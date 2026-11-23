package com.mygames.vgzseabattle;

import android.content.DialogInterface;

/* loaded from: classes.dex */
class h implements DialogInterface.OnClickListener {
    final /* synthetic */ ActivityLearnScreen a;

    h(ActivityLearnScreen activityLearnScreen) {
        this.a = activityLearnScreen;
    }

    @Override // android.content.DialogInterface.OnClickListener
    public void onClick(DialogInterface dialogInterface, int i) {
        switch (i) {
            case 1:
                p.d = true;
                this.a.finish();
                break;
        }
    }
}
