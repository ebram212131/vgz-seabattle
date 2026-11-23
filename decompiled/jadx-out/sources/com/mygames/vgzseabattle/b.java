package com.mygames.vgzseabattle;

import android.content.DialogInterface;

/* loaded from: classes.dex */
class b implements DialogInterface.OnClickListener {
    final /* synthetic */ ActivityGameScreen a;

    b(ActivityGameScreen activityGameScreen) {
        this.a = activityGameScreen;
    }

    @Override // android.content.DialogInterface.OnClickListener
    public void onClick(DialogInterface dialogInterface, int i) {
        switch (i) {
            case 0:
                this.a.e();
                this.a.b(0);
                this.a.o();
                break;
            case 1:
                this.a.e();
                this.a.b(1);
                this.a.o();
                break;
        }
    }
}
