package com.mygames.vgzseabattle

import android.app.Activity
import android.app.AlertDialog
import android.graphics.Color
import android.os.Bundle
import android.view.MotionEvent
import android.view.View
import android.widget.Button
import com.mygames.vgzseabattle.core.GlobalState

/**
 * Faithful port of ActivityLearnScreen.java + helpers g/h.
 * Evidence: work/rea-evidence/ActivityLearnScreen.java.txt.
 */
class ActivityLearnScreen : Activity(), View.OnTouchListener {

    private var sound: SoundBoard? = null
    private var menuStream = 0
    private lateinit var menuButton: Button
    private val cells = Array(10) { arrayOfNulls<Button>(10) }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.my_ships)
        window.addFlags(1024)
        menuButton = findViewById(R.id.buttonMenu)
        menuButton.setOnTouchListener(this)
        title = "Learn game screen"
        menuButton.text = "Menu"
        bindCells()
        setVolumeControlStream(3)
        val sb = SoundBoard(this, 1)
        sound = sb
        sb.load(0, R.raw.sound_game_menu)
    }

    private fun bindCells() {
        val ids = GridIds.all
        for (r in 0 until 10) {
            for (c in 0 until 10) {
                cells[r][c] = findViewById(ids[r][c])
                cells[r][c]?.setOnTouchListener(this)
            }
        }
        var letter = 'a'
        for (r in 0 until 10) {
            for (c in 0 until 10) {
                cells[r][c]?.contentDescription = "$letter ${c + 1}"
                cells[r][c]?.setBackgroundColor(Color.rgb(0, 84, 166))
            }
            letter++
        }
    }

    /** Original a(String). */
    private fun showDialog(text: String) {
        AlertDialog.Builder(this)
            .setTitle("Learn screen dialog")
            .setMessage(text)
            .setPositiveButton("Ok") { _, _ -> GlobalState.exitFlag = true; finish() }
            .create()
            .show()
    }

    /** Original c(): menu open sound. */
    private fun playMenuSound() {
        val sb = sound ?: return
        val v = sb.volume()
        menuStream = sb.playStereo(0, v, v, 1)
    }

    /** Original d(): learn-screen menu. */
    private fun showMenu() {
        AlertDialog.Builder(this)
            .setTitle("Learn game screen menu")
            .setItems(arrayOf("Close menu", "Show opponent screen", "Help", "Return to main menu")) { _, which ->
                when (which) {
                    0 -> {
                        showDialog("Tap Close menu item to continue the game with current settings.")
                        playMenuSound()
                    }
                    1 -> {
                        showDialog("Tap Show opponent screen item to shoot the opponent ships.")
                        playMenuSound()
                    }
                    2 -> {
                        showDialog("Tap this item to get the game help.")
                        playMenuSound()
                    }
                    3 -> {
                        GlobalState.exitFlag = true
                        finish()
                    }
                }
            }
            .create()
            .show()
    }

    override fun onStop() {
        GlobalState.exitFlag = true
        finish()
        super.onStop()
    }

    override fun onTouch(view: View?, event: MotionEvent?): Boolean {
        if (event?.actionMasked != MotionEvent.ACTION_DOWN || view !== menuButton) {
            return true
        }
        showMenu()
        playMenuSound()
        return true
    }

    override fun onDestroy() {
        super.onDestroy()
        sound?.release()
    }
}
