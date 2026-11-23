package com.mygames.vgzseabattle;

import android.os.Handler;
import android.os.Message;

/* loaded from: classes.dex */
class a extends Handler {
    final /* synthetic */ ActivityGameScreen a;

    a(ActivityGameScreen activityGameScreen) {
        this.a = activityGameScreen;
    }

    @Override // android.os.Handler
    public void handleMessage(Message message) {
        int i;
        int i2;
        int i3;
        int i4;
        int i5;
        int i6;
        int i7;
        Handler handler;
        int i8;
        int i9 = message.what;
        i = this.a.e;
        if (i9 == i) {
            this.a.r = false;
            this.a.q();
        }
        int i10 = message.what;
        i2 = this.a.f;
        if (i10 == i2) {
            this.a.s = false;
        }
        int i11 = message.what;
        i3 = this.a.g;
        if (i11 == i3) {
            this.a.t = false;
            this.a.x = true;
            this.a.b(0);
        }
        int i12 = message.what;
        i4 = this.a.h;
        if (i12 == i4) {
            this.a.r = false;
            this.a.v();
        }
        int i13 = message.what;
        i5 = this.a.i;
        if (i13 == i5) {
            this.a.s = false;
            this.a.x = true;
            this.a.u();
        }
        int i14 = message.what;
        i6 = this.a.j;
        if (i14 == i6) {
            this.a.t = false;
            this.a.x = false;
            this.a.b(1);
        }
        int i15 = message.what;
        i7 = this.a.k;
        if (i15 == i7) {
            this.a.t = false;
            this.a.x = false;
            if (!p.c) {
                p.d = true;
                this.a.finish();
            } else {
                handler = this.a.d;
                i8 = this.a.k;
                handler.sendEmptyMessageDelayed(i8, 1000L);
            }
        }
    }
}
