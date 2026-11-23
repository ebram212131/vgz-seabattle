package com.mygames.vgzseabattle

import android.app.Activity
import android.app.AlertDialog
import android.content.Intent
import android.os.Bundle
import android.view.MotionEvent
import android.view.View
import android.view.WindowManager
import android.widget.Button
import android.widget.RelativeLayout
import com.mygames.vgzseabattle.core.GlobalState
import com.mygames.vgzseabattle.core.HttpURLConnectionTransport
import com.mygames.vgzseabattle.core.OnlineGateway

/**
 * Faithful port of ActivityMenu.java + helpers i/j/k/l (menu adapter and threads).
 * Evidence: work/rea-evidence/ActivityMenu.java.txt, i/j/k/l.java.txt.
 *
 * ARCHITECTURE (owner requirement, v2.2.0): the menu and every game/learn screen
 * runs ENTIRELY on the device - offline and synchronous. Touching Start Game /
 * Learn Sounds / Learn Screen / Top 10 / Test Headsets / Final Score / Settings /
 * Quit opens the next screen immediately with a direct, explicit startActivity
 * (no server round-trip, no background thread, no check-string). Only the three
 * genuinely server-backed features use the network:
 *   - Send Score  -> gateway.submitScore (returns the player's rank)
 *   - Register    -> RegisterApp -> gateway.register / get_next_page
 *   - "score list" = the rank returned by submitScore (the original server
 *     protocol never streamed a top-10 table; TopScoresHolder stays local)
 *
 * PRODUCT ADDITION: a "Settings" button (buttonSettings) opens SettingsActivity
 * where online mode and the custom server URL are configured.
 *
 * DIAGNOSTICS: every ACTION_DOWN is logged with the touched view, and every
 * action method logs its entry, so a device log immediately shows whether a
 * button tap reached the handler and which step followed.
 *
 * TALKBACK FIX (v2.2.3, owner report: "menus do not open with TalkBack clicks"):
 * TalkBack does NOT deliver the double-tap as a MotionEvent to the app. The
 * double-tap is translated into the accessibility action ACTION_CLICK, which
 * the framework routes to View.performClick() - and an OnTouchListener alone
 * is NEVER called through that path. Buttons that only set an OnTouchListener
 * (firing on ACTION_DOWN) therefore did nothing under TalkBack: focus moved,
 * the app announced the button, but the double-tap performed no action. Fix:
 * every menu button ALSO gets an OnClickListener that runs the exact same
 * action method. Real touches keep the original instant ACTION_DOWN response
 * (the OnTouchListener consumes the event, so the click listener is not
 * double-fired); TalkBack double-taps go through performClick() and now work.
 */
class ActivityMenu : Activity(), View.OnTouchListener {

    private lateinit var files: FileStore
    private lateinit var gateway: OnlineGateway
    private var sound: SoundBoard? = null

    private var bgrn = 0
    private var autZone = 0
    private var testLeft = 0
    private var testRight = 0
    private var pressButton = 0
    private var sendingScore = 0
    private var scoreSent1 = 0
    private var scoreSent2 = 0
    private var sendScoreError = 0

    private var buttonStart: Button? = null
    private var buttonHeadsets: Button? = null
    private var buttonLearnSounds: Button? = null
    private var buttonLearnScreen: Button? = null
    private var buttonFinalScore: Button? = null
    private var buttonSendScore: Button? = null
    private var buttonTop10: Button? = null
    private var buttonRegister: Button? = null
    private var buttonSettings: Button? = null
    private var buttonQuit: Button? = null
    private lateinit var layout: RelativeLayout
    private lateinit var speaker: Speaker

    private var headsetTestActive = false    // f
    private var headsetStep = 0              // g
    private var musicRestartPending = false  // h
    private var rowHeight = 50               // q
    private var scoreSendPending = false     // s
    private var musicPauseOnce = false       // t
    private var pauseCounter = 0             // u

    private var timer: java.util.Timer? = null

