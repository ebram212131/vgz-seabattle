package com.mygames.vgzseabattle;

import android.app.Activity;
import android.media.AudioManager;
import android.media.SoundPool;
import android.os.Bundle;
import android.view.MotionEvent;
import android.view.View;
import android.view.WindowManager;
import android.widget.Button;
import android.widget.RelativeLayout;
import java.util.Timer;

/* loaded from: classes.dex */
public class ActivityMenu extends Activity implements View.OnTouchListener {
    private SoundPool a;
    private int[] b;
    private int[] c;
    private Timer d;
    private RelativeLayout e;
    private Button i;
    private Button j;
    private Button k;
    private Button l;
    private Button m;
    private Button n;
    private Button o;
    private Button p;
    private l r;
    private boolean f = false;
    private int g = 0;
    private boolean h = false;
    private int q = 50;
    private boolean s = false;
    private boolean t = false;
    private int u = 0;
    private String v = "";
    private int w = 1;

    private void a() {
        this.i = (Button) findViewById(C0000R.id.buttonStartGame);
        this.i.setOnTouchListener(this);
        this.j = (Button) findViewById(C0000R.id.buttonTestHeadSets);
        this.j.setOnTouchListener(this);
        this.k = (Button) findViewById(C0000R.id.buttonLearnGameSounds);
        this.k.setOnTouchListener(this);
        this.l = (Button) findViewById(C0000R.id.buttonLearnGameScreen);
        this.l.setOnTouchListener(this);
        this.m = (Button) findViewById(C0000R.id.buttonFinalScore);
        this.m.setOnTouchListener(this);
        this.n = (Button) findViewById(C0000R.id.buttonSendScore);
        this.n.setOnTouchListener(this);
        this.o = (Button) findViewById(C0000R.id.buttonTop10Score);
        this.o.setOnTouchListener(this);
        this.p = (Button) findViewById(C0000R.id.buttonQuitGame);
        this.p.setOnTouchListener(this);
        RelativeLayout.LayoutParams layoutParams = (RelativeLayout.LayoutParams) this.i.getLayoutParams();
        layoutParams.height = this.q;
        this.i.setLayoutParams(layoutParams);
        RelativeLayout.LayoutParams layoutParams2 = (RelativeLayout.LayoutParams) this.j.getLayoutParams();
        layoutParams2.height = this.q;
        this.j.setLayoutParams(layoutParams2);
        RelativeLayout.LayoutParams layoutParams3 = (RelativeLayout.LayoutParams) this.k.getLayoutParams();
        layoutParams3.height = this.q;
        this.k.setLayoutParams(layoutParams3);
        RelativeLayout.LayoutParams layoutParams4 = (RelativeLayout.LayoutParams) this.l.getLayoutParams();
        layoutParams4.height = this.q;
        this.l.setLayoutParams(layoutParams4);
        RelativeLayout.LayoutParams layoutParams5 = (RelativeLayout.LayoutParams) this.m.getLayoutParams();
        layoutParams5.height = this.q;
        this.m.setLayoutParams(layoutParams5);
        RelativeLayout.LayoutParams layoutParams6 = (RelativeLayout.LayoutParams) this.n.getLayoutParams();
        layoutParams6.height = this.q;
        this.n.setLayoutParams(layoutParams6);
        RelativeLayout.LayoutParams layoutParams7 = (RelativeLayout.LayoutParams) this.o.getLayoutParams();
        layoutParams7.height = this.q;
        this.o.setLayoutParams(layoutParams7);
        RelativeLayout.LayoutParams layoutParams8 = (RelativeLayout.LayoutParams) this.p.getLayoutParams();
        layoutParams8.height = this.q;
        this.p.setLayoutParams(layoutParams8);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void a(int i) {
        q();
        AudioManager audioManager = (AudioManager) getSystemService("audio");
        float streamVolume = audioManager.getStreamVolume(3) / audioManager.getStreamMaxVolume(3);
        this.c[i] = this.a.play(this.b[i], streamVolume, streamVolume, i + 1, 0, 1.0f);
    }

    private void a(MotionEvent motionEvent) {
        switch (motionEvent.getAction()) {
            case 0:
                b();
                break;
            case 1:
                b();
                break;
            case 2:
                b();
                break;
            case 3:
                b();
                break;
        }
    }

    private void b() {
        this.a.stop(this.c[1]);
        AudioManager audioManager = (AudioManager) getSystemService("audio");
        float streamVolume = audioManager.getStreamVolume(3) / audioManager.getStreamMaxVolume(3);
        this.c[1] = this.a.play(this.b[1], streamVolume, streamVolume, 2, 0, 1.0f);
    }

    private void b(int i) {
        this.w = i;
        u();
        new Thread(new k(this)).start();
    }

    private void c() {
        this.a.stop(this.c[4]);
        AudioManager audioManager = (AudioManager) getSystemService("audio");
        float streamVolume = audioManager.getStreamVolume(3) / audioManager.getStreamMaxVolume(3);
        this.c[4] = this.a.play(this.b[4], streamVolume, streamVolume, 5, 0, 1.0f);
    }

    private void d() {
        this.b = new int[13];
        this.c = new int[13];
        for (int i = 0; i < 13; i++) {
            this.b[i] = 0;
            this.c[i] = 0;
        }
    }

    private void e() {
        this.d = new Timer();
        this.d.schedule(new i(this), 2000L, 1000L);
    }

    private void f() {
        setVolumeControlStream(3);
        this.a = new SoundPool(10, 3, 0);
        this.b[0] = this.a.load(this, C0000R.raw.sound_menu_bgrn, 1);
        this.b[1] = this.a.load(this, C0000R.raw.sound_menu_aut_zone, 2);
        this.b[2] = this.a.load(this, C0000R.raw.sound_test_left, 3);
        this.b[3] = this.a.load(this, C0000R.raw.sound_test_right, 4);
        this.b[4] = this.a.load(this, C0000R.raw.sound_menu_press_button, 5);
        this.b[5] = this.a.load(this, C0000R.raw.sound_game_sending_score, 6);
        this.b[6] = this.a.load(this, C0000R.raw.sound_game_score_sent1, 7);
        this.b[7] = this.a.load(this, C0000R.raw.sound_game_score_sent2, 8);
        this.b[8] = this.a.load(this, C0000R.raw.sound_game_send_score_error, 9);
    }

    private void g() {
        for (int i = 0; i < 9; i++) {
            this.a.stop(this.c[i]);
        }
    }

    private void h() {
        t();
        c();
        p.g = 2;
        b(1);
    }

    private void i() {
        c();
        this.f = true;
        this.g = 0;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void j() {
        AudioManager audioManager = (AudioManager) getSystemService("audio");
        this.c[2] = this.a.play(this.b[2], audioManager.getStreamVolume(3) / audioManager.getStreamMaxVolume(3), 0.0f, 3, 0, 1.0f);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void k() {
        AudioManager audioManager = (AudioManager) getSystemService("audio");
        this.c[3] = this.a.play(this.b[3], 0.0f, audioManager.getStreamVolume(3) / audioManager.getStreamMaxVolume(3), 4, 0, 1.0f);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void l() {
        this.f = false;
        if (this.c[0] != 0) {
            return;
        }
        AudioManager audioManager = (AudioManager) getSystemService("audio");
        float streamVolume = audioManager.getStreamVolume(3) / audioManager.getStreamMaxVolume(3);
        this.c[0] = this.a.play(this.b[0], streamVolume, streamVolume, 1, 10000, 1.0f);
    }

    private void m() {
        t();
        c();
        p.g = 2;
        b(2);
    }

    private void n() {
        t();
        c();
        p.g = 2;
        b(3);
    }

    private void o() {
        t();
        c();
        this.r.a(false);
        this.s = true;
    }

    private void p() {
        t();
        c();
        if (p.b == 0) {
            o();
        } else {
            new Thread(new j(this)).start();
        }
    }

    private void q() {
        for (int i = 5; i < 9; i++) {
            this.a.stop(this.c[i]);
        }
    }

    private void r() {
        t();
        c();
        p.g = 2;
        b(4);
    }

    private void s() {
        t();
        c();
        p.a = 1;
        finish();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void t() {
        this.a.stop(this.c[0]);
        this.c[0] = 0;
    }

    private void u() {
        String a = new x().a("data0.txt");
        w wVar = new w();
        String a2 = wVar.a(this);
        String b = wVar.b(this);
        String a3 = wVar.a();
        aa aaVar = new aa();
        this.v = String.valueOf(a) + aaVar.b(aaVar.a(a2, a)) + aaVar.b(aaVar.a(b, a)) + a3;
    }

    @Override // android.app.Activity
    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        this.q = ((WindowManager) getSystemService("window")).getDefaultDisplay().getHeight();
        this.q /= 9;
        getWindow().addFlags(1024);
        setContentView(C0000R.layout.activity_menu);
        this.e = (RelativeLayout) findViewById(C0000R.id.layout_main_menu);
        this.e.setOnTouchListener(this);
        d();
        f();
        a();
        e();
        this.r = new l(this);
        if (p.e == null) {
            p.e = new z();
            p.e.a();
        }
        try {
            new v().a(this);
        } catch (Exception e) {
        }
        this.t = false;
        this.u = 0;
    }

    @Override // android.app.Activity
    protected void onDestroy() {
        super.onDestroy();
        g();
        this.d.cancel();
    }

    @Override // android.app.Activity
    public void onPause() {
        t();
        super.onPause();
    }

    @Override // android.app.Activity
    public void onResume() {
        super.onResume();
        if (this.c[0] == 0) {
            this.h = false;
        }
    }

    @Override // android.app.Activity
    public void onStart() {
        super.onStart();
        p.g = 1;
    }

    @Override // android.app.Activity
    public void onStop() {
        if (p.a == 0 && p.g == 1) {
            p.a = 1;
            g();
            finish();
        }
        t();
        super.onStop();
    }

    @Override // android.view.View.OnTouchListener
    public boolean onTouch(View view, MotionEvent motionEvent) {
        if (!this.f) {
            if (view == this.e) {
                a(motionEvent);
            }
            if (view == this.i && motionEvent.getAction() == 0) {
                h();
            } else if (view == this.j && motionEvent.getAction() == 0) {
                i();
            } else if (view == this.k && motionEvent.getAction() == 0) {
                m();
            } else if (view == this.l && motionEvent.getAction() == 0) {
                n();
            } else if (view == this.m && motionEvent.getAction() == 0) {
                o();
            } else if (view == this.n && motionEvent.getAction() == 0) {
                p();
            } else if (view == this.o && motionEvent.getAction() == 0) {
                r();
            } else if (view == this.p && motionEvent.getAction() == 0) {
                s();
            }
        }
        return true;
    }
}
