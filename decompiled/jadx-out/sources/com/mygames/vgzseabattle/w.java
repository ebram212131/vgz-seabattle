package com.mygames.vgzseabattle;

import android.content.Context;
import android.os.Build;
import android.provider.Settings;
import android.telephony.TelephonyManager;

/* loaded from: classes.dex */
public class w {
    public String a() {
        return String.valueOf(String.valueOf(String.valueOf(String.valueOf(String.valueOf(String.valueOf(String.valueOf(String.valueOf(new StringBuilder().append(Build.BOARD.length()).toString()) + Build.BRAND.length()) + Build.CPU_ABI.length()) + Build.DEVICE.length()) + Build.DISPLAY.length()) + Build.HOST.length()) + Build.ID.length()) + Build.MANUFACTURER.length()) + Build.MODEL.length();
    }

    public String a(Context context) {
        TelephonyManager telephonyManager = (TelephonyManager) context.getSystemService("phone");
        return String.valueOf(telephonyManager.getDeviceId()) + telephonyManager.getSimSerialNumber();
    }

    public String b(Context context) {
        return Settings.Secure.getString(context.getContentResolver(), "android_id");
    }
}
