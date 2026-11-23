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

/* loaded from: classes.dex */
public class ActivityLearnSounds extends Activity implements View.OnTouchListener {
    private Button a;
    private Button b;
    private Button c;
    private Button d;
    private Button e;
    private Button f;
    private Button g;
    private Button h;
    private Button i;
    private Button j;
    private int k = 50;
    private int[] l;
    private int[] m;
    private SoundPool n;
    private RelativeLayout o;

    private void a() {
        this.l = new int[12];
        this.m = new int[12];
        for (int i = 0; i < 12; i++) {
            this.l[i] = 0;
            this.m[i] = 0;
        }
    }

    private void a(int i) {
        d();
        AudioManager audioManager = (AudioManager) getSystemService("audio");
        float streamVolume = audioManager.getStreamVolume(3) / audioManager.getStreamMaxVolume(3);
        this.m[i] = this.n.play(this.l[i], streamVolume, streamVolume, i + 1, 0, 1.0f);
    }

    private void b() {
        this.a = (Button) findViewById(C0000R.id.buttonLearnSoundGun);
        this.a.setOnTouchListener(this);
        this.b = (Button) findViewById(C0000R.id.buttonLearnSoundTargetHit);
        this.b.setOnTouchListener(this);
        this.c = (Button) findViewById(C0000R.id.buttonLearnSoundYouMissed);
        this.c.setOnTouchListener(this);
        this.d = (Button) findViewById(C0000R.id.buttonLearnSoundOpponentMissed);
        this.d.setOnTouchListener(this);
        this.e = (Button) findViewById(C0000R.id.buttonLearnSoundShipDestroyed);
        this.e.setOnTouchListener(this);
        this.f = (Button) findViewById(C0000R.id.buttonLearnSoundMenuOpenClose);
        this.f.setOnTouchListener(this);
        this.g = (Button) findViewById(C0000R.id.buttonLearnSoundYourShip);
        this.g.setOnTouchListener(this);
        this.h = (Button) findViewById(C0000R.id.buttonLearnSoundEmptyCell);
        this.h.setOnTouchListener(this);
        this.i = (Button) findViewById(C0000R.id.buttonLearnSoundTargetedCell);
        this.i.setOnTouchListener(this);
        this.j = (Button) findViewById(C0000R.id.buttonLearnSoundReturn);
        this.j.setOnTouchListener(this);
        RelativeLayout.LayoutParams layoutParams = (RelativeLayout.LayoutParams) this.a.getLayoutParams();
        layoutParams.height = this.k;
        this.a.setLayoutParams(layoutParams);
        RelativeLayout.LayoutParams layoutParams2 = (RelativeLayout.LayoutParams) this.b.getLayoutParams();
        layoutParams2.height = this.k;
        this.b.setLayoutParams(layoutParams2);
        RelativeLayout.LayoutParams layoutParams3 = (RelativeLayout.LayoutParams) this.c.getLayoutParams();
        layoutParams3.height = this.k;
        this.c.setLayoutParams(layoutParams3);
        RelativeLayout.LayoutParams layoutParams4 = (RelativeLayout.LayoutParams) this.d.getLayoutParams();
        layoutParams4.height = this.k;
        this.d.setLayoutParams(layoutParams4);
        RelativeLayout.LayoutParams layoutParams5 = (RelativeLayout.LayoutParams) this.e.getLayoutParams();
        layoutParams5.height = this.k;
        this.e.setLayoutParams(layoutParams5);
        RelativeLayout.LayoutParams layoutParams6 = (RelativeLayout.LayoutParams) this.f.getLayoutParams();
        layoutParams6.height = this.k;
        this.f.setLayoutParams(layoutParams6);
        RelativeLayout.LayoutParams layoutParams7 = (RelativeLayout.LayoutParams) this.g.getLayoutParams();
        layoutParams7.height = this.k;
        this.g.setLayoutParams(layoutParams7);
        RelativeLayout.LayoutParams layoutParams8 = (RelativeLayout.LayoutParams) this.h.getLayoutParams();
        layoutParams8.height = this.k;
        this.h.setLayoutParams(layoutParams8);
        RelativeLayout.LayoutParams layoutParams9 = (RelativeLayout.LayoutParams) this.i.getLayoutParams();
        layoutParams9.height = this.k;
        this.i.setLayoutParams(layoutParams9);
        RelativeLayout.LayoutParams layoutParams10 = (RelativeLayout.LayoutParams) this.j.getLayoutParams();
        layoutParams10.height = this.k;
        this.j.setLayoutParams(layoutParams10);
    }

    private void c() {
        setVolumeControlStream(3);
        this.n = new SoundPool(12, 3, 0);
        this.l[0] = this.n.load(this, C0000R.raw.sound_game_gun, 1);
        this.l[1] = this.n.load(this, C0000R.raw.sound_game_success, 2);
        this.l[2] = this.n.load(this, C0000R.raw.sound_game_lose2, 3);
        this.l[3] = this.n.load(this, C0000R.raw.sound_game_lose1, 4);
        this.l[4] = this.n.load(this, C0000R.raw.sound_game_destroy, 5);
        this.l[5] = this.n.load(this, C0000R.raw.sound_game_menu, 6);
        this.l[6] = this.n.load(this, C0000R.raw.sound_game_ship, 7);
        this.l[7] = this.n.load(this, C0000R.raw.sound_game_empty, 8);
        this.l[8] = this.n.load(this, C0000R.raw.sound_game_killed, 9);
    }

    private void d() {
        for (int i = 0; i < 9; i++) {
            this.n.stop(this.m[i]);
        }
    }

    private void e() {
        d();
        p.d = true;
        finish();
    }

    @Override // android.app.Activity
    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        setContentView(C0000R.layout.activity_learn_sounds);
        this.k = ((WindowManager) getSystemService("window")).getDefaultDisplay().getHeight();
        this.k /= 11;
        getWindow().addFlags(1024);
        this.o = (RelativeLayout) findViewById(C0000R.id.layout_learn_sounds);
        this.o.setOnTouchListener(this);
        a();
        c();
        b();
    }

    @Override // android.app.Activity
    protected void onDestroy() {
        super.onDestroy();
        d();
    }

    @Override // android.app.Activity
    public void onStop() {
        d();
        p.d = true;
        finish();
        super.onStop();
    }

    @Override // android.view.View.OnTouchListener
    public boolean onTouch(View view, MotionEvent motionEvent) {
        if (view == this.a && motionEvent.getAction() == 0) {
            a(0);
            return true;
        }
        if (view == this.b && motionEvent.getAction() == 0) {
            a(1);
            return true;
        }
        if (view == this.c && motionEvent.getAction() == 0) {
            a(2);
            return true;
        }
        if (view == this.d && motionEvent.getAction() == 0) {
            a(3);
            return true;
        }
        if (view == this.e && motionEvent.getAction() == 0) {
            a(4);
            return true;
        }
        if (view == this.f && motionEvent.getAction() == 0) {
            a(5);
            return true;
        }
        if (view == this.g && motionEvent.getAction() == 0) {
            a(6);
            return true;
        }
        if (view == this.h && motionEvent.getAction() == 0) {
            a(7);
            return true;
        }
        if (view == this.i && motionEvent.getAction() == 0) {
            a(8);
            return true;
        }
        if (view != this.j || motionEvent.getAction() != 0) {
            return false;
        }
        e();
        return true;
    }
}
