package com.mygames.vgzseabattle

import android.app.Application

/**
 * NEW: application entry point that boots the file logging system (logs land in
 * Android/data/com.mygames.vgzseabattle/files/logs) and installs the crash
 * handler before any activity starts.
 *
 * CRASH-SAFETY (owner report: "logging must start even before the sound is
 * played; when the sound is played the app crashes and no log is saved"):
 *  - The uncaught-exception handler is installed FIRST, before anything that
 *    could fail (including FileLogger.init). The handler lazily initializes
 *    logging if it fires before init() finished, so a crash during the very
 *    first milliseconds of startup is still written to disk instead of lost.
 *  - FileLogger.init() never throws (external-storage failures fall back to the
 *    internal files dir), so by the time MainActivity runs and loads/plays the
 *    intro sound, a writable log dir is guaranteed and a "started" line is
 *    already on disk.
 *  - Every later sound play is logged through FileLogger before it happens
 *    (see SoundBoard / MainActivity), so even a sound-related crash leaves a
 *    "about to play ..." trace right before the crash report.
 */
class VgzApp : Application() {

    override fun onCreate() {
        super.onCreate()
        try {
            // 1) Crash handler first: even if init() throws, the crash is captured.
            FileLogger.installCrashHandler(this)
            // 2) Now set up the log dirs + session header (never throws).
            FileLogger.init(this)
            // 3) Record that the app (and logging) started, before any activity/sound.
            FileLogger.i("App", "VGZ Sea Battle started, pid " + android.os.Process.myPid())
        } catch (t: Throwable) {
            // Should never happen (init/install are defensive), but as a final
            // safety net try to leave a trace and then re-throw so the crash
            // handler — already installed in step 1 — can write a report.
            try {
                FileLogger.e("App", "VgzApp.onCreate failed", t)
            } catch (_: Throwable) {
            }
            throw t
        }
    }
}
