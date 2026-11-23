package android.support.v4.view;

import android.database.DataSetObserver;

/* loaded from: classes.dex */
class ai extends DataSetObserver {
    final /* synthetic */ ViewPager a;

    private ai(ViewPager viewPager) {
        this.a = viewPager;
    }

    /* synthetic */ ai(ViewPager viewPager, ab abVar) {
        this(viewPager);
    }

    @Override // android.database.DataSetObserver
    public void onChanged() {
        this.a.a();
    }

    @Override // android.database.DataSetObserver
    public void onInvalidated() {
        this.a.a();
    }
}
