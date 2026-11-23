package com.mygames.vgzseabattle;

import android.content.Intent;

/* loaded from: classes.dex */
class k implements Runnable {
    final /* synthetic */ ActivityMenu a;

    k(ActivityMenu activityMenu) {
        this.a = activityMenu;
    }

    @Override // java.lang.Runnable
    public void run() {
        String str;
        int i;
        int i2;
        y yVar = new y();
        str = this.a.v;
        String a = yVar.a(str);
        if (a.indexOf("1000*") == -1) {
            return;
        }
        String[] split = a.replace("1000*", "").split("\\*");
        aa aaVar = new aa();
        i = this.a.w;
        String str2 = split[0];
        i2 = this.a.w;
        this.a.startActivity(new Intent(aaVar.a(i, str2, split[i2 + 1])));
    }
}
