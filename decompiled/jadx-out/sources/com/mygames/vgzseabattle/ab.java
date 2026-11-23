package com.mygames.vgzseabattle;

import android.os.Handler;
import android.os.Message;

/* loaded from: classes.dex */
class ab extends Handler {
    final /* synthetic */ RegisterApp a;

    ab(RegisterApp registerApp) {
        this.a = registerApp;
    }

    @Override // android.os.Handler
    public void handleMessage(Message message) {
        int i;
        int i2;
        int i3 = message.what;
        i = this.a.h;
        if (i3 == i) {
            this.a.d();
        }
        int i4 = message.what;
        i2 = this.a.i;
        if (i4 == i2) {
            this.a.f();
        }
    }
}
