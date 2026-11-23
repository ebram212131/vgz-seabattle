package com.mygames.vgzseabattle;

import android.media.AudioManager;
import android.media.SoundPool;
import java.util.TimerTask;

/* loaded from: classes.dex */
class i extends TimerTask {
    final /* synthetic */ ActivityMenu a;

    i(ActivityMenu activityMenu) {
        this.a = activityMenu;
    }

    @Override // java.util.TimerTask, java.lang.Runnable
    public void run() {
        boolean z;
        boolean z2;
        boolean z3;
        boolean z4;
        int i;
        int i2;
        int[] iArr;
        int[] iArr2;
        int[] iArr3;
        SoundPool soundPool;
        int[] iArr4;
        int i3;
        int i4;
        z = this.a.t;
        if (z) {
            ActivityMenu activityMenu = this.a;
            i3 = activityMenu.u;
            activityMenu.u = i3 + 1;
            i4 = this.a.u;
            if (i4 <= 3) {
            }
            this.a.t = false;
            this.a.h = false;
        }
        if (p.d) {
            p.d = false;
            this.a.h = false;
        }
        if (p.c) {
            return;
        }
        z2 = this.a.s;
        if (z2) {
            this.a.s = false;
            this.a.h = false;
        }
        z3 = this.a.h;
        if (!z3) {
            iArr = this.a.b;
            if (iArr[0] != 0) {
                iArr2 = this.a.c;
                if (iArr2[0] == 0) {
                    AudioManager audioManager = (AudioManager) this.a.getSystemService("audio");
                    float streamVolume = audioManager.getStreamVolume(3) / audioManager.getStreamMaxVolume(3);
                    iArr3 = this.a.c;
                    soundPool = this.a.a;
                    iArr4 = this.a.b;
                    iArr3[0] = soundPool.play(iArr4[0], streamVolume, streamVolume, 1, 10000, 1.0f);
                }
            }
            this.a.h = true;
        }
        z4 = this.a.f;
        if (z4) {
            ActivityMenu activityMenu2 = this.a;
            i = activityMenu2.g;
            activityMenu2.g = i + 1;
            i2 = this.a.g;
            switch (i2) {
                case 1:
                    this.a.t();
                    break;
                case 2:
                    this.a.j();
                    break;
                case 3:
                    this.a.k();
                    break;
                case 4:
                    this.a.l();
                    break;
            }
        }
    }
}
