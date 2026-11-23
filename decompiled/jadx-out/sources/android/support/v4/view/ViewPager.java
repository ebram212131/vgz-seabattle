package android.support.v4.view;

import android.R;
import android.database.DataSetObserver;
import android.graphics.Canvas;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.os.Build;
import android.os.Parcel;
import android.os.Parcelable;
import android.util.AttributeSet;
import android.util.Log;
import android.view.FocusFinder;
import android.view.KeyEvent;
import android.view.MotionEvent;
import android.view.SoundEffectConstants;
import android.view.VelocityTracker;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewParent;
import android.view.accessibility.AccessibilityEvent;
import android.view.animation.Interpolator;
import android.widget.Scroller;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;

/* loaded from: classes.dex */
public class ViewPager extends ViewGroup {
    private static final int[] a = {R.attr.layout_gravity};
    private static final Comparator b = new ab();
    private static final Interpolator c = new ac();
    private boolean A;
    private int B;
    private int C;
    private int D;
    private float E;
    private float F;
    private float G;
    private int H;
    private VelocityTracker I;
    private int J;
    private int K;
    private int L;
    private int M;
    private boolean N;
    private android.support.v4.d.a O;
    private android.support.v4.d.a P;
    private boolean Q;
    private boolean R;
    private boolean S;
    private int T;
    private ah U;
    private ah V;
    private ag W;
    private int Z;
    private final ArrayList d;
    private final ae e;
    private final Rect f;
    private k g;
    private int h;
    private int i;
    private Parcelable j;
    private ClassLoader k;
    private Scroller l;
    private ai m;
    private int n;
    private Drawable o;
    private int p;
    private int q;
    private float r;
    private float s;
    private int t;
    private int u;
    private boolean v;
    private boolean w;
    private boolean x;
    private int y;
    private boolean z;

    public class SavedState extends View.BaseSavedState {
        public static final Parcelable.Creator CREATOR = android.support.v4.b.a.a(new aj());
        int a;
        Parcelable b;
        ClassLoader c;

        SavedState(Parcel parcel, ClassLoader classLoader) {
            super(parcel);
            classLoader = classLoader == null ? getClass().getClassLoader() : classLoader;
            this.a = parcel.readInt();
            this.b = parcel.readParcelable(classLoader);
            this.c = classLoader;
        }

        public SavedState(Parcelable parcelable) {
            super(parcelable);
        }

        public String toString() {
            return "FragmentPager.SavedState{" + Integer.toHexString(System.identityHashCode(this)) + " position=" + this.a + "}";
        }

        @Override // android.view.View.BaseSavedState, android.view.AbsSavedState, android.os.Parcelable
        public void writeToParcel(Parcel parcel, int i) {
            super.writeToParcel(parcel, i);
            parcel.writeInt(this.a);
            parcel.writeParcelable(this.b, i);
        }
    }

    private int a(int i, float f, int i2, int i3) {
        if (Math.abs(i3) <= this.L || Math.abs(i2) <= this.J) {
            i = (int) (i + f + 0.5f);
        } else if (i2 <= 0) {
            i++;
        }
        if (this.d.size() <= 0) {
            return i;
        }
        return Math.max(((ae) this.d.get(0)).b, Math.min(i, ((ae) this.d.get(this.d.size() - 1)).b));
    }

    private Rect a(Rect rect, View view) {
        Rect rect2 = rect == null ? new Rect() : rect;
        if (view == null) {
            rect2.set(0, 0, 0, 0);
            return rect2;
        }
        rect2.left = view.getLeft();
        rect2.right = view.getRight();
        rect2.top = view.getTop();
        rect2.bottom = view.getBottom();
        ViewParent parent = view.getParent();
        while ((parent instanceof ViewGroup) && parent != this) {
            ViewGroup viewGroup = (ViewGroup) parent;
            rect2.left += viewGroup.getLeft();
            rect2.right += viewGroup.getRight();
            rect2.top += viewGroup.getTop();
            rect2.bottom += viewGroup.getBottom();
            parent = viewGroup.getParent();
        }
        return rect2;
    }

    private void a(int i, int i2, int i3, int i4) {
        if (i2 > 0 && !this.d.isEmpty()) {
            int scrollX = (int) ((i + i3) * (getScrollX() / (i2 + i4)));
            scrollTo(scrollX, getScrollY());
            if (this.l.isFinished()) {
                return;
            }
            this.l.startScroll(scrollX, 0, (int) (b(this.h).e * i), 0, this.l.getDuration() - this.l.timePassed());
            return;
        }
        ae b2 = b(this.h);
        int min = (int) ((b2 != null ? Math.min(b2.e, this.s) : 0.0f) * i);
        if (min != getScrollX()) {
            g();
            scrollTo(min, getScrollY());
        }
    }

