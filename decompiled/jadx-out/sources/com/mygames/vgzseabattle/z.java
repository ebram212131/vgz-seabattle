package com.mygames.vgzseabattle;

/* loaded from: classes.dex */
public class z {
    private int[] a = new int[11];

    private void d() {
        int i = 0;
        while (true) {
            int i2 = i;
            if (i2 >= 10) {
                return;
            }
            for (int i3 = i2 + 1; i3 < 11; i3++) {
                if (this.a[i2] < this.a[i3]) {
                    int i4 = this.a[i2];
                    this.a[i2] = this.a[i3];
                    this.a[i3] = i4;
                }
            }
            i = i2 + 1;
        }
    }

    public int a(int i) {
        if (i >= 0 && i <= 9) {
            return this.a[i];
        }
        return 0;
    }

    public void a() {
        for (int i = 0; i < 11; i++) {
            this.a[i] = 0;
        }
        String[] a = new x().a();
        for (int i2 = 0; i2 < a.length; i2++) {
            if (a[i2].length() == 0) {
                this.a[i2] = 0;
            } else {
                try {
                    this.a[i2] = Integer.parseInt(a[i2]);
                } catch (NumberFormatException e) {
                    this.a[i2] = 0;
                }
            }
        }
        d();
    }

    public void b() {
        if (this.a[0] == 0) {
            return;
        }
        String[] strArr = new String[10];
        for (int i = 0; i < 10; i++) {
            strArr[i] = new StringBuilder().append(this.a[i]).toString();
        }
        new x().a(strArr);
    }

    public void c() {
        if (p.b == 0) {
            return;
        }
        this.a[10] = p.b;
        d();
        b();
    }
}
