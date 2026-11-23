package android.support.v4.app;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.content.res.Configuration;
import android.content.res.TypedArray;
import android.os.Build;
import android.os.Bundle;
import android.os.Handler;
import android.os.Parcelable;
import android.util.AttributeSet;
import android.util.Log;
import android.view.KeyEvent;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import java.io.FileDescriptor;
import java.io.PrintWriter;
import java.util.ArrayList;

/* loaded from: classes.dex */
public class g extends Activity {
    final Handler a;
    final l b;
    boolean c;
    boolean d;
    boolean e;
    boolean f;
    boolean g;
    boolean h;
    boolean i;
    boolean j;
    android.support.v4.c.c k;
    s l;

    s a(int i, boolean z, boolean z2) {
        if (this.k == null) {
            this.k = new android.support.v4.c.c();
        }
        s sVar = (s) this.k.a(i);
        if (sVar != null) {
            sVar.a(this);
            return sVar;
        }
        if (!z2) {
            return sVar;
        }
        s sVar2 = new s(this, z);
        this.k.b(i, sVar2);
        return sVar2;
    }

    protected void a() {
        this.b.l();
    }

    void a(int i) {
        s sVar;
        if (this.k == null || (sVar = (s) this.k.a(i)) == null || sVar.f) {
            return;
        }
        sVar.h();
        this.k.c(i);
    }

    public void a(Fragment fragment) {
    }

    void a(boolean z) {
        if (this.f) {
            return;
        }
        this.f = true;
        this.g = z;
        this.a.removeMessages(1);
        d();
    }

    public Object b() {
        return null;
    }

    public void c() {
        if (Build.VERSION.SDK_INT >= 11) {
            a.a(this);
        } else {
            this.h = true;
        }
    }

    void d() {
        if (this.j) {
            this.j = false;
            if (this.l != null) {
                if (this.g) {
                    this.l.d();
                } else {
                    this.l.c();
                }
            }
        }
        this.b.o();
    }

    @Override // android.app.Activity
    public void dump(String str, FileDescriptor fileDescriptor, PrintWriter printWriter, String[] strArr) {
        if (Build.VERSION.SDK_INT >= 11) {
        }
        printWriter.print(str);
        printWriter.print("Local FragmentActivity ");
        printWriter.print(Integer.toHexString(System.identityHashCode(this)));
        printWriter.println(" State:");
        String str2 = str + "  ";
        printWriter.print(str2);
        printWriter.print("mCreated=");
        printWriter.print(this.c);
        printWriter.print("mResumed=");
        printWriter.print(this.d);
        printWriter.print(" mStopped=");
        printWriter.print(this.e);
        printWriter.print(" mReallyStopped=");
        printWriter.println(this.f);
        printWriter.print(str2);
        printWriter.print("mLoadersStarted=");
        printWriter.println(this.j);
        if (this.l != null) {
            printWriter.print(str);
            printWriter.print("Loader Manager ");
            printWriter.print(Integer.toHexString(System.identityHashCode(this.l)));
            printWriter.println(":");
            this.l.a(str + "  ", fileDescriptor, printWriter, strArr);
        }
        this.b.a(str, fileDescriptor, printWriter, strArr);
    }

    @Override // android.app.Activity
    protected void onActivityResult(int i, int i2, Intent intent) {
        int i3 = i >> 16;
        if (i3 == 0) {
            super.onActivityResult(i, i2, intent);
            return;
        }
        int i4 = i3 - 1;
        if (this.b.f == null || i4 < 0 || i4 >= this.b.f.size()) {
            Log.w("FragmentActivity", "Activity result fragment index out of range: 0x" + Integer.toHexString(i));
            return;
        }
        Fragment fragment = (Fragment) this.b.f.get(i4);
        if (fragment == null) {
            Log.w("FragmentActivity", "Activity result no fragment exists for index: 0x" + Integer.toHexString(i));
        } else {
            fragment.a(65535 & i, i2, intent);
        }
    }

    @Override // android.app.Activity
    public void onBackPressed() {
        if (this.b.b()) {
            return;
        }
        finish();
    }