    private fun findButtons() {
        buttonStart = findViewById(R.id.buttonStartGame)
        buttonHeadsets = findViewById(R.id.buttonTestHeadSets)
        buttonLearnSounds = findViewById(R.id.buttonLearnGameSounds)
        buttonLearnScreen = findViewById(R.id.buttonLearnGameScreen)
        buttonFinalScore = findViewById(R.id.buttonFinalScore)
        buttonSendScore = findViewById(R.id.buttonSendScore)
        buttonTop10 = findViewById(R.id.buttonTop10Score)
        buttonRegister = findViewById(R.id.buttonRegisterAccount)
        buttonSettings = findViewById(R.id.buttonSettings)
        buttonQuit = findViewById(R.id.buttonQuitGame)
        layout = findViewById(R.id.layout_main_menu)
        listOf(
            buttonStart, buttonHeadsets, buttonLearnSounds, buttonLearnScreen,
            buttonFinalScore, buttonSendScore, buttonTop10, buttonRegister,
            buttonSettings, buttonQuit
        ).forEach {
            it?.setOnTouchListener(this)
            // v2.2.3 TalkBack fix: double-tap fires ACTION_CLICK -> performClick().
            it?.setOnClickListener { v -> activate(v) }
        }
        layout.setOnTouchListener(this)
        listOf(
            buttonStart, buttonHeadsets, buttonLearnSounds, buttonLearnScreen,
            buttonFinalScore, buttonSendScore, buttonTop10, buttonRegister,
            buttonSettings, buttonQuit
        ).forEach { btn ->
            val lp = btn?.layoutParams as? RelativeLayout.LayoutParams
            lp?.height = rowHeight
            btn?.layoutParams = lp
        }
    }

    /** Original a(int): play a menu sound slot after stopping 5..8. */
    private fun playMenuSound(index: Int) {
        stopSendSounds()
        val sb = sound ?: return
        val left = sb.volume()
        when (index) {
            5 -> sb.playStereo(index, left, left, index + 1)
            else -> sb.play(index, index + 1)
        }
    }

    private fun stopSendSounds() {
        for (i in 5..8) sound?.stop(i)
    }

    /** Original a(MotionEvent): background zone touch replays the aut-zone sound. */
    private fun onBackgroundTouch(event: MotionEvent) {
        when (event.actionMasked) {
            MotionEvent.ACTION_DOWN, MotionEvent.ACTION_UP,
            MotionEvent.ACTION_MOVE, MotionEvent.ACTION_CANCEL -> replayAutZone()
        }
    }

    private fun replayAutZone() {
        val sb = sound ?: return
        sb.stop(1)
        val v = sb.volume()
        sb.playStereo(1, v, v, 2)
    }

    /** Original c(): press-button sound. */
    private fun pressSound() {
        val sb = sound ?: return
        sb.stop(4)
        val v = sb.volume()
        sb.playStereo(4, v, v, 5)
    }

    /** Original e(): menu heartbeat timer. */
    private fun startHeartbeat() {
        timer = java.util.Timer()
        timer?.schedule(MenuHeartbeat(), 2000L, 1000L)
    }

    private inner class MenuHeartbeat : java.util.TimerTask() {
        override fun run() {
            // CRASH-SAFETY: MenuHeartbeat runs on a java.util.Timer thread and
            // drives the background music loop; an uncaught exception here would
            // kill the process. Wrap the body so a failure is logged and the
            // heartbeat keeps running instead of tearing the app down. (Every
            // sb.* call is itself defensive in SoundBoard and logged there.)
            try {
                heartbeatBody()
            } catch (t: Throwable) {
                FileLogger.e(TAG, "MenuHeartbeat crashed", t)
            }
        }

        private fun heartbeatBody() {
            val sb = sound ?: return
            if (musicPauseOnce) {
                pauseCounter++
                musicPauseOnce = false
                musicRestartPending = false
            }
            if (GlobalState.exitFlag) {
                GlobalState.exitFlag = false
                musicRestartPending = false
            }
            if (GlobalState.speaking) {
                return
            }
            if (scoreSendPending) {
                scoreSendPending = false
                musicRestartPending = false
            }
            if (!musicRestartPending) {
                if (bgrn != 0 && !sb.isStreamActive(0)) {
                    val v = sb.volume()
                    sb.playStereo(0, v, v, 1, loop = 10000)
                }
                musicRestartPending = true
            }
            if (headsetTestActive) {
                headsetStep++
                when (headsetStep) {
                    1 -> stopBackgroundMusic()
                    2 -> {
                        // j(): left channel only
                        val v = sb.volume()
                        sb.playStereo(2, v, 0.0f, 3)
                    }
                    3 -> {
                        // k(): right channel only
                        val v = sb.volume()
                        sb.playStereo(3, 0.0f, v, 4)
                    }
                    4 -> {
                        // l(): end of test, restart music when stopped
                        headsetTestActive = false
                        if (!sb.isStreamActive(0)) {
                            val v = sb.volume()
                            sb.playStereo(0, v, v, 1, loop = 10000)
                        }
                    }
                }
            }
        }
    }

