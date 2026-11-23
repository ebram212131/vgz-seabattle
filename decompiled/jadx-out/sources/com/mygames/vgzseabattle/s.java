package com.mygames.vgzseabattle;

import android.app.Activity;
import android.os.Handler;

/* loaded from: classes.dex */
class s implements Runnable {
    final /* synthetic */ MainActivity a;

    s(MainActivity mainActivity) {
        this.a = mainActivity;
    }

    @Override // java.lang.Runnable
    public void run() {
        Activity activity;
        Handler handler;
        int i;
        Handler handler2;
        int i2;
        ag agVar = new ag();
        activity = this.a.n;
        if (agVar.b(activity)) {
            handler2 = this.a.a;
            i2 = this.a.o;
            handler2.sendEmptyMessageDelayed(i2, 100L);
        } else {
            handler = this.a.a;
            i = this.a.p;
            handler.sendEmptyMessageDelayed(i, 100L);
        }
    }
}
