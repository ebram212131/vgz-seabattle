package com.mygames.vgzseabattle;

import android.app.Activity;
import android.app.AlertDialog;
import android.graphics.Color;
import android.media.AudioManager;
import android.media.SoundPool;
import android.os.Bundle;
import android.os.Handler;
import android.view.MotionEvent;
import android.view.View;
import android.widget.Button;
import java.lang.reflect.Array;
import java.util.Random;

/* loaded from: classes.dex */
public class ActivityGameScreen extends Activity implements View.OnTouchListener {
    private String[][] B;
    private SoundPool a;
    private int[] b;
    private int[] c;
    private Handler d;
    private Button[][] l;
    private Button m;
    private int[][] n;
    private int[][] o;
    private Random p;
    private int q;
    private boolean r;
    private boolean s;
    private boolean t;
    private boolean x;
    private l z;
    private int e = 1000;
    private int f = 1001;
    private int g = 1002;
    private int h = 2000;
    private int i = 2001;
    private int j = 2002;
    private int k = 3000;
    private int u = 0;
    private int v = 0;
    private int w = 0;
    private boolean y = false;
    private boolean A = false;

    /* JADX INFO: Access modifiers changed from: private */
    public void A() {
        z();
        if (this.w < 0) {
            this.w = 0;
        }
        p.b = this.w;
        if (p.e != null) {
            p.e.c();
        }
        this.A = true;
        this.z.a(true);
        this.d.sendEmptyMessageDelayed(this.k, 1000L);
    }

    private void a() {
        this.b = new int[13];
        this.c = new int[13];
        for (int i = 0; i < 13; i++) {
            this.b[i] = 0;
            this.c[i] = 0;
        }
    }

    private void a(int i) {
        for (int i2 = 0; i2 < 10; i2++) {
            for (int i3 = 0; i3 < 10; i3++) {
                switch (i) {
                    case 1:
                        switch (this.n[i2][i3]) {
                            case 0:
                                this.l[i2][i3].setContentDescription(this.B[i2][i3]);
                                break;
                            case 1:
                                this.l[i2][i3].setContentDescription(String.valueOf(this.B[i2][i3]) + " ship");
                                break;
                            case 3:
                                this.l[i2][i3].setContentDescription(String.valueOf(this.B[i2][i3]) + " destroyed");
                                break;
                            case 4:
                                this.l[i2][i3].setContentDescription(String.valueOf(this.B[i2][i3]) + " empty");
                                break;
                        }
                    case 2:
                        switch (this.o[i2][i3]) {
                            case 0:
                                this.l[i2][i3].setContentDescription(this.B[i2][i3]);
                                break;
                            case 1:
                                this.l[i2][i3].setContentDescription(this.B[i2][i3]);
                                break;
                            case 3:
                                this.l[i2][i3].setContentDescription(String.valueOf(this.B[i2][i3]) + " destroyed");
                                break;
                            case 4:
                                this.l[i2][i3].setContentDescription(String.valueOf(this.B[i2][i3]) + " empty");
                                break;
                        }
                }
            }
        }
    }

    private void a(int i, int i2) {
        switch (this.n[i][i2]) {
            case 0:
                f(4);
                break;
            case 1:
                f(1);
                break;
            case 3:
                f(3);
                break;
            case 4:
                f(4);
                break;
        }
    }

    private void a(int i, int i2, MotionEvent motionEvent) {
        if (motionEvent.getAction() == 0) {
            if (this.q == 0) {
                a(i, i2);
            } else {
                b(i, i2);
            }
        }
    }

    private void a(MotionEvent motionEvent) {
        if (motionEvent.getAction() == 0) {
            if (this.q == 0) {
                o();
                j();
            } else {
                o();
                l();
            }
        }
    }

    private void a(boolean z) {
        for (int i = 0; i < 10; i++) {
            for (int i2 = 0; i2 < 10; i2++) {
                switch (this.o[i][i2]) {
                    case 0:
                        this.l[i][i2].setBackgroundColor(Color.rgb(0, 84, 166));
                        break;
                    case 1:
                        this.l[i][i2].setBackgroundColor(Color.rgb(0, 84, 166));
                        break;
                    case 3:
                        this.l[i][i2].setBackgroundColor(-65536);
                        break;
                    case 4:
                        this.l[i][i2].setBackgroundColor(-7829368);
                        break;
                }
            }
        }
        a(2);
        if (z) {
            f(10);
        }
    }