    private void a(ae aeVar, int i, ae aeVar2) {
        ae aeVar3;
        ae aeVar4;
        int a2 = this.g.a();
        int width = getWidth();
        float f = width > 0 ? this.n / width : 0.0f;
        if (aeVar2 != null) {
            int i2 = aeVar2.b;
            if (i2 < aeVar.b) {
                float f2 = aeVar2.e + aeVar2.d + f;
                int i3 = i2 + 1;
                int i4 = 0;
                while (i3 <= aeVar.b && i4 < this.d.size()) {
                    Object obj = this.d.get(i4);
                    while (true) {
                        aeVar4 = (ae) obj;
                        if (i3 <= aeVar4.b || i4 >= this.d.size() - 1) {
                            break;
                        }
                        i4++;
                        obj = this.d.get(i4);
                    }
                    while (i3 < aeVar4.b) {
                        f2 += this.g.a(i3) + f;
                        i3++;
                    }
                    aeVar4.e = f2;
                    f2 += aeVar4.d + f;
                    i3++;
                }
            } else if (i2 > aeVar.b) {
                int size = this.d.size() - 1;
                float f3 = aeVar2.e;
                int i5 = i2 - 1;
                while (i5 >= aeVar.b && size >= 0) {
                    Object obj2 = this.d.get(size);
                    while (true) {
                        aeVar3 = (ae) obj2;
                        if (i5 >= aeVar3.b || size <= 0) {
                            break;
                        }
                        size--;
                        obj2 = this.d.get(size);
                    }
                    while (i5 > aeVar3.b) {
                        f3 -= this.g.a(i5) + f;
                        i5--;
                    }
                    f3 -= aeVar3.d + f;
                    aeVar3.e = f3;
                    i5--;
                }
            }
        }
        int size2 = this.d.size();
        float f4 = aeVar.e;
        int i6 = aeVar.b - 1;
        this.r = aeVar.b == 0 ? aeVar.e : -3.4028235E38f;
        this.s = aeVar.b == a2 + (-1) ? (aeVar.e + aeVar.d) - 1.0f : Float.MAX_VALUE;
        for (int i7 = i - 1; i7 >= 0; i7--) {
            ae aeVar5 = (ae) this.d.get(i7);
            float f5 = f4;
            while (i6 > aeVar5.b) {
                f5 -= this.g.a(i6) + f;
                i6--;
            }
            f4 = f5 - (aeVar5.d + f);
            aeVar5.e = f4;
            if (aeVar5.b == 0) {
                this.r = f4;
            }
            i6--;
        }
        float f6 = aeVar.e + aeVar.d + f;
        int i8 = aeVar.b + 1;
        for (int i9 = i + 1; i9 < size2; i9++) {
            ae aeVar6 = (ae) this.d.get(i9);
            float f7 = f6;
            while (i8 < aeVar6.b) {
                f7 = this.g.a(i8) + f + f7;
                i8++;
            }
            if (aeVar6.b == a2 - 1) {
                this.s = (aeVar6.d + f7) - 1.0f;
            }
            aeVar6.e = f7;
            f6 = f7 + aeVar6.d + f;
            i8++;
        }
        this.R = false;
    }

    private void a(MotionEvent motionEvent) {
        int a2 = f.a(motionEvent);
        if (f.b(motionEvent, a2) == this.H) {
            int i = a2 == 0 ? 1 : 0;
            this.F = f.c(motionEvent, i);
            this.H = f.b(motionEvent, i);
            if (this.I != null) {
                this.I.clear();
            }
        }
    }

    private boolean a(float f, float f2) {
        return (f < ((float) this.C) && f2 > 0.0f) || (f > ((float) (getWidth() - this.C)) && f2 < 0.0f);
    }

    private boolean b(float f) {
        boolean z;
        float f2;
        boolean z2 = true;
        float f3 = this.F - f;
        this.F = f;
        float scrollX = getScrollX() + f3;
        int width = getWidth();
        float f4 = width * this.r;
        float f5 = width * this.s;
        ae aeVar = (ae) this.d.get(0);
        ae aeVar2 = (ae) this.d.get(this.d.size() - 1);
        if (aeVar.b != 0) {
            f4 = aeVar.e * width;
            z = false;
        } else {
            z = true;
        }
        if (aeVar2.b != this.g.a() - 1) {
            f2 = aeVar2.e * width;
            z2 = false;
        } else {
            f2 = f5;
        }
        if (scrollX < f4) {
            if (z) {
                r2 = this.O.a(Math.abs(f4 - scrollX) / width);
            }
        } else if (scrollX > f2) {
            r2 = z2 ? this.P.a(Math.abs(scrollX - f2) / width) : false;
            f4 = f2;
        } else {
            f4 = scrollX;
        }
        this.F += f4 - ((int) f4);
        scrollTo((int) f4, getScrollY());
        d((int) f4);
        return r2;
    }

    private boolean d(int i) {
        if (this.d.size() == 0) {
            this.S = false;
            a(0, 0.0f, 0);
            if (this.S) {
                return false;
            }
            throw new IllegalStateException("onPageScrolled did not call superclass implementation");
        }
        ae h = h();
        int width = getWidth();
        int i2 = this.n + width;
        int i3 = h.b;
        float f = ((i / width) - h.e) / (h.d + (this.n / width));
        this.S = false;
        a(i3, f, (int) (i2 * f));
        if (this.S) {
            return true;
        }
        throw new IllegalStateException("onPageScrolled did not call superclass implementation");
    }

    private void f() {
        int i = 0;
        while (true) {
            int i2 = i;
            if (i2 >= getChildCount()) {
                return;
            }
            if (!((af) getChildAt(i2).getLayoutParams()).a) {
                removeViewAt(i2);
                i2--;
            }
            i = i2 + 1;
        }
    }

    private void g() {
        boolean z = this.Z == 2;
        if (z) {
            setScrollingCacheEnabled(false);
            this.l.abortAnimation();
            int scrollX = getScrollX();
            int scrollY = getScrollY();
            int currX = this.l.getCurrX();
            int currY = this.l.getCurrY();
            if (scrollX != currX || scrollY != currY) {
                scrollTo(currX, currY);
            }
            setScrollState(0);
        }
        this.x = false;
        boolean z2 = z;
        for (int i = 0; i < this.d.size(); i++) {
            ae aeVar = (ae) this.d.get(i);
            if (aeVar.c) {
                aeVar.c = false;
                z2 = true;
            }
        }
        if (z2) {
            b();
        }
    }

