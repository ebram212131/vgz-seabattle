package android.support.v4.app;

import android.content.Context;
import android.content.res.Configuration;
import android.os.Build;
import android.os.Bundle;
import android.os.Handler;
import android.os.Parcelable;
import android.util.Log;
import android.util.SparseArray;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.animation.AccelerateInterpolator;
import android.view.animation.AlphaAnimation;
import android.view.animation.Animation;
import android.view.animation.AnimationSet;
import android.view.animation.AnimationUtils;
import android.view.animation.DecelerateInterpolator;
import android.view.animation.Interpolator;
import android.view.animation.ScaleAnimation;
import java.io.FileDescriptor;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Arrays;

/* loaded from: classes.dex */
final class l extends j {
    static final Interpolator A;
    static boolean a = false;
    static final boolean b;
    static final Interpolator x;
    static final Interpolator y;
    static final Interpolator z;
    ArrayList c;
    Runnable[] d;
    boolean e;
    ArrayList f;
    ArrayList g;
    ArrayList h;
    ArrayList i;
    ArrayList j;
    ArrayList k;
    ArrayList l;
    ArrayList m;
    int n;
    g o;
    boolean p;
    boolean q;
    boolean r;
    String s;
    boolean t;
    Bundle u;
    SparseArray v;
    Runnable w;

    static {
        b = Build.VERSION.SDK_INT >= 11;
        x = new DecelerateInterpolator(2.5f);
        y = new DecelerateInterpolator(1.5f);
        z = new AccelerateInterpolator(2.5f);
        A = new AccelerateInterpolator(1.5f);
    }

    static Animation a(Context context, float f, float f2) {
        AlphaAnimation alphaAnimation = new AlphaAnimation(f, f2);
        alphaAnimation.setInterpolator(y);
        alphaAnimation.setDuration(220L);
        return alphaAnimation;
    }

    static Animation a(Context context, float f, float f2, float f3, float f4) {
        AnimationSet animationSet = new AnimationSet(false);
        ScaleAnimation scaleAnimation = new ScaleAnimation(f, f2, f, f2, 1, 0.5f, 1, 0.5f);
        scaleAnimation.setInterpolator(x);
        scaleAnimation.setDuration(220L);
        animationSet.addAnimation(scaleAnimation);
        AlphaAnimation alphaAnimation = new AlphaAnimation(f3, f4);
        alphaAnimation.setInterpolator(y);
        alphaAnimation.setDuration(220L);
        animationSet.addAnimation(alphaAnimation);
        return animationSet;
    }

    public static int b(int i, boolean z2) {
        switch (i) {
            case 4097:
                return z2 ? 1 : 2;
            case 4099:
                return z2 ? 5 : 6;
            case 8194:
                return z2 ? 3 : 4;
            default:
                return -1;
        }
    }

    public static int c(int i) {
        switch (i) {
            case 4097:
                return 8194;
            case 4099:
                return 4099;
            case 8194:
                return 4097;
            default:
                return 0;
        }
    }

    private void r() {
        if (this.q) {
            throw new IllegalStateException("Can not perform this action after onSaveInstanceState");
        }
        if (this.s != null) {
            throw new IllegalStateException("Can not perform this action inside of " + this.s);
        }
    }

    public Fragment a(int i) {
        if (this.g != null) {
            for (int size = this.g.size() - 1; size >= 0; size--) {
                Fragment fragment = (Fragment) this.g.get(size);
                if (fragment != null && fragment.u == i) {
                    return fragment;
                }
            }
        }
        if (this.f != null) {
            for (int size2 = this.f.size() - 1; size2 >= 0; size2--) {
                Fragment fragment2 = (Fragment) this.f.get(size2);
                if (fragment2 != null && fragment2.u == i) {
                    return fragment2;
                }
            }
        }
        return null;
    }

    public Fragment a(Bundle bundle, String str) {
        int i = bundle.getInt(str, -1);
        if (i == -1) {
            return null;
        }
        if (i >= this.f.size()) {
            throw new IllegalStateException("Fragement no longer exists for key " + str + ": index " + i);
        }
        Fragment fragment = (Fragment) this.f.get(i);
        if (fragment == null) {
            throw new IllegalStateException("Fragement no longer exists for key " + str + ": index " + i);
        }
        return fragment;
    }

    public Fragment a(String str) {
        if (this.g != null && str != null) {
            for (int size = this.g.size() - 1; size >= 0; size--) {
                Fragment fragment = (Fragment) this.g.get(size);
                if (fragment != null && str.equals(fragment.w)) {
                    return fragment;
                }
            }
        }
        if (this.f != null && str != null) {
            for (int size2 = this.f.size() - 1; size2 >= 0; size2--) {
                Fragment fragment2 = (Fragment) this.f.get(size2);
                if (fragment2 != null && str.equals(fragment2.w)) {
                    return fragment2;
                }
            }
        }
        return null;
    }

