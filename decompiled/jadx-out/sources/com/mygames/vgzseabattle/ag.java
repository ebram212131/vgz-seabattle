package com.mygames.vgzseabattle;

import android.content.Context;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.URL;

/* loaded from: classes.dex */
public class ag {
    public boolean a(Context context) {
        NetworkInfo activeNetworkInfo = ((ConnectivityManager) context.getSystemService("connectivity")).getActiveNetworkInfo();
        return activeNetworkInfo != null && activeNetworkInfo.isConnected();
    }

    public boolean b(Context context) {
        if (!a(context)) {
            return false;
        }
        try {
            HttpURLConnection httpURLConnection = (HttpURLConnection) new URL("http://www.vipgameszone.com").openConnection();
            httpURLConnection.setRequestProperty("User-Agent", "test");
            httpURLConnection.setRequestProperty("Connection", "close");
            httpURLConnection.setConnectTimeout(3000);
            httpURLConnection.setReadTimeout(4000);
            httpURLConnection.connect();
            return httpURLConnection.getResponseCode() == 200;
        } catch (IOException e) {
            return false;
        }
    }
}