    private ae h() {
        int i;
        ae aeVar;
        int width = getWidth();
        float scrollX = width > 0 ? getScrollX() / width : 0.0f;
        float f = width > 0 ? this.n / width : 0.0f;
        float f2 = 0.0f;
        float f3 = 0.0f;
        int i2 = -1;
        int i3 = 0;
        boolean z = true;
        ae aeVar2 = null;
        while (i3 < this.d.size()) {
            ae aeVar3 = (ae) this.d.get(i3);
            if (z || aeVar3.b == i2 + 1) {
                i = i3;
                aeVar = aeVar3;
            } else {
                ae aeVar4 = this.e;
                aeVar4.e = f2 + f3 + f;
                aeVar4.b = i2 + 1;
                aeVar4.d = this.g.a(aeVar4.b);
                i = i3 - 1;
                aeVar = aeVar4;
            }
            float f4 = aeVar.e;
            float f5 = aeVar.d + f4 + f;
            if (!z && scrollX < f4) {
                return aeVar2;
            }
            if (scrollX < f5 || i == this.d.size() - 1) {
                return aeVar;
            }
            f3 = f4;
            i2 = aeVar.b;
            z = false;
            f2 = aeVar.d;
            aeVar2 = aeVar;
            i3 = i + 1;
        }
        return aeVar2;
    }

    private void i() {
        this.z = false;
        this.A = false;
        if (this.I != null) {
            this.I.recycle();
            this.I = null;
        }
    }

    private void setScrollState(int i) {
        if (this.Z == i) {
            return;
        }
        this.Z = i;
        if (this.U != null) {
            this.U.b(i);
        }
    }

    private void setScrollingCacheEnabled(boolean z) {
        if (this.w != z) {
            this.w = z;
        }
    }

    float a(float f) {
        return (float) Math.sin((float) ((f - 0.5f) * 0.4712389167638204d));
    }

    ae a(int i, int i2) {
        ae aeVar = new ae();
        aeVar.b = i;
        aeVar.a = this.g.a((ViewGroup) this, i);
        aeVar.d = this.g.a(i);
        if (i2 < 0 || i2 >= this.d.size()) {
            this.d.add(aeVar);
        } else {
            this.d.add(i2, aeVar);
        }
        return aeVar;
    }

    ae a(View view) {
        int i = 0;
        while (true) {
            int i2 = i;
            if (i2 >= this.d.size()) {
                return null;
            }
            ae aeVar = (ae) this.d.get(i2);
            if (this.g.a(view, aeVar.a)) {
                return aeVar;
            }
            i = i2 + 1;
        }
    }

    void a() {
        int i;
        boolean z;
        int i2;
        boolean z2;
        boolean z3 = this.d.size() < (this.y * 2) + 1 && this.d.size() < this.g.a();
        boolean z4 = false;
        int i3 = this.h;
        boolean z5 = z3;
        int i4 = 0;
        while (i4 < this.d.size()) {
            ae aeVar = (ae) this.d.get(i4);
            int a2 = this.g.a(aeVar.a);
            if (a2 == -1) {
                i = i4;
                z = z4;
                i2 = i3;
                z2 = z5;
            } else if (a2 == -2) {
                this.d.remove(i4);
                int i5 = i4 - 1;
                if (!z4) {
                    this.g.a((ViewGroup) this);
                    z4 = true;
                }
                this.g.a((ViewGroup) this, aeVar.b, aeVar.a);
                if (this.h == aeVar.b) {
                    i = i5;
                    z = z4;
                    i2 = Math.max(0, Math.min(this.h, this.g.a() - 1));
                    z2 = true;
                } else {
                    i = i5;
                    z = z4;
                    i2 = i3;
                    z2 = true;
                }
            } else if (aeVar.b != a2) {
                if (aeVar.b == this.h) {
                    i3 = a2;
                }
                aeVar.b = a2;
                i = i4;
                z = z4;
                i2 = i3;
                z2 = true;
            } else {
                i = i4;
                z = z4;
                i2 = i3;
                z2 = z5;
            }
            z5 = z2;
            i3 = i2;
            z4 = z;
            i4 = i + 1;
        }
        if (z4) {
            this.g.b((ViewGroup) this);
        }
        Collections.sort(this.d, b);
        if (z5) {
            int childCount = getChildCount();
            for (int i6 = 0; i6 < childCount; i6++) {
                af afVar = (af) getChildAt(i6).getLayoutParams();
                if (!afVar.a) {
                    afVar.c = 0.0f;
                }
            }
            a(i3, false, true);
            requestLayout();
        }
    }

