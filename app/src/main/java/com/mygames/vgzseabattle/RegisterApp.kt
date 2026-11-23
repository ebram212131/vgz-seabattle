package com.mygames.vgzseabattle

import android.app.Activity
import android.app.AlertDialog
import android.content.Intent
import android.os.Bundle
import android.os.Handler
import android.os.Looper
import android.os.Message
import android.view.MotionEvent
import android.view.View
import android.widget.Button
import android.widget.EditText
import com.mygames.vgzseabattle.core.GlobalState
import com.mygames.vgzseabattle.core.HttpURLConnectionTransport
import com.mygames.vgzseabattle.core.LoginValidator
import com.mygames.vgzseabattle.core.ObfuscationCodec
import com.mygames.vgzseabattle.core.OnlineGateway
import com.mygames.vgzseabattle.core.RegistrationGate

/**
 * Faithful port of RegisterApp.java + helpers ab/ac/ad/ae/af.
 * Evidence: work/rea-evidence/RegisterApp.java.txt and ab..af.java.txt.
 *
 * The activity is reachable from the menu at any time (product change: the
 * account system is optional); the original server protocol is preserved and
 * honours the custom server URL from Settings.
 *
 * NEW (owner request): when the server cannot be reached the screen reports
 * "Server is not reachable" with an Ok button instead of the misleading
 * "Unknown exception" dialog the dead server produced, and every step is
 * written to the file log.
 *
 * NEW v2.2.2 (owner report: "registration misbehaves depending on the online
 * checkbox"):
 *  - the Settings online checkbox now gates the Register button. With online
 *    mode OFF the screen explains how to enable the account system instead of
 *    silently timing out on the network;
 *  - while the request is in flight the "sending score" sound plays (a blind
 *    user previously had NO audio feedback for up to ~20 s), it stops when the
 *    answer arrives and the error sound plays when the server was unreachable.
 */
class RegisterApp : Activity(), View.OnTouchListener {

    private lateinit var handler: Handler
    private lateinit var loginField: EditText
    private lateinit var registerButton: Button
    private lateinit var files: FileStore
    private lateinit var gateway: OnlineGateway
    private var soundBoard: SoundBoard? = null

    private var uid = ""           // d
    private var busy = false       // e
    private var login = ""         // f
    private var checkString = ""   // g
    private var response = ""      // j
    private var transportError = ""
    /** PRODUCT CHANGE: true when launched from the menu (optional-account flow). */
    private var fromMenu = false

