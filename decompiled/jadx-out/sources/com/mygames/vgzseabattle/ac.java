package com.mygames.vgzseabattle;

import android.os.Handler;

/* loaded from: classes.dex */
class ac implements Runnable {
    final /* synthetic */ RegisterApp a;

    ac(RegisterApp registerApp) {
        this.a = registerApp;
    }

    @Override // java.lang.Runnable
    public void run() {
        String str;
        String str2;
        Handler handler;
        int i;
        this.a.e = true;
        y yVar = new y();
        RegisterApp registerApp = this.a;
        str = this.a.g;
        str2 = this.a.f;
        registerApp.j = yVar.b(str, str2);
        handler = this.a.a;
        i = this.a.h;
        handler.sendEmptyMessageDelayed(i, 100L);
    }
}