    @Override // android.app.Activity, android.content.ComponentCallbacks
    public void onConfigurationChanged(Configuration configuration) {
        super.onConfigurationChanged(configuration);
        this.b.a(configuration);
    }

    @Override // android.app.Activity
    protected void onCreate(Bundle bundle) {
        this.b.a(this);
        if (getLayoutInflater().getFactory() == null) {
            getLayoutInflater().setFactory(this);
        }
        super.onCreate(bundle);
        i iVar = (i) getLastNonConfigurationInstance();
        if (iVar != null) {
            this.k = iVar.e;
        }
        if (bundle != null) {
            this.b.a(bundle.getParcelable("android:support:fragments"), iVar != null ? iVar.d : null);
        }
        this.b.i();
    }

    @Override // android.app.Activity, android.view.Window.Callback
    public boolean onCreatePanelMenu(int i, Menu menu) {
        if (i != 0) {
            return super.onCreatePanelMenu(i, menu);
        }
        boolean onCreatePanelMenu = super.onCreatePanelMenu(i, menu) | this.b.a(menu, getMenuInflater());
        if (Build.VERSION.SDK_INT >= 11) {
            return onCreatePanelMenu;
        }
        return true;
    }

    /* JADX WARN: Multi-variable type inference failed */
    @Override // android.app.Activity, android.view.LayoutInflater.Factory
    public View onCreateView(String str, Context context, AttributeSet attributeSet) {
        Object[] objArr = 0;
        if (!"fragment".equals(str)) {
            return super.onCreateView(str, context, attributeSet);
        }
        String attributeValue = attributeSet.getAttributeValue(null, "class");
        TypedArray obtainStyledAttributes = context.obtainStyledAttributes(attributeSet, h.a);
        if (attributeValue == null) {
            attributeValue = obtainStyledAttributes.getString(0);
        }
        int resourceId = obtainStyledAttributes.getResourceId(1, -1);
        String string = obtainStyledAttributes.getString(2);
        obtainStyledAttributes.recycle();
        int id = 0 != 0 ? (objArr == true ? 1 : 0).getId() : 0;
        if (id == -1 && resourceId == -1 && string == null) {
            throw new IllegalArgumentException(attributeSet.getPositionDescription() + ": Must specify unique android:id, android:tag, or have a parent with an id for " + attributeValue);
        }
        Fragment a = resourceId != -1 ? this.b.a(resourceId) : null;
        if (a == null && string != null) {
            a = this.b.a(string);
        }
        if (a == null && id != -1) {
            a = this.b.a(id);
        }
        if (l.a) {
            Log.v("FragmentActivity", "onCreateView: id=0x" + Integer.toHexString(resourceId) + " fname=" + attributeValue + " existing=" + a);
        }
        if (a == null) {
            Fragment a2 = Fragment.a(this, attributeValue);
            a2.o = true;
            a2.u = resourceId != 0 ? resourceId : id;
            a2.v = id;
            a2.w = string;
            a2.p = true;
            a2.s = this.b;
            a2.a(this, attributeSet, a2.d);
            this.b.a(a2, true);
            a = a2;
        } else {
            if (a.p) {
                throw new IllegalArgumentException(attributeSet.getPositionDescription() + ": Duplicate id 0x" + Integer.toHexString(resourceId) + ", tag " + string + ", or parent id 0x" + Integer.toHexString(id) + " with another fragment for " + attributeValue);
            }
            a.p = true;
            if (!a.A) {
                a.a(this, attributeSet, a.d);
            }
            this.b.b(a);
        }
        if (a.G == null) {
            throw new IllegalStateException("Fragment " + attributeValue + " did not create a view.");
        }
        if (resourceId != 0) {
            a.G.setId(resourceId);
        }
        if (a.G.getTag() == null) {
            a.G.setTag(string);
        }
        return a.G;
    }

    @Override // android.app.Activity
    protected void onDestroy() {
        super.onDestroy();
        a(false);
        this.b.p();
        if (this.l != null) {
            this.l.h();
        }
    }

    @Override // android.app.Activity, android.view.KeyEvent.Callback
    public boolean onKeyDown(int i, KeyEvent keyEvent) {
        if (Build.VERSION.SDK_INT >= 5 || i != 4 || keyEvent.getRepeatCount() != 0) {
            return super.onKeyDown(i, keyEvent);
        }
        onBackPressed();
        return true;
    }

