package com.mygames.vgzseabattle

import android.content.Context
import android.content.Intent

/**
 * Centralizes in-app navigation and fixes the crash reported on Android 16.
 *
 * WHY THIS EXISTS: the original Java game navigated between screens with
 * *implicit* intents built from an action string, e.g.
 *     startActivity(Intent("com.mygames.vgzseabattle.ActivityMenu"))
 * Every target activity is declared `android:exported="false"` in the
 * manifest (they are internal screens, not launch entry points). Starting
 * with Android 14 and enforced strictly on Android 16 (API 36), an implicit
 * intent no longer resolves to a non-exported component, so the legacy call
 * threw `ActivityNotFoundException` the moment the splash tried to open the
 * menu - and again for every subsequent screen. On-device crash logs:
 *   "No Activity found to handle Intent { act=com.mygames.vgzseabattle.ActivityMenu }"
 *
 * FIX: for every known in-app action we now build an *explicit* intent that
 * names the target Activity class directly (`Intent(context, TargetClass)`).
 * Explicit intents bypass intent-filter resolution entirely and start
 * non-exported components within the same app on every Android version. For
 * any action we do not know ahead of time (a server-redirected action decoded
 * at runtime), we fall back to a package-scoped implicit intent (`setPackage`),
 * which is the documented way to let an implicit intent resolve a non-exported
 * component in the app's own package on Android 14+.
 */
object Nav {
    private val ACTION_TO_CLASS: Map<String, Class<out android.app.Activity>> = mapOf(
        MainActivity.ACTION_MENU to ActivityMenu::class.java,
        ActivityMenu.ACTION_GAME_SCREEN to ActivityGameScreen::class.java,
        ActivityMenu.ACTION_LEARN_SOUNDS to ActivityLearnSounds::class.java,
        ActivityMenu.ACTION_LEARN_SCREEN to ActivityLearnScreen::class.java,
        ActivityMenu.ACTION_VIEW_TOP to ActivityViewTop::class.java,
        ActivityMenu.ACTION_SETTINGS to SettingsActivity::class.java,
    )

    /**
     * A launch [Intent] for [action]. Explicit (names the target class) for the
     * known in-app actions; package-scoped implicit for any unknown
     * server-decoded action, which still resolves a non-exported component in
     * this app's own package. Never throws - if nothing matches, the caller
     * simply gets an intent that the system resolves against this package.
     */
    fun intent(context: Context, action: String): Intent {
        val clazz = ACTION_TO_CLASS[action]
        if (clazz != null) {
            return Intent(context, clazz)
        }
        FileLogger.w("Nav", "unknown action '$action'; using package-scoped implicit intent")
        return Intent(action).setPackage(context.packageName)
    }
}
