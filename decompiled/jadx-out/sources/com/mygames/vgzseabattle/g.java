package com.mygames.vgzseabattle;

import android.content.DialogInterface;

/* loaded from: classes.dex */
class g implements DialogInterface.OnClickListener {
    final /* synthetic */ ActivityLearnScreen a;

    g(ActivityLearnScreen activityLearnScreen) {
        this.a = activityLearnScreen;
    }

    @Override // android.content.DialogInterface.OnClickListener
    public void onClick(DialogInterface dialogInterface, int i) {
        switch (i) {
            case 0:
                this.a.a("Tap Close menu item to continue the game with current settings.");
                this.a.c();
                break;
            case 1:
                this.a.a("Tap Show opponent screen item to shoot the opponent ships.");
                this.a.c();
                break;
            case 2:
                this.a.a("Tap this item to get the game help.");
                this.a.c();
                break;
            case 3:
                p.d = true;
                this.a.finish();
                break;
        }
    }
}
