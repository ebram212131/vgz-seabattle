package com.mygames.vgzseabattle;

/* loaded from: classes.dex */
class j implements Runnable {
    final /* synthetic */ ActivityMenu a;

    j(ActivityMenu activityMenu) {
        this.a = activityMenu;
    }

    @Override // java.lang.Runnable
    public void run() {
        String str = new x().a("data1.txt").split("\\*")[0];
        this.a.a(5);
        this.a.t = true;
        this.a.u = 0;
        String a = new y().a(str, new StringBuilder().append(p.b).toString());
        if (a.length() == 0) {
            this.a.a(8);
            return;
        }
        int intValue = Integer.valueOf(a).intValue();
        if (intValue < 1) {
            this.a.a(8);
        } else if (intValue <= 0 || intValue >= 11) {
            this.a.a(7);
        } else {
            this.a.a(6);
        }
    }
}
