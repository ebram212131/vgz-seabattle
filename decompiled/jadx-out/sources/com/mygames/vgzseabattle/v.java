package com.mygames.vgzseabattle;

import android.content.Context;
import java.util.Calendar;

/* loaded from: classes.dex */
public class v {
    public String a() {
        return new StringBuilder().append(Long.valueOf(Calendar.getInstance().getTimeInMillis())).toString();
    }

    public void a(Context context) {
        p.f = context.getApplicationContext().getPackageManager().getPackageInfo(context.getPackageName(), 0).applicationInfo.dataDir;
    }
}