    Animation a(Fragment fragment, int i, boolean z2, int i2) {
        int b2;
        Animation loadAnimation;
        Animation a2 = fragment.a(i, z2, fragment.E);
        if (a2 != null) {
            return a2;
        }
        if (fragment.E != 0 && (loadAnimation = AnimationUtils.loadAnimation(this.o, fragment.E)) != null) {
            return loadAnimation;
        }
        if (i != 0 && (b2 = b(i, z2)) >= 0) {
            switch (b2) {
                case 1:
                    return a(this.o, 1.125f, 1.0f, 0.0f, 1.0f);
                case 2:
                    return a(this.o, 1.0f, 0.975f, 1.0f, 0.0f);
                case 3:
                    return a(this.o, 0.975f, 1.0f, 0.0f, 1.0f);
                case 4:
                    return a(this.o, 1.0f, 1.075f, 1.0f, 0.0f);
                case 5:
                    return a(this.o, 0.0f, 1.0f);
                case 6:
                    return a(this.o, 1.0f, 0.0f);
                default:
                    if (i2 == 0 && this.o.getWindow() != null) {
                        i2 = this.o.getWindow().getAttributes().windowAnimations;
                    }
                    return i2 == 0 ? null : null;
            }
        }
        return null;
    }

    void a(int i, int i2, int i3, boolean z2) {
        if (this.o == null && i != 0) {
            throw new IllegalStateException("No activity");
        }
        if (z2 || this.n != i) {
            this.n = i;
            if (this.f != null) {
                int i4 = 0;
                boolean z3 = false;
                while (i4 < this.f.size()) {
                    Fragment fragment = (Fragment) this.f.get(i4);
                    if (fragment != null) {
                        a(fragment, i, i2, i3, false);
                        if (fragment.K != null) {
                            z3 |= fragment.K.a();
                        }
                    }
                    i4++;
                    z3 = z3;
                }
                if (!z3) {
                    c();
                }
                if (this.p && this.o != null && this.n == 5) {
                    this.o.c();
                    this.p = false;
                }
            }
        }
    }

    public void a(int i, b bVar) {
        synchronized (this) {
            if (this.k == null) {
                this.k = new ArrayList();
            }
            int size = this.k.size();
            if (i < size) {
                if (a) {
                    Log.v("FragmentManager", "Setting back stack index " + i + " to " + bVar);
                }
                this.k.set(i, bVar);
            } else {
                while (size < i) {
                    this.k.add(null);
                    if (this.l == null) {
                        this.l = new ArrayList();
                    }
                    if (a) {
                        Log.v("FragmentManager", "Adding available back stack index " + size);
                    }
                    this.l.add(Integer.valueOf(size));
                    size++;
                }
                if (a) {
                    Log.v("FragmentManager", "Adding back stack index " + i + " with " + bVar);
                }
                this.k.add(bVar);
            }
        }
    }

    void a(int i, boolean z2) {
        a(i, 0, 0, z2);
    }

    public void a(Configuration configuration) {
        if (this.g == null) {
            return;
        }
        int i = 0;
        while (true) {
            int i2 = i;
            if (i2 >= this.g.size()) {
                return;
            }
            Fragment fragment = (Fragment) this.g.get(i2);
            if (fragment != null) {
                fragment.onConfigurationChanged(configuration);
            }
            i = i2 + 1;
        }
    }

    public void a(Bundle bundle, String str, Fragment fragment) {
        if (fragment.f < 0) {
            throw new IllegalStateException("Fragment " + fragment + " is not currently in the FragmentManager");
        }
        bundle.putInt(str, fragment.f);
    }

