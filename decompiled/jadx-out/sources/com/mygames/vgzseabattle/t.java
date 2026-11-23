package com.mygames.vgzseabattle;

/* loaded from: classes.dex */
class t implements Runnable {
    final /* synthetic */ MainActivity a;

    t(MainActivity mainActivity) {
        this.a = mainActivity;
    }

    @Override // java.lang.Runnable
    public void run() {
        String str;
        String str2;
        String str3;
        String str4;
        y yVar = new y();
        MainActivity mainActivity = this.a;
        str = this.a.j;
        mainActivity.j = yVar.a(str);
        str2 = this.a.j;
        if (str2.indexOf("1000*") == -1) {
            this.a.j = "";
            return;
        }
        MainActivity mainActivity2 = this.a;
        str3 = this.a.j;
        mainActivity2.j = str3.replace("1000*", "");
        str4 = this.a.j;
        String[] split = str4.split("\\*");
        aa aaVar = new aa();
        this.a.j = aaVar.a(0, split[0], split[1]);
    }
}