    /** Original f(): build the sound table. */
    private fun loadSounds() {
        val sb = SoundBoard(this, 10)
        sound = sb
        bgrn = sb.load(0, R.raw.sound_menu_bgrn)
        autZone = sb.load(1, R.raw.sound_menu_aut_zone)
        testLeft = sb.load(2, R.raw.sound_test_left)
        testRight = sb.load(3, R.raw.sound_test_right)
        pressButton = sb.load(4, R.raw.sound_menu_press_button)
        sendingScore = sb.load(5, R.raw.sound_game_sending_score)
        scoreSent1 = sb.load(6, R.raw.sound_game_score_sent1)
        scoreSent2 = sb.load(7, R.raw.sound_game_score_sent2)
        sendScoreError = sb.load(8, R.raw.sound_game_send_score_error)
    }

    /** Original g(): stop menu sounds 0..8. */
    private fun stopAllMenuSounds() {
        for (i in 0..8) sound?.stop(i)
    }

    /**
     * Offline, synchronous navigation to an in-app screen. v2.2.0: the menu and
     * every game/learn screen opens directly on the device - no server call, no
     * background thread, no check-string. Logs the target so the device log
     * shows exactly which screen was opened and when.
     */
    private fun goOffline(action: String) {
        FileLogger.i(TAG, "opening screen offline: $action")
        try {
            startActivity(Nav.intent(this, action))
        } catch (t: Throwable) {
            FileLogger.e(TAG, "failed to open $action", t)
        }
    }

    /** Original h(): start game. Offline on device. */
    private fun startGame() {
        FileLogger.i(TAG, "-> startGame")
        stopBackgroundMusic()
        pressSound()
        GlobalState.menuPhase = 2
        goOffline(ACTION_GAME_SCREEN)
    }

    /** Original i(): test headsets. Local stereo sound test. */
    private fun testHeadsets() {
        FileLogger.i(TAG, "-> testHeadsets")
        pressSound()
        headsetTestActive = true
        headsetStep = 0
    }

    /** Original m(): learn game sounds. Offline on device. */
    private fun learnSounds() {
        FileLogger.i(TAG, "-> learnSounds")
        stopBackgroundMusic()
        pressSound()
        GlobalState.menuPhase = 2
        goOffline(ACTION_LEARN_SOUNDS)
    }

    /** Original n(): learn game screen. Offline on device. */
    private fun learnScreen() {
        FileLogger.i(TAG, "-> learnScreen")
        stopBackgroundMusic()
        pressSound()
        GlobalState.menuPhase = 2
        goOffline(ACTION_LEARN_SCREEN)
    }

    /** Original o(): final score speech. Local TTS. */
    private fun finalScore() {
        FileLogger.i(TAG, "-> finalScore")
        stopBackgroundMusic()
        pressSound()
        speaker.speakFinalScore(false)
        scoreSendPending = true
    }

    /**
     * Original p(): send score. ONLINE - submits the last score to the server via
     * a background thread (gateway.submitScore) and plays the rank result sound.
     * Does not block the UI; the menu stays responsive.
     */
    private fun sendScore() {
        FileLogger.i(TAG, "-> sendScore (online)")
        stopBackgroundMusic()
        pressSound()
        if (GlobalState.lastScore == 0) {
            finalScore()
        } else {
            Thread(SendScoreTask()).start()
        }
    }

