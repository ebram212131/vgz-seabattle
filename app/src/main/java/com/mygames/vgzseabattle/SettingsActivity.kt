package com.mygames.vgzseabattle

import android.app.Activity
import android.os.Bundle
import android.view.MotionEvent
import android.view.View
import android.widget.Button
import android.widget.EditText
import android.widget.LinearLayout
import android.widget.Switch
import android.widget.TextView
import android.widget.Toast

/**
 * NEW in this port (requested by the product owner): settings screen where the
 * optional online account system can be enabled and a custom server URL can be
 * entered. Everything else in the game works fully offline.
 */
class SettingsActivity : Activity(), View.OnTouchListener {

    private lateinit var onlineSwitch: Switch
    private lateinit var serverField: EditText
    private lateinit var saveButton: Button

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_settings)
        window.addFlags(1024)
        onlineSwitch = findViewById(R.id.switchOnline)
        serverField = findViewById(R.id.editTextServerUrl)
        saveButton = findViewById(R.id.buttonSaveSettings)
        saveButton.setOnTouchListener(this)
        onlineSwitch.isChecked = Prefs.onlineEnabled(this)
        serverField.setText(Prefs.serverUrl(this))
    }

    override fun onTouch(view: View?, event: MotionEvent?): Boolean {
        if (view === saveButton && event?.actionMasked == MotionEvent.ACTION_DOWN) {
            Prefs.setOnlineEnabled(this, onlineSwitch.isChecked)
            val url = serverField.text.toString().trim()
            if (url.isEmpty()) {
                Prefs.setServerUrl(this, Prefs.DEFAULT_SERVER)
            } else {
                Prefs.setServerUrl(this, url)
            }
            FileLogger.i(TAG, "settings saved: online=" + Prefs.onlineEnabled(this) +
                " server=" + Prefs.serverUrl(this))
            // Owner request: point the user at the log folder inside
            // Android/data/<package name> so crashes can be reported and fixed.
            Toast.makeText(
                this,
                getString(R.string.settings_saved) + "\n" + FileLogger.logPath(),
                Toast.LENGTH_LONG
            ).show()
            finish()
        }
        return false
    }

    companion object {
        private const val TAG = "Settings"
    }
}