    private boolean a(int[][] iArr, int i, int i2, int i3) {
        int i4 = i2 + i3;
        while (i2 < 10 && i2 < i4) {
            if (iArr[i][i2] != 0) {
                return false;
            }
            if (i > 0 && i2 > 0 && iArr[i - 1][i2 - 1] != 0) {
                return false;
            }
            if (i2 > 0 && iArr[i][i2 - 1] != 0) {
                return false;
            }
            if (i < 9 && i2 > 0 && iArr[i + 1][i2 - 1] != 0) {
                return false;
            }
            if (i > 0 && iArr[i - 1][i2] != 0) {
                return false;
            }
            if (i > 0 && i2 < 9 && iArr[i - 1][i2 + 1] != 0) {
                return false;
            }
            if (i2 < 9 && iArr[i][i2 + 1] != 0) {
                return false;
            }
            if (i < 9 && iArr[i + 1][i2] != 0) {
                return false;
            }
            if (i < 9 && i2 < 9 && iArr[i + 1][i2 + 1] != 0) {
                return false;
            }
            i2++;
        }
        return true;
    }

    private int[][] a(int[][] iArr, int i) {
        for (int i2 = 0; i2 < 100; i2++) {
            int nextInt = this.p.nextInt(10 - i);
            int nextInt2 = this.p.nextInt(10 - i);
            if (this.p.nextInt(2) == 0) {
                if (a(iArr, nextInt, nextInt2, i)) {
                    return b(iArr, nextInt, nextInt2, i);
                }
            } else if (c(iArr, nextInt, nextInt2, i)) {
                return d(iArr, nextInt, nextInt2, i);
            }
        }
        return iArr;
    }

