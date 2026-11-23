package com.mygames.vgzseabattle

import android.app.Activity
import android.os.Bundle
import android.view.MotionEvent
import android.view.View
import android.view.WindowManager
import android.widget.Button
import android.widget.RelativeLayout
import com.mygames.vgzseabattle.core.GlobalState

/**
 * Faithful port of ActivityLearnSounds.java.
 * Evidence: work/rea-evidence/ActivityLearnSounds.java.txt.
 */
class ActivityLearnSounds : Activity(), View.OnTouchListener {

    private var sound: SoundBoard? = null
    private var rowHeight = 50
    private lateinit var layout: RelativeLayout
    private val buttons = arrayOfNulls<Button>(10)

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_learn_sounds)
        rowHeight = (getSystemService(WINDOW_SERVICE) as WindowManager)
            .defaultDisplay.height / 11
        window.addFlags(1024)
        layout = findViewById(R.id.layout_learn_sounds)
        layout.setOnTouchListener(this)
        setVolumeControlStream(3)
        loadTable()
        val sb = SoundBoard(this, 12)
        sound = sb
        sb.load(0, R.raw.sound_game_gun)
        sb.load(1, R.raw.sound_game_success)
        sb.load(2, R.raw.sound_game_lose2)
        sb.load(3, R.raw.sound_game_lose1)
        sb.load(4, R.raw.sound_game_destroy)
        sb.load(5, R.raw.sound_game_menu)
        sb.load(6, R.raw.sound_game_ship)
        sb.load(7, R.raw.sound_game_empty)
        sb.load(8, R.raw.sound_game_killed)
        bind()
    }

    private fun loadTable() {
        // Original a(): zero-filled 12-slot tables (kept implicitly by SoundBoard).
    }

    private fun bind() {
        buttons[0] = findViewById(R.id.buttonLearnSoundGun)
        buttons[1] = findViewById(R.id.buttonLearnSoundTargetHit)
        buttons[2] = findViewById(R.id.buttonLearnSoundYouMissed)
        buttons[3] = findViewById(R.id.buttonLearnSoundOpponentMissed)
        buttons[4] = findViewById(R.id.buttonLearnSoundShipDestroyed)
        buttons[5] = findViewById(R.id.buttonLearnSoundMenuOpenClose)
        buttons[6] = findViewById(R.id.buttonLearnSoundYourShip)
        buttons[7] = findViewById(R.id.buttonLearnSoundEmptyCell)
        buttons[8] = findViewById(R.id.buttonLearnSoundTargetedCell)
        buttons[9] = findViewById(R.id.buttonLearnSoundReturn)
        for (b in buttons) {
            b?.setOnTouchListener(this)
            val lp = b?.layoutParams as? RelativeLayout.LayoutParams
            lp?.height = rowHeight
            b?.layoutParams = lp
        }
    }

    /** Original a(int). */
    private fun play(index: Int) {
        stopAll()
        val sb = sound ?: return
        val v = sb.volume()
        sb.playStereo(index, v, v, index + 1)
    }

    /** Original d(). */
    private fun stopAll() {
        for (i in 0..8) sound?.stop(i)
    }

    /** Original e(): return to menu. */
    private fun returnToMenu() {
        stopAll()
        GlobalState.exitFlag = true
        finish()
    }

    override fun onDestroy() {
        super.onDestroy()
        stopAll()
        sound?.release()
    }

    override fun onStop() {
        stopAll()
        GlobalState.exitFlag = true
        finish()
        super.onStop()
    }

    override fun onTouch(view: View?, event: MotionEvent?): Boolean {
        if (event?.actionMasked != MotionEvent.ACTION_DOWN) return false
        val indexes = mapOf<View?, Int>(
            buttons[0] to 0, buttons[1] to 1, buttons[2] to 2, buttons[3] to 3,
            buttons[4] to 4, buttons[5] to 5, buttons[6] to 6, buttons[7] to 7,
            buttons[8] to 8
        )
        if (view === buttons[9]) {
            returnToMenu()
            return true
        }
        val index = indexes[view]
        if (index != null) {
            play(index)
            return true
        }
        return false
    }
}
