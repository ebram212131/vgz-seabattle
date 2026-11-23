package com.mygames.vgzseabattle

import android.app.Activity
import android.app.AlertDialog
import android.content.Intent
import android.os.Bundle
import android.os.Handler
import android.os.Looper
import android.os.Message
import android.view.View
import android.widget.ImageView
import android.widget.RelativeLayout
import com.mygames.vgzseabattle.core.GlobalState
import com.mygames.vgzseabattle.core.HttpURLConnectionTransport
import com.mygames.vgzseabattle.core.ObfuscationCodec
import com.mygames.vgzseabattle.core.OnlineGateway
import com.mygames.vgzseabattle.core.ServerUrls

/**
 * Faithful port of MainActivity.java + its helpers q/r/s/t/u/v/w/x/y/aa/ag.
 * Evidence: work/rea-evidence/MainActivity.java.txt and the helper files.
 *
 * CRASH FIX (owner report: "the app crashes because of the dead server"):
 *  - the original-style verification ran get_next_page.php on the main thread,
 *    which threw NetworkOnMainThreadException as soon as the server was slow;
 *    all network work now happens on worker threads.
 *  - every network failure is caught and reported as a "Server is not
 *    reachable" dialog with an Ok button; pressing Ok continues to the game
 *    menu offline instead of exiting the process.
 *
 * PRODUCT CHANGE (documented, requested by the owner): the online account check
 * is optional. With Prefs.onlineEnabled == false (the default) the splash never
 * touches the network and simply plays the intro sounds, then opens the menu.
 * With online mode on, the original flow runs (registration verify ->
 * get_next_page -> unregistered fallback) with https-first server failover.
 */
class MainActivity : Activity(), View.OnTouchListener {

    private lateinit var handler: Handler
    private lateinit var picture: ImageView
    private lateinit var layout: RelativeLayout
    private lateinit var files: FileStore
    private lateinit var gateway: OnlineGateway

    private var soundBoard: SoundBoard? = null
    private var introSoundId = 0
    private var errorSoundId = 0
    private var introStream = 0
    private var errorStream = 0

    private var tick = 0                    // i
    private var introPlayed = false         // g
    private var targetAction = ""           // j
    private var deviceKey = ""              // q
    private var unreachableDialogShown = false
    private var menuStarted = false

    private var timer: java.util.Timer? = null

    private inner class SplashHandler : Handler(Looper.getMainLooper()) {
        override fun handleMessage(msg: Message) {
            when (msg.what) {
                MSG_VERIFY -> startVerification()
                MSG_ERROR -> showServerUnreachableDialog()
            }
        }
    }

    override fun onCreate(savedInstanceState: Bundle?) {
        GlobalState.quitRequested = 0
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)
        files = FileStore(this)
        files.publishDataDir()
        gateway = OnlineGateway(
            HttpURLConnectionTransport(),
            Prefs.effectiveBaseUrl(this),
            Prefs.preferredScheme(this)
        ) { message -> FileLogger.i(TAG, message) }
        handler = SplashHandler()
        window.addFlags(1024) // FLAG_KEEP_SCREEN_ON

        picture = findViewById(R.id.mainPictureView)
        picture.setOnTouchListener(this)
        layout = findViewById(R.id.layout_main_activity)
        layout.setOnTouchListener(this)

        setVolumeControlStream(3)
        val sb = SoundBoard(this, 2)
        soundBoard = sb
        introSoundId = sb.load(0, R.raw.sound_game_intro)
        errorSoundId = sb.load(1, R.raw.sound_start_internet_error)

        timer = java.util.Timer()
        timer?.schedule(SplashTicker(), 1000L, 1000L)

        FileLogger.i(TAG, "splash started, online=" + Prefs.onlineEnabled(this) +
            " server=" + Prefs.serverUrl(this))

