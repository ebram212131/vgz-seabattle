package android.support.v4.app;

import android.app.Activity;
import android.content.ComponentCallbacks;
import android.content.Context;
import android.content.Intent;
import android.content.res.Configuration;
import android.os.Bundle;
import android.os.Parcel;
import android.os.Parcelable;
import android.util.AttributeSet;
import android.util.SparseArray;
import android.view.ContextMenu;
import android.view.LayoutInflater;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import android.view.animation.Animation;
import java.io.FileDescriptor;
import java.io.PrintWriter;
import java.util.HashMap;

/* loaded from: classes.dex */
public class Fragment implements ComponentCallbacks, View.OnCreateContextMenuListener {
    private static final HashMap N = new HashMap();
    boolean A;
    boolean B;
    boolean D;
    int E;
    ViewGroup F;
    View G;
    View H;
    boolean I;
    s K;
    boolean L;
    boolean M;
    View b;
    int c;
    Bundle d;
    SparseArray e;
    String g;
    Bundle h;
    Fragment i;
    int k;
    boolean l;
    boolean m;
    boolean n;
    boolean o;
    boolean p;
    boolean q;
    int r;
    l s;
    g t;
    int u;
    int v;
    String w;
    boolean x;
    boolean y;
    boolean z;
    int a = 0;
    int f = -1;
    int j = -1;
    boolean C = true;
    boolean J = true;

    public class SavedState implements Parcelable {
        public static final Parcelable.Creator CREATOR = new f();
        final Bundle a;

        SavedState(Parcel parcel, ClassLoader classLoader) {
            this.a = parcel.readBundle();
            if (classLoader == null || this.a == null) {
                return;
            }
            this.a.setClassLoader(classLoader);
        }

        @Override // android.os.Parcelable
        public int describeContents() {
            return 0;
        }

        @Override // android.os.Parcelable
        public void writeToParcel(Parcel parcel, int i) {
            parcel.writeBundle(this.a);
        }
    }

    public static Fragment a(Context context, String str) {
        return a(context, str, (Bundle) null);
    }

    public static Fragment a(Context context, String str, Bundle bundle) {
        try {
            Class<?> cls = (Class) N.get(str);
            if (cls == null) {
                cls = context.getClassLoader().loadClass(str);
                N.put(str, cls);
            }
            Fragment fragment = (Fragment) cls.newInstance();
            if (bundle != null) {
                bundle.setClassLoader(fragment.getClass().getClassLoader());
                fragment.h = bundle;
            }
            return fragment;
        } catch (ClassNotFoundException e) {
            throw new e("Unable to instantiate fragment " + str + ": make sure class name exists, is public, and has an empty constructor that is public", e);
        } catch (IllegalAccessException e2) {
            throw new e("Unable to instantiate fragment " + str + ": make sure class name exists, is public, and has an empty constructor that is public", e2);
        } catch (InstantiationException e3) {
            throw new e("Unable to instantiate fragment " + str + ": make sure class name exists, is public, and has an empty constructor that is public", e3);
        }
    }

    public LayoutInflater a(Bundle bundle) {
        return this.t.getLayoutInflater();
    }

    public View a(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        return null;
    }

    public Animation a(int i, boolean z, int i2) {
        return null;
    }

    final void a() {
        if (this.e != null) {
            this.H.restoreHierarchyState(this.e);
            this.e = null;
        }
    }

    final void a(int i) {
        this.f = i;
        this.g = "android:fragment:" + this.f;
    }

    public void a(int i, int i2, Intent intent) {
    }

    public void a(Activity activity) {
        this.D = true;
    }

    public void a(Activity activity, AttributeSet attributeSet, Bundle bundle) {
        this.D = true;
    }

    public void a(Menu menu) {
    }

    public void a(Menu menu, MenuInflater menuInflater) {
    }

    public void a(View view, Bundle bundle) {
    }