    private inner class RegisterHandler : Handler(Looper.getMainLooper()) {
        override fun handleMessage(msg: Message) {
            when (msg.what) {
                MSG_REGISTER_DONE -> onRegisterResponse()
                MSG_NEXT_PAGE_DONE -> onNextPageResponse()
            }
        }
    }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.register_app)
        files = FileStore(this)
        gateway = OnlineGateway(
            HttpURLConnectionTransport(),
            Prefs.effectiveBaseUrl(this),
            Prefs.preferredScheme(this)
        ) { message -> FileLogger.i(TAG, message) }
        handler = RegisterHandler()
        window.addFlags(1024)
        loginField = findViewById(R.id.editTextLogin)
        registerButton = findViewById(R.id.buttonRegister)
        registerButton.setOnTouchListener(this)
        busy = false
        fromMenu = intent.action == ACTION_FROM_MENU || GlobalState.menuPhase == 2
        // v2.2.2: audio feedback for the online request (blind users get no
        // visual spinner; the sounds are the progress indicator).
        val sb = SoundBoard(this, 2)
        soundBoard = sb
        sb.load(0, R.raw.sound_game_sending_score)
        sb.load(1, R.raw.sound_game_send_score_error)
        FileLogger.i(TAG, "registration screen opened (fromMenu=$fromMenu, online=" +
            Prefs.onlineEnabled(this) + ", server=" + Prefs.serverUrl(this) + ")")
        showHelp()
    }

    /** Original a(String, String): message dialog. */
    private fun dialog(title: String, body: String) {
        AlertDialog.Builder(this)
            .setTitle(title)
            .setMessage(body)
            .setPositiveButton("Ok") { _, _ -> busy = false }
            .create()
            .show()
    }

    /** Owner request: explicit "Server is not reachable" report with Ok button. */
    private fun serverUnreachableDialog() {
        dialog(
            "Server is not reachable",
            "The game server could not be reached.\n" +
                "Check your Internet connection or the server address in Settings, then try again.\n" +
                "Detail: $transportError"
        )
    }

    /** Original a(String): login validation with original dialog texts. */
    private fun validate(loginCandidate: String): Boolean {
        val result = LoginValidator.validate(loginCandidate)
        return when (result) {
            is LoginValidator.Result.Valid -> true
            is LoginValidator.Result.Invalid -> {
                FileLogger.w(TAG, "login rejected: ${result.title} - ${result.body}")
                dialog(result.title, result.body)
                false
            }
        }
    }

    /** v2.2.2: "sending" cue while the register.php request is in flight. */
    private fun playSendingCue() {
        val sb = soundBoard ?: return
        val v = sb.volume()
        FileLogger.i(TAG, "about to play sending-score cue (registration in flight)")
        sb.playStereo(0, v, v, 1, loop = 1)
    }

    private fun stopSendingCue() {
        soundBoard?.stop(0)
    }

    /** v2.2.2: error cue before the "Server is not reachable" dialog. */
    private fun playErrorCue() {
        val sb = soundBoard ?: return
        val v = sb.volume()
        FileLogger.i(TAG, "about to play send-score-error cue (server unreachable)")
        sb.playStereo(1, v, v, 2)
    }

    /** Original b(): build UID from the timestamp, store data0.txt, fire register.php. */
    private fun submitRegistration() {
        // v2.2.2 GATE: registration is an online feature - the Settings checkbox
        // controls it. With online mode off, explain instead of timing out.
        if (!RegistrationGate.allows(Prefs.onlineEnabled(this))) {
            FileLogger.w(TAG, "register pressed while online mode is off -> guidance dialog")
            dialog(RegistrationGate.OFFLINE_TITLE, RegistrationGate.OFFLINE_BODY)
            return
        }
        val candidate = loginField.text.toString()
        if (!validate(candidate)) return
        login = candidate
        uid = DeviceIdentity.timestampMillis()
        uid = ObfuscationCodec.reverse(uid)
        uid = uid.substring(0, 10)
        files.writeAll("data0.txt", uid)
        val imeiLike = DeviceIdentity.imeiAndSim(this)
        val androidId = DeviceIdentity.androidId(this)
        val build = DeviceIdentity.buildFingerprint()
        checkString = uid +
            ObfuscationCodec.digitify(ObfuscationCodec.splice(imeiLike, uid)) +
            ObfuscationCodec.digitify(ObfuscationCodec.splice(androidId, uid)) + build
        busy = true
        FileLogger.i(TAG, "registering login '$login' with uid $uid")
        playSendingCue()
        Thread {
            val result = gateway.register(checkString, login)
            response = result.body
            transportError = result.error
            handler.sendEmptyMessageDelayed(MSG_REGISTER_DONE, 100L)
        }.start()
    }

    /** Original b(String): decode and follow the redirect action. */
    private fun followRedirect(payload: String) {
        val split = payload.split("\\*".toRegex())
        if (split.size < 2) return
        val action = ObfuscationCodec.decodeAction(0, split[0], split[1])
        if (fromMenu) {
            // Menu-launched registration: just return to the menu underneath.
            finish()
        } else {
            GlobalState.menuPhase = 0
            startActivity(Nav.intent(this, action))
        }
    }

    /** Original c(): help dialog (verbatim). */
    private fun showHelp() {
        AlertDialog.Builder(this)
            .setTitle("Register help")
            .setMessage(
                "There is 1 text field and 1 button on the register screen. Please type in the text field your login or nickname and click the Register button.\n" +
                    "Put your finger on the screen and move it either up and down to know where text field and button are placed.\n" +
                    "Tap twice the text field to open a virtual keyboard, if it wasn't opened automatically.\n" +
                    "When you have successfully completed the registration process you will be moved to a game menu."
            )
            .setPositiveButton("Ok") { _, _ -> }
            .create()
            .show()
    }

    /** Original d(): handle register.php response. */
    private fun onRegisterResponse() {
        stopSendingCue()
        if (transportFailed(response, transportError)) {
            playErrorCue()
            serverUnreachableDialog()
            return
        }
        val split = response.split("\\*".toRegex())
        when (split[0]) {
            "1" -> { dialog("Registration error!", "Login expected"); return }
            "2" -> { dialog("Registration error!", "User ID expected"); return }
            "3" -> { dialog("Registration error!", "This login is already taken"); return }
            "1000" -> {
                response = response.replace("1000*", "")
                files.writeAll("data1.txt", response)
                FileLogger.i(TAG, "registered ok, user id stored (${response.length} chars)")
                fetchNextPage()
            }
            else -> dialog("Registration error!", "Unknown exception. Please try again")
        }
    }

    /** Original e(): fetch get_next_page.php. */
    private fun fetchNextPage() {
        Thread {
            val result = gateway.getNextPage(checkString)
            response = result.body
            transportError = result.error
            handler.sendEmptyMessageDelayed(MSG_NEXT_PAGE_DONE, 100L)
        }.start()
    }

    /** Original f(): handle get_next_page.php response. */
    private fun onNextPageResponse() {
        stopSendingCue()
        if (transportFailed(response, transportError)) {
            playErrorCue()
            serverUnreachableDialog()
            return
        }
        val split = response.split("\\*".toRegex())
        if (split[0] == "1") {
            dialog("Registration error!", "Wrong User ID")
        } else if (split[0] != "1000") {
            dialog("Registration error!", "Unknown exception. Please try again")
        } else {
            response = response.replace("1000*", "")
            FileLogger.i(TAG, "registration flow complete, following redirect")
            followRedirect(response)
        }
    }

    private fun transportFailed(body: String, error: String): Boolean = body.isEmpty() && error.isNotEmpty()

    override fun onStart() {
        super.onStart()
        if (GlobalState.quitRequested == 1) {
            finish()
        } else if (fromMenu) {
            // Optional-account entry from the menu: no phase gating.
        } else if (GlobalState.menuPhase == 0 || GlobalState.menuPhase == 100) {
            GlobalState.menuPhase = 100
        } else {
            GlobalState.quitRequested = 1
            finish()
        }
    }

    override fun onStop() {
        if (!fromMenu && (GlobalState.quitRequested == 1 || GlobalState.menuPhase == 100)) {
            GlobalState.quitRequested = 1
            finish()
        }
        stopSendingCue()
        super.onStop()
    }

    override fun onDestroy() {
        super.onDestroy()
        soundBoard?.stopAll(2)
        soundBoard?.release()
        soundBoard = null
    }

    override fun onTouch(view: View?, event: MotionEvent?): Boolean {
        if (view === registerButton && event?.actionMasked == MotionEvent.ACTION_DOWN) {
            if (busy) return true
            submitRegistration()
        }
        return false
    }

    companion object {
        private const val TAG = "Register"
        const val MSG_REGISTER_DONE = 1000
        const val MSG_NEXT_PAGE_DONE = 1001
        const val ACTION_FROM_MENU = "com.mygames.vgzseabattle.RegisterApp.FROM_MENU"
    }
}
