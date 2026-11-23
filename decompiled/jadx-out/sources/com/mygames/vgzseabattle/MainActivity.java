package com.mygames.vgzseabattle;

import android.app.Activity;
import android.app.AlertDialog;
import android.media.SoundPool;
import android.os.Bundle;
import android.os.Handler;
import android.os.Process;
import android.view.Menu;
import android.view.MotionEvent;
import android.view.View;
import android.widget.ImageView;
import android.widget.RelativeLayout;
import java.util.Timer;

/* loaded from: classes.dex */
public class MainActivity extends Activity implements View.OnTouchListener {
    private Handler a;
    private SoundPool b;
    private Timer h;
    private ImageView l;
    private RelativeLayout m;
    private int c = 0;
    private int d = 0;
    private int e = 0;
    private int f = 0;
    private boolean g = false;
    private int i = 0;
    private String j = "";
    private boolean k = false;
    private Activity n = this;
    private int o = 1000;
    private int p = 1001;
    private String q = "";

    private void a() {
        this.a = new r(this);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void a(String str, String str2) {
        String[] split = str.split("\\*");
        this.j = String.valueOf(this.q) + str2;
        if (new aa().c(split[0]).contentEquals(str2)) {
            new Thread(new t(this)).start();
        } else {
            this.j = "";
        }
    }

    private void b() {
        new Thread(new s(this)).start();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public String c() {
        this.q = new x().a("data0.txt");
        w wVar = new w();
        String a = wVar.a(this);
        String b = wVar.b(this);
        String a2 = wVar.a();
        aa aaVar = new aa();
        return String.valueOf(aaVar.b(aaVar.a(a, this.q))) + aaVar.b(aaVar.a(b, this.q)) + a2;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void d() {
        AlertDialog.Builder builder = new AlertDialog.Builder(this);
        builder.setTitle("Error Internet connection");
        builder.setMessage("Please check your Internet connection and then try to run the game again.");
        builder.setPositiveButton("Ok", new u(this));
        builder.create().show();
    }

    @Override // android.app.Activity
    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        setContentView(C0000R.layout.activity_main);
        a();
        b();
        try {
            new v().a(this);
        } catch (Exception e) {
        }
        getWindow().addFlags(1024);
        p.a = 0;
        this.l = (ImageView) findViewById(C0000R.id.mainPictureView);
        this.l.setOnTouchListener(this);
        this.m = (RelativeLayout) findViewById(C0000R.id.layout_main_activity);
        this.m.setOnTouchListener(this);
        this.h = new Timer();
        this.h.schedule(new q(this), 1000L, 1000L);
        setVolumeControlStream(3);
        this.b = new SoundPool(2, 3, 0);
        this.c = this.b.load(this, C0000R.raw.sound_game_intro, 1);
        this.e = this.b.load(this, C0000R.raw.sound_start_internet_error, 2);
    }

    @Override // android.app.Activity
    public boolean onCreateOptionsMenu(Menu menu) {
        getMenuInflater().inflate(C0000R.menu.activity_main, menu);
        return true;
    }

    @Override // android.app.Activity
    protected void onDestroy() {
        super.onDestroy();
        Process.killProcess(Process.myPid());
    }

    @Override // android.view.View.OnTouchListener
    public boolean onTouch(View view, MotionEvent motionEvent) {
        return false;
    }
}