    /**
     * Original r(): top 10 screen. Offline on device - opens ActivityViewTop,
     * which reads the locally-stored top scores. (The server protocol returns a
     * player's rank from submitScore, not a streamed table; that rank is spoken
     * by sendScore above.)
     */
    private fun viewTop10() {
        FileLogger.i(TAG, "-> viewTop10")
        stopBackgroundMusic()
        pressSound()
        GlobalState.menuPhase = 2
        goOffline(ACTION_VIEW_TOP)
    }

    /** NEW: optional-account registration entry. RegisterApp does the online work. */
    private fun openRegister() {
        FileLogger.i(TAG, "-> openRegister (online in RegisterApp)")
        pressSound()
        GlobalState.menuPhase = 2
        val intent = Intent(this, RegisterApp::class.java)
        intent.action = RegisterApp.ACTION_FROM_MENU
        try {
            startActivity(intent)
        } catch (t: Throwable) {
            FileLogger.e(TAG, "failed to open RegisterApp", t)
        }
    }

    /** NEW: settings entry. Offline, local configuration screen. */
    private fun openSettings() {
        FileLogger.i(TAG, "-> openSettings")
        pressSound()
        GlobalState.menuPhase = 2
        goOffline(ACTION_SETTINGS)
    }

    /**
     * Original s(): quit. v3.0 CHANGE (owner request: "ask me a question before
     * exiting"): neither the Quit button nor the system Back key on the menu
     * exits silently any more - both ask for confirmation first. Yes runs the
     * original quit flow (stop music, press sound, quitRequested = 1, finish);
     * No keeps the app open. MainActivity still sees quitRequested == 1 and
     * finishes itself, exactly like the pre-v3.0 flow. TalkBack reads the
     * standard dialog natively.
     */
    private fun quitGame() {
        FileLogger.i(TAG, "-> quitGame: asking quit confirmation")
        pressSound()
        AlertDialog.Builder(this)
            .setTitle("Quit")
            .setMessage("Do you really want to quit the game?")
            .setPositiveButton("Yes") { _, _ -> reallyQuit() }
            .setNegativeButton("No") { _, _ -> }
            .create()
            .show()
    }

    /** Original quit body (was quitGame before v3.0). */
    private fun reallyQuit() {
        FileLogger.i(TAG, "-> reallyQuit")
        stopBackgroundMusic()
        GlobalState.quitRequested = 1
        finish()
    }

    /**
     * v3.0: Back on the main menu no longer exits silently (the old onStop
     * auto-quit); it opens the same quit confirmation as the Quit button.
     */
    override fun onBackPressed() {
        quitGame()
    }

    /** Original t(): stop background music. */
    private fun stopBackgroundMusic() {
        sound?.stop(0)
    }

