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
 *
 * CRASH-SAFETY (owner report: "when the sound is played the app crashes and no
 * log is saved"):
 *  - Every SoundPool call (load/play/playStereo/stop/release/volume) is wrapped
 *    in try/catch and logged via FileLogger. A failure logs a WARN/ERROR and
 *    returns a safe default (0 / false) instead of propagating and killing the
 *    thread (the splash/menu tickers run on Timer threads, where an uncaught
 *    exception would otherwise tear down the process).
 *  - volume() guards against getStreamMaxVolume()==0 (a fully muted device) so
 *    we never feed SoundPool a NaN volume.
 *  - An OnLoadCompleteListener tracks which slots have finished decoding; if a
 *    sample is not ready yet (or its load failed) play() is skipped and logged
 *    instead of calling pool.play() on an unprepared sample id (a real OEM
 *    crash source). The "ready" flag is set optimistically right after load()
 *    so the normal fast-decoding wav path still plays immediately.
 *  - Each play attempt is logged BEFORE pool.play() is called, so a crash
 *    mid-play leaves a "about to play ..." trace in the log right before the
 *    crash report.
 */
class SoundBoard(context: Context, capacity: Int) {

    private val appContext = context.applicationContext
    private val pool = SoundPool(capacity, AudioManager.STREAM_MUSIC, 0)
    private val loaded = IntArray(13)
    private val streams = IntArray(13)
    private val ready = BooleanArray(13)

    init {
        try {
            pool.setOnLoadCompleteListener { _, sampleId, status ->
                for (i in loaded.indices) {
                    if (loaded[i] == sampleId && loaded[i] != 0) {
                        if (status == 0) {
                            ready[i] = true
                        } else {
                            ready[i] = false
                            FileLogger.w(
                                "Sound",
                                "sample load failed slot=$i sampleId=$sampleId status=$status"
                            )
                        }
                        break
                    }
                }
            }
        } catch (t: Throwable) {
            FileLogger.w("Sound", "OnLoadCompleteListener setup failed: ${t.javaClass.simpleName}: ${t.message}")
        }
    }

    /** Current stream volume factor of STREAM_MUSIC, exactly as the original computed it. */
    fun volume(): Float {
        return try {
            val am = appContext.getSystemService(Context.AUDIO_SERVICE) as AudioManager
            val max = am.getStreamMaxVolume(AudioManager.STREAM_MUSIC)
            if (max <= 0) {
                0f
            } else {
                am.getStreamVolume(AudioManager.STREAM_MUSIC).toFloat() / max.toFloat()
            }
        } catch (t: Throwable) {
            FileLogger.w("Sound", "volume() failed: ${t.javaClass.simpleName}: ${t.message}")
            0f
        }
    }

    fun load(index: Int, resId: Int): Int {
        return try {
            val id = pool.load(appContext, resId, 1)
            loaded[index] = id
            // Optimistically ready: small wavs usually decode before the listener fires;
            // the listener corrects this to false if the load actually fails.
            if (id != 0) ready[index] = true
            FileLogger.i("Sound", "load slot=$index resId=$resId sampleId=$id")
            id
        } catch (t: Throwable) {
            FileLogger.e("Sound", "load slot=$index resId=$resId failed", t)
            loaded[index] = 0
            0
        }
    }

    fun play(index: Int, priority: Int, loop: Int = 0, volume: Float = volume()): Int {
        val sound = loaded[index]
        if (sound == 0) return 0
        if (!ready[index]) {
            FileLogger.w("Sound", "play slot=$index skipped (sample not ready yet)")
            return 0
        }
        return try {
            FileLogger.i("Sound", "play slot=$index priority=$priority loop=$loop vol=$volume")
            val id = pool.play(sound, volume, volume, priority, loop, 1.0f)
            streams[index] = id
            id
        } catch (t: Throwable) {
            FileLogger.e("Sound", "play slot=$index failed", t)
            0
        }
    }

    fun playStereo(index: Int, left: Float, right: Float, priority: Int, loop: Int = 0): Int {
        val sound = loaded[index]
        if (sound == 0) return 0
        if (!ready[index]) {
            FileLogger.w("Sound", "playStereo slot=$index skipped (sample not ready yet)")
            return 0
        }
        return try {
            FileLogger.i("Sound", "playStereo slot=$index L=$left R=$right priority=$priority loop=$loop")
            val id = pool.play(sound, left, right, priority, loop, 1.0f)
            streams[index] = id
            id
        } catch (t: Throwable) {
            FileLogger.e("Sound", "playStereo slot=$index failed", t)
            0
        }
    }

    fun stop(index: Int) {
        try {
            if (streams[index] != 0) {
                pool.stop(streams[index])
                streams[index] = 0
            }
        } catch (t: Throwable) {
            FileLogger.w("Sound", "stop slot=$index failed: ${t.javaClass.simpleName}: ${t.message}")
            streams[index] = 0
        }
    }

    /** True when a stream for this slot is currently registered (mirrors c[i] != 0). */
    fun isStreamActive(index: Int): Boolean = try {
        streams[index] != 0
    } catch (_: Throwable) {
        false
    }

    fun stopAll(count: Int = 12) {
        for (i in 0 until count) stop(i)
    }

    fun release() {
        try {
            pool.release()
        } catch (t: Throwable) {
            FileLogger.w("Sound", "release failed: ${t.javaClass.simpleName}: ${t.message}")
        }
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
