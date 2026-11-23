package com.mygames.vgzseabattle;

import android.os.Handler;
import android.os.Message;

/* loaded from: classes.dex */
class r extends Handler {
    final /* synthetic */ MainActivity a;

    r(MainActivity mainActivity) {
        this.a = mainActivity;
    }

    @Override // android.os.Handler
    public void handleMessage(Message message) {
        int i;
        int i2;
        String c;
        int i3 = message.what;
        i = this.a.o;
        if (i3 == i) {
            String b = new x().b("data1.txt");
            if (b.length() == 0) {
                this.a.j = "";
            } else {
                c = this.a.c();
                this.a.a(b, c);
            }
            p.h = true;
        }
        int i4 = message.what;
        i2 = this.a.p;
        if (i4 == i2) {
            this.a.d();
        }
    }
}