    private void b() {
        setVolumeControlStream(3);
        this.a = new SoundPool(13, 3, 0);
        this.b[0] = this.a.load(this, C0000R.raw.sound_game_bgrn, 1);
        this.b[1] = this.a.load(this, C0000R.raw.sound_game_menu, 2);
        this.b[2] = this.a.load(this, C0000R.raw.sound_game_ship, 3);
        this.b[3] = this.a.load(this, C0000R.raw.sound_game_empty, 4);
        this.b[4] = this.a.load(this, C0000R.raw.sound_game_gun, 5);
        this.b[5] = this.a.load(this, C0000R.raw.sound_game_lose1, 6);
        this.b[6] = this.a.load(this, C0000R.raw.sound_game_lose2, 7);
        this.b[7] = this.a.load(this, C0000R.raw.sound_game_success, 8);
        this.b[8] = this.a.load(this, C0000R.raw.sound_game_destroy, 9);
        this.b[9] = this.a.load(this, C0000R.raw.sound_game_killed, 10);
        this.b[10] = this.a.load(this, C0000R.raw.sound_game_you_shoot, 11);
        this.b[11] = this.a.load(this, C0000R.raw.sound_game_opponent_shoots, 12);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void b(int i) {
        this.q = i;
        this.u = 0;
        this.v = 0;
        switch (i) {
            case 0:
                setTitle("My screen");
                this.m.setText("My screen menu");
                this.m.setContentDescription("My screen menu");
                h();
                break;
            case 1:
                setTitle("Opponent screen");
                this.m.setText("Opponent screen menu");
                this.m.setContentDescription("Opponent screen menu");
                a(true);
                break;
        }
    }

    private void b(int i, int i2) {
        switch (this.o[i][i2]) {
            case 3:
                f(3);
                break;
            case 4:
                f(4);
                break;
            default:
                this.u = i;
                this.v = i2;
                c(1);
                break;
        }
    }

    private int[][] b(int[][] iArr, int i, int i2, int i3) {
        int i4 = i2 + i3;
        while (i2 < 10 && i2 < i4) {
            iArr[i][i2] = 1;
            i2++;
        }
        return iArr;
    }

    private void c() {
        this.d = new a(this);
    }

    private void c(int i) {
        if (this.A) {
            return;
        }
        AudioManager audioManager = (AudioManager) getSystemService("audio");
        float streamVolume = audioManager.getStreamVolume(3) / audioManager.getStreamMaxVolume(3);
        if (i == 0) {
            streamVolume = (float) (streamVolume * 0.7d);
        }
        this.c[4] = this.a.play(this.b[4], streamVolume, streamVolume, 5, 0, 1.0f);
        this.r = true;
        if (i == 0) {
            this.d.sendEmptyMessageDelayed(this.h, 1000L);
        } else {
            this.d.sendEmptyMessageDelayed(this.e, 1000L);
        }
    }

    private void c(int i, int i2) {
        if (i2 > 0 && this.o[i][i2 - 1] == 0) {
            this.o[i][i2 - 1] = 4;
        }
        if (i > 0 && i2 > 0 && this.o[i - 1][i2 - 1] == 0) {
            this.o[i - 1][i2 - 1] = 4;
        }
        if (i > 0 && this.o[i - 1][i2] == 0) {
            this.o[i - 1][i2] = 4;
        }
        if (i > 0 && i2 < 9 && this.o[i - 1][i2 + 1] == 0) {
            this.o[i - 1][i2 + 1] = 4;
        }
        if (i2 < 9 && this.o[i][i2 + 1] == 0) {
            this.o[i][i2 + 1] = 4;
        }
        if (i < 9 && i2 < 9 && this.o[i + 1][i2 + 1] == 0) {
            this.o[i + 1][i2 + 1] = 4;
        }
        if (i < 9 && this.o[i + 1][i2] == 0) {
            this.o[i + 1][i2] = 4;
        }
        if (i >= 9 || i2 <= 0 || this.o[i + 1][i2 - 1] != 0) {
            return;
        }
        this.o[i + 1][i2 - 1] = 4;
    }

    private boolean c(int[][] iArr, int i, int i2, int i3) {
        int i4 = i + i3;
        while (i < 10 && i < i4) {
            if (iArr[i][i2] != 0) {
                return false;
            }
            if (i > 0 && i2 > 0 && iArr[i - 1][i2 - 1] != 0) {
                return false;
            }
            if (i2 > 0 && iArr[i][i2 - 1] != 0) {
                return false;
            }
            if (i < 9 && i2 > 0 && iArr[i + 1][i2 - 1] != 0) {
                return false;
            }
            if (i > 0 && iArr[i - 1][i2] != 0) {
                return false;
            }
            if (i > 0 && i2 < 9 && iArr[i - 1][i2 + 1] != 0) {
                return false;
            }
            if (i2 < 9 && iArr[i][i2 + 1] != 0) {
                return false;
            }
            if (i < 9 && iArr[i + 1][i2] != 0) {
                return false;
            }
            if (i < 9 && i2 < 9 && iArr[i + 1][i2 + 1] != 0) {
                return false;
            }
            i++;
        }
        return true;
    }

    private void d() {
        this.l = (Button[][]) Array.newInstance((Class<?>) Button.class, 10, 10);
        this.B = (String[][]) Array.newInstance((Class<?>) String.class, 10, 10);
        this.l[0][0] = (Button) findViewById(C0000R.id.msba1);
        this.l[0][1] = (Button) findViewById(C0000R.id.msba2);
        this.l[0][2] = (Button) findViewById(C0000R.id.msba3);
        this.l[0][3] = (Button) findViewById(C0000R.id.msba4);
        this.l[0][4] = (Button) findViewById(C0000R.id.msba5);
        this.l[0][5] = (Button) findViewById(C0000R.id.msba6);
        this.l[0][6] = (Button) findViewById(C0000R.id.msba7);
        this.l[0][7] = (Button) findViewById(C0000R.id.msba8);
        this.l[0][8] = (Button) findViewById(C0000R.id.msba9);
        this.l[0][9] = (Button) findViewById(C0000R.id.msba10);
        this.l[1][0] = (Button) findViewById(C0000R.id.msbb1);
        this.l[1][1] = (Button) findViewById(C0000R.id.msbb2);
        this.l[1][2] = (Button) findViewById(C0000R.id.msbb3);
        this.l[1][3] = (Button) findViewById(C0000R.id.msbb4);
        this.l[1][4] = (Button) findViewById(C0000R.id.msbb5);
        this.l[1][5] = (Button) findViewById(C0000R.id.msbb6);
        this.l[1][6] = (Button) findViewById(C0000R.id.msbb7);
        this.l[1][7] = (Button) findViewById(C0000R.id.msbb8);
        this.l[1][8] = (Button) findViewById(C0000R.id.msbb9);
        this.l[1][9] = (Button) findViewById(C0000R.id.msbb10);
        this.l[2][0] = (Button) findViewById(C0000R.id.msbc1);
        this.l[2][1] = (Button) findViewById(C0000R.id.msbc2);
        this.l[2][2] = (Button) findViewById(C0000R.id.msbc3);
        this.l[2][3] = (Button) findViewById(C0000R.id.msbc4);
        this.l[2][4] = (Button) findViewById(C0000R.id.msbc5);
        this.l[2][5] = (Button) findViewById(C0000R.id.msbc6);
        this.l[2][6] = (Button) findViewById(C0000R.id.msbc7);
        this.l[2][7] = (Button) findViewById(C0000R.id.msbc8);
        this.l[2][8] = (Button) findViewById(C0000R.id.msbc9);
        this.l[2][9] = (Button) findViewById(C0000R.id.msbc10);
        this.l[3][0] = (Button) findViewById(C0000R.id.msbd1);
        this.l[3][1] = (Button) findViewById(C0000R.id.msbd2);
        this.l[3][2] = (Button) findViewById(C0000R.id.msbd3);
        this.l[3][3] = (Button) findViewById(C0000R.id.msbd4);
        this.l[3][4] = (Button) findViewById(C0000R.id.msbd5);
        this.l[3][5] = (Button) findViewById(C0000R.id.msbd6);
        this.l[3][6] = (Button) findViewById(C0000R.id.msbd7);
        this.l[3][7] = (Button) findViewById(C0000R.id.msbd8);
        this.l[3][8] = (Button) findViewById(C0000R.id.msbd9);
        this.l[3][9] = (Button) findViewById(C0000R.id.msbd10);
        this.l[4][0] = (Button) findViewById(C0000R.id.msbe1);
        this.l[4][1] = (Button) findViewById(C0000R.id.msbe2);
        this.l[4][2] = (Button) findViewById(C0000R.id.msbe3);
        this.l[4][3] = (Button) findViewById(C0000R.id.msbe4);
        this.l[4][4] = (Button) findViewById(C0000R.id.msbe5);
        this.l[4][5] = (Button) findViewById(C0000R.id.msbe6);
        this.l[4][6] = (Button) findViewById(C0000R.id.msbe7);
        this.l[4][7] = (Button) findViewById(C0000R.id.msbe8);
        this.l[4][8] = (Button) findViewById(C0000R.id.msbe9);
        this.l[4][9] = (Button) findViewById(C0000R.id.msbe10);
        this.l[5][0] = (Button) findViewById(C0000R.id.msbf1);
        this.l[5][1] = (Button) findViewById(C0000R.id.msbf2);
        this.l[5][2] = (Button) findViewById(C0000R.id.msbf3);
        this.l[5][3] = (Button) findViewById(C0000R.id.msbf4);
        this.l[5][4] = (Button) findViewById(C0000R.id.msbf5);
        this.l[5][5] = (Button) findViewById(C0000R.id.msbf6);
        this.l[5][6] = (Button) findViewById(C0000R.id.msbf7);
        this.l[5][7] = (Button) findViewById(C0000R.id.msbf8);
        this.l[5][8] = (Button) findViewById(C0000R.id.msbf9);
        this.l[5][9] = (Button) findViewById(C0000R.id.msbf10);
        this.l[6][0] = (Button) findViewById(C0000R.id.msbg1);
        this.l[6][1] = (Button) findViewById(C0000R.id.msbg2);
        this.l[6][2] = (Button) findViewById(C0000R.id.msbg3);
        this.l[6][3] = (Button) findViewById(C0000R.id.msbg4);
        this.l[6][4] = (Button) findViewById(C0000R.id.msbg5);
        this.l[6][5] = (Button) findViewById(C0000R.id.msbg6);
        this.l[6][6] = (Button) findViewById(C0000R.id.msbg7);
        this.l[6][7] = (Button) findViewById(C0000R.id.msbg8);
        this.l[6][8] = (Button) findViewById(C0000R.id.msbg9);
        this.l[6][9] = (Button) findViewById(C0000R.id.msbg10);
        this.l[7][0] = (Button) findViewById(C0000R.id.msbh1);
        this.l[7][1] = (Button) findViewById(C0000R.id.msbh2);
        this.l[7][2] = (Button) findViewById(C0000R.id.msbh3);
        this.l[7][3] = (Button) findViewById(C0000R.id.msbh4);
        this.l[7][4] = (Button) findViewById(C0000R.id.msbh5);
        this.l[7][5] = (Button) findViewById(C0000R.id.msbh6);
        this.l[7][6] = (Button) findViewById(C0000R.id.msbh7);
        this.l[7][7] = (Button) findViewById(C0000R.id.msbh8);
        this.l[7][8] = (Button) findViewById(C0000R.id.msbh9);
        this.l[7][9] = (Button) findViewById(C0000R.id.msbh10);
        this.l[8][0] = (Button) findViewById(C0000R.id.msbi1);
        this.l[8][1] = (Button) findViewById(C0000R.id.msbi2);
        this.l[8][2] = (Button) findViewById(C0000R.id.msbi3);
        this.l[8][3] = (Button) findViewById(C0000R.id.msbi4);
        this.l[8][4] = (Button) findViewById(C0000R.id.msbi5);
        this.l[8][5] = (Button) findViewById(C0000R.id.msbi6);
        this.l[8][6] = (Button) findViewById(C0000R.id.msbi7);
        this.l[8][7] = (Button) findViewById(C0000R.id.msbi8);
        this.l[8][8] = (Button) findViewById(C0000R.id.msbi9);
        this.l[8][9] = (Button) findViewById(C0000R.id.msbi10);
        this.l[9][0] = (Button) findViewById(C0000R.id.msbj1);
        this.l[9][1] = (Button) findViewById(C0000R.id.msbj2);
        this.l[9][2] = (Button) findViewById(C0000R.id.msbj3);
        this.l[9][3] = (Button) findViewById(C0000R.id.msbj4);
        this.l[9][4] = (Button) findViewById(C0000R.id.msbj5);
        this.l[9][5] = (Button) findViewById(C0000R.id.msbj6);
        this.l[9][6] = (Button) findViewById(C0000R.id.msbj7);
        this.l[9][7] = (Button) findViewById(C0000R.id.msbj8);
        this.l[9][8] = (Button) findViewById(C0000R.id.msbj9);
        this.l[9][9] = (Button) findViewById(C0000R.id.msbj10);
        int i = 0;
        char c = 'a';
        while (i < 10) {
            int i2 = 1;
            for (int i3 = 0; i3 < 10; i3++) {
                String str = String.valueOf(c) + " " + i2;
                this.l[i][i3].setContentDescription(str);
                this.B[i][i3] = str;
                this.l[i][i3].setOnTouchListener(this);
                i2++;
            }
            i++;
            c = (char) (c + 1);
        }
    }

    private void d(int i) {
        if (this.A) {
            return;
        }
        AudioManager audioManager = (AudioManager) getSystemService("audio");
        float streamVolume = audioManager.getStreamVolume(3) / audioManager.getStreamMaxVolume(3);
        if (i == 1) {
            streamVolume = (float) (streamVolume * 0.7d);
        }
        this.c[5] = this.a.play(this.b[5], streamVolume, streamVolume, 6, 0, 1.0f);
        this.s = true;
        if (i == 0) {
            this.d.sendEmptyMessageDelayed(this.i, 100L);
        } else {
            this.d.sendEmptyMessageDelayed(this.f, 100L);
        }
    }

    private void d(int i, int i2) {
        if (i2 > 0 && this.n[i][i2 - 1] == 0) {
            this.n[i][i2 - 1] = 4;
        }
        if (i > 0 && i2 > 0 && this.n[i - 1][i2 - 1] == 0) {
            this.n[i - 1][i2 - 1] = 4;
        }
        if (i > 0 && this.n[i - 1][i2] == 0) {
            this.n[i - 1][i2] = 4;
        }
        if (i > 0 && i2 < 9 && this.n[i - 1][i2 + 1] == 0) {
            this.n[i - 1][i2 + 1] = 4;
        }
        if (i2 < 9 && this.n[i][i2 + 1] == 0) {
            this.n[i][i2 + 1] = 4;
        }
        if (i < 9 && i2 < 9 && this.n[i + 1][i2 + 1] == 0) {
            this.n[i + 1][i2 + 1] = 4;
        }
        if (i < 9 && this.n[i + 1][i2] == 0) {
            this.n[i + 1][i2] = 4;
        }
        if (i >= 9 || i2 <= 0 || this.n[i + 1][i2 - 1] != 0) {
            return;
        }
        this.n[i + 1][i2 - 1] = 4;
    }

    private int[][] d(int[][] iArr, int i, int i2, int i3) {
        int i4 = i + i3;
        while (i < 10 && i < i4) {
            iArr[i][i2] = 1;
            i++;
        }
        return iArr;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void e() {
        f();
        h();
        g();
        setTitle("My screen");
        this.m.setText("My screen menu");
        n();
        this.r = false;
        this.s = false;
        this.t = false;
        this.w = 0;
    }

    private void e(int i) {
        float f;
        float f2 = 0.0f;
        if (this.A) {
            return;
        }
        AudioManager audioManager = (AudioManager) getSystemService("audio");
        float streamVolume = audioManager.getStreamVolume(3) / audioManager.getStreamMaxVolume(3);
        if (i == 1) {
            streamVolume = (float) (streamVolume * 0.7d);
        }
        if (this.p.nextInt(2) == 0) {
            f = streamVolume;
        } else {
            f = 0.0f;
            f2 = streamVolume;
        }
        this.t = true;
        if (i == 0) {
            this.c[5] = this.a.play(this.b[5], f, f2, 6, 0, 1.0f);
            this.d.sendEmptyMessageDelayed(this.j, 3000L);
        } else {
            this.c[6] = this.a.play(this.b[6], f, f2, 7, 0, 1.0f);
            this.d.sendEmptyMessageDelayed(this.g, 3000L);
        }
    }

    private void f() {
        for (int i = 0; i < 10; i++) {
            for (int i2 = 0; i2 < 10; i2++) {
                this.n[i][i2] = 0;
            }
        }
        this.n = a(this.n, 4);
        this.n = a(this.n, 3);
        this.n = a(this.n, 3);
        this.n = a(this.n, 2);
        this.n = a(this.n, 2);
        this.n = a(this.n, 2);
        this.n = a(this.n, 1);
        this.n = a(this.n, 1);
        this.n = a(this.n, 1);
        this.n = a(this.n, 1);
    }

    private void f(int i) {
        if (this.A) {
        }
        AudioManager audioManager = (AudioManager) getSystemService("audio");
        float streamVolume = audioManager.getStreamVolume(3) / audioManager.getStreamMaxVolume(3);
        switch (i) {
            case 1:
                this.c[2] = this.a.play(this.b[2], streamVolume, streamVolume, 3, 0, 1.0f);
                break;
            case 3:
                this.c[9] = this.a.play(this.b[9], streamVolume, streamVolume, 10, 0, 1.0f);
                break;
            case 4:
                this.c[3] = this.a.play(this.b[3], streamVolume, streamVolume, 4, 0, 1.0f);
                break;
            case 5:
                this.c[8] = this.a.play(this.b[8], streamVolume, streamVolume, 9, 0, 1.0f);
                break;
            case 10:
                this.c[10] = this.a.play(this.b[10], streamVolume, streamVolume, 11, 0, 1.0f);
                break;
            case 11:
                this.c[11] = this.a.play(this.b[11], streamVolume, streamVolume, 12, 0, 1.0f);
                break;
        }
    }

    private void g() {
        for (int i = 0; i < 10; i++) {
            for (int i2 = 0; i2 < 10; i2++) {
                this.o[i][i2] = 0;
            }
        }
        this.o = a(this.o, 4);
        this.o = a(this.o, 3);
        this.o = a(this.o, 3);
        this.o = a(this.o, 2);
        this.o = a(this.o, 2);
        this.o = a(this.o, 2);
        this.o = a(this.o, 1);
        this.o = a(this.o, 1);
        this.o = a(this.o, 1);
        this.o = a(this.o, 1);
    }

    private void h() {
        for (int i = 0; i < 10; i++) {
            for (int i2 = 0; i2 < 10; i2++) {
                switch (this.n[i][i2]) {
                    case 0:
                        this.l[i][i2].setBackgroundColor(Color.rgb(0, 84, 166));
                        break;
                    case 1:
                        this.l[i][i2].setBackgroundColor(Color.rgb(255, 245, 104));
                        break;
                    case 3:
                        this.l[i][i2].setBackgroundColor(-65536);
                        break;
                    case 4:
                        this.l[i][i2].setBackgroundColor(-7829368);
                        break;
                }
            }
        }
        a(1);
        if (this.x) {
            f(11);
            u();
        }
    }

    private void i() {
        AlertDialog.Builder builder = new AlertDialog.Builder(this);
        builder.setTitle("Choose the screen");
        builder.setItems(new CharSequence[]{"Show my screen", "Show opponent screen"}, new b(this));
        builder.create().show();
        o();
    }

    private void j() {
        AlertDialog.Builder builder = new AlertDialog.Builder(this);
        builder.setTitle("My screen menu");
        builder.setItems(new CharSequence[]{"Close menu", "Show opponent screen", "Help", "Stop game"}, new c(this));
        builder.create().show();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void k() {
        AlertDialog.Builder builder = new AlertDialog.Builder(this);
        builder.setTitle("Game help");
        builder.setMessage("There is a menu button at the top of the screen. Below the menu button is your ship's field which consists of 10 rows. There are 10 buttons in each row. \nPut your finger on the screen and move it either up and down, to the left and to the right to know where the buttons are placed.Tap the button to know is this button empty or one of your ships is placed there.\nTap the menu button to get the game menu. Use the item Show opponent screen to get the opponet's ships screen. Yo can shoot the opponet's ships on opponent screen only.Your ships screen will show automatically when your opponent will shoot your ships.");
        builder.setPositiveButton("Ok", new d(this));
        builder.create().show();
    }

    private void l() {
        AlertDialog.Builder builder = new AlertDialog.Builder(this);
        builder.setTitle("Opponent screen menu");
        builder.setItems(new CharSequence[]{"Close menu", "Show my screen", "Help", "Stop game"}, new e(this));
        builder.create().show();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void m() {
        AlertDialog.Builder builder = new AlertDialog.Builder(this);
        builder.setTitle("Game help");
        builder.setMessage("There is a menu button at the top of the screen. Below the menu button is opponent's ship's field which consists of 10 rows. There are 10 buttons in each row. \nPut your finger on the screen and move it either up and down, to the left and to the right to know where the buttons are placed.\nOpponent's ships are placed secretly. Tap the button to shoot the opponent's ships. You will hear the target hit sound if you will succeed, otherwise you will hear lose sound. \nTap the menu button to get the game menu. Use the item Show my screen to get the your ships screen. Your ships screen will show automatically when your opponent will shoot your ships.");
        builder.setPositiveButton("Ok", new f(this));
        builder.create().show();
    }

    private void n() {
        if (this.A || this.b[0] == 0 || this.c[0] != 0) {
            return;
        }
        AudioManager audioManager = (AudioManager) getSystemService("audio");
        float streamVolume = audioManager.getStreamVolume(3) / audioManager.getStreamMaxVolume(3);
        this.c[0] = this.a.play(this.b[0], streamVolume, streamVolume, 1, 10000, 1.0f);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void o() {
        AudioManager audioManager = (AudioManager) getSystemService("audio");
        float streamVolume = audioManager.getStreamVolume(3) / audioManager.getStreamMaxVolume(3);
        this.c[1] = this.a.play(this.b[1], streamVolume, streamVolume, 2, 0, 1.0f);
    }

    private void p() {
        if (this.o[this.u][this.v] == 3) {
            d(1);
        } else {
            e(1);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void q() {
        if (this.o[this.u][this.v] == 1) {
            this.o[this.u][this.v] = 3;
            this.w += 20;
            r();
            a(true);
        } else {
            this.o[this.u][this.v] = 4;
            a(false);
        }
        p();
    }

    private void r() {
        for (int i = this.u; i < 10; i++) {
            if (this.o[i][this.v] == 1) {
                return;
            }
            if (this.o[i][this.v] == 0 || this.o[i][this.v] == 4) {
                break;
            }
        }
        for (int i2 = this.u; i2 > 0; i2--) {
            if (this.o[i2][this.v] == 1) {
                return;
            }
            if (this.o[i2][this.v] == 0 || this.o[i2][this.v] == 4) {
                break;
            }
        }
        for (int i3 = this.v; i3 < 10; i3++) {
            if (this.o[this.u][i3] == 1) {
                return;
            }
            if (this.o[this.u][i3] == 0 || this.o[this.u][i3] == 4) {
                break;
            }
        }
        for (int i4 = this.v; i4 > 0; i4--) {
            if (this.o[this.u][i4] == 1) {
                return;
            }
            if (this.o[this.u][i4] == 0 || this.o[this.u][i4] == 4) {
                break;
            }
        }
        s();
        this.w += 100;
        if (t()) {
            return;
        }
        A();
    }

    private void s() {
        c(this.u, this.v);
        for (int i = this.u; i < 10 && this.o[i][this.v] != 0 && this.o[i][this.v] != 4; i++) {
            c(i, this.v);
        }
        for (int i2 = this.u; i2 > 0 && this.o[i2][this.v] != 0 && this.o[i2][this.v] != 4; i2--) {
            c(i2, this.v);
        }
        for (int i3 = this.v; i3 < 10 && this.o[this.u][i3] != 0 && this.o[this.u][i3] != 4; i3++) {
            c(this.u, i3);
        }
        for (int i4 = this.v; i4 > 0 && this.o[this.u][i4] != 0 && this.o[this.u][i4] != 4; i4--) {
            c(this.u, i4);
        }
        f(5);
    }

    private boolean t() {
        for (int i = 0; i < 10; i++) {
            for (int i2 = 0; i2 < 10; i2++) {
                if (this.o[i][i2] == 1) {
                    return true;
                }
            }
        }
        return false;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void u() {
        if (this.x) {
            if (this.y && this.n[this.u][this.v] == 3) {
                this.y = false;
                if (this.u > 0 && this.n[this.u - 1][this.v] == 1) {
                    this.u--;
                    c(0);
                    return;
                }
                if (this.u < 9 && this.n[this.u + 1][this.v] == 1) {
                    this.u++;
                    c(0);
                    return;
                } else if (this.v > 0 && this.n[this.u][this.v - 1] == 1) {
                    this.v--;
                    c(0);
                    return;
                } else if (this.v < 9 && this.n[this.u][this.v + 1] == 1) {
                    this.v++;
                    c(0);
                    return;
                }
            } else {
                this.y = true;
            }
            for (int i = 0; i < 100; i++) {
                this.u = this.p.nextInt(10);
                this.v = this.p.nextInt(10);
                if (this.n[this.u][this.v] == 0 || this.n[this.u][this.v] == 1) {
                    c(0);
                    return;
                }
            }
            for (int i2 = 0; i2 < 10; i2++) {
                for (int i3 = 0; i3 < 10; i3++) {
                    if (this.n[i2][i3] == 0 || this.n[this.u][this.v] == 1) {
                        this.u = i2;
                        this.v = i3;
                        c(0);
                        return;
                    }
                }
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void v() {
        this.x = false;
        if (this.n[this.u][this.v] != 1) {
            this.n[this.u][this.v] = 4;
            h();
            e(0);
        } else {
            this.n[this.u][this.v] = 3;
            this.w -= 10;
            w();
            h();
            d(0);
        }
    }

    private void w() {
        for (int i = this.u; i < 10; i++) {
            if (this.n[i][this.v] == 1) {
                return;
            }
            if (this.n[i][this.v] == 0 || this.n[i][this.v] == 4) {
                break;
            }
        }
        for (int i2 = this.u; i2 > 0; i2--) {
            if (this.n[i2][this.v] == 1) {
                return;
            }
            if (this.n[i2][this.v] == 0 || this.n[i2][this.v] == 4) {
                break;
            }
        }
        for (int i3 = this.v; i3 < 10; i3++) {
            if (this.n[this.u][i3] == 1) {
                return;
            }
            if (this.n[this.u][i3] == 0 || this.n[this.u][i3] == 4) {
                break;
            }
        }
        for (int i4 = this.v; i4 > 0; i4--) {
            if (this.n[this.u][i4] == 1) {
                return;
            }
            if (this.n[this.u][i4] == 0 || this.n[this.u][i4] == 4) {
                break;
            }
        }
        x();
        this.w -= 50;
        if (y()) {
            return;
        }
        A();
    }

    private void x() {
        d(this.u, this.v);
        for (int i = this.u; i < 10 && this.n[i][this.v] != 0 && this.n[i][this.v] != 4; i++) {
            d(i, this.v);
        }
        for (int i2 = this.u; i2 > 0 && this.n[i2][this.v] != 0 && this.n[i2][this.v] != 4; i2--) {
            d(i2, this.v);
        }
        for (int i3 = this.v; i3 < 10 && this.n[this.u][i3] != 0 && this.n[this.u][i3] != 4; i3++) {
            d(this.u, i3);
        }
        for (int i4 = this.v; i4 > 0 && this.n[this.u][i4] != 0 && this.n[this.u][i4] != 4; i4--) {
            d(this.u, i4);
        }
        f(5);
    }

    private boolean y() {
        for (int i = 0; i < 10; i++) {
            for (int i2 = 0; i2 < 10; i2++) {
                if (this.n[i][i2] == 1) {
                    return true;
                }
            }
        }
        this.w = 0;
        return false;
    }

    private void z() {
        for (int i = 0; i < 12; i++) {
            this.a.stop(this.c[i]);
        }
    }

    @Override // android.app.Activity
    public void onCreate(Bundle bundle) {
        this.A = false;
        super.onCreate(bundle);
        setContentView(C0000R.layout.my_ships);
        this.z = new l(this);
        getWindow().addFlags(1024);
        this.n = (int[][]) Array.newInstance((Class<?>) Integer.TYPE, 10, 10);
        this.o = (int[][]) Array.newInstance((Class<?>) Integer.TYPE, 10, 10);
        d();
        this.p = new Random();
        this.m = (Button) findViewById(C0000R.id.buttonMenu);
        this.m.setOnTouchListener(this);
        a();
        b();
        this.r = false;
        this.s = false;
        this.t = false;
        this.x = false;
        c();
        i();
        e();
        b(0);
    }

    @Override // android.view.View.OnTouchListener
    public boolean onTouch(View view, MotionEvent motionEvent) {
        if (!this.r && !this.s && !this.t && !this.A) {
            if (view != this.m) {
                int i = 0;
                loop0: while (true) {
                    if (i >= 10) {
                        break;
                    }
                    for (int i2 = 0; i2 < 10; i2++) {
                        if (view == this.l[i][i2]) {
                            a(i, i2, motionEvent);
                            break loop0;
                        }
                    }
                    i++;
                }
            } else {
                a(motionEvent);
            }
        }
        return false;
    }
}
