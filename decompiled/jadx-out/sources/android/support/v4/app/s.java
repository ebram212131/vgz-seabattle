package android.support.v4.app;

import android.util.Log;
import java.io.FileDescriptor;
import java.io.PrintWriter;

/* loaded from: classes.dex */
class s extends q {
    static boolean a = false;
    final android.support.v4.c.c b = new android.support.v4.c.c();
    final android.support.v4.c.c c = new android.support.v4.c.c();
    g d;
    boolean e;
    boolean f;

    s(g gVar, boolean z) {
        this.d = gVar;
        this.e = z;
    }

    void a(g gVar) {
        this.d = gVar;
    }

    public void a(String str, FileDescriptor fileDescriptor, PrintWriter printWriter, String[] strArr) {
        if (this.b.a() > 0) {
            printWriter.print(str);
            printWriter.println("Active Loaders:");
            String str2 = str + "    ";
            for (int i = 0; i < this.b.a(); i++) {
                t tVar = (t) this.b.f(i);
                printWriter.print(str);
                printWriter.print("  #");
                printWriter.print(this.b.e(i));
                printWriter.print(": ");
                printWriter.println(tVar.toString());
                tVar.a(str2, fileDescriptor, printWriter, strArr);
            }
        }
        if (this.c.a() > 0) {
            printWriter.print(str);
            printWriter.println("Inactive Loaders:");
            String str3 = str + "    ";
            for (int i2 = 0; i2 < this.c.a(); i2++) {
                t tVar2 = (t) this.c.f(i2);
                printWriter.print(str);
                printWriter.print("  #");
                printWriter.print(this.c.e(i2));
                printWriter.print(": ");
                printWriter.println(tVar2.toString());
                tVar2.a(str3, fileDescriptor, printWriter, strArr);
            }
        }
    }

    @Override // android.support.v4.app.q
    public boolean a() {
        int a2 = this.b.a();
        boolean z = false;
        for (int i = 0; i < a2; i++) {
            t tVar = (t) this.b.f(i);
            z |= tVar.h && !tVar.f;
        }
        return z;
    }

    void b() {
        if (a) {
            Log.v("LoaderManager", "Starting in " + this);
        }
        if (this.e) {
            RuntimeException runtimeException = new RuntimeException("here");
            runtimeException.fillInStackTrace();
            Log.w("LoaderManager", "Called doStart when already started: " + this, runtimeException);
        } else {
            this.e = true;
            for (int a2 = this.b.a() - 1; a2 >= 0; a2--) {
                ((t) this.b.f(a2)).a();
            }
        }
    }

    void c() {
        if (a) {
            Log.v("LoaderManager", "Stopping in " + this);
        }
        if (!this.e) {
            RuntimeException runtimeException = new RuntimeException("here");
            runtimeException.fillInStackTrace();
            Log.w("LoaderManager", "Called doStop when not started: " + this, runtimeException);
        } else {
            for (int a2 = this.b.a() - 1; a2 >= 0; a2--) {
                ((t) this.b.f(a2)).e();
            }
            this.e = false;
        }
    }

    void d() {
        if (a) {
            Log.v("LoaderManager", "Retaining in " + this);
        }
        if (!this.e) {
            RuntimeException runtimeException = new RuntimeException("here");
            runtimeException.fillInStackTrace();
            Log.w("LoaderManager", "Called doRetain when not started: " + this, runtimeException);
        } else {
            this.f = true;
            this.e = false;
            for (int a2 = this.b.a() - 1; a2 >= 0; a2--) {
                ((t) this.b.f(a2)).b();
            }
        }
    }

    void e() {
        if (this.f) {
            if (a) {
                Log.v("LoaderManager", "Finished Retaining in " + this);
            }
            this.f = false;
            for (int a2 = this.b.a() - 1; a2 >= 0; a2--) {
                ((t) this.b.f(a2)).c();
            }
        }
    }

    void f() {
        for (int a2 = this.b.a() - 1; a2 >= 0; a2--) {
            ((t) this.b.f(a2)).k = true;
        }
    }

    void g() {
        for (int a2 = this.b.a() - 1; a2 >= 0; a2--) {
            ((t) this.b.f(a2)).d();
        }
    }

    void h() {
        if (!this.f) {
            if (a) {
                Log.v("LoaderManager", "Destroying Active in " + this);
            }
            for (int a2 = this.b.a() - 1; a2 >= 0; a2--) {
                ((t) this.b.f(a2)).f();
            }
        }
        if (a) {
            Log.v("LoaderManager", "Destroying Inactive in " + this);
        }
        for (int a3 = this.c.a() - 1; a3 >= 0; a3--) {
            ((t) this.c.f(a3)).f();
        }
        this.c.b();
    }

    public String toString() {
        StringBuilder sb = new StringBuilder(128);
        sb.append("LoaderManager{");
        sb.append(Integer.toHexString(System.identityHashCode(this)));
        sb.append(" in ");
        android.support.v4.c.a.a(this.d, sb);
        sb.append("}}");
        return sb.toString();
    }
}
