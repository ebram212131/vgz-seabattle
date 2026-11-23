package android.support.v4.app;

import android.view.animation.Animation;

/* loaded from: classes.dex */
class m implements Animation.AnimationListener {
    final /* synthetic */ Fragment a;
    final /* synthetic */ l b;

    m(l lVar, Fragment fragment) {
        this.b = lVar;
        this.a = fragment;
    }

    @Override // android.view.animation.Animation.AnimationListener
    public void onAnimationEnd(Animation animation) {
        if (this.a.b != null) {
            this.a.b = null;
            this.b.a(this.a, this.a.c, 0, 0, false);
        }
    }

    @Override // android.view.animation.Animation.AnimationListener
    public void onAnimationRepeat(Animation animation) {
    }

    @Override // android.view.animation.Animation.AnimationListener
    public void onAnimationStart(Animation animation) {
    }
}
