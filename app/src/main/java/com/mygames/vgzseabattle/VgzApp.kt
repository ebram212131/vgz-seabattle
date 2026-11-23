package com.mygames.vgzseabattle

import android.app.Application

/**
 * NEW: application entry point that boots the file logging system (logs land in
 * Android/data/com.mygames.vgzseabattle/files/logs) and installs the crash
 * handler before any activity starts.
 */
class VgzApp : Application() {

    override fun onCreate() {
        super.onCreate()
        FileLogger.init(this)
        FileLogger.installCrashHandler()
        FileLogger.i("App", "VGZ Sea Battle started, pid " + android.os.Process.myPid())
    }
}
