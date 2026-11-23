package com.mygames.vgzseabattle.core

/**
 * NEW (owner report, v2.2.2: "registration misbehaves depending on the online
 * checkbox"): registration is the one purely-online feature of the game, so the
 * Settings checkbox must gate it explicitly.
 *
 * Before this gate the Register screen always fired the network request even
 * with online mode switched off, which left a blind user waiting in silence
 * (up to 20-30 s of no audio feedback) before the "Server is not reachable"
 * dialog. With the gate:
 *  - online OFF  -> an immediate spoken/text dialog explains how to enable the
 *    account system (no network call at all);
 *  - online ON   -> the request runs as before, now with the "sending score"
 *    audio cue while it is in flight (RegisterApp handles the sounds).
 *
 * Kept in core/ so the rule is plain-JVM testable (RegistrationGateTest).
 */
object RegistrationGate {

    const val OFFLINE_TITLE = "Online mode is off"
    const val OFFLINE_BODY =
        "Registration uses the online account system, which is switched off.\n" +
            "Open Settings, tick the online mode checkbox, enter the server address, " +
            "save, and try again."

    /** true = registration may go online; false = show OFFLINE_TITLE / OFFLINE_BODY first. */
    fun allows(onlineEnabled: Boolean): Boolean = onlineEnabled
}
