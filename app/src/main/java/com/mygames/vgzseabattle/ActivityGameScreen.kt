package com.mygames.vgzseabattle

import android.app.Activity
import android.app.AlertDialog
import android.graphics.Color
import android.graphics.drawable.GradientDrawable
import android.os.Bundle
import android.os.Handler
import android.os.Looper
import android.os.Message
import android.view.MotionEvent
import android.view.View
import android.widget.Button
import com.mygames.vgzseabattle.core.GlobalState
import com.mygames.vgzseabattle.core.SeaBattleEngine

/**
 * Faithful port of ActivityGameScreen.java (1010 lines) and handlers a..f.
 * Evidence: work/rea-evidence/ActivityGameScreen.java.txt and a..f.java.txt.
 *
 * All game rules live in core/SeaBattleEngine.kt (pure Kotlin, unit tested);
 * this activity owns sounds, timing delays, colors, accessibility descriptions,
 * dialogs and screen switching exactly like the original.
 */
class ActivityGameScreen : Activity(), View.OnTouchListener, SeaBattleEngine.Listener {

    private lateinit var engine: SeaBattleEngine
    private lateinit var files: FileStore
    private lateinit var speaker: Speaker
    private var sound: SoundBoard? = null
    private lateinit var handler: Handler
    private lateinit var menuButton: Button
    private val cells = Array(10) { arrayOfNulls<Button>(10) }

