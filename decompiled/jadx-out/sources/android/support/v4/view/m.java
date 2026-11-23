package android.support.v4.view;

import android.view.VelocityTracker;

/* loaded from: classes.dex */
class m implements o {
    m() {
    }

    @Override // android.support.v4.view.o
    public float a(VelocityTracker velocityTracker, int i) {
        return velocityTracker.getXVelocity();
    }
}
