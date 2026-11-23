package com.mygames.vgzseabattle;

import android.content.DialogInterface;

/* loaded from: classes.dex */
class e implements DialogInterface.OnClickListener {
    final /* synthetic */ ActivityGameScreen a;

    e(ActivityGameScreen activityGameScreen) {
        this.a = activityGameScreen;
    }

    @Override // android.content.DialogInterface.OnClickListener
    public void onClick(DialogInterface dialogInterface, int i) {
        switch (i) {
            case 0:
                this.a.o();
                break;
            case 1:
                this.a.b(0);
                this.a.o();
                break;
            case 2:
                this.a.m();
                this.a.o();
                break;
            case 3:
                this.a.w = 0;
                this.a.A();
                this.a.o();
                break;
        }
    }
}