    public void a(String str, FileDescriptor fileDescriptor, PrintWriter printWriter, String[] strArr) {
        printWriter.print(str);
        printWriter.print("mFragmentId=#");
        printWriter.print(Integer.toHexString(this.u));
        printWriter.print(" mContainerId=#");
        printWriter.print(Integer.toHexString(this.v));
        printWriter.print(" mTag=");
        printWriter.println(this.w);
        printWriter.print(str);
        printWriter.print("mState=");
        printWriter.print(this.a);
        printWriter.print(" mIndex=");
        printWriter.print(this.f);
        printWriter.print(" mWho=");
        printWriter.print(this.g);
        printWriter.print(" mBackStackNesting=");
        printWriter.println(this.r);
        printWriter.print(str);
        printWriter.print("mAdded=");
        printWriter.print(this.l);
        printWriter.print(" mRemoving=");
        printWriter.print(this.m);
        printWriter.print(" mResumed=");
        printWriter.print(this.n);
        printWriter.print(" mFromLayout=");
        printWriter.print(this.o);
        printWriter.print(" mInLayout=");
        printWriter.println(this.p);
        printWriter.print(str);
        printWriter.print("mHidden=");
        printWriter.print(this.x);
        printWriter.print(" mDetached=");
        printWriter.print(this.y);
        printWriter.print(" mMenuVisible=");
        printWriter.print(this.C);
        printWriter.print(" mHasMenu=");
        printWriter.println(this.B);
        printWriter.print(str);
        printWriter.print("mRetainInstance=");
        printWriter.print(this.z);
        printWriter.print(" mRetaining=");
        printWriter.print(this.A);
        printWriter.print(" mUserVisibleHint=");
        printWriter.println(this.J);
        if (this.s != null) {
            printWriter.print(str);
            printWriter.print("mFragmentManager=");
            printWriter.println(this.s);
        }
        if (this.t != null) {
            printWriter.print(str);
            printWriter.print("mActivity=");
            printWriter.println(this.t);
        }
        if (this.h != null) {
            printWriter.print(str);
            printWriter.print("mArguments=");
            printWriter.println(this.h);
        }
        if (this.d != null) {
            printWriter.print(str);
            printWriter.print("mSavedFragmentState=");
            printWriter.println(this.d);
        }
        if (this.e != null) {
            printWriter.print(str);
            printWriter.print("mSavedViewState=");
            printWriter.println(this.e);
        }
        if (this.i != null) {
            printWriter.print(str);
            printWriter.print("mTarget=");
            printWriter.print(this.i);
            printWriter.print(" mTargetRequestCode=");
            printWriter.println(this.k);
        }
        if (this.E != 0) {
            printWriter.print(str);
            printWriter.print("mNextAnim=");
            printWriter.println(this.E);
        }
        if (this.F != null) {
            printWriter.print(str);
            printWriter.print("mContainer=");
            printWriter.println(this.F);
        }
        if (this.G != null) {
            printWriter.print(str);
            printWriter.print("mView=");
            printWriter.println(this.G);
        }
        if (this.H != null) {
            printWriter.print(str);
            printWriter.print("mInnerView=");
            printWriter.println(this.G);
        }
        if (this.b != null) {
            printWriter.print(str);
            printWriter.print("mAnimatingAway=");
            printWriter.println(this.b);
            printWriter.print(str);
            printWriter.print("mStateAfterAnimating=");
            printWriter.println(this.c);
        }
        if (this.K != null) {
            printWriter.print(str);
            printWriter.println("Loader Manager:");
            this.K.a(str + "  ", fileDescriptor, printWriter, strArr);
        }
    }

    public void a(boolean z) {
    }

    public boolean a(MenuItem menuItem) {
        return false;
    }

    public void b(Bundle bundle) {
        this.D = true;
    }

    public void b(Menu menu) {
    }

    final boolean b() {
        return this.r > 0;
    }

    public boolean b(MenuItem menuItem) {
        return false;
    }

    public final g c() {
        return this.t;
    }

    public void c(Bundle bundle) {
        this.D = true;
    }

    public void d() {
        this.D = true;
        if (this.L) {
            return;
        }
        this.L = true;
        if (!this.M) {
            this.M = true;
            this.K = this.t.a(this.f, this.L, false);
        }
        if (this.K != null) {
            this.K.b();
        }
    }

    public void d(Bundle bundle) {
    }

    public void e() {
        this.D = true;
    }

    public final boolean equals(Object obj) {
        return super.equals(obj);
    }

    public void f() {
        this.D = true;
    }

    public void g() {
        this.D = true;
    }

    public void h() {
        this.D = true;
    }

    public final int hashCode() {
        return super.hashCode();
    }

    public void i() {
        this.D = true;
        if (!this.M) {
            this.M = true;
            this.K = this.t.a(this.f, this.L, false);
        }
        if (this.K != null) {
            this.K.h();
        }
    }

    void j() {
        this.f = -1;
        this.g = null;
        this.l = false;
        this.m = false;
        this.n = false;
        this.o = false;
        this.p = false;
        this.q = false;
        this.r = 0;
        this.s = null;
        this.t = null;
        this.u = 0;
        this.v = 0;
        this.w = null;
        this.x = false;
        this.y = false;
        this.A = false;
        this.K = null;
        this.L = false;
        this.M = false;
    }

    public void k() {
        this.D = true;
    }

    public void l() {
    }

    void m() {
        d();
        if (this.K != null) {
            this.K.g();
        }
    }

    void n() {
        g();
    }

    void o() {
        if (this.L) {
            this.L = false;
            if (!this.M) {
                this.M = true;
                this.K = this.t.a(this.f, this.L, false);
            }
            if (this.K != null) {
                if (this.t.g) {
                    this.K.d();
                } else {
                    this.K.c();
                }
            }
        }
    }

    @Override // android.content.ComponentCallbacks
    public void onConfigurationChanged(Configuration configuration) {
        this.D = true;
    }

    @Override // android.view.View.OnCreateContextMenuListener
    public void onCreateContextMenu(ContextMenu contextMenu, View view, ContextMenu.ContextMenuInfo contextMenuInfo) {
        c().onCreateContextMenu(contextMenu, view, contextMenuInfo);
    }

    @Override // android.content.ComponentCallbacks
    public void onLowMemory() {
        this.D = true;
    }

    void p() {
        h();
        if (this.K != null) {
            this.K.f();
        }
    }

    public String toString() {
        StringBuilder sb = new StringBuilder(128);
        android.support.v4.c.a.a(this, sb);
        if (this.f >= 0) {
            sb.append(" #");
            sb.append(this.f);
        }
        if (this.u != 0) {
            sb.append(" id=0x");
            sb.append(Integer.toHexString(this.u));
        }
        if (this.w != null) {
            sb.append(" ");
            sb.append(this.w);
        }
        sb.append('}');
        return sb.toString();
    }
}