    private val soundIds = IntArray(13)
    private val streamIds = IntArray(13)

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.my_ships)
        files = FileStore(this)
        speaker = Speaker(this)
        engine = SeaBattleEngine(java.util.Random())
        engine.setListener(this)
        window.addFlags(1024)
        setVolumeControlStream(3)

        loadSounds()
        bindCells()
        menuButton = findViewById(R.id.buttonMenu)
        menuButton.setOnTouchListener(this)

        engine.newGame()
        handler = GameHandler()

        // Original onCreate end: c(); i(); e(); b(0).
        showScreenDialog()          // i()
        resetForNewGame()           // e()
        engine.showScreen(SeaBattleEngine.SCREEN_MY)  // b(0)
        playBackgroundMusic()       // n()
    }

    // ---------------------------------------------------------------- sounds

    /** Original b(): the 12-sound table in original order. */
    private fun loadSounds() {
        val sb = SoundBoard(this, 13)
        sound = sb
        soundIds[0] = sb.load(0, R.raw.sound_game_bgrn)
        soundIds[1] = sb.load(1, R.raw.sound_game_menu)
        soundIds[2] = sb.load(2, R.raw.sound_game_ship)
        soundIds[3] = sb.load(3, R.raw.sound_game_empty)
        soundIds[4] = sb.load(4, R.raw.sound_game_gun)
        soundIds[5] = sb.load(5, R.raw.sound_game_lose1)
        soundIds[6] = sb.load(6, R.raw.sound_game_lose2)
        soundIds[7] = sb.load(7, R.raw.sound_game_success)
        soundIds[8] = sb.load(8, R.raw.sound_game_destroy)
        soundIds[9] = sb.load(9, R.raw.sound_game_killed)
        soundIds[10] = sb.load(10, R.raw.sound_game_you_shoot)
        soundIds[11] = sb.load(11, R.raw.sound_game_opponent_shoots)
    }

    /** Original f(int): one-shot event sounds. */
    private fun playEvent(event: Int) {
        val sb = sound ?: return
        val v = sb.volume()
        when (event) {
            1 -> streamIds[2] = sb.playStereo(2, v, v, 3)
            3 -> streamIds[9] = sb.playStereo(9, v, v, 10)
            4 -> streamIds[3] = sb.playStereo(3, v, v, 4)
            5 -> streamIds[8] = sb.playStereo(8, v, v, 9)
            10 -> streamIds[10] = sb.playStereo(10, v, v, 11)
            11 -> streamIds[11] = sb.playStereo(11, v, v, 12)
        }
    }

    /** Original n(): background loop, once. */
    private fun playBackgroundMusic() {
        val sb = sound ?: return
        if (engine.gameOver || soundIds[0] == 0 || sb.isStreamActive(0)) return
        val v = sb.volume()
        streamIds[0] = sb.playStereo(0, v, v, 1, loop = 10000)
    }

    /** Original o(): menu open sound. */
    private fun playMenuSound() {
        val sb = sound ?: return
        val v = sb.volume()
        streamIds[1] = sb.playStereo(1, v, v, 2)
    }

    /** Original z(): stop all game sounds. */
    private fun stopAllSounds() {
        sound?.stopAll(12)
    }

    // ------------------------------------------------------------------ grid

    /** Original d(): bind 100 cell buttons in original order a1..j10. */
    private fun bindCells() {
        val ids = GridIds.all
        for (r in 0 until 10) {
            for (c in 0 until 10) {
                cells[r][c] = findViewById(ids[r][c])
                cells[r][c]?.setOnTouchListener(this)
            }
        }
        val labels = engine.cellLabels()
        for (r in 0 until 10) {
            for (c in 0 until 10) {
                cells[r][c]?.contentDescription = labels[r][c]
                cells[r][c]?.setBackgroundColor(Color.rgb(0, 84, 166))
            }
        }
    }

    /** Original h(): repaint MY grid + descriptions; optional "opponent shoots". */
    private fun refreshMyScreen(playOpponentShoots: Boolean) {
        val descs = engine.buildCellDescriptions(1)
        for (r in 0 until 10) {
            for (c in 0 until 10) {
                when (engine.myGrid[r][c]) {
                    SeaBattleEngine.WATER_UNKNOWN -> cells[r][c]?.setBackgroundColor(Color.rgb(0, 84, 166))
                    SeaBattleEngine.SHIP -> cells[r][c]?.setBackgroundColor(Color.rgb(255, 245, 104))
                    SeaBattleEngine.DESTROYED -> cells[r][c]?.setBackgroundColor(Color.RED)
                    SeaBattleEngine.EMPTY_KNOWN -> cells[r][c]?.setBackgroundColor(-7829368)
                }
                cells[r][c]?.contentDescription = descs[r][c]
            }
        }
        if (playOpponentShoots) {
            playEvent(11)
            engine.beginAiTurn()
        }
    }

    /** Original a(boolean): repaint OPPONENT grid; optional "you shoot". */
    private fun refreshOpponentScreen(playYouShoot: Boolean) {
        val descs = engine.buildCellDescriptions(2)
        for (r in 0 until 10) {
            for (c in 0 until 10) {
                when (engine.opponentGrid[r][c]) {
                    SeaBattleEngine.DESTROYED -> cells[r][c]?.setBackgroundColor(Color.RED)
                    SeaBattleEngine.EMPTY_KNOWN -> cells[r][c]?.setBackgroundColor(-7829368)
                    else -> cells[r][c]?.setBackgroundColor(Color.rgb(0, 84, 166))
                }
                cells[r][c]?.contentDescription = descs[r][c]
            }
        }
        if (playYouShoot) {
            playEvent(10)
        }
    }

    private fun applyScreenTitle() {
        if (engine.screen == SeaBattleEngine.SCREEN_MY) {
            title = "My screen"
            menuButton.text = "My screen menu"
            menuButton.contentDescription = "My screen menu"
        } else {
            title = "Opponent screen"
            menuButton.text = "Opponent screen menu"
            menuButton.contentDescription = "Opponent screen menu"
        }
    }

    /** Original e(): place fresh fleets and reset the round. */
    private fun resetForNewGame() {
        engine.newGame()
        playBackgroundMusic()
        refreshMyScreen(playOpponentShoots = false)
        refreshOpponentScreen(playYouShoot = false)
        title = "My screen"
        menuButton.text = "My screen menu"
        menuButton.contentDescription = "My screen menu"
    }

    // --------------------------------------------------------------- dialogs

    /** Original i(): initial screen chooser. */
    private fun showScreenDialog() {
        AlertDialog.Builder(this)
            .setTitle("Choose the screen")
            .setItems(arrayOf("Show my screen", "Show opponent screen")) { _, which ->
                when (which) {
                    0 -> {
                        resetForNewGame()
                        engine.showScreen(SeaBattleEngine.SCREEN_MY)
                        playMenuSound()
                    }
                    1 -> {
                        resetForNewGame()
                        engine.showScreen(SeaBattleEngine.SCREEN_OPPONENT)
                        playMenuSound()
                    }
                }
            }
            .create()
            .show()
    }

    /** Original j(): my screen menu. */
    private fun showMyMenu() {
        AlertDialog.Builder(this)
            .setTitle("My screen menu")
            .setItems(arrayOf("Close menu", "Show opponent screen", "Help", "Stop game")) { _, which ->
                when (which) {
                    0 -> playMenuSound()
                    1 -> {
                        engine.showScreen(SeaBattleEngine.SCREEN_OPPONENT)
                        playMenuSound()
                    }
                    2 -> {
                        showMyHelp()
                        playMenuSound()
                    }
                    3 -> {
                        engine.finishByStop()
                        playMenuSound()
                    }
                }
            }
            .create()
            .show()
    }

    /** Original l(): opponent screen menu. */
    private fun showOpponentMenu() {
        AlertDialog.Builder(this)
            .setTitle("Opponent screen menu")
            .setItems(arrayOf("Close menu", "Show my screen", "Help", "Stop game")) { _, which ->
                when (which) {
                    0 -> playMenuSound()
                    1 -> {
                        engine.showScreen(SeaBattleEngine.SCREEN_MY)
                        playMenuSound()
                    }
                    2 -> {
                        showOpponentHelp()
                        playMenuSound()
                    }
                    3 -> {
                        engine.finishByStop()
                        playMenuSound()
                    }
                }
            }
            .create()
            .show()
    }

    /** Original k(): my-screen help text (verbatim). */
    private fun showMyHelp() {
        AlertDialog.Builder(this)
            .setTitle("Game help")
            .setMessage(
                "There is a menu button at the top of the screen. Below the menu button is your ship's field which consists of 10 rows. There are 10 buttons in each row. \n" +
                    "Put your finger on the screen and move it either up and down, to the left and to the right to know where the buttons are placed." +
                    "Tap the button to know is this button empty or one of your ships is placed there.\n" +
                    "Tap the menu button to get the game menu. Use the item Show opponent screen to get the opponet's ships screen. " +
                    "Yo can shoot the opponet's ships on opponent screen only." +
                    "Your ships screen will show automatically when your opponent will shoot your ships."
            )
            .setPositiveButton("Ok") { _, _ -> }
            .create()
            .show()
    }

    /** Original m(): opponent-screen help text (verbatim). */
    private fun showOpponentHelp() {
        AlertDialog.Builder(this)
            .setTitle("Game help")
            .setMessage(
                "There is a menu button at the top of the screen. Below the menu button is opponent's ship's field which consists of 10 rows. There are 10 buttons in each row. \n" +
                    "Put your finger on the screen and move it either up and down, to the left and to the right to know where the buttons are placed.\n" +
                    "Opponent's ships are placed secretly. Tap the button to shoot the opponent's ships. You will hear the target hit sound if you will succeed, otherwise you will hear lose sound. \n" +
                    "Tap the menu button to get the game menu. Use the item Show my screen to get the your ships screen. " +
                    "Your ships screen will show automatically when your opponent will shoot your ships."
            )
            .setPositiveButton("Ok") { _, _ -> }
            .create()
            .show()
    }

    // --------------------------------------------------------------- handler

    private inner class GameHandler : Handler(Looper.getMainLooper()) {
        override fun handleMessage(msg: Message) {
            when (msg.what) {
                Handlers.MSG_RESOLVE_MY_SHOT -> {
                    engine.shotLocked = false
                    engine.resolvePlayerShot()
                }
                Handlers.MSG_UNLOCK_RESULT -> engine.resultLocked = false
                Handlers.MSG_SWITCH_TO_MY_SCREEN -> {
                    engine.switchLocked = false
                    engine.aiTurn = true
                    engine.showScreen(SeaBattleEngine.SCREEN_MY)
                }
                Handlers.MSG_RESOLVE_AI_SHOT -> {
                    engine.shotLocked = false
                    engine.resolveOpponentShot()
                }
                Handlers.MSG_AI_NEXT_TARGET -> {
                    engine.resultLocked = false
                    engine.aiTurn = true
                    engine.aiPickTargetAndFire()
                }
                Handlers.MSG_SWITCH_TO_OPPONENT_SCREEN -> {
                    engine.switchLocked = false
                    engine.aiTurn = false
                    engine.showScreen(SeaBattleEngine.SCREEN_OPPONENT)
                }
                Handlers.MSG_GAME_OVER_EXIT -> {
                    engine.switchLocked = false
                    engine.aiTurn = false
                    if (!GlobalState.speaking) {
                        GlobalState.exitFlag = true
                        finish()
                    } else {
                        handler.sendEmptyMessageDelayed(Handlers.MSG_GAME_OVER_EXIT, 1000L)
                    }
                }
            }
        }
    }

    // ------------------------------------------------------ engine callbacks

    override fun onEventSound(event: Int) = playEvent(event)

    override fun onGun(volumeFactor: Float) {
        val sb = sound ?: return
        val v = sb.volume() * volumeFactor
        streamIds[4] = sb.playStereo(4, v, v, 5)
        engine.shotLocked = true
        if (volumeFactor < 1.0f) {
            handler.sendEmptyMessageDelayed(Handlers.MSG_RESOLVE_AI_SHOT, 1000L)
        } else {
            handler.sendEmptyMessageDelayed(Handlers.MSG_RESOLVE_MY_SHOT, 1000L)
        }
    }

    override fun onLose1(volumeFactor: Float) {
        val sb = sound ?: return
        val v = sb.volume() * volumeFactor
        streamIds[5] = sb.playStereo(5, v, v, 6)
        if (volumeFactor < 1.0f) {
            engine.resultLocked = true
            handler.sendEmptyMessageDelayed(Handlers.MSG_UNLOCK_RESULT, 100L)
        } else {
            engine.resultLocked = true
            handler.sendEmptyMessageDelayed(Handlers.MSG_AI_NEXT_TARGET, 100L)
        }
    }

    override fun onPannedLose(which: Int) {
        val sb = sound ?: return
        val v = sb.volume()
        val left: Float
        val right: Float
        if (java.util.Random().nextInt(2) == 0) {
            left = v; right = 0.0f
        } else {
            left = 0.0f; right = v
        }
        engine.switchLocked = true
        if (which == SeaBattleEngine.SND_LOSE1) {
            streamIds[5] = sb.playStereo(5, left, right, 6)
            handler.sendEmptyMessageDelayed(Handlers.MSG_SWITCH_TO_OPPONENT_SCREEN, 3000L)
        } else {
            streamIds[6] = sb.playStereo(6, left, right, 7)
            handler.sendEmptyMessageDelayed(Handlers.MSG_SWITCH_TO_MY_SCREEN, 3000L)
        }
    }

    override fun onScreenChanged(screen: Int) = applyScreenTitle()

    override fun onRefreshMyScreen(playOpponentShoots: Boolean) {
        refreshMyScreen(playOpponentShoots)
    }

    override fun onRefreshOpponentScreen(playYouShoot: Boolean) {
        refreshOpponentScreen(playYouShoot)
    }

    override fun onGameOver(finalScore: Int) {
        stopAllSounds()
        TopScoresHolder.obtain(files).recordLastScore()
        speaker.speakFinalScore(true)
        handler.sendEmptyMessageDelayed(Handlers.MSG_GAME_OVER_EXIT, 1000L)
    }

    // ----------------------------------------------------------------- input

    override fun onTouch(view: View?, event: MotionEvent?): Boolean {
        if (engine.shotLocked || engine.resultLocked || engine.switchLocked || engine.gameOver) {
            return false
        }
        if (view === menuButton) {
            if (event?.actionMasked == MotionEvent.ACTION_DOWN) {
                playMenuSound()
                if (engine.screen == SeaBattleEngine.SCREEN_MY) {
                    showMyMenu()
                } else {
                    showOpponentMenu()
                }
            }
            return false
        }
        event ?: return false
        if (event.actionMasked != MotionEvent.ACTION_DOWN) return false
        for (r in 0 until 10) {
            for (c in 0 until 10) {
                if (view === cells[r][c]) {
                    if (engine.screen == SeaBattleEngine.SCREEN_MY) {
                        engine.exploreMyCell(r, c)
                    } else {
                        engine.tapOpponentCell(r, c)
                    }
                    return false
                }
            }
        }
        return false
    }

    override fun onDestroy() {
        super.onDestroy()
        stopAllSounds()
        sound?.release()
        speaker.release()
    }
}