    void a(Parcelable parcelable, ArrayList arrayList) {
        if (parcelable == null) {
            return;
        }
        FragmentManagerState fragmentManagerState = (FragmentManagerState) parcelable;
        if (fragmentManagerState.a != null) {
            if (arrayList != null) {
                for (int i = 0; i < arrayList.size(); i++) {
                    Fragment fragment = (Fragment) arrayList.get(i);
                    if (a) {
                        Log.v("FragmentManager", "restoreAllState: re-attaching retained " + fragment);
                    }
                    FragmentState fragmentState = fragmentManagerState.a[fragment.f];
                    fragmentState.k = fragment;
                    fragment.e = null;
                    fragment.r = 0;
                    fragment.p = false;
                    fragment.l = false;
                    fragment.i = null;
                    if (fragmentState.j != null) {
                        fragmentState.j.setClassLoader(this.o.getClassLoader());
                        fragment.e = fragmentState.j.getSparseParcelableArray("android:view_state");
                    }
                }
            }
            this.f = new ArrayList(fragmentManagerState.a.length);
            if (this.h != null) {
                this.h.clear();
            }
            for (int i2 = 0; i2 < fragmentManagerState.a.length; i2++) {
                FragmentState fragmentState2 = fragmentManagerState.a[i2];
                if (fragmentState2 != null) {
                    Fragment a2 = fragmentState2.a(this.o);
                    if (a) {
                        Log.v("FragmentManager", "restoreAllState: adding #" + i2 + ": " + a2);
                    }
                    this.f.add(a2);
                    fragmentState2.k = null;
                } else {
                    if (a) {
                        Log.v("FragmentManager", "restoreAllState: adding #" + i2 + ": (null)");
                    }
                    this.f.add(null);
                    if (this.h == null) {
                        this.h = new ArrayList();
                    }
                    if (a) {
                        Log.v("FragmentManager", "restoreAllState: adding avail #" + i2);
                    }
                    this.h.add(Integer.valueOf(i2));
                }
            }
            if (arrayList != null) {
                for (int i3 = 0; i3 < arrayList.size(); i3++) {
                    Fragment fragment2 = (Fragment) arrayList.get(i3);
                    if (fragment2.j >= 0) {
                        if (fragment2.j < this.f.size()) {
                            fragment2.i = (Fragment) this.f.get(fragment2.j);
                        } else {
                            Log.w("FragmentManager", "Re-attaching retained fragment " + fragment2 + " target no longer exists: " + fragment2.j);
                            fragment2.i = null;
                        }
                    }
                }
            }
            if (fragmentManagerState.b != null) {
                this.g = new ArrayList(fragmentManagerState.b.length);
                for (int i4 = 0; i4 < fragmentManagerState.b.length; i4++) {
                    Fragment fragment3 = (Fragment) this.f.get(fragmentManagerState.b[i4]);
                    if (fragment3 == null) {
                        throw new IllegalStateException("No instantiated fragment for index #" + fragmentManagerState.b[i4]);
                    }
                    fragment3.l = true;
                    if (a) {
                        Log.v("FragmentManager", "restoreAllState: making added #" + i4 + ": " + fragment3);
                    }
                    this.g.add(fragment3);
                }
            } else {
                this.g = null;
            }
            if (fragmentManagerState.c == null) {
                this.i = null;
                return;
            }
            this.i = new ArrayList(fragmentManagerState.c.length);
            for (int i5 = 0; i5 < fragmentManagerState.c.length; i5++) {
                b a3 = fragmentManagerState.c[i5].a(this);
                if (a) {
                    Log.v("FragmentManager", "restoreAllState: adding bse #" + i5 + " (index " + a3.o + "): " + a3);
                }
                this.i.add(a3);
                if (a3.o >= 0) {
                    a(a3.o, a3);
                }
            }
        }
    }

    public void a(Fragment fragment) {
        if (fragment.I) {
            if (this.e) {
                this.t = true;
            } else {
                fragment.I = false;
                a(fragment, this.n, 0, 0, false);
            }
        }
    }

