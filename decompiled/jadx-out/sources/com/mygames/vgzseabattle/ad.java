package com.mygames.vgzseabattle;

import android.content.DialogInterface;

/* loaded from: classes.dex */
class ad implements DialogInterface.OnClickListener {
    final /* synthetic */ RegisterApp a;

    ad(RegisterApp registerApp) {
        this.a = registerApp;
    }

    @Override // android.content.DialogInterface.OnClickListener
    public void onClick(DialogInterface dialogInterface, int i) {
        this.a.e = false;
    }
}