    @Override // android.app.Activity, android.content.ComponentCallbacks
    public void onLowMemory() {
        super.onLowMemory();
        this.b.q();
    }

    @Override // android.app.Activity, android.view.Window.Callback
    public boolean onMenuItemSelected(int i, MenuItem menuItem) {
        if (super.onMenuItemSelected(i, menuItem)) {
            return true;
        }
        switch (i) {
            case 0:
                return this.b.a(menuItem);
            case 6:
                return this.b.b(menuItem);
            default:
                return false;
        }
    }

    @Override // android.app.Activity, android.view.Window.Callback
    public void onPanelClosed(int i, Menu menu) {
        switch (i) {
            case 0:
                this.b.b(menu);
                break;
        }
        super.onPanelClosed(i, menu);
    }

    @Override // android.app.Activity
    protected void onPause() {
        super.onPause();
        this.d = false;
        if (this.a.hasMessages(2)) {
            this.a.removeMessages(2);
            a();
        }
        this.b.m();
    }

    @Override // android.app.Activity
    protected void onPostResume() {
        super.onPostResume();
        this.a.removeMessages(2);
        a();
        this.b.d();
    }

    @Override // android.app.Activity, android.view.Window.Callback
    public boolean onPreparePanel(int i, View view, Menu menu) {
        if (i != 0 || menu == null) {
            return super.onPreparePanel(i, view, menu);
        }
        if (this.h) {
            this.h = false;
            menu.clear();
            onCreatePanelMenu(i, menu);
        }
        return (super.onPreparePanel(i, view, menu) || this.b.a(menu)) && menu.hasVisibleItems();
    }

    @Override // android.app.Activity
    protected void onResume() {
        super.onResume();
        this.a.sendEmptyMessage(2);
        this.d = true;
        this.b.d();
    }

    @Override // android.app.Activity
    public final Object onRetainNonConfigurationInstance() {
        boolean z;
        if (this.e) {
            a(true);
        }
        Object b = b();
        ArrayList f = this.b.f();
        boolean z2 = false;
        if (this.k != null) {
            int a = this.k.a() - 1;
            while (a >= 0) {
                s sVar = (s) this.k.f(a);
                if (sVar.f) {
                    z = true;
                } else {
                    sVar.h();
                    this.k.d(a);
                    z = z2;
                }
                a--;
                z2 = z;
            }
        }
        if (f == null && !z2 && b == null) {
            return null;
        }
        i iVar = new i();
        iVar.a = null;
        iVar.b = b;
        iVar.c = null;
        iVar.d = f;
        iVar.e = this.k;
        return iVar;
    }

    @Override // android.app.Activity
    protected void onSaveInstanceState(Bundle bundle) {
        super.onSaveInstanceState(bundle);
        Parcelable g = this.b.g();
        if (g != null) {
            bundle.putParcelable("android:support:fragments", g);
        }
    }

    @Override // android.app.Activity
    protected void onStart() {
        super.onStart();
        this.e = false;
        this.f = false;
        this.a.removeMessages(1);
        if (!this.c) {
            this.c = true;
            this.b.j();
        }
        this.b.h();
        this.b.d();
        if (!this.j) {
            this.j = true;
            if (this.l != null) {
                this.l.b();
            } else if (!this.i) {
                this.l = a(-1, this.j, false);
            }
            this.i = true;
        }
        this.b.k();
        if (this.k != null) {
            for (int a = this.k.a() - 1; a >= 0; a--) {
                s sVar = (s) this.k.f(a);
                sVar.e();
                sVar.g();
            }
        }
    }

    @Override // android.app.Activity
    protected void onStop() {
        super.onStop();
        this.e = true;
        this.a.sendEmptyMessage(1);
        this.b.n();
    }

    @Override // android.app.Activity
    public void startActivityForResult(Intent intent, int i) {
        if (i != -1 && ((-65536) & i) != 0) {
            throw new IllegalArgumentException("Can only use lower 16 bits for requestCode");
        }
        super.startActivityForResult(intent, i);
    }
}
