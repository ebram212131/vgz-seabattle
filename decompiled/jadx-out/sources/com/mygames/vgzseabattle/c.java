package com.mygames.vgzseabattle;

import android.content.DialogInterface;

/* loaded from: classes.dex */
class c implements DialogInterface.OnClickListener {
    final /* synthetic */ ActivityGameScreen a;

    c(ActivityGameScreen activityGameScreen) {
        this.a = activityGameScreen;
    }

    @Override // android.content.DialogInterface.OnClickListener
    public void onClick(DialogInterface dialogInterface, int i) {
        switch (i) {
            case 0:
                this.a.o();
                break;
            case 1:
                this.a.b(1);
                this.a.o();
                break;
            case 2:
                this.a.k();
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