    /* JADX WARN: Code restructure failed: missing block: B:20:0x0058, code lost:
    
        if (r0.b == r14.h) goto L19;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    void a(int r15) {
        /*
            Method dump skipped, instructions count: 537
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: android.support.v4.view.ViewPager.a(int):void");
    }

    protected void a(int i, float f, int i2) {
        int measuredWidth;
        int i3;
        int i4;
        if (this.T > 0) {
            int scrollX = getScrollX();
            int paddingLeft = getPaddingLeft();
            int paddingRight = getPaddingRight();
            int width = getWidth();
            int childCount = getChildCount();
            int i5 = 0;
            while (i5 < childCount) {
                View childAt = getChildAt(i5);
                af afVar = (af) childAt.getLayoutParams();
                if (afVar.a) {
                    switch (afVar.b & 7) {
                        case 1:
                            measuredWidth = Math.max((width - childAt.getMeasuredWidth()) / 2, paddingLeft);
                            int i6 = paddingRight;
                            i3 = paddingLeft;
                            i4 = i6;
                            break;
                        case 2:
                        case 4:
                        default:
                            measuredWidth = paddingLeft;
                            int i7 = paddingRight;
                            i3 = paddingLeft;
                            i4 = i7;
                            break;
                        case 3:
                            int width2 = childAt.getWidth() + paddingLeft;
                            int i8 = paddingLeft;
                            i4 = paddingRight;
                            i3 = width2;
                            measuredWidth = i8;
                            break;
                        case 5:
                            measuredWidth = (width - paddingRight) - childAt.getMeasuredWidth();
                            int measuredWidth2 = paddingRight + childAt.getMeasuredWidth();
                            i3 = paddingLeft;
                            i4 = measuredWidth2;
                            break;
                    }
                    int left = (measuredWidth + scrollX) - childAt.getLeft();
                    if (left != 0) {
                        childAt.offsetLeftAndRight(left);
                    }
                } else {
                    int i9 = paddingRight;
                    i3 = paddingLeft;
                    i4 = i9;
                }
                i5++;
                int i10 = i4;
                paddingLeft = i3;
                paddingRight = i10;
            }
        }
        if (this.U != null) {
            this.U.a(i, f, i2);
        }
        if (this.V != null) {
            this.V.a(i, f, i2);
        }
        this.S = true;
    }

    void a(int i, int i2, int i3) {
        int abs;
        if (getChildCount() == 0) {
            setScrollingCacheEnabled(false);
            return;
        }
        int scrollX = getScrollX();
        int scrollY = getScrollY();
        int i4 = i - scrollX;
        int i5 = i2 - scrollY;
        if (i4 == 0 && i5 == 0) {
            g();
            b();
            setScrollState(0);
            return;
        }
        setScrollingCacheEnabled(true);
        setScrollState(2);
        int width = getWidth();
        int i6 = width / 2;
        float a2 = (i6 * a(Math.min(1.0f, (Math.abs(i4) * 1.0f) / width))) + i6;
        int abs2 = Math.abs(i3);
        if (abs2 > 0) {
            abs = Math.round(1000.0f * Math.abs(a2 / abs2)) * 4;
        } else {
            abs = (int) (((Math.abs(i4) / ((width * this.g.a(this.h)) + this.n)) + 1.0f) * 100.0f);
        }
        this.l.startScroll(scrollX, scrollY, i4, i5, Math.min(abs, 600));
        q.b(this);
    }

    public void a(int i, boolean z) {
        this.x = false;
        a(i, z, false);
    }

    void a(int i, boolean z, boolean z2) {
        a(i, z, z2, 0);
    }

    void a(int i, boolean z, boolean z2, int i2) {
        if (this.g == null || this.g.a() <= 0) {
            setScrollingCacheEnabled(false);
            return;
        }
        if (!z2 && this.h == i && this.d.size() != 0) {
            setScrollingCacheEnabled(false);
            return;
        }
        if (i < 0) {
            i = 0;
        } else if (i >= this.g.a()) {
            i = this.g.a() - 1;
        }
        int i3 = this.y;
        if (i > this.h + i3 || i < this.h - i3) {
            for (int i4 = 0; i4 < this.d.size(); i4++) {
                ((ae) this.d.get(i4)).c = true;
            }
        }
        boolean z3 = this.h != i;
        a(i);
        ae b2 = b(i);
        int max = b2 != null ? (int) (Math.max(this.r, Math.min(b2.e, this.s)) * getWidth()) : 0;
        if (z) {
            a(max, 0, i2);
            if (z3 && this.U != null) {
                this.U.a(i);
            }
            if (!z3 || this.V == null) {
                return;
            }
            this.V.a(i);
            return;
        }
        if (z3 && this.U != null) {
            this.U.a(i);
        }
        if (z3 && this.V != null) {
            this.V.a(i);
        }
        g();
        scrollTo(max, 0);
    }

    public boolean a(KeyEvent keyEvent) {
        if (keyEvent.getAction() != 0) {
            return false;
        }
        switch (keyEvent.getKeyCode()) {
            case 21:
                break;
            case 22:
                break;
            case 61:
                if (Build.VERSION.SDK_INT >= 11) {
                    if (!a.a(keyEvent)) {
                        if (a.a(keyEvent, 1)) {
                            break;
                        }
                    } else {
                        break;
                    }
                }
                break;
        }
        return false;
    }

    protected boolean a(View view, boolean z, int i, int i2, int i3) {
        if (view instanceof ViewGroup) {
            ViewGroup viewGroup = (ViewGroup) view;
            int scrollX = view.getScrollX();
            int scrollY = view.getScrollY();
            for (int childCount = viewGroup.getChildCount() - 1; childCount >= 0; childCount--) {
                View childAt = viewGroup.getChildAt(childCount);
                if (i2 + scrollX >= childAt.getLeft() && i2 + scrollX < childAt.getRight() && i3 + scrollY >= childAt.getTop() && i3 + scrollY < childAt.getBottom() && a(childAt, true, i, (i2 + scrollX) - childAt.getLeft(), (i3 + scrollY) - childAt.getTop())) {
                    return true;
                }
            }
        }
        return z && q.a(view, -i);
    }

    @Override // android.view.ViewGroup, android.view.View
    public void addFocusables(ArrayList arrayList, int i, int i2) {
        ae a2;
        int size = arrayList.size();
        int descendantFocusability = getDescendantFocusability();
        if (descendantFocusability != 393216) {
            for (int i3 = 0; i3 < getChildCount(); i3++) {
                View childAt = getChildAt(i3);
                if (childAt.getVisibility() == 0 && (a2 = a(childAt)) != null && a2.b == this.h) {
                    childAt.addFocusables(arrayList, i, i2);
                }
            }
        }
        if ((descendantFocusability != 262144 || size == arrayList.size()) && isFocusable()) {
            if (((i2 & 1) == 1 && isInTouchMode() && !isFocusableInTouchMode()) || arrayList == null) {
                return;
            }
            arrayList.add(this);
        }
    }

    @Override // android.view.ViewGroup, android.view.View
    public void addTouchables(ArrayList arrayList) {
        ae a2;
        for (int i = 0; i < getChildCount(); i++) {
            View childAt = getChildAt(i);
            if (childAt.getVisibility() == 0 && (a2 = a(childAt)) != null && a2.b == this.h) {
                childAt.addTouchables(arrayList);
            }
        }
    }

    @Override // android.view.ViewGroup
    public void addView(View view, int i, ViewGroup.LayoutParams layoutParams) {
        ViewGroup.LayoutParams generateLayoutParams = !checkLayoutParams(layoutParams) ? generateLayoutParams(layoutParams) : layoutParams;
        af afVar = (af) generateLayoutParams;
        afVar.a |= view instanceof ad;
        if (!this.v) {
            super.addView(view, i, generateLayoutParams);
        } else {
            if (afVar != null && afVar.a) {
                throw new IllegalStateException("Cannot add pager decor view during layout");
            }
            afVar.d = true;
            addViewInLayout(view, i, generateLayoutParams);
        }
    }

    ae b(int i) {
        int i2 = 0;
        while (true) {
            int i3 = i2;
            if (i3 >= this.d.size()) {
                return null;
            }
            ae aeVar = (ae) this.d.get(i3);
            if (aeVar.b == i) {
                return aeVar;
            }
            i2 = i3 + 1;
        }
    }

    ae b(View view) {
        while (true) {
            Object parent = view.getParent();
            if (parent == this) {
                return a(view);
            }
            if (parent == null || !(parent instanceof View)) {
                break;
            }
            view = (View) parent;
        }
        return null;
    }

    void b() {
        a(this.h);
    }

    boolean c() {
        if (this.h <= 0) {
            return false;
        }
        a(this.h - 1, true);
        return true;
    }

    public boolean c(int i) {
        boolean c2;
        View findFocus = findFocus();
        if (findFocus == this) {
            findFocus = null;
        }
        View findNextFocus = FocusFinder.getInstance().findNextFocus(this, findFocus, i);
        if (findNextFocus == null || findNextFocus == findFocus) {
            if (i == 17 || i == 1) {
                c2 = c();
            } else {
                if (i == 66 || i == 2) {
                    c2 = d();
                }
                c2 = false;
            }
        } else if (i == 17) {
            c2 = (findFocus == null || a(this.f, findNextFocus).left < a(this.f, findFocus).left) ? findNextFocus.requestFocus() : c();
        } else {
            if (i == 66) {
                c2 = (findFocus == null || a(this.f, findNextFocus).left > a(this.f, findFocus).left) ? findNextFocus.requestFocus() : d();
            }
            c2 = false;
        }
        if (c2) {
            playSoundEffect(SoundEffectConstants.getContantForFocusDirection(i));
        }
        return c2;
    }

    @Override // android.view.ViewGroup
    protected boolean checkLayoutParams(ViewGroup.LayoutParams layoutParams) {
        return (layoutParams instanceof af) && super.checkLayoutParams(layoutParams);
    }

    @Override // android.view.View
    public void computeScroll() {
        if (this.l.isFinished() || !this.l.computeScrollOffset()) {
            g();
            return;
        }
        int scrollX = getScrollX();
        int scrollY = getScrollY();
        int currX = this.l.getCurrX();
        int currY = this.l.getCurrY();
        if (scrollX != currX || scrollY != currY) {
            scrollTo(currX, currY);
            if (!d(currX)) {
                this.l.abortAnimation();
                scrollTo(0, currY);
            }
        }
        q.b(this);
    }

    boolean d() {
        if (this.g == null || this.h >= this.g.a() - 1) {
            return false;
        }
        a(this.h + 1, true);
        return true;
    }

    @Override // android.view.ViewGroup, android.view.View
    public boolean dispatchKeyEvent(KeyEvent keyEvent) {
        return super.dispatchKeyEvent(keyEvent) || a(keyEvent);
    }

    @Override // android.view.View
    public boolean dispatchPopulateAccessibilityEvent(AccessibilityEvent accessibilityEvent) {
        ae a2;
        int childCount = getChildCount();
        for (int i = 0; i < childCount; i++) {
            View childAt = getChildAt(i);
            if (childAt.getVisibility() == 0 && (a2 = a(childAt)) != null && a2.b == this.h && childAt.dispatchPopulateAccessibilityEvent(accessibilityEvent)) {
                return true;
            }
        }
        return false;
    }

    @Override // android.view.View
    public void draw(Canvas canvas) {
        super.draw(canvas);
        boolean z = false;
        int a2 = q.a(this);
        if (a2 == 0 || (a2 == 1 && this.g != null && this.g.a() > 1)) {
            if (!this.O.a()) {
                int save = canvas.save();
                int height = (getHeight() - getPaddingTop()) - getPaddingBottom();
                int width = getWidth();
                canvas.rotate(270.0f);
                canvas.translate((-height) + getPaddingTop(), this.r * width);
                this.O.a(height, width);
                z = false | this.O.a(canvas);
                canvas.restoreToCount(save);
            }
            if (!this.P.a()) {
                int save2 = canvas.save();
                int width2 = getWidth();
                int height2 = (getHeight() - getPaddingTop()) - getPaddingBottom();
                canvas.rotate(90.0f);
                canvas.translate(-getPaddingTop(), (-(this.s + 1.0f)) * width2);
                this.P.a(height2, width2);
                z |= this.P.a(canvas);
                canvas.restoreToCount(save2);
            }
        } else {
            this.O.b();
            this.P.b();
        }
        if (z) {
            q.b(this);
        }
    }

    @Override // android.view.ViewGroup, android.view.View
    protected void drawableStateChanged() {
        super.drawableStateChanged();
        Drawable drawable = this.o;
        if (drawable == null || !drawable.isStateful()) {
            return;
        }
        drawable.setState(getDrawableState());
    }

    @Override // android.view.ViewGroup
    protected ViewGroup.LayoutParams generateDefaultLayoutParams() {
        return new af();
    }

    @Override // android.view.ViewGroup
    public ViewGroup.LayoutParams generateLayoutParams(AttributeSet attributeSet) {
        return new af(getContext(), attributeSet);
    }

    @Override // android.view.ViewGroup
    protected ViewGroup.LayoutParams generateLayoutParams(ViewGroup.LayoutParams layoutParams) {
        return generateDefaultLayoutParams();
    }

    public k getAdapter() {
        return this.g;
    }

    public int getCurrentItem() {
        return this.h;
    }

    public int getOffscreenPageLimit() {
        return this.y;
    }

    public int getPageMargin() {
        return this.n;
    }

    @Override // android.view.ViewGroup, android.view.View
    protected void onAttachedToWindow() {
        super.onAttachedToWindow();
        this.Q = true;
    }

    @Override // android.view.View
    protected void onDraw(Canvas canvas) {
        float f;
        super.onDraw(canvas);
        if (this.n <= 0 || this.o == null || this.d.size() <= 0 || this.g == null) {
            return;
        }
        int scrollX = getScrollX();
        int width = getWidth();
        float f2 = this.n / width;
        ae aeVar = (ae) this.d.get(0);
        float f3 = aeVar.e;
        int size = this.d.size();
        int i = aeVar.b;
        int i2 = ((ae) this.d.get(size - 1)).b;
        int i3 = 0;
        for (int i4 = i; i4 < i2; i4++) {
            while (i4 > aeVar.b && i3 < size) {
                i3++;
                aeVar = (ae) this.d.get(i3);
            }
            if (i4 == aeVar.b) {
                f = (aeVar.e + aeVar.d) * width;
                f3 = aeVar.e + aeVar.d + f2;
            } else {
                float a2 = this.g.a(i4);
                f = (f3 + a2) * width;
                f3 += a2 + f2;
            }
            if (this.n + f > scrollX) {
                this.o.setBounds((int) f, this.p, (int) (this.n + f + 0.5f), this.q);
                this.o.draw(canvas);
            }
            if (f > scrollX + width) {
                return;
            }
        }
    }

    @Override // android.view.ViewGroup
    public boolean onInterceptTouchEvent(MotionEvent motionEvent) {
        int action = motionEvent.getAction() & 255;
        if (action == 3 || action == 1) {
            this.z = false;
            this.A = false;
            this.H = -1;
            if (this.I == null) {
                return false;
            }
            this.I.recycle();
            this.I = null;
            return false;
        }
        if (action != 0) {
            if (this.z) {
                return true;
            }
            if (this.A) {
                return false;
            }
        }
        switch (action) {
            case 0:
                float x = motionEvent.getX();
                this.E = x;
                this.F = x;
                this.G = motionEvent.getY();
                this.H = f.b(motionEvent, 0);
                this.A = false;
                this.l.computeScrollOffset();
                if (this.Z == 2 && Math.abs(this.l.getFinalX() - this.l.getCurrX()) > this.M) {
                    this.l.abortAnimation();
                    this.x = false;
                    b();
                    this.z = true;
                    setScrollState(1);
                    break;
                } else {
                    g();
                    this.z = false;
                    break;
                }
            case 2:
                int i = this.H;
                if (i != -1) {
                    int a2 = f.a(motionEvent, i);
                    float c2 = f.c(motionEvent, a2);
                    float f = c2 - this.F;
                    float abs = Math.abs(f);
                    float d = f.d(motionEvent, a2);
                    float abs2 = Math.abs(d - this.G);
                    if (f != 0.0f && !a(this.F, f) && a(this, false, (int) f, (int) c2, (int) d)) {
                        this.F = c2;
                        this.E = c2;
                        this.G = d;
                        this.A = true;
                        return false;
                    }
                    if (abs > this.D && abs > abs2) {
                        this.z = true;
                        setScrollState(1);
                        this.F = f > 0.0f ? this.E + this.D : this.E - this.D;
                        setScrollingCacheEnabled(true);
                    } else if (abs2 > this.D) {
                        this.A = true;
                    }
                    if (this.z && b(c2)) {
                        q.b(this);
                        break;
                    }
                }
                break;
            case 6:
                a(motionEvent);
                break;
        }
        if (this.I == null) {
            this.I = VelocityTracker.obtain();
        }
        this.I.addMovement(motionEvent);
        return this.z;
    }

    @Override // android.view.ViewGroup, android.view.View
    protected void onLayout(boolean z, int i, int i2, int i3, int i4) {
        ae a2;
        int i5;
        int i6;
        int i7;
        int measuredHeight;
        int i8;
        int i9;
        this.v = true;
        b();
        this.v = false;
        int childCount = getChildCount();
        int i10 = i3 - i;
        int i11 = i4 - i2;
        int paddingLeft = getPaddingLeft();
        int paddingTop = getPaddingTop();
        int paddingRight = getPaddingRight();
        int paddingBottom = getPaddingBottom();
        int scrollX = getScrollX();
        int i12 = 0;
        int i13 = 0;
        while (i13 < childCount) {
            View childAt = getChildAt(i13);
            if (childAt.getVisibility() != 8) {
                af afVar = (af) childAt.getLayoutParams();
                if (afVar.a) {
                    int i14 = afVar.b & 7;
                    int i15 = afVar.b & 112;
                    switch (i14) {
                        case 1:
                            i7 = Math.max((i10 - childAt.getMeasuredWidth()) / 2, paddingLeft);
                            break;
                        case 2:
                        case 4:
                        default:
                            i7 = paddingLeft;
                            break;
                        case 3:
                            i7 = paddingLeft;
                            paddingLeft = childAt.getMeasuredWidth() + paddingLeft;
                            break;
                        case 5:
                            int measuredWidth = (i10 - paddingRight) - childAt.getMeasuredWidth();
                            paddingRight += childAt.getMeasuredWidth();
                            i7 = measuredWidth;
                            break;
                    }
                    switch (i15) {
                        case 16:
                            measuredHeight = Math.max((i11 - childAt.getMeasuredHeight()) / 2, paddingTop);
                            int i16 = paddingBottom;
                            i8 = paddingTop;
                            i9 = i16;
                            break;
                        case 48:
                            int measuredHeight2 = childAt.getMeasuredHeight() + paddingTop;
                            int i17 = paddingTop;
                            i9 = paddingBottom;
                            i8 = measuredHeight2;
                            measuredHeight = i17;
                            break;
                        case 80:
                            measuredHeight = (i11 - paddingBottom) - childAt.getMeasuredHeight();
                            int measuredHeight3 = paddingBottom + childAt.getMeasuredHeight();
                            i8 = paddingTop;
                            i9 = measuredHeight3;
                            break;
                        default:
                            measuredHeight = paddingTop;
                            int i18 = paddingBottom;
                            i8 = paddingTop;
                            i9 = i18;
                            break;
                    }
                    int i19 = i7 + scrollX;
                    childAt.layout(i19, measuredHeight, childAt.getMeasuredWidth() + i19, childAt.getMeasuredHeight() + measuredHeight);
                    i5 = i12 + 1;
                    i6 = i8;
                    paddingBottom = i9;
                    i13++;
                    paddingLeft = paddingLeft;
                    paddingRight = paddingRight;
                    paddingTop = i6;
                    i12 = i5;
                }
            }
            i5 = i12;
            i6 = paddingTop;
            i13++;
            paddingLeft = paddingLeft;
            paddingRight = paddingRight;
            paddingTop = i6;
            i12 = i5;
        }
        for (int i20 = 0; i20 < childCount; i20++) {
            View childAt2 = getChildAt(i20);
            if (childAt2.getVisibility() != 8) {
                af afVar2 = (af) childAt2.getLayoutParams();
                if (!afVar2.a && (a2 = a(childAt2)) != null) {
                    int i21 = ((int) (a2.e * i10)) + paddingLeft;
                    if (afVar2.d) {
                        afVar2.d = false;
                        childAt2.measure(View.MeasureSpec.makeMeasureSpec((int) (afVar2.c * ((i10 - paddingLeft) - paddingRight)), 1073741824), View.MeasureSpec.makeMeasureSpec((i11 - paddingTop) - paddingBottom, 1073741824));
                    }
                    childAt2.layout(i21, paddingTop, childAt2.getMeasuredWidth() + i21, childAt2.getMeasuredHeight() + paddingTop);
                }
            }
        }
        this.p = paddingTop;
        this.q = i11 - paddingBottom;
        this.T = i12;
        this.Q = false;
    }

    /* JADX WARN: Removed duplicated region for block: B:33:0x00a0  */
    /* JADX WARN: Removed duplicated region for block: B:36:0x00b4  */
    @Override // android.view.View
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    protected void onMeasure(int r14, int r15) {
        /*
            Method dump skipped, instructions count: 275
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: android.support.v4.view.ViewPager.onMeasure(int, int):void");
    }

    @Override // android.view.ViewGroup
    protected boolean onRequestFocusInDescendants(int i, Rect rect) {
        int i2;
        ae a2;
        int i3 = -1;
        int childCount = getChildCount();
        if ((i & 2) != 0) {
            i3 = 1;
            i2 = 0;
        } else {
            i2 = childCount - 1;
            childCount = -1;
        }
        while (i2 != childCount) {
            View childAt = getChildAt(i2);
            if (childAt.getVisibility() == 0 && (a2 = a(childAt)) != null && a2.b == this.h && childAt.requestFocus(i, rect)) {
                return true;
            }
            i2 += i3;
        }
        return false;
    }

    @Override // android.view.View
    public void onRestoreInstanceState(Parcelable parcelable) {
        if (!(parcelable instanceof SavedState)) {
            super.onRestoreInstanceState(parcelable);
            return;
        }
        SavedState savedState = (SavedState) parcelable;
        super.onRestoreInstanceState(savedState.getSuperState());
        if (this.g != null) {
            this.g.a(savedState.b, savedState.c);
            a(savedState.a, false, true);
        } else {
            this.i = savedState.a;
            this.j = savedState.b;
            this.k = savedState.c;
        }
    }

    @Override // android.view.View
    public Parcelable onSaveInstanceState() {
        SavedState savedState = new SavedState(super.onSaveInstanceState());
        savedState.a = this.h;
        if (this.g != null) {
            savedState.b = this.g.b();
        }
        return savedState;
    }

    @Override // android.view.View
    protected void onSizeChanged(int i, int i2, int i3, int i4) {
        super.onSizeChanged(i, i2, i3, i4);
        if (i != i3) {
            a(i, i3, this.n, this.n);
        }
    }

    @Override // android.view.View
    public boolean onTouchEvent(MotionEvent motionEvent) {
        boolean z = false;
        if (this.N) {
            return true;
        }
        if (motionEvent.getAction() == 0 && motionEvent.getEdgeFlags() != 0) {
            return false;
        }
        if (this.g == null || this.g.a() == 0) {
            return false;
        }
        if (this.I == null) {
            this.I = VelocityTracker.obtain();
        }
        this.I.addMovement(motionEvent);
        switch (motionEvent.getAction() & 255) {
            case 0:
                this.l.abortAnimation();
                this.x = false;
                b();
                this.z = true;
                setScrollState(1);
                float x = motionEvent.getX();
                this.E = x;
                this.F = x;
                this.H = f.b(motionEvent, 0);
                break;
            case 1:
                if (this.z) {
                    VelocityTracker velocityTracker = this.I;
                    velocityTracker.computeCurrentVelocity(1000, this.K);
                    int a2 = (int) l.a(velocityTracker, this.H);
                    this.x = true;
                    int width = getWidth();
                    int scrollX = getScrollX();
                    ae h = h();
                    a(a(h.b, ((scrollX / width) - h.e) / h.d, a2, (int) (f.c(motionEvent, f.a(motionEvent, this.H)) - this.E)), true, true, a2);
                    this.H = -1;
                    i();
                    z = this.P.c() | this.O.c();
                    break;
                }
                break;
            case 2:
                if (!this.z) {
                    int a3 = f.a(motionEvent, this.H);
                    float c2 = f.c(motionEvent, a3);
                    float abs = Math.abs(c2 - this.F);
                    float abs2 = Math.abs(f.d(motionEvent, a3) - this.G);
                    if (abs > this.D && abs > abs2) {
                        this.z = true;
                        this.F = c2 - this.E > 0.0f ? this.E + this.D : this.E - this.D;
                        setScrollState(1);
                        setScrollingCacheEnabled(true);
                    }
                }
                if (this.z) {
                    z = false | b(f.c(motionEvent, f.a(motionEvent, this.H)));
                    break;
                }
                break;
            case 3:
                if (this.z) {
                    a(this.h, true, true);
                    this.H = -1;
                    i();
                    z = this.P.c() | this.O.c();
                    break;
                }
                break;
            case 5:
                int a4 = f.a(motionEvent);
                this.F = f.c(motionEvent, a4);
                this.H = f.b(motionEvent, a4);
                break;
            case 6:
                a(motionEvent);
                this.F = f.c(motionEvent, f.a(motionEvent, this.H));
                break;
        }
        if (z) {
            q.b(this);
        }
        return true;
    }

    public void setAdapter(k kVar) {
        if (this.g != null) {
            this.g.b(this.m);
            this.g.a((ViewGroup) this);
            for (int i = 0; i < this.d.size(); i++) {
                ae aeVar = (ae) this.d.get(i);
                this.g.a((ViewGroup) this, aeVar.b, aeVar.a);
            }
            this.g.b((ViewGroup) this);
            this.d.clear();
            f();
            this.h = 0;
            scrollTo(0, 0);
        }
        k kVar2 = this.g;
        this.g = kVar;
        if (this.g != null) {
            if (this.m == null) {
                this.m = new ai(this, null);
            }
            this.g.a((DataSetObserver) this.m);
            this.x = false;
            this.Q = true;
            if (this.i >= 0) {
                this.g.a(this.j, this.k);
                a(this.i, false, true);
                this.i = -1;
                this.j = null;
                this.k = null;
            } else {
                b();
            }
        }
        if (this.W == null || kVar2 == kVar) {
            return;
        }
        this.W.a(kVar2, kVar);
    }

    public void setCurrentItem(int i) {
        this.x = false;
        a(i, !this.Q, false);
    }

    public void setOffscreenPageLimit(int i) {
        if (i < 1) {
            Log.w("ViewPager", "Requested offscreen page limit " + i + " too small; defaulting to 1");
            i = 1;
        }
        if (i != this.y) {
            this.y = i;
            b();
        }
    }

    void setOnAdapterChangeListener(ag agVar) {
        this.W = agVar;
    }

    public void setOnPageChangeListener(ah ahVar) {
        this.U = ahVar;
    }

    public void setPageMargin(int i) {
        int i2 = this.n;
        this.n = i;
        int width = getWidth();
        a(width, width, i, i2);
        requestLayout();
    }

    public void setPageMarginDrawable(int i) {
        setPageMarginDrawable(getContext().getResources().getDrawable(i));
    }

    public void setPageMarginDrawable(Drawable drawable) {
        this.o = drawable;
        if (drawable != null) {
            refreshDrawableState();
        }
        setWillNotDraw(drawable == null);
        invalidate();
    }

    @Override // android.view.View
    protected boolean verifyDrawable(Drawable drawable) {
        return super.verifyDrawable(drawable) || drawable == this.o;
    }
}
