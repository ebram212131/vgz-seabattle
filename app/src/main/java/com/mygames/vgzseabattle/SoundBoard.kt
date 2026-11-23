package com.mygames.vgzseabattle

import android.content.Context
import android.media.AudioManager
import android.media.SoundPool
import android.os.Handler
import android.os.Looper

/**
 * Faithful port of the SoundPool tables used by MainActivity (2 sounds),
 * ActivityMenu (9), ActivityGameScreen (12) and ActivityLearnSounds (9).
 *
 * Original loading order (b() of each activity) is preserved; play()/stop()
 * semantics (stream volume scaling, priority, loop) match the original calls.
 */
class SoundBoard(context: Context, capacity: Int) {

    private val appContext = context.applicationContext
    private val pool = SoundPool(capacity, AudioManager.STREAM_MUSIC, 0)
    private val loaded = IntArray(13)
    private val streams = IntArray(13)

    /** Current stream volume factor of STREAM_MUSIC, exactly as the original computed it. */
    fun volume(): Float {
        val am = appContext.getSystemService(Context.AUDIO_SERVICE) as AudioManager
        return am.getStreamVolume(AudioManager.STREAM_MUSIC).toFloat() /
            am.getStreamMaxVolume(AudioManager.STREAM_MUSIC).toFloat()
    }

    fun load(index: Int, resId: Int): Int {
        val id = pool.load(appContext, resId, 1)
        loaded[index] = id
        return id
    }

    fun play(index: Int, priority: Int, loop: Int = 0, volume: Float = volume()): Int {
        val sound = loaded[index]
        if (sound == 0) return 0
        val id = pool.play(sound, volume, volume, priority, loop, 1.0f)
        streams[index] = id
        return id
    }

    fun playStereo(index: Int, left: Float, right: Float, priority: Int, loop: Int = 0): Int {
        val sound = loaded[index]
        if (sound == 0) return 0
        val id = pool.play(sound, left, right, priority, loop, 1.0f)
        streams[index] = id
        return id
    }

    fun stop(index: Int) {
        if (streams[index] != 0) {
            pool.stop(streams[index])
            streams[index] = 0
        }
    }

    /** True when a stream for this slot is currently registered (mirrors c[i] != 0). */
    fun isStreamActive(index: Int): Boolean = streams[index] != 0

    fun stopAll(count: Int = 12) {
        for (i in 0 until count) stop(i)
    }

    fun release() {
        pool.release()
    }
}

/** Handler on the main looper with the original message ids. */
object Handlers {
    const val MSG_RESOLVE_MY_SHOT = 1000        // e
    const val MSG_UNLOCK_RESULT = 1001          // f
    const val MSG_SWITCH_TO_MY_SCREEN = 1002    // g
    const val MSG_RESOLVE_AI_SHOT = 2000        // h
    const val MSG_AI_NEXT_TARGET = 2001         // i
    const val MSG_SWITCH_TO_OPPONENT_SCREEN = 2002 // j
    const val MSG_GAME_OVER_EXIT = 3000         // k
    const val MSG_SPLASH_VERIFY = 1001 + 0      // MainActivity o
    const val MSG_SPLASH_ERROR = 1001 + 1       // MainActivity p

    fun main(): Handler = Handler(Looper.getMainLooper())
}
