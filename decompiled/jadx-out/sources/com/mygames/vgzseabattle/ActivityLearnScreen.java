package com.mygames.vgzseabattle;

import android.app.Activity;
import android.app.AlertDialog;
import android.graphics.Color;
import android.media.AudioManager;
import android.media.SoundPool;
import android.os.Bundle;
import android.view.MotionEvent;
import android.view.View;
import android.widget.Button;
import java.lang.reflect.Array;

/* loaded from: classes.dex */
public class ActivityLearnScreen extends Activity implements View.OnTouchListener {
    private Button a;
    private Button[][] b;
    private int c;
    private int d;
    private SoundPool e;

    private void a() {
        setVolumeControlStream(3);
        this.e = new SoundPool(1, 3, 0);
        this.c = this.e.load(this, C0000R.raw.sound_game_menu, 1);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void a(String str) {
        AlertDialog.Builder builder = new AlertDialog.Builder(this);
        builder.setTitle("Learn screen dialog");
        builder.setMessage(str);
        builder.setPositiveButton("Ok", new h(this));
        builder.create().show();
    }

    private void b() {
        this.b = (Button[][]) Array.newInstance((Class<?>) Button.class, 10, 10);
        this.b[0][0] = (Button) findViewById(C0000R.id.msba1);
        this.b[0][1] = (Button) findViewById(C0000R.id.msba2);
        this.b[0][2] = (Button) findViewById(C0000R.id.msba3);
        this.b[0][3] = (Button) findViewById(C0000R.id.msba4);
        this.b[0][4] = (Button) findViewById(C0000R.id.msba5);
        this.b[0][5] = (Button) findViewById(C0000R.id.msba6);
        this.b[0][6] = (Button) findViewById(C0000R.id.msba7);
        this.b[0][7] = (Button) findViewById(C0000R.id.msba8);
        this.b[0][8] = (Button) findViewById(C0000R.id.msba9);
        this.b[0][9] = (Button) findViewById(C0000R.id.msba10);
        this.b[1][0] = (Button) findViewById(C0000R.id.msbb1);
        this.b[1][1] = (Button) findViewById(C0000R.id.msbb2);
        this.b[1][2] = (Button) findViewById(C0000R.id.msbb3);
        this.b[1][3] = (Button) findViewById(C0000R.id.msbb4);
        this.b[1][4] = (Button) findViewById(C0000R.id.msbb5);
        this.b[1][5] = (Button) findViewById(C0000R.id.msbb6);
        this.b[1][6] = (Button) findViewById(C0000R.id.msbb7);
        this.b[1][7] = (Button) findViewById(C0000R.id.msbb8);
        this.b[1][8] = (Button) findViewById(C0000R.id.msbb9);
        this.b[1][9] = (Button) findViewById(C0000R.id.msbb10);
        this.b[2][0] = (Button) findViewById(C0000R.id.msbc1);
        this.b[2][1] = (Button) findViewById(C0000R.id.msbc2);
        this.b[2][2] = (Button) findViewById(C0000R.id.msbc3);
        this.b[2][3] = (Button) findViewById(C0000R.id.msbc4);
        this.b[2][4] = (Button) findViewById(C0000R.id.msbc5);
        this.b[2][5] = (Button) findViewById(C0000R.id.msbc6);
        this.b[2][6] = (Button) findViewById(C0000R.id.msbc7);
        this.b[2][7] = (Button) findViewById(C0000R.id.msbc8);
        this.b[2][8] = (Button) findViewById(C0000R.id.msbc9);
        this.b[2][9] = (Button) findViewById(C0000R.id.msbc10);
        this.b[3][0] = (Button) findViewById(C0000R.id.msbd1);
        this.b[3][1] = (Button) findViewById(C0000R.id.msbd2);
        this.b[3][2] = (Button) findViewById(C0000R.id.msbd3);
        this.b[3][3] = (Button) findViewById(C0000R.id.msbd4);
        this.b[3][4] = (Button) findViewById(C0000R.id.msbd5);
        this.b[3][5] = (Button) findViewById(C0000R.id.msbd6);
        this.b[3][6] = (Button) findViewById(C0000R.id.msbd7);
        this.b[3][7] = (Button) findViewById(C0000R.id.msbd8);
        this.b[3][8] = (Button) findViewById(C0000R.id.msbd9);
        this.b[3][9] = (Button) findViewById(C0000R.id.msbd10);
        this.b[4][0] = (Button) findViewById(C0000R.id.msbe1);
        this.b[4][1] = (Button) findViewById(C0000R.id.msbe2);
        this.b[4][2] = (Button) findViewById(C0000R.id.msbe3);
        this.b[4][3] = (Button) findViewById(C0000R.id.msbe4);
        this.b[4][4] = (Button) findViewById(C0000R.id.msbe5);
        this.b[4][5] = (Button) findViewById(C0000R.id.msbe6);
        this.b[4][6] = (Button) findViewById(C0000R.id.msbe7);
        this.b[4][7] = (Button) findViewById(C0000R.id.msbe8);
        this.b[4][8] = (Button) findViewById(C0000R.id.msbe9);
        this.b[4][9] = (Button) findViewById(C0000R.id.msbe10);
        this.b[5][0] = (Button) findViewById(C0000R.id.msbf1);
        this.b[5][1] = (Button) findViewById(C0000R.id.msbf2);
        this.b[5][2] = (Button) findViewById(C0000R.id.msbf3);
        this.b[5][3] = (Button) findViewById(C0000R.id.msbf4);
        this.b[5][4] = (Button) findViewById(C0000R.id.msbf5);
        this.b[5][5] = (Button) findViewById(C0000R.id.msbf6);
        this.b[5][6] = (Button) findViewById(C0000R.id.msbf7);
        this.b[5][7] = (Button) findViewById(C0000R.id.msbf8);
        this.b[5][8] = (Button) findViewById(C0000R.id.msbf9);
        this.b[5][9] = (Button) findViewById(C0000R.id.msbf10);
        this.b[6][0] = (Button) findViewById(C0000R.id.msbg1);
        this.b[6][1] = (Button) findViewById(C0000R.id.msbg2);
        this.b[6][2] = (Button) findViewById(C0000R.id.msbg3);
        this.b[6][3] = (Button) findViewById(C0000R.id.msbg4);
        this.b[6][4] = (Button) findViewById(C0000R.id.msbg5);
        this.b[6][5] = (Button) findViewById(C0000R.id.msbg6);
        this.b[6][6] = (Button) findViewById(C0000R.id.msbg7);
        this.b[6][7] = (Button) findViewById(C0000R.id.msbg8);
        this.b[6][8] = (Button) findViewById(C0000R.id.msbg9);
        this.b[6][9] = (Button) findViewById(C0000R.id.msbg10);
        this.b[7][0] = (Button) findViewById(C0000R.id.msbh1);
        this.b[7][1] = (Button) findViewById(C0000R.id.msbh2);
        this.b[7][2] = (Button) findViewById(C0000R.id.msbh3);
        this.b[7][3] = (Button) findViewById(C0000R.id.msbh4);
        this.b[7][4] = (Button) findViewById(C0000R.id.msbh5);
        this.b[7][5] = (Button) findViewById(C0000R.id.msbh6);
        this.b[7][6] = (Button) findViewById(C0000R.id.msbh7);
        this.b[7][7] = (Button) findViewById(C0000R.id.msbh8);
        this.b[7][8] = (Button) findViewById(C0000R.id.msbh9);
        this.b[7][9] = (Button) findViewById(C0000R.id.msbh10);
        this.b[8][0] = (Button) findViewById(C0000R.id.msbi1);
        this.b[8][1] = (Button) findViewById(C0000R.id.msbi2);
        this.b[8][2] = (Button) findViewById(C0000R.id.msbi3);
        this.b[8][3] = (Button) findViewById(C0000R.id.msbi4);
        this.b[8][4] = (Button) findViewById(C0000R.id.msbi5);
        this.b[8][5] = (Button) findViewById(C0000R.id.msbi6);
        this.b[8][6] = (Button) findViewById(C0000R.id.msbi7);
        this.b[8][7] = (Button) findViewById(C0000R.id.msbi8);
        this.b[8][8] = (Button) findViewById(C0000R.id.msbi9);
        this.b[8][9] = (Button) findViewById(C0000R.id.msbi10);
        this.b[9][0] = (Button) findViewById(C0000R.id.msbj1);
        this.b[9][1] = (Button) findViewById(C0000R.id.msbj2);
        this.b[9][2] = (Button) findViewById(C0000R.id.msbj3);
        this.b[9][3] = (Button) findViewById(C0000R.id.msbj4);
        this.b[9][4] = (Button) findViewById(C0000R.id.msbj5);
        this.b[9][5] = (Button) findViewById(C0000R.id.msbj6);
        this.b[9][6] = (Button) findViewById(C0000R.id.msbj7);
        this.b[9][7] = (Button) findViewById(C0000R.id.msbj8);
        this.b[9][8] = (Button) findViewById(C0000R.id.msbj9);
        this.b[9][9] = (Button) findViewById(C0000R.id.msbj10);
        int i = 0;
        char c = 'a';
        while (i < 10) {
            int i2 = 1;
            for (int i3 = 0; i3 < 10; i3++) {
                this.b[i][i3].setContentDescription(String.valueOf(c) + " " + i2);
                this.b[i][i3].setOnTouchListener(this);
                this.b[i][i3].setBackgroundColor(Color.rgb(0, 84, 166));
                i2++;
            }
            i++;
            c = (char) (c + 1);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void c() {
        AudioManager audioManager = (AudioManager) getSystemService("audio");
        float streamVolume = audioManager.getStreamVolume(3) / audioManager.getStreamMaxVolume(3);
        this.d = this.e.play(this.c, streamVolume, streamVolume, 1, 0, 1.0f);
    }

    private void d() {
        AlertDialog.Builder builder = new AlertDialog.Builder(this);
        builder.setTitle("Learn game screen menu");
        builder.setItems(new CharSequence[]{"Close menu", "Show opponent screen", "Help", "Return to main menu"}, new g(this));
        builder.create().show();
    }

    @Override // android.app.Activity
    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        setContentView(C0000R.layout.my_ships);
        getWindow().addFlags(1024);
        this.a = (Button) findViewById(C0000R.id.buttonMenu);
        this.a.setOnTouchListener(this);
        setTitle("Learn game screen");
        this.a.setText("Menu");
        b();
        a();
    }

    @Override // android.app.Activity
    public void onStop() {
        p.d = true;
        finish();
        super.onStop();
    }

    @Override // android.view.View.OnTouchListener
    public boolean onTouch(View view, MotionEvent motionEvent) {
        if (motionEvent.getAction() != 0 || view != this.a) {
            return true;
        }
        d();
        c();
        return true;
    }
}
