package com.mygames.vgzseabattle

import android.content.Context
import android.os.Build
import java.io.File
import java.text.SimpleDateFormat
import java.util.Date
import java.util.Locale

/**
 * NEW (product request): file logging system.
 *
 * Logs are written to the app's "Android data" folder:
 *   <external files dir>/logs/vgz-log.txt
 *     = /storage/emulated/0/Android/data/com.mygames.vgzseabattle/files/logs/
 * which is exactly the Android/data/<package name> location the owner asked for.
 * If external storage is not available the internal private dir
 * (/data/data/com.mygames.vgzseabattle/files/logs) is used instead.
 *
 * An uncaught-exception handler writes a full crash report
 * (crash-<timestamp>.txt plus a summary line in the main log) so crashes can be
 * diagnosed without adb logcat.
 */
object FileLogger {

    private const val MAX_BYTES = 512L * 1024L
    private const val LOG_FILE = "vgz-log.txt"
    private const val OLD_FILE = "vgz-log.old.txt"

    private val lock = Any()
    private var dir: File? = null
    private var crashHandlerInstalled = false
    private val timeFormat = SimpleDateFormat("MM-dd HH:mm:ss.SSS", Locale.US)
    private val fileNameFormat = SimpleDateFormat("yyyyMMdd-HHmmss", Locale.US)

    /** Resolves the log directory, rotates the previous log and opens a session. */
    fun init(context: Context): String {
        val appContext = context.applicationContext
        val chosen: File? = appContext.getExternalFilesDir(null)
        val base = chosen ?: appContext.filesDir
        val logDir = File(base, "logs")
        synchronized(lock) {
            dir = try {
                if (!logDir.exists()) logDir.mkdirs()
                logDir
            } catch (e: Exception) {
                val fallback = File(appContext.filesDir, "logs")
                try {
                    if (!fallback.exists()) fallback.mkdirs()
                } catch (ignored: Exception) {
                }
                fallback
            }
            rotateIfNeeded()
            sessionHeader(appContext)
        }
        return logPath()
    }

    /** The directory that currently receives log files (best-effort). */
    fun logPath(): String = dir?.absolutePath ?: "unavailable"

    fun i(tag: String, message: String) = append("INFO", tag, message, null)
    fun w(tag: String, message: String) = append("WARN", tag, message, null)
    fun e(tag: String, message: String, tr: Throwable? = null) = append("ERROR", tag, message, tr)

    private fun append(level: String, tag: String, message: String, tr: Throwable?) {
        synchronized(lock) {
            val target = dir ?: return
            try {
                rotateIfNeeded()
                val line = timeFormat.format(Date()) + " " + level + "/" + tag + ": " + message + "\n"
                File(target, LOG_FILE).appendText(line)
                if (tr != null) {
                    File(target, LOG_FILE).appendText(android.util.Log.getStackTraceString(tr) + "\n")
                }
            } catch (ignored: Exception) {
                // Never let logging kill the app.
            }
        }
    }

    private fun rotateIfNeeded() {
        val target = dir ?: return
        try {
            val current = File(target, LOG_FILE)
            if (current.exists() && current.length() > MAX_BYTES) {
                val old = File(target, OLD_FILE)
                if (old.exists()) old.delete()
                current.renameTo(old)
            }
        } catch (ignored: Exception) {
        }
    }

    private fun sessionHeader(context: Context) {
        try {
            val pm = context.packageManager.getPackageInfo(context.packageName, 0)
            val version = pm.versionName + " (" + pm.getLongVersionCode() + ")"
            append(
                "INFO", "Session",
                "=== VGZ Sea Battle $version | ${Build.MODEL} | Android ${Build.VERSION.RELEASE} (API ${Build.VERSION.SDK_INT}) | log dir ${logPath()} ===",
                null
            )
        } catch (ignored: Exception) {
        }
    }

    /**
     * Writes a crash-<timestamp>.txt report for any uncaught exception and then
     * delegates to the previous handler so the system still sees the crash.
     */
    fun installCrashHandler() {
        synchronized(lock) {
            if (crashHandlerInstalled) return
            val previous = Thread.getDefaultUncaughtExceptionHandler()
            Thread.setDefaultUncaughtExceptionHandler { thread, throwable ->
                runCatching { writeCrashReport(thread, throwable) }
                previous?.uncaughtException(thread, throwable)
            }
            crashHandlerInstalled = true
        }
    }

    private fun writeCrashReport(thread: Thread, throwable: Throwable) {
        val target = dir ?: return
        val stamp = fileNameFormat.format(Date())
        synchronized(lock) {
            try {
                val sb = StringBuilder()
                sb.append("=== VGZ Sea Battle crash report $stamp ===\n")
                sb.append("Thread: ").append(thread.name).append("\n")
                sb.append("Device: ").append(Build.MANUFACTURER).append(" ").append(Build.MODEL)
                    .append(" | Android ").append(Build.VERSION.RELEASE)
                    .append(" (API ").append(Build.VERSION.SDK_INT).append(")\n")
                sb.append("Exception: ").append(throwable.javaClass.name).append("\n")
                sb.append("Message: ").append(throwable.message ?: "").append("\n\n")
                sb.append(android.util.Log.getStackTraceString(throwable))
                var cause = throwable.cause
                var depth = 0
                while (cause != null && depth < 10) {
                    sb.append("\nCaused by: ").append(cause.javaClass.name)
                        .append(": ").append(cause.message ?: "").append("\n")
                    sb.append(android.util.Log.getStackTraceString(cause))
                    cause = cause.cause
                    depth++
                }
                File(target, "crash-$stamp.txt").writeText(sb.toString())
                append(
                    "ERROR", "Crash",
                    "uncaught ${throwable.javaClass.simpleName} on '${thread.name}': ${throwable.message} (report crash-$stamp.txt)",
                    null
                )
            } catch (ignored: Exception) {
                // Never throw from the crash writer itself.
            }
        }
    }
}
