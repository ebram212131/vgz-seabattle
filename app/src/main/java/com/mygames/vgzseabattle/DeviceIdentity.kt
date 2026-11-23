package com.mygames.vgzseabattle

import android.content.Context
import android.provider.Settings

/**
 * Faithful port of w.java (device fingerprint) and v.java (timestamp), adjusted
 * for modern Android: the original additionally mixed IMEI + SIM serial via the
 * deprecated TelephonyManager APIs. Our targetSdk 35 build never declares
 * READ_PHONE_STATE, so those calls return null / throw on every modern device -
 * the decompiled original then produced String.valueOf(null) + String.valueOf(null)
 * = "nullnull". We reproduce exactly that constant, which keeps the UID byte
 * compatible with the decompiled protocol ("nullnull" contains no '0' char, so
 * splice() and digitify() are fully deterministic for every seed).
 *
 * Evidence: work/rea-evidence/w.java.txt, v.java.txt.
 */
object DeviceIdentity {

    /** Original w.a(): concatenated String lengths of Build fields. */
    fun buildFingerprint(): String {
        val parts = intArrayOf(
            android.os.Build.BOARD.length,
            android.os.Build.BRAND.length,
            android.os.Build.CPU_ABI.length,
            android.os.Build.DEVICE.length,
            android.os.Build.DISPLAY.length,
            android.os.Build.HOST.length,
            android.os.Build.ID.length,
            android.os.Build.MANUFACTURER.length,
            android.os.Build.MODEL.length
        )
        return parts.joinToString("")
    }

    /** Original w.a(Context): deviceId + simSerialNumber -> "nullnull" on modern Android. */
    fun imeiAndSim(context: Context? = null): String = "nullnull"

    /** Original w.b(Context): Settings.Secure android_id. */
    fun androidId(context: Context): String =
        Settings.Secure.getString(context.contentResolver, "android_id") ?: ""

    /** v.java a(): current wall-clock millis. */
    fun timestampMillis(): String = System.currentTimeMillis().toString()
}