    private inner class SendScoreTask : Runnable {
        override fun run() {
            val sb = sound ?: return
            val uid = try {
                files.readAll("data1.txt").split("\\*".toRegex())[0]
            } catch (t: Throwable) {
                FileLogger.e(TAG, "sendScore: no stored user id, aborting", t)
                playMenuSound(8)
                return
            }
            playMenuSound(5)     // sending...
            musicPauseOnce = true
            pauseCounter = 0
            val result = gateway.submitScore(uid, GlobalState.lastScore.toString())
            if (!result.ok) {
                FileLogger.w(TAG, "score submission failed: ${result.error}")
                playMenuSound(8)
                return
            }
            val rank = result.body.toIntOrNull() ?: -1
            FileLogger.i(TAG, "score ${GlobalState.lastScore} submitted for $uid -> rank $rank")
            if (rank < 1) {
                playMenuSound(8)
            } else if (rank >= 11) {
                playMenuSound(7)
            } else {
                playMenuSound(6)
            }
        }
    }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        files = FileStore(this)
        gateway = OnlineGateway(
            HttpURLConnectionTransport(),
            Prefs.effectiveBaseUrl(this),
            Prefs.preferredScheme(this)
        ) { message -> FileLogger.i(TAG, message) }
        rowHeight = (getSystemService(WINDOW_SERVICE) as WindowManager)
            .defaultDisplay.height / 11
        window.addFlags(1024)
        setContentView(R.layout.activity_menu)
        setVolumeControlStream(3)
        loadSounds()
        findButtons()
        startHeartbeat()
        speaker = Speaker(this)
        TopScoresHolder.obtain(files)
        try {
            files.publishDataDir()
        } catch (e: Exception) {
        }
        scoreSendPending = false
        pauseCounter = 0
        FileLogger.i(TAG, "menu ready, rowHeight=$rowHeight, online=${Prefs.onlineEnabled(this)}")
    }

    override fun onDestroy() {
        super.onDestroy()
        stopAllMenuSounds()
        timer?.cancel()
        sound?.release()
        speaker.release()
    }

    override fun onPause() {
        stopBackgroundMusic()
        super.onPause()
    }

    override fun onResume() {
        super.onResume()
        if (sound?.isStreamActive(0) == false) {
            musicRestartPending = false
        }
    }

    override fun onStart() {
        super.onStart()
        GlobalState.menuPhase = 1
    }

    override fun onStop() {
        if (GlobalState.quitRequested == 0 && GlobalState.menuPhase == 1) {
            GlobalState.quitRequested = 1
            stopAllMenuSounds()
            finish()
        }
        stopBackgroundMusic()
        super.onStop()
    }

    override fun onTouch(view: View?, event: MotionEvent?): Boolean {
        val action = event?.actionMasked ?: -1
        // DIAGNOSTIC: log every DOWN so the device log shows whether a tap reached
        // the handler and which view was under the finger.
        if (action == MotionEvent.ACTION_DOWN) {
            val label = when (view) {
                buttonStart -> "StartGame"
                buttonHeadsets -> "TestHeadsets"
                buttonLearnSounds -> "LearnSounds"
                buttonLearnScreen -> "LearnScreen"
                buttonFinalScore -> "FinalScore"
                buttonSendScore -> "SendScore"
                buttonTop10 -> "Top10"
                buttonRegister -> "Register"
                buttonSettings -> "Settings"
                buttonQuit -> "Quit"
                layout -> "Layout(background)"
                null -> "null"
                else -> view.javaClass.simpleName
            }
            FileLogger.i(TAG, "onTouch DOWN on [$label] headsetTestActive=$headsetTestActive")
        }
        if (headsetTestActive) {
            return true
        }
        val down = action == MotionEvent.ACTION_DOWN
        if (view === layout) {
            onBackgroundTouch(event!!)
        }
        if (down) {
            activate(view)
        }
        return true
    }

    /**
     * v2.2.3 TalkBack fix: single dispatcher shared by the OnTouchListener
     * (direct touch, ACTION_DOWN) and the OnClickListener (TalkBack double-tap
     * -> ACTION_CLICK -> performClick()). Both paths run the identical action
     * exactly once.
     */
    private fun activate(view: View?) {
        if (headsetTestActive) return
        when (view) {
            buttonStart -> startGame()
            buttonHeadsets -> testHeadsets()
            buttonLearnSounds -> learnSounds()
            buttonLearnScreen -> learnScreen()
            buttonFinalScore -> finalScore()
            buttonSendScore -> sendScore()
            buttonTop10 -> viewTop10()
            buttonRegister -> openRegister()
            buttonSettings -> openSettings()
            buttonQuit -> quitGame()
        }
    }

    companion object {
        private const val TAG = "Menu"
        const val ACTION_GAME_SCREEN = "com.mygames.vgzseabattle.ActivityGameScreen"
        const val ACTION_LEARN_SOUNDS = "com.mygames.vgzseabattle.ActivityLearnSounds"
        const val ACTION_LEARN_SCREEN = "com.mygames.vgzseabattle.ActivityLearnScreen"
        const val ACTION_VIEW_TOP = "com.mygames.vgzseabattle.ActivityViewTop"
        const val ACTION_SETTINGS = "com.mygames.vgzseabattle.SettingsActivity"
    }
}
