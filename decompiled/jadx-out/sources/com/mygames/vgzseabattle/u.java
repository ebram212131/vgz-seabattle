package com.mygames.vgzseabattle;

import android.content.DialogInterface;

/* loaded from: classes.dex */
class u implements DialogInterface.OnClickListener {
    final /* synthetic */ MainActivity a;

    u(MainActivity mainActivity) {
        this.a = mainActivity;
    }

    @Override // android.content.DialogInterface.OnClickListener
    public void onClick(DialogInterface dialogInterface, int i) {
        this.a.finish();
    }
}
