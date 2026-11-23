package com.mygames.vgzseabattle

import android.content.Context
import android.media.MediaPlayer
import android.os.Handler
import android.os.Looper
import com.mygames.vgzseabattle.core.GlobalState
import com.mygames.vgzseabattle.core.ScoreSpeech

/**
 * Faithful port of l.java (the score speaker) plus its timer/listener helpers
 * m.java/n.java/o.java.
 *
 * Evidence: work/rea-evidence/l.java.txt.
 *
 * The token -> resource mapping follows a(int) of the original:
 * 0..19 units/teens, 20..90 tens, 100/1000/1000000 magnitudes,
 * 1000001 "final score", 1000002 "points".
 */
class Speaker(private val context: Context) : MediaPlayer.OnCompletionListener {

    private val handler = Handler(Looper.getMainLooper())
    private var player: MediaPlayer? = null
    private val plan = IntArray(20) { -1 }
    private var tick: Int = 0

    private val timer = java.util.Timer()
    private val timerTask = object : java.util.TimerTask() {
        override fun run() {
            // Original m.java: intentionally empty body (kept for faithfulness).
        }
    }

    init {
        timer.schedule(timerTask, 50L, 50L)
    }

    /** Original a(int): token -> raw resource id. */
    private fun resFor(token: Int): Int = when (token) {
        0 -> R.raw.sound_score_0
        1 -> R.raw.sound_score_1
        2 -> R.raw.sound_score_2
        3 -> R.raw.sound_score_3
        4 -> R.raw.sound_score_4
        5 -> R.raw.sound_score_5
        6 -> R.raw.sound_score_6
        7 -> R.raw.sound_score_7
        8 -> R.raw.sound_score_8
        9 -> R.raw.sound_score_9
        10 -> R.raw.sound_score_10
        11 -> R.raw.sound_score_11
        12 -> R.raw.sound_score_12
        13 -> R.raw.sound_score_13
        14 -> R.raw.sound_score_14
        15 -> R.raw.sound_score_15
        16 -> R.raw.sound_score_16
        17 -> R.raw.sound_score_17
        18 -> R.raw.sound_score_18
        19 -> R.raw.sound_score_19
        20 -> R.raw.sound_score_20
        30 -> R.raw.sound_score_30
        40 -> R.raw.sound_score_40
        50 -> R.raw.sound_score_50
        60 -> R.raw.sound_score_60
        70 -> R.raw.sound_score_70
        80 -> R.raw.sound_score_80
        90 -> R.raw.sound_score_90
        100 -> R.raw.sound_score_100
        1000 -> R.raw.sound_score_1000
        1000000 -> R.raw.sound_score_1000000
        ScoreSpeech.SAY_FINAL_SCORE -> R.raw.sound_say_final_score
        ScoreSpeech.SAY_POINTS -> R.raw.sound_say_points
        else -> -1
    }

    private fun create(token: Int): Boolean {
        val res = resFor(token)
        if (res == -1) return false
        player = MediaPlayer.create(context, res) ?: return false
        return true
    }

    /** Original c(): advance through the plan, playing one token at a time. */
    private fun playNext() {
        for (i in 0 until 20) {
            when {
                plan[i] == -1 -> {
                    GlobalState.speaking = false
                    return
                }
                plan[i] > -2 -> {
                    val token = plan[i]
                    plan[i] = -2
                    if (!create(token)) {
                        GlobalState.speaking = false
                        return
                    }
                    player?.start()
                    player?.setOnCompletionListener(this)
                    return
                }
            }
        }
    }

    /** Original a(boolean): plan from GlobalState.lastScore and start speaking. */
    fun speakFinalScore(finalScore: Boolean) {
        GlobalState.speaking = true
        val tokens = ScoreSpeech.plan(GlobalState.lastScore, finalScore)
        for (i in 0 until 20) plan[i] = -1
        tokens.forEachIndexed { idx, t -> if (idx < 20) plan[idx] = t }
        val first = plan[0]
        if (!create(first)) {
            GlobalState.speaking = false
            return
        }
        plan[0] = -2
        player?.start()
        player?.setOnCompletionListener(object : MediaPlayer.OnCompletionListener {
            override fun onCompletion(mp: MediaPlayer) {
                mp.release()
                playNext()
            }
        })
    }

    /** Original n/o: continue after completion. */
    override fun onCompletion(mp: MediaPlayer) {
        mp.release()
        playNext()
    }

    /** Stop and release everything (used when activities finish). */
    fun release() {
        try {
            player?.release()
        } catch (e: Exception) {
        }
        player = null
        timer.cancel()
    }
}
