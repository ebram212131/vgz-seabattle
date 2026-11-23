package com.mygames.vgzseabattle

import android.app.Activity
import android.content.Intent
import android.os.Bundle
import android.view.MotionEvent
import android.view.View
import android.view.WindowManager
import android.widget.Button
import android.widget.RelativeLayout
import com.mygames.vgzseabattle.core.GlobalState
import com.mygames.vgzseabattle.core.HttpURLConnectionTransport
import com.mygames.vgzseabattle.core.ObfuscationCodec
import com.mygames.vgzseabattle.core.OnlineGateway

/**
 * Faithful port of ActivityMenu.java + helpers i/j/k/l (menu adapter and threads).
 * Evidence: work/rea-evidence/ActivityMenu.java.txt, i/j/k/l.java.txt.
 *
 * Original design note: the four activity-launching buttons asked the server for
 * the next action ("1000*seed*encoded"). In this port the launch works offline:
 * when online mode is off or the server does not answer, the original action
 * constants are used directly. With online mode on, the server flow is kept.
 *
 * PRODUCT ADDITION: a "Settings" button (buttonSettings) opens SettingsActivity
 * where online mode and the custom server URL are configured.
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
    private var checkString = ""             // v
    private var nextActionIndex = 1          // w

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
        ).forEach { it?.setOnTouchListener(this) }
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

    /** Original h(): start game. */
    private fun startGame() {
        stopBackgroundMusic()
        pressSound()
        GlobalState.menuPhase = 2
        launchNextActivity(1)
    }

    /** Original i(): test headsets. */
    private fun testHeadsets() {
        pressSound()
        headsetTestActive = true
        headsetStep = 0
    }

    /** Original m(): learn game sounds. */
    private fun learnSounds() {
        stopBackgroundMusic()
        pressSound()
        GlobalState.menuPhase = 2
        launchNextActivity(2)
    }

    /** Original n(): learn game screen. */
    private fun learnScreen() {
        stopBackgroundMusic()
        pressSound()
        GlobalState.menuPhase = 2
        launchNextActivity(3)
    }

    /** Original o(): final score speech. */
    private fun finalScore() {
        stopBackgroundMusic()
        pressSound()
        speaker.speakFinalScore(false)
        scoreSendPending = true
    }

    /** Original p(): send score. */
    private fun sendScore() {
        stopBackgroundMusic()
        pressSound()
        if (GlobalState.lastScore == 0) {
            finalScore()
        } else {
            Thread(SendScoreTask()).start()
        }
    }

    /** Original r(): top 10 screen. */
    private fun viewTop10() {
        stopBackgroundMusic()
        pressSound()
        GlobalState.menuPhase = 2
        launchNextActivity(4)
    }

    /** NEW: optional-account registration entry. */
    private fun openRegister() {
        pressSound()
        GlobalState.menuPhase = 2
        val intent = Intent(this, RegisterApp::class.java)
        intent.action = RegisterApp.ACTION_FROM_MENU
        startActivity(intent)
    }

    /** NEW: settings entry. */
    private fun openSettings() {
        pressSound()
        startActivity(Intent(ACTION_SETTINGS))
    }

    /** Original s(): quit. */
    private fun quitGame() {
        stopBackgroundMusic()
        pressSound()
        GlobalState.quitRequested = 1
        finish()
    }

    /** Original t(): stop background music. */
    private fun stopBackgroundMusic() {
        sound?.stop(0)
    }

    /** Original u(): compute the server check string. */
    private fun computeCheckString() {
        val seed = files.readAll("data0.txt")
        val imeiLike = DeviceIdentity.imeiAndSim(this)
        val androidId = DeviceIdentity.androidId(this)
        val build = DeviceIdentity.buildFingerprint()
        checkString = seed +
            ObfuscationCodec.digitify(ObfuscationCodec.splice(imeiLike, seed)) +
            ObfuscationCodec.digitify(ObfuscationCodec.splice(androidId, seed)) + build
    }

    /**
     * Original b(int) + k.java: ask the server for the next activity, falling back
     * to the built-in action constants when offline mode is on or the call fails.
     */
    private fun launchNextActivity(which: Int) {
        nextActionIndex = which
        computeCheckString()
        if (!Prefs.onlineEnabled(this)) {
            startActivity(Intent(localActionFor(which)))
            return
        }
        Thread {
            val result = gateway.getNextPage(checkString)
            val response = result.body
            if (result.ok && response.contains("1000*")) {
                val clean = response.replace("1000*", "")
                val split = clean.split("\\*".toRegex())
                if (split.size >= nextActionIndex + 2) {
                    val action = ObfuscationCodec.decodeAction(
                        nextActionIndex, split[0], split[nextActionIndex + 1]
                    )
                    runOnUiThread { startActivity(Intent(action)) }
                    return@Thread
                }
            } else if (!result.ok) {
                FileLogger.w(TAG, "get_next_page failed, using local action: ${result.error}")
            }
            runOnUiThread { startActivity(Intent(localActionFor(nextActionIndex))) }
        }.start()
    }

    /** Offline mapping of the original server-provided actions. */
    private fun localActionFor(which: Int): String = when (which) {
        1 -> ACTION_GAME_SCREEN
        2 -> ACTION_LEARN_SOUNDS
        3 -> ACTION_LEARN_SCREEN
        4 -> ACTION_VIEW_TOP
        else -> ACTION_GAME_SCREEN
    }

    private inner class SendScoreTask : Runnable {
        override fun run() {
            val sb = sound ?: return
            val uid = files.readAll("data1.txt").split("\\*".toRegex())[0]
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
            .defaultDisplay.height / 9
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
        if (headsetTestActive) {
            return true
        }
        val down = event?.actionMasked == MotionEvent.ACTION_DOWN
        if (view === layout) {
            onBackgroundTouch(event!!)
        }
        if (down) {
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
        return true
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
