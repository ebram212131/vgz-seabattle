package android.support.v4.view;

import android.view.View;

/* loaded from: classes.dex */
class r implements w {
    r() {
    }

    @Override // android.support.v4.view.w
    public int a(View view) {
        return 2;
    }

    long a() {
        return 10L;
    }

    @Override // android.support.v4.view.w
    public boolean a(View view, int i) {
        return false;
    }

    @Override // android.support.v4.view.w
    public void b(View view) {
        view.postInvalidateDelayed(a());
    }
}
