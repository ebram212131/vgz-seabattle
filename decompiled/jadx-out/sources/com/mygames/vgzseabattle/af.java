package com.mygames.vgzseabattle;

import android.os.Handler;

/* loaded from: classes.dex */
class af implements Runnable {
    final /* synthetic */ RegisterApp a;

    af(RegisterApp registerApp) {
        this.a = registerApp;
    }

    @Override // java.lang.Runnable
    public void run() {
        String str;
        Handler handler;
        int i;
        y yVar = new y();
        RegisterApp registerApp = this.a;
        str = this.a.g;
        registerApp.j = yVar.a(str);
        handler = this.a.a;
        i = this.a.i;
        handler.sendEmptyMessageDelayed(i, 100L);
    }
}
