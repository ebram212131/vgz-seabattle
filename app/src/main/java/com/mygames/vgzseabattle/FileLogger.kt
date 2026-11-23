package com.mygames.vgzseabattle

import android.content.Context
import android.os.Build
import android.util.Log
import java.io.File
import java.io.FileOutputStream
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
 * CRASH-SAFETY (owner report: "when the sound plays the app crashes and no log
 * is saved"):
 *  - init() never throws: getExternalFilesDir() is wrapped, and the internal
 *    files dir is always used as a guaranteed-writable fallback, so the log dir
 *    is ALWAYS set before any activity (and therefore any sound) runs.
 *  - Every line is written with flush() + fd.sync() so it reaches the flash
 *    before the process can be killed.
 *  - The crash handler is installed first (see VgzApp) and lazily initializes
 *    logging if it ran before init(), so even a crash during early startup is
 *    captured. Each crash report is written to BOTH the user-visible external
 *    log dir and the always-available internal log dir, so a report survives
 *    even if external/emulated storage is flaky at crash time.
 */
object FileLogger {

    private const val MAX_BYTES = 512L * 1024L
    private const val LOG_FILE = "vgz-log.txt"
    private const val OLD_FILE = "vgz-log.old.txt"

    private val lock = Any()

    @Volatile
    private var dir: File? = null                 // primary target (external if available, else internal)

    @Volatile
    private var internalDir: File? = null         // always-available mirror target (filesDir/logs)

    @Volatile
    private var appContext: Context? = null       // captured so the crash handler can lazy-init

    private var crashHandlerInstalled = false
    private val timeFormat = SimpleDateFormat("MM-dd HH:mm:ss.SSS", Locale.US)
    private val fileNameFormat = SimpleDateFormat("yyyyMMdd-HHmmss", Locale.US)

    /**
     * Resolves the log directory, rotates the previous log and opens a session.
     * NEVER throws: any failure falls back to the internal files dir so that
     * the caller (VgzApp.onCreate, which runs before any sound) always ends up
     * with a writable [dir].
     */
    fun init(context: Context): String {
        val appCtx = context.applicationContext
        appContext = appCtx
        try {
            synchronized(lock) {
                // Always-available internal target: no external media / permission dependency.
                val internal = File(appCtx.filesDir, "logs")
                ensureDir(internal)
                internalDir = internal

                // Preferred external target: user-visible via Android/data/<pkg>/files.
                val extFiles: File? = try {
                    appCtx.getExternalFilesDir(null)
                } catch (t: Throwable) {
                    null
                }
                val chosen: File? = extFiles?.let { ef ->
                    val ld = File(ef, "logs")
                    ensureDir(ld)
                    ld
                }
                dir = chosen ?: internal

                rotateIfNeeded()
                sessionHeader(appCtx)
            }
        } catch (t: Throwable) {
            // Last-resort fallback: guarantee dir points somewhere writable.
            try {
                val internal = File(appCtx.filesDir, "logs")
                ensureDir(internal)
                internalDir = internal
                if (dir == null) dir = internal
                rawWrite(internal, LOG_FILE, "FileLogger init fallback after " +
                    t.javaClass.simpleName + ": " + (t.message ?: "") + "\n")
            } catch (_: Throwable) {
                // Nothing more we can do; never throw out of init().
            }
        }
        return logPath()
    }

    private fun ensureDir(f: File) {
        if (!f.exists()) f.mkdirs()
    }

    /** The directory that currently receives log files (best-effort). */
    fun logPath(): String = dir?.absolutePath ?: "unavailable"

    fun i(tag: String, message: String) = append("INFO", tag, message, null)
    fun w(tag: String, message: String) = append("WARN", tag, message, null)
    fun e(tag: String, message: String, tr: Throwable? = null) = append("ERROR", tag, message, tr)

    private fun append(level: String, tag: String, message: String, tr: Throwable?) {
        synchronized(lock) {
            val target = dir ?: internalDir ?: return
            try {
                rotateIfNeeded()
                val line = timeFormat.format(Date()) + " " + level + "/" + tag + ": " + message + "\n"
                syncWrite(target, LOG_FILE, line, append = true)
                if (tr != null) {
                    syncWrite(target, LOG_FILE, Log.getStackTraceString(tr) + "\n", append = true)
                }
            } catch (_: Throwable) {
                // Never let logging kill the app.
            }
        }
    }

    /**
     * Writes text with an explicit flush() + fd.sync() so the bytes reach the
     * flash before the process can be killed by the default uncaught-exception
     * handler (Process.killProcess).
     */
    private fun syncWrite(target: File, name: String, text: String, append: Boolean) {
        FileOutputStream(File(target, name), append).use { fos ->
            fos.write(text.toByteArray())
            fos.flush()
            try {
                fos.fd.sync()
            } catch (_: Throwable) {
                // sync() is not supported on every filesystem; flush+close is still enough on most.
            }
        }
    }

    /** No-sync raw write used only by the init() fallback (avoids any recursion risk). */
    private fun rawWrite(target: File, name: String, text: String) {
        FileOutputStream(File(target, name), true).use { it.write(text.toByteArray()) }
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
        } catch (_: Throwable) {
        }
    }

    private fun sessionHeader(context: Context) {
        try {
            val pm = context.packageManager.getPackageInfo(context.packageName, 0)
            val version = pm.versionName + " (" + pm.getLongVersionCode() + ")"
            append(
                "INFO", "Session",
                "=== VGZ Sea Battle $version | ${Build.MODEL} | Android ${Build.VERSION.RELEASE} " +
                    "(API ${Build.VERSION.SDK_INT}) | log dir ${logPath()} ===",
                null
            )
        } catch (_: Throwable) {
        }
    }

    /**
     * Writes a crash-<timestamp>.txt report for any uncaught exception and then
     * delegates to the previous handler so the system still sees the crash.
     *
     * Pass the application [context] so the handler can lazily initialize
     * logging if it fires before init() ran (e.g. a crash during very early
     * startup). Safe to call before init(); safe to call more than once.
     */
    fun installCrashHandler(context: Context? = null) {
        synchronized(lock) {
            if (context != null) appContext = context.applicationContext
            if (crashHandlerInstalled) return
            val previous = Thread.getDefaultUncaughtExceptionHandler()
            Thread.setDefaultUncaughtExceptionHandler { thread, throwable ->
                runCatching {
                    // Lazy init so a crash during early startup (before init() finished)
                    // is still captured instead of vanishing with no log.
                    if (dir == null) {
                        appContext?.let { init(it) }
                    }
                    writeCrashReport(thread, throwable)
                }
                previous?.uncaughtException(thread, throwable)
            }
            crashHandlerInstalled = true
        }
    }

    private fun writeCrashReport(thread: Thread, throwable: Throwable) {
        val stamp = fileNameFormat.format(Date())
        // Write to BOTH the user-visible primary dir and the always-available
        // internal dir, so the report survives even if external/emulated
        // storage is flaky at crash time.
        val targets = linkedSetOf(dir, internalDir).filterNotNull()
        synchronized(lock) {
            for (target in targets) {
                try {
                    val report = buildReport(thread, throwable, stamp)
                    syncWrite(target, "crash-$stamp.txt", report, append = false)
                } catch (_: Throwable) {
                    // Never throw from the crash writer itself.
                }
            }
            try {
                append(
                    "ERROR", "Crash",
                    "uncaught ${throwable.javaClass.simpleName} on '${thread.name}': " +
                        "${throwable.message} (report crash-$stamp.txt)",
                    null
                )
            } catch (_: Throwable) {
            }
        }
    }

    private fun buildReport(thread: Thread, throwable: Throwable, stamp: String): String {
        val sb = StringBuilder()
        sb.append("=== VGZ Sea Battle crash report $stamp ===\n")
        sb.append("Thread: ").append(thread.name).append("\n")
        sb.append("Device: ").append(Build.MANUFACTURER).append(" ").append(Build.MODEL)
            .append(" | Android ").append(Build.VERSION.RELEASE)
            .append(" (API ").append(Build.VERSION.SDK_INT).append(")\n")
        sb.append("Exception: ").append(throwable.javaClass.name).append("\n")
        sb.append("Message: ").append(throwable.message ?: "").append("\n\n")
        sb.append(Log.getStackTraceString(throwable))
        var cause = throwable.cause
        var depth = 0
        while (cause != null && depth < 10) {
            sb.append("\nCaused by: ").append(cause.javaClass.name)
                .append(": ").append(cause.message ?: "").append("\n")
            sb.append(Log.getStackTraceString(cause))
            cause = cause.cause
            depth++
        }
        return sb.toString()
    }
}
