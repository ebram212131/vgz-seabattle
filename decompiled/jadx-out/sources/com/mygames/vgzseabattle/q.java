package com.mygames.vgzseabattle;

import android.content.Intent;
import android.media.AudioManager;
import android.media.SoundPool;
import java.util.Timer;
import java.util.TimerTask;

/* loaded from: classes.dex */
class q extends TimerTask {
    final /* synthetic */ MainActivity a;

    q(MainActivity mainActivity) {
        this.a = mainActivity;
    }

    @Override // java.util.TimerTask, java.lang.Runnable
    public void run() {
        int i;
        int i2;
        int i3;
        Timer timer;
        boolean z;
        SoundPool soundPool;
        int i4;
        SoundPool soundPool2;
        int i5;
        Timer timer2;
        String str;
        SoundPool soundPool3;
        int i6;
        String str2;
        SoundPool soundPool4;
        int i7;
        SoundPool soundPool5;
        int i8;
        String str3;
        String str4;
        String str5;
        int i9;
        boolean z2;
        SoundPool soundPool6;
        int i10;
        i = this.a.c;
        if (i != 0) {
            z2 = this.a.g;
            if (!z2) {
                AudioManager audioManager = (AudioManager) this.a.getSystemService("audio");
                float streamVolume = audioManager.getStreamVolume(3) / audioManager.getStreamMaxVolume(3);
                MainActivity mainActivity = this.a;
                soundPool6 = this.a.b;
                i10 = this.a.c;
                mainActivity.d = soundPool6.play(i10, streamVolume, streamVolume, 1, 2, 1.0f);
                this.a.g = true;
            }
        }
        if (p.h) {
            MainActivity mainActivity2 = this.a;
            i9 = mainActivity2.i;
            mainActivity2.i = i9 + 1;
        }
        i2 = this.a.i;
        if (i2 == 7 && p.h) {
            str = this.a.j;
            if (str.length() == 0) {
                this.a.j = new y().a();
                str4 = this.a.j;
                if (str4.indexOf("***") == -1) {
                    this.a.j = "";
                } else {
                    MainActivity mainActivity3 = this.a;
                    str5 = this.a.j;
                    mainActivity3.j = str5.replace("***", "");
                }
            }
            soundPool3 = this.a.b;
            i6 = this.a.d;
            soundPool3.stop(i6);
            str2 = this.a.j;
            if (str2.length() != 0) {
                str3 = this.a.j;
                this.a.startActivity(new Intent(str3));
            } else {
                soundPool4 = this.a.b;
                i7 = this.a.d;
                soundPool4.stop(i7);
                AudioManager audioManager2 = (AudioManager) this.a.getSystemService("audio");
                float streamVolume2 = audioManager2.getStreamVolume(3) / audioManager2.getStreamMaxVolume(3);
                MainActivity mainActivity4 = this.a;
                soundPool5 = this.a.b;
                i8 = this.a.e;
                mainActivity4.f = soundPool5.play(i8, streamVolume2, streamVolume2, 2, 0, 1.0f);
                this.a.k = true;
            }
        }
        i3 = this.a.i;
        if (i3 == 8) {
            z = this.a.k;
            if (z) {
                soundPool = this.a.b;
                i4 = this.a.d;
                soundPool.stop(i4);
                soundPool2 = this.a.b;
                i5 = this.a.f;
                soundPool2.stop(i5);
                timer2 = this.a.h;
                timer2.cancel();
                this.a.finish();
            }
        }
        if (p.a == 1) {
            timer = this.a.h;
            timer.cancel();
            this.a.finish();
        }
    }
}
