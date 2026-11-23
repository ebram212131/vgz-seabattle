package com.mygames.vgzseabattle

import android.content.Context
import android.content.SharedPreferences
import com.mygames.vgzseabattle.core.ServerUrls

/**
 * NEW in the port (product decision): the online account system is optional and
 * its server is configurable. Defaults preserve the original behaviour when
 * online mode is switched on.
 *
 * NEW (product request: "use https when available"): a server address without an
 * explicit scheme is tried with https first and http as fallback; the scheme
 * that worked is remembered in KEY_SERVER_SCHEME so later requests do not pay
 * the failing attempt again. Changing the server address clears that memory.
 */
object Prefs {
    private const val NAME = "vgz_settings"
    const val KEY_ONLINE_ENABLED = "online_enabled"
    const val KEY_SERVER_URL = "server_url"
    const val KEY_SERVER_SCHEME = "server_scheme"

    /** Scheme-less on purpose: ServerUrls tries https first, then http. */
    const val DEFAULT_SERVER = "android.vipgameszone.com/sea_battle"

    fun prefs(context: Context): SharedPreferences =
        context.getSharedPreferences(NAME, Context.MODE_PRIVATE)

    fun onlineEnabled(context: Context): Boolean = prefs(context).getBoolean(KEY_ONLINE_ENABLED, false)

    fun setOnlineEnabled(context: Context, value: Boolean) {
        prefs(context).edit().putBoolean(KEY_ONLINE_ENABLED, value).commit()
    }

    fun serverUrl(context: Context): String =
        prefs(context).getString(KEY_SERVER_URL, DEFAULT_SERVER) ?: DEFAULT_SERVER

    fun setServerUrl(context: Context, value: String) {
        val v = value.trim().trimEnd('/')
        val changed = v != serverUrl(context)
        val editor = prefs(context).edit()
        editor.putString(KEY_SERVER_URL, v)
        if (changed) editor.remove(KEY_SERVER_SCHEME)
        editor.commit()
    }

    /** https/http remembered after a successful request (null = not known yet). */
    fun preferredScheme(context: Context): String? =
        prefs(context).getString(KEY_SERVER_SCHEME, null)

    fun setPreferredScheme(context: Context, scheme: String?) {
        val editor = prefs(context).edit()
        if (scheme == null) editor.remove(KEY_SERVER_SCHEME) else editor.putString(KEY_SERVER_SCHEME, scheme)
        editor.commit()
    }

    /** Normalized base URL (adds https when the user typed no scheme). */
    fun effectiveBaseUrl(context: Context): String = ServerUrls.normalize(serverUrl(context))
}