    public void a(Fragment fragment, int i, int i2) {
        if (a) {
            Log.v("FragmentManager", "remove: " + fragment + " nesting=" + fragment.r);
        }
        boolean z2 = !fragment.b();
        if (!fragment.y || z2) {
            if (this.g != null) {
                this.g.remove(fragment);
            }
            if (fragment.B && fragment.C) {
                this.p = true;
            }
            fragment.l = false;
            fragment.m = true;
            a(fragment, z2 ? 0 : 1, i, i2, false);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:29:0x0041 A[FALL_THROUGH, PHI: r11
      0x0041: PHI (r11v5 int) = 
      (r11v3 int)
      (r11v3 int)
      (r11v3 int)
      (r11v3 int)
      (r11v3 int)
      (r11v3 int)
      (r11v4 int)
      (r11v3 int)
      (r11v6 int)
      (r11v6 int)
     binds: [B:117:0x02a9, B:119:0x02ad, B:120:0x02b2, B:142:0x047e, B:146:0x0489, B:145:0x0484, B:128:0x02c7, B:28:0x003e, B:107:0x0259, B:115:0x02a1] A[DONT_GENERATE, DONT_INLINE]] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    void a(android.support.v4.app.Fragment r10, int r11, int r12, int r13, boolean r14) {
        /*
            Method dump skipped, instructions count: 1198
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: android.support.v4.app.l.a(android.support.v4.app.Fragment, int, int, int, boolean):void");
    }

    public void a(Fragment fragment, boolean z2) {
        if (this.g == null) {
            this.g = new ArrayList();
        }
        if (a) {
            Log.v("FragmentManager", "add: " + fragment);
        }
        c(fragment);
        if (fragment.y) {
            return;
        }
        this.g.add(fragment);
        fragment.l = true;
        fragment.m = false;
        if (fragment.B && fragment.C) {
            this.p = true;
        }
        if (z2) {
            b(fragment);
        }
    }

    void a(b bVar) {
        if (this.i == null) {
            this.i = new ArrayList();
        }
        this.i.add(bVar);
        e();
    }

    public void a(g gVar) {
        if (this.o != null) {
            throw new IllegalStateException();
        }
        this.o = gVar;
    }

    public void a(String str, FileDescriptor fileDescriptor, PrintWriter printWriter, String[] strArr) {
        int size;
        int size2;
        int size3;
        int size4;
        int size5;
        int size6;
        String str2 = str + "    ";
        if (this.f != null && (size6 = this.f.size()) > 0) {
            printWriter.print(str);
            printWriter.print("Active Fragments in ");
            printWriter.print(Integer.toHexString(System.identityHashCode(this)));
            printWriter.println(":");
            for (int i = 0; i < size6; i++) {
                Fragment fragment = (Fragment) this.f.get(i);
                printWriter.print(str);
                printWriter.print("  #");
                printWriter.print(i);
                printWriter.print(": ");
                printWriter.println(fragment);
                if (fragment != null) {
                    fragment.a(str2, fileDescriptor, printWriter, strArr);
                }
            }
        }
        if (this.g != null && (size5 = this.g.size()) > 0) {
            printWriter.print(str);
            printWriter.println("Added Fragments:");
            for (int i2 = 0; i2 < size5; i2++) {
                Fragment fragment2 = (Fragment) this.g.get(i2);
                printWriter.print(str);
                printWriter.print("  #");
                printWriter.print(i2);
                printWriter.print(": ");
                printWriter.println(fragment2.toString());
            }
        }
        if (this.j != null && (size4 = this.j.size()) > 0) {
            printWriter.print(str);
            printWriter.println("Fragments Created Menus:");
            for (int i3 = 0; i3 < size4; i3++) {
                Fragment fragment3 = (Fragment) this.j.get(i3);
                printWriter.print(str);
                printWriter.print("  #");
                printWriter.print(i3);
                printWriter.print(": ");
                printWriter.println(fragment3.toString());
            }
        }
        if (this.i != null && (size3 = this.i.size()) > 0) {
            printWriter.print(str);
            printWriter.println("Back Stack:");
            for (int i4 = 0; i4 < size3; i4++) {
                b bVar = (b) this.i.get(i4);
                printWriter.print(str);
                printWriter.print("  #");
                printWriter.print(i4);
                printWriter.print(": ");
                printWriter.println(bVar.toString());
                bVar.a(str2, fileDescriptor, printWriter, strArr);
            }
        }
        synchronized (this) {
            if (this.k != null && (size2 = this.k.size()) > 0) {
                printWriter.print(str);
                printWriter.println("Back Stack Indices:");
                for (int i5 = 0; i5 < size2; i5++) {
                    Object obj = (b) this.k.get(i5);
                    printWriter.print(str);
                    printWriter.print("  #");
                    printWriter.print(i5);
                    printWriter.print(": ");
                    printWriter.println(obj);
                }
            }
            if (this.l != null && this.l.size() > 0) {
                printWriter.print(str);
                printWriter.print("mAvailBackStackIndices: ");
                printWriter.println(Arrays.toString(this.l.toArray()));
            }
        }
        if (this.c != null && (size = this.c.size()) > 0) {
            printWriter.print(str);
            printWriter.println("Pending Actions:");
            for (int i6 = 0; i6 < size; i6++) {
                Object obj2 = (Runnable) this.c.get(i6);
                printWriter.print(str);
                printWriter.print("  #");
                printWriter.print(i6);
                printWriter.print(": ");
                printWriter.println(obj2);
            }
        }
        printWriter.print(str);
        printWriter.println("FragmentManager misc state:");
        printWriter.print(str);
        printWriter.print("  mCurState=");
        printWriter.print(this.n);
        printWriter.print(" mStateSaved=");
        printWriter.print(this.q);
        printWriter.print(" mDestroyed=");
        printWriter.println(this.r);
        if (this.p) {
            printWriter.print(str);
            printWriter.print("  mNeedMenuInvalidate=");
            printWriter.println(this.p);
        }
        if (this.s != null) {
            printWriter.print(str);
            printWriter.print("  mNoTransactionsBecause=");
            printWriter.println(this.s);
        }
        if (this.h == null || this.h.size() <= 0) {
            return;
        }
        printWriter.print(str);
        printWriter.print("  mAvailIndices: ");
        printWriter.println(Arrays.toString(this.h.toArray()));
    }

    public boolean a() {
        return d();
    }

    boolean a(Handler handler, String str, int i, int i2) {
        if (this.i == null) {
            return false;
        }
        if (str == null && i < 0 && (i2 & 1) == 0) {
            int size = this.i.size() - 1;
            if (size < 0) {
                return false;
            }
            ((b) this.i.remove(size)).a(true);
            e();
        } else {
            int i3 = -1;
            if (str != null || i >= 0) {
                int size2 = this.i.size() - 1;
                while (size2 >= 0) {
                    b bVar = (b) this.i.get(size2);
                    if ((str != null && str.equals(bVar.a())) || (i >= 0 && i == bVar.o)) {
                        break;
                    }
                    size2--;
                }
                if (size2 < 0) {
                    return false;
                }
                if ((i2 & 1) != 0) {
                    size2--;
                    while (size2 >= 0) {
                        b bVar2 = (b) this.i.get(size2);
                        if ((str == null || !str.equals(bVar2.a())) && (i < 0 || i != bVar2.o)) {
                            break;
                        }
                        size2--;
                    }
                }
                i3 = size2;
            }
            if (i3 == this.i.size() - 1) {
                return false;
            }
            ArrayList arrayList = new ArrayList();
            for (int size3 = this.i.size() - 1; size3 > i3; size3--) {
                arrayList.add(this.i.remove(size3));
            }
            int size4 = arrayList.size() - 1;
            int i4 = 0;
            while (i4 <= size4) {
                if (a) {
                    Log.v("FragmentManager", "Popping back stack state: " + arrayList.get(i4));
                }
                ((b) arrayList.get(i4)).a(i4 == size4);
                i4++;
            }
            e();
        }
        return true;
    }

    public boolean a(Menu menu) {
        if (this.g == null) {
            return false;
        }
        boolean z2 = false;
        for (int i = 0; i < this.g.size(); i++) {
            Fragment fragment = (Fragment) this.g.get(i);
            if (fragment != null && !fragment.x && fragment.B && fragment.C) {
                z2 = true;
                fragment.a(menu);
            }
        }
        return z2;
    }

    public boolean a(Menu menu, MenuInflater menuInflater) {
        boolean z2;
        ArrayList arrayList = null;
        if (this.g != null) {
            int i = 0;
            z2 = false;
            while (i < this.g.size()) {
                Fragment fragment = (Fragment) this.g.get(i);
                if (fragment != null && !fragment.x && fragment.B && fragment.C) {
                    z2 = true;
                    fragment.a(menu, menuInflater);
                    if (arrayList == null) {
                        arrayList = new ArrayList();
                    }
                    arrayList.add(fragment);
                }
                i++;
                z2 = z2;
            }
        } else {
            z2 = false;
        }
        if (this.j != null) {
            for (int i2 = 0; i2 < this.j.size(); i2++) {
                Fragment fragment2 = (Fragment) this.j.get(i2);
                if (arrayList == null || !arrayList.contains(fragment2)) {
                    fragment2.l();
                }
            }
        }
        this.j = arrayList;
        return z2;
    }

    public boolean a(MenuItem menuItem) {
        if (this.g == null) {
            return false;
        }
        for (int i = 0; i < this.g.size(); i++) {
            Fragment fragment = (Fragment) this.g.get(i);
            if (fragment != null && !fragment.x && fragment.B && fragment.C && fragment.a(menuItem)) {
                return true;
            }
        }
        return false;
    }

    public void b(int i) {
        synchronized (this) {
            this.k.set(i, null);
            if (this.l == null) {
                this.l = new ArrayList();
            }
            if (a) {
                Log.v("FragmentManager", "Freeing back stack index " + i);
            }
            this.l.add(Integer.valueOf(i));
        }
    }

    void b(Fragment fragment) {
        a(fragment, this.n, 0, 0, false);
    }

    public void b(Fragment fragment, int i, int i2) {
        if (a) {
            Log.v("FragmentManager", "hide: " + fragment);
        }
        if (fragment.x) {
            return;
        }
        fragment.x = true;
        if (fragment.G != null) {
            Animation a2 = a(fragment, i, true, i2);
            if (a2 != null) {
                fragment.G.startAnimation(a2);
            }
            fragment.G.setVisibility(8);
        }
        if (fragment.l && fragment.B && fragment.C) {
            this.p = true;
        }
        fragment.a(true);
    }

    public void b(Menu menu) {
        if (this.g == null) {
            return;
        }
        int i = 0;
        while (true) {
            int i2 = i;
            if (i2 >= this.g.size()) {
                return;
            }
            Fragment fragment = (Fragment) this.g.get(i2);
            if (fragment != null && !fragment.x && fragment.B && fragment.C) {
                fragment.b(menu);
            }
            i = i2 + 1;
        }
    }

    public boolean b() {
        r();
        a();
        return a(this.o.a, (String) null, -1, 0);
    }

    public boolean b(MenuItem menuItem) {
        if (this.g == null) {
            return false;
        }
        for (int i = 0; i < this.g.size(); i++) {
            Fragment fragment = (Fragment) this.g.get(i);
            if (fragment != null && !fragment.x && fragment.J && fragment.b(menuItem)) {
                return true;
            }
        }
        return false;
    }

    void c() {
        if (this.f == null) {
            return;
        }
        int i = 0;
        while (true) {
            int i2 = i;
            if (i2 >= this.f.size()) {
                return;
            }
            Fragment fragment = (Fragment) this.f.get(i2);
            if (fragment != null) {
                a(fragment);
            }
            i = i2 + 1;
        }
    }

    void c(Fragment fragment) {
        if (fragment.f >= 0) {
            return;
        }
        if (this.h == null || this.h.size() <= 0) {
            if (this.f == null) {
                this.f = new ArrayList();
            }
            fragment.a(this.f.size());
            this.f.add(fragment);
        } else {
            fragment.a(((Integer) this.h.remove(this.h.size() - 1)).intValue());
            this.f.set(fragment.f, fragment);
        }
        if (a) {
            Log.v("FragmentManager", "Allocated fragment index " + fragment);
        }
    }

    public void c(Fragment fragment, int i, int i2) {
        if (a) {
            Log.v("FragmentManager", "show: " + fragment);
        }
        if (fragment.x) {
            fragment.x = false;
            if (fragment.G != null) {
                Animation a2 = a(fragment, i, true, i2);
                if (a2 != null) {
                    fragment.G.startAnimation(a2);
                }
                fragment.G.setVisibility(0);
            }
            if (fragment.l && fragment.B && fragment.C) {
                this.p = true;
            }
            fragment.a(false);
        }
    }

    void d(Fragment fragment) {
        if (fragment.f < 0) {
            return;
        }
        if (a) {
            Log.v("FragmentManager", "Freeing fragment index " + fragment);
        }
        this.f.set(fragment.f, null);
        if (this.h == null) {
            this.h = new ArrayList();
        }
        this.h.add(Integer.valueOf(fragment.f));
        this.o.a(fragment.f);
        fragment.j();
    }

    public void d(Fragment fragment, int i, int i2) {
        if (a) {
            Log.v("FragmentManager", "detach: " + fragment);
        }
        if (fragment.y) {
            return;
        }
        fragment.y = true;
        if (fragment.l) {
            if (this.g != null) {
                this.g.remove(fragment);
            }
            if (fragment.B && fragment.C) {
                this.p = true;
            }
            fragment.l = false;
            a(fragment, 1, i, i2, false);
        }
    }

    /* JADX WARN: Code restructure failed: missing block: B:23:0x0083, code lost:
    
        r6.e = true;
        r1 = 0;
     */
    /* JADX WARN: Code restructure failed: missing block: B:24:0x0086, code lost:
    
        if (r1 >= r3) goto L49;
     */
    /* JADX WARN: Code restructure failed: missing block: B:25:0x0088, code lost:
    
        r6.d[r1].run();
        r6.d[r1] = null;
        r1 = r1 + 1;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public boolean d() {
        /*
            r6 = this;
            r0 = 1
            r2 = 0
            boolean r1 = r6.e
            if (r1 == 0) goto Le
            java.lang.IllegalStateException r0 = new java.lang.IllegalStateException
            java.lang.String r1 = "Recursive entry to executePendingTransactions"
            r0.<init>(r1)
            throw r0
        Le:
            android.os.Looper r1 = android.os.Looper.myLooper()
            android.support.v4.app.g r3 = r6.o
            android.os.Handler r3 = r3.a
            android.os.Looper r3 = r3.getLooper()
            if (r1 == r3) goto L24
            java.lang.IllegalStateException r0 = new java.lang.IllegalStateException
            java.lang.String r1 = "Must be called from main thread of process"
            r0.<init>(r1)
            throw r0
        L24:
            r1 = r2
        L25:
            monitor-enter(r6)
            java.util.ArrayList r3 = r6.c     // Catch: java.lang.Throwable -> L97
            if (r3 == 0) goto L32
            java.util.ArrayList r3 = r6.c     // Catch: java.lang.Throwable -> L97
            int r3 = r3.size()     // Catch: java.lang.Throwable -> L97
            if (r3 != 0) goto L5a
        L32:
            monitor-exit(r6)     // Catch: java.lang.Throwable -> L97
            boolean r0 = r6.t
            if (r0 == 0) goto La5
            r3 = r2
            r4 = r2
        L39:
            java.util.ArrayList r0 = r6.f
            int r0 = r0.size()
            if (r3 >= r0) goto L9e
            java.util.ArrayList r0 = r6.f
            java.lang.Object r0 = r0.get(r3)
            android.support.v4.app.Fragment r0 = (android.support.v4.app.Fragment) r0
            if (r0 == 0) goto L56
            android.support.v4.app.s r5 = r0.K
            if (r5 == 0) goto L56
            android.support.v4.app.s r0 = r0.K
            boolean r0 = r0.a()
            r4 = r4 | r0
        L56:
            int r0 = r3 + 1
            r3 = r0
            goto L39
        L5a:
            java.util.ArrayList r1 = r6.c     // Catch: java.lang.Throwable -> L97
            int r3 = r1.size()     // Catch: java.lang.Throwable -> L97
            java.lang.Runnable[] r1 = r6.d     // Catch: java.lang.Throwable -> L97
            if (r1 == 0) goto L69
            java.lang.Runnable[] r1 = r6.d     // Catch: java.lang.Throwable -> L97
            int r1 = r1.length     // Catch: java.lang.Throwable -> L97
            if (r1 >= r3) goto L6d
        L69:
            java.lang.Runnable[] r1 = new java.lang.Runnable[r3]     // Catch: java.lang.Throwable -> L97
            r6.d = r1     // Catch: java.lang.Throwable -> L97
        L6d:
            java.util.ArrayList r1 = r6.c     // Catch: java.lang.Throwable -> L97
            java.lang.Runnable[] r4 = r6.d     // Catch: java.lang.Throwable -> L97
            r1.toArray(r4)     // Catch: java.lang.Throwable -> L97
            java.util.ArrayList r1 = r6.c     // Catch: java.lang.Throwable -> L97
            r1.clear()     // Catch: java.lang.Throwable -> L97
            android.support.v4.app.g r1 = r6.o     // Catch: java.lang.Throwable -> L97
            android.os.Handler r1 = r1.a     // Catch: java.lang.Throwable -> L97
            java.lang.Runnable r4 = r6.w     // Catch: java.lang.Throwable -> L97
            r1.removeCallbacks(r4)     // Catch: java.lang.Throwable -> L97
            monitor-exit(r6)     // Catch: java.lang.Throwable -> L97
            r6.e = r0
            r1 = r2
        L86:
            if (r1 >= r3) goto L9a
            java.lang.Runnable[] r4 = r6.d
            r4 = r4[r1]
            r4.run()
            java.lang.Runnable[] r4 = r6.d
            r5 = 0
            r4[r1] = r5
            int r1 = r1 + 1
            goto L86
        L97:
            r0 = move-exception
            monitor-exit(r6)     // Catch: java.lang.Throwable -> L97
            throw r0
        L9a:
            r6.e = r2
            r1 = r0
            goto L25
        L9e:
            if (r4 != 0) goto La5
            r6.t = r2
            r6.c()
        La5:
            return r1
        */
        throw new UnsupportedOperationException("Method not decompiled: android.support.v4.app.l.d():boolean");
    }

    void e() {
        if (this.m == null) {
            return;
        }
        int i = 0;
        while (true) {
            int i2 = i;
            if (i2 >= this.m.size()) {
                return;
            }
            ((k) this.m.get(i2)).a();
            i = i2 + 1;
        }
    }

    void e(Fragment fragment) {
        if (fragment.H == null) {
            return;
        }
        if (this.v == null) {
            this.v = new SparseArray();
        } else {
            this.v.clear();
        }
        fragment.H.saveHierarchyState(this.v);
        if (this.v.size() > 0) {
            fragment.e = this.v;
            this.v = null;
        }
    }

    public void e(Fragment fragment, int i, int i2) {
        if (a) {
            Log.v("FragmentManager", "attach: " + fragment);
        }
        if (fragment.y) {
            fragment.y = false;
            if (fragment.l) {
                return;
            }
            if (this.g == null) {
                this.g = new ArrayList();
            }
            this.g.add(fragment);
            fragment.l = true;
            if (fragment.B && fragment.C) {
                this.p = true;
            }
            a(fragment, this.n, i, i2, false);
        }
    }

    Bundle f(Fragment fragment) {
        Bundle bundle;
        if (this.u == null) {
            this.u = new Bundle();
        }
        fragment.d(this.u);
        if (this.u.isEmpty()) {
            bundle = null;
        } else {
            bundle = this.u;
            this.u = null;
        }
        if (fragment.G != null) {
            e(fragment);
        }
        if (fragment.e != null) {
            if (bundle == null) {
                bundle = new Bundle();
            }
            bundle.putSparseParcelableArray("android:view_state", fragment.e);
        }
        if (!fragment.J) {
            if (bundle == null) {
                bundle = new Bundle();
            }
            bundle.putBoolean("android:user_visible_hint", fragment.J);
        }
        return bundle;
    }

    ArrayList f() {
        ArrayList arrayList = null;
        if (this.f != null) {
            int i = 0;
            while (true) {
                int i2 = i;
                if (i2 >= this.f.size()) {
                    break;
                }
                Fragment fragment = (Fragment) this.f.get(i2);
                if (fragment != null && fragment.z) {
                    if (arrayList == null) {
                        arrayList = new ArrayList();
                    }
                    arrayList.add(fragment);
                    fragment.A = true;
                    fragment.j = fragment.i != null ? fragment.i.f : -1;
                    if (a) {
                        Log.v("FragmentManager", "retainNonConfig: keeping retained " + fragment);
                    }
                }
                i = i2 + 1;
            }
        }
        return arrayList;
    }

    Parcelable g() {
        int[] iArr;
        int size;
        int size2;
        boolean z2;
        BackStackState[] backStackStateArr = null;
        d();
        if (b) {
            this.q = true;
        }
        if (this.f == null || this.f.size() <= 0) {
            return null;
        }
        int size3 = this.f.size();
        FragmentState[] fragmentStateArr = new FragmentState[size3];
        int i = 0;
        boolean z3 = false;
        while (i < size3) {
            Fragment fragment = (Fragment) this.f.get(i);
            if (fragment == null) {
                z2 = z3;
            } else {
                if (fragment.f < 0) {
                    String str = "Failure saving state: active " + fragment + " has cleared index: " + fragment.f;
                    Log.e("FragmentManager", str);
                    a("  ", (FileDescriptor) null, new PrintWriter(new android.support.v4.c.b("FragmentManager")), new String[0]);
                    throw new IllegalStateException(str);
                }
                FragmentState fragmentState = new FragmentState(fragment);
                fragmentStateArr[i] = fragmentState;
                if (fragment.a <= 0 || fragmentState.j != null) {
                    fragmentState.j = fragment.d;
                } else {
                    fragmentState.j = f(fragment);
                    if (fragment.i != null) {
                        if (fragment.i.f < 0) {
                            String str2 = "Failure saving state: " + fragment + " has target not in fragment manager: " + fragment.i;
                            Log.e("FragmentManager", str2);
                            a("  ", (FileDescriptor) null, new PrintWriter(new android.support.v4.c.b("FragmentManager")), new String[0]);
                            throw new IllegalStateException(str2);
                        }
                        if (fragmentState.j == null) {
                            fragmentState.j = new Bundle();
                        }
                        a(fragmentState.j, "android:target_state", fragment.i);
                        if (fragment.k != 0) {
                            fragmentState.j.putInt("android:target_req_state", fragment.k);
                        }
                    }
                }
                if (a) {
                    Log.v("FragmentManager", "Saved state of " + fragment + ": " + fragmentState.j);
                }
                z2 = true;
            }
            i++;
            z3 = z2;
        }
        if (!z3) {
            if (!a) {
                return null;
            }
            Log.v("FragmentManager", "saveAllState: no fragments!");
            return null;
        }
        if (this.g == null || (size2 = this.g.size()) <= 0) {
            iArr = null;
        } else {
            iArr = new int[size2];
            for (int i2 = 0; i2 < size2; i2++) {
                iArr[i2] = ((Fragment) this.g.get(i2)).f;
                if (iArr[i2] < 0) {
                    String str3 = "Failure saving state: active " + this.g.get(i2) + " has cleared index: " + iArr[i2];
                    Log.e("FragmentManager", str3);
                    a("  ", (FileDescriptor) null, new PrintWriter(new android.support.v4.c.b("FragmentManager")), new String[0]);
                    throw new IllegalStateException(str3);
                }
                if (a) {
                    Log.v("FragmentManager", "saveAllState: adding fragment #" + i2 + ": " + this.g.get(i2));
                }
            }
        }
        if (this.i != null && (size = this.i.size()) > 0) {
            backStackStateArr = new BackStackState[size];
            for (int i3 = 0; i3 < size; i3++) {
                backStackStateArr[i3] = new BackStackState(this, (b) this.i.get(i3));
                if (a) {
                    Log.v("FragmentManager", "saveAllState: adding back stack #" + i3 + ": " + this.i.get(i3));
                }
            }
        }
        FragmentManagerState fragmentManagerState = new FragmentManagerState();
        fragmentManagerState.a = fragmentStateArr;
        fragmentManagerState.b = iArr;
        fragmentManagerState.c = backStackStateArr;
        return fragmentManagerState;
    }

    public void h() {
        this.q = false;
    }

    public void i() {
        this.q = false;
        a(1, false);
    }

    public void j() {
        this.q = false;
        a(2, false);
    }

    public void k() {
        this.q = false;
        a(4, false);
    }

    public void l() {
        this.q = false;
        a(5, false);
    }

    public void m() {
        a(4, false);
    }

    public void n() {
        this.q = true;
        a(3, false);
    }

    public void o() {
        a(2, false);
    }

    public void p() {
        this.r = true;
        d();
        a(0, false);
        this.o = null;
    }

    public void q() {
        if (this.g == null) {
            return;
        }
        int i = 0;
        while (true) {
            int i2 = i;
            if (i2 >= this.g.size()) {
                return;
            }
            Fragment fragment = (Fragment) this.g.get(i2);
            if (fragment != null) {
                fragment.onLowMemory();
            }
            i = i2 + 1;
        }
    }

    public String toString() {
        StringBuilder sb = new StringBuilder(128);
        sb.append("FragmentManager{");
        sb.append(Integer.toHexString(System.identityHashCode(this)));
        sb.append(" in ");
        android.support.v4.c.a.a(this.o, sb);
        sb.append("}}");
        return sb.toString();
    }
}