        // b()/s(): network reachability probe only when online mode is on.
        if (Prefs.onlineEnabled(this)) {
            Thread {
                val reachable = probeServer()
                if (reachable) {
                    handler.sendEmptyMessageDelayed(MSG_VERIFY, 100L)
                } else {
                    FileLogger.w(TAG, "server probe failed: " + Prefs.serverUrl(this))
                    runOnUiThread { showServerUnreachableDialog() }
                }
            }.start()
        } else {
            GlobalState.splashTicking = true
        }
    }

    /** ag.b(Context) equivalent: HTTP probe against the configured server host. */
    private fun probeServer(): Boolean {
        val raw = Prefs.serverUrl(this)
        for (url in ServerUrls.candidates(raw, Prefs.preferredScheme(this))) {
            if (probeUrl(url)) {
                val scheme = url.substringBefore("://")
                gateway.markScheme(scheme)
                if (Prefs.preferredScheme(this) != scheme) {
                    Prefs.setPreferredScheme(this, scheme)
                    FileLogger.i(TAG, "server reachable via $scheme:// (scheme remembered)")
                }
                return true
            }
            FileLogger.w(TAG, "probe failed for $url")
        }
        return false
    }

    private fun probeUrl(url: String): Boolean {
        return try {
            val conn = java.net.URL(url).openConnection() as java.net.HttpURLConnection
            conn.requestMethod = "GET"
            conn.setRequestProperty("User-Agent", "test")
            conn.setRequestProperty("Connection", "close")
            conn.connectTimeout = 3000
            conn.readTimeout = 4000
            conn.connect()
            // Any HTTP answer proves the host is reachable; the original required
            // 200 from its own portal root, but a custom PHP path may answer
            // 301/403/404 and still be a perfectly working backend.
            val reachable = conn.responseCode > 0
            conn.disconnect()
            reachable
        } catch (e: Exception) {
            FileLogger.w(TAG, "probe $url error: ${e.javaClass.simpleName}: ${e.message}")
            false
        }
    }

    /**
     * Original r() + t(): verify data1.txt and ask get_next_page.php. Both run
     * on a worker thread now (crash fix: NetworkOnMainThreadException).
     */
    private fun startVerification() {
        Thread {
            var action = ""
            try {
                val saved = files.readIfExists("data1.txt")
                if (saved.isEmpty()) {
                    FileLogger.i(TAG, "no saved registration (data1.txt empty)")
                } else {
                    val computed = computeCheck()
                    action = verifyRegistration(saved, computed)
                }
            } catch (e: Exception) {
                FileLogger.e(TAG, "verification failed", e)
            }
            val finalAction = action
            runOnUiThread {
                GlobalState.splashTicking = true
                targetAction = finalAction
            }
        }.start()
    }

    /**
     * Original MainActivity.c(): the device check string
     * digitify(splice(imeiAndSim, seed)) + digitify(splice(androidId, seed)) + buildLengths.
     */
    private fun computeCheck(): String {
        deviceKey = files.readAll("data0.txt")
        val imeiLike = DeviceIdentity.imeiAndSim(this)
        val androidId = DeviceIdentity.androidId(this)
        val build = DeviceIdentity.buildFingerprint()
        return ObfuscationCodec.digitify(ObfuscationCodec.splice(imeiLike, deviceKey)) +
            ObfuscationCodec.digitify(ObfuscationCodec.splice(androidId, deviceKey)) + build
    }

    /**
     * Original MainActivity.a(String, String) + t.java:
     * checksum(data1.txt part) must equal the computed check; then
     * get_next_page.php is asked with UID = seed + computed, and the response
     * decodes into the redirect action.
     */
    private fun verifyRegistration(saved: String, computed: String): String {
        val parts = saved.split("\\*".toRegex())
        if (parts.isEmpty()) return ""
        val uid = deviceKey + computed
        return if (ObfuscationCodec.checksum(parts[0]) == computed) {
            val result = gateway.getNextPage(uid)
            if (!result.ok) return ""
            val response = result.body
            if (!response.contains("1000*")) {
                FileLogger.w(TAG, "get_next_page: unexpected body: " + response.take(120))
                return ""
            }
            val clean = response.replace("1000*", "")
            val chunks = clean.split("\\*".toRegex())
            if (chunks.size >= 2) {
                ObfuscationCodec.decodeAction(0, chunks[0], chunks[1])
            } else {
                ""
            }
        } else {
            FileLogger.w(TAG, "data1 checksum mismatch -> treated as unregistered")
            ""
        }
    }

    /**
     * Owner request: when the server cannot be reached, show the error
     * "Server is not reachable" with an Ok button; Ok continues offline to the
     * game menu (the process is never killed from here).
     */
    private fun showServerUnreachableDialog() {
        if (unreachableDialogShown || isFinishing) return
        unreachableDialogShown = true
        FileLogger.w(TAG, "reporting: server is not reachable")
        if (errorSoundId != 0) {
            soundBoard?.let { errorStream = it.play(1, 2) }
        }
        val builder = AlertDialog.Builder(this)
        builder.setTitle("Server is not reachable")
        builder.setMessage(
            "The game server could not be reached.\n" +
                "Check your Internet connection or the server address in Settings.\n" +
                "Press Ok to continue offline."
        )
        builder.setPositiveButton("Ok") { _, _ -> continueOffline() }
        builder.create().show()
    }

    /**
     * Ok on the unreachable dialog: keep playing, straight into the menu.
     * The splash activity stays on the back stack (stopped) exactly like in the
     * original flow, so the quit-from-menu path still works via quitRequested.
     */
    private fun continueOffline() {
        GlobalState.splashTicking = true
        FileLogger.i(TAG, "server unreachable -> continuing offline to the menu")
        openMenu(ACTION_MENU)
    }

    /** Starts the next activity once; guards the double-start after the dialog. */
    private fun openMenu(action: String) {
        if (menuStarted || isFinishing) return
        menuStarted = true
        soundBoard?.let {
            it.stop(0)
            it.stop(1)
        }
        startActivity(Intent(action))
    }

    /** Original q.java timer task. */
    private inner class SplashTicker : java.util.TimerTask() {
        override fun run() {
            val sb = soundBoard ?: return
            if (introSoundId != 0 && !introPlayed) {
                introStream = sb.playStereo(0, sb.volume(), sb.volume(), 1, loop = 2)
                introPlayed = true
            }
            if (GlobalState.splashTicking) {
                tick++
            }
            if (tick == 7 && GlobalState.splashTicking) {
                if (targetAction.isEmpty() && Prefs.onlineEnabled(this@MainActivity) &&
                    !unreachableDialogShown
                ) {
                    // Original q.java: registered users get a redirect payload,
                    // everyone else is sent to registration via unregistered.php.
                    val result = gateway.unregistered()
                    val response = result.body
                    if (result.ok && response.contains("***")) {
                        targetAction = response.replace("***", "").trim()
                        FileLogger.i(TAG, "unregistered redirect: $targetAction")
                    } else {
                        if (!result.ok) {
                            FileLogger.w(TAG, "unregistered probe failed: ${result.error}")
                        } else {
                            FileLogger.w(TAG, "unregistered probe: unexpected body " + response.take(120))
                        }
                        runOnUiThread { showServerUnreachableDialog() }
                        return
                    }
                } else if (targetAction.isEmpty()) {
                    // Offline mode (or already handled failure): straight to menu.
                    targetAction = ACTION_MENU
                }
                sb.stop(0)
                if (targetAction.isNotEmpty()) {
                    runOnUiThread { openMenu(targetAction) }
                }
            }
            if (GlobalState.quitRequested == 1) {
                timer?.cancel()
                runOnUiThread { finish() }
            }
        }
    }

    override fun onCreateOptionsMenu(menu: android.view.Menu?): Boolean {
        menuInflater.inflate(R.menu.activity_main, menu)
        return true
    }

    override fun onDestroy() {
        super.onDestroy()
        soundBoard?.release()
        android.os.Process.killProcess(android.os.Process.myPid())
    }

    override fun onTouch(v: View?, event: android.view.MotionEvent?): Boolean = false

    companion object {
        private const val TAG = "Splash"
        const val ACTION_MENU = "com.mygames.vgzseabattle.ActivityMenu"
        const val MSG_VERIFY = 1001
        const val MSG_ERROR = 1002
    }
}
