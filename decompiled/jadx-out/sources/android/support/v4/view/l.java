package android.support.v4.view;

import android.os.Build;
import android.view.VelocityTracker;

/* loaded from: classes.dex */
public class l {
    static final o a;

    static {
        if (Build.VERSION.SDK_INT >= 11) {
            a = new n();
        } else {
            a = new m();
        }
    }

    public static float a(VelocityTracker velocityTracker, int i) {
        return a.a(velocityTracker, i);
    }
}
