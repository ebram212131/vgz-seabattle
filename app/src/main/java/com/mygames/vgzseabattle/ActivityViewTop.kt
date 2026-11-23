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
 * Faithful port of ActivityViewTop.java.
 * Evidence: work/rea-evidence/ActivityViewTop.java.txt.
 */
class ActivityViewTop : Activity(), View.OnTouchListener {

    private val buttons = arrayOfNulls<Button>(11)
    private var rowHeight = 0
    private lateinit var speaker: Speaker

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_view_top)
        window.addFlags(1024)
        rowHeight = (getSystemService(WINDOW_SERVICE) as WindowManager)
            .defaultDisplay.height / 12
        bind()
        speaker = Speaker(this)
    }

    private fun bind() {
        val ids = intArrayOf(
            R.id.buttonTop10Score1, R.id.buttonTop10Score2, R.id.buttonTop10Score3,
            R.id.buttonTop10Score4, R.id.buttonTop10Score5, R.id.buttonTop10Score6,
            R.id.buttonTop10Score7, R.id.buttonTop10Score8, R.id.buttonTop10Score9,
            R.id.buttonTop10Score10, R.id.buttonTop10ReturnToMenu
        )
        for (i in ids.indices) {
            buttons[i] = findViewById(ids[i])
            val lp = buttons[i]?.layoutParams as? RelativeLayout.LayoutParams
            lp?.height = rowHeight
            buttons[i]?.layoutParams = lp
            buttons[i]?.setOnTouchListener(this)
        }
    }

    /** Original a(int): speak the rank value. */
    private fun speakRank(rank: Int) {
        val top = TopScoresHolder.instance ?: return
        GlobalState.lastScore = top.scoreAt(rank)
        speaker.speakFinalScore(false)
    }

    override fun onStop() {
        GlobalState.exitFlag = true
        finish()
        super.onStop()
    }

    override fun onTouch(view: View?, event: MotionEvent?): Boolean {
        if (GlobalState.speaking || event?.actionMasked != MotionEvent.ACTION_DOWN) {
            return false
        }
        for (rank in 0 until 10) {
            if (view === buttons[rank]) {
                speakRank(rank)
                return true
            }
        }
        if (view === buttons[10]) {
            GlobalState.exitFlag = true
            finish()
            return true
        }
        return false
    }

    override fun onDestroy() {
        super.onDestroy()
        speaker.release()
    }
}
