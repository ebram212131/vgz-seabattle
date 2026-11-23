package android.support.v4.view;

import android.os.Build;
import android.view.View;

/* loaded from: classes.dex */
public class q {
    static final w a;

    static {
        int i = Build.VERSION.SDK_INT;
        if (i >= 16 || Build.VERSION.CODENAME.equals("JellyBean")) {
            a = new v();
            return;
        }
        if (i >= 14) {
            a = new u();
            return;
        }
        if (i >= 11) {
            a = new t();
        } else if (i >= 9) {
            a = new s();
        } else {
            a = new r();
        }
    }

    public static int a(View view) {
        return a.a(view);
    }

    public static boolean a(View view, int i) {
        return a.a(view, i);
    }

    public static void b(View view) {
        a.b(view);
    }
}
