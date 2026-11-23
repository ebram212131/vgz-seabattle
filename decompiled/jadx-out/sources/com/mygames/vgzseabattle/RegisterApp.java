package com.mygames.vgzseabattle;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.Intent;
import android.os.Bundle;
import android.os.Handler;
import android.view.MotionEvent;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;

/* loaded from: classes.dex */
public class RegisterApp extends Activity implements View.OnTouchListener {
    private Handler a;
    private EditText b;
    private Button c;
    private String d = "";
    private boolean e = false;
    private String f = "";
    private String g = "";
    private int h = 1000;
    private int i = 1001;
    private String j = "";

    private void a() {
        this.a = new ab(this);
    }

    private void a(String str, String str2) {
        AlertDialog.Builder builder = new AlertDialog.Builder(this);
        builder.setTitle(str);
        builder.setMessage(str2);
        builder.setPositiveButton("Ok", new ad(this));
        builder.create().show();
    }

    private boolean a(String str) {
        if (str.length() == 0) {
            a("Login error!", "Please fill in Login text field");
            return false;
        }
        if (str.length() > 10) {
            a("Wrong Login length!", "Your Login must have at least 10 characters");
            return false;
        }
        for (int i = 0; i < str.length(); i++) {
            char charAt = str.charAt(i);
            if ((charAt < '0' || charAt > '9') && ((charAt < 'A' || charAt > 'Z') && (charAt < 'a' || charAt > 'z'))) {
                a("Wrong character!", "Your Login must have at least 10 characters and limited to A - Z, 0 - 9");
                return false;
            }
        }
        return true;
    }

    private void b() {
        String editable = this.b.getText().toString();
        if (a(editable)) {
            this.f = editable;
            this.d = new v().a();
            w wVar = new w();
            String a = wVar.a(this);
            String b = wVar.b(this);
            String a2 = wVar.a();
            aa aaVar = new aa();
            this.d = aaVar.a(this.d);
            this.d = this.d.substring(0, 10);
            new x().a("data0.txt", this.d);
            this.g = String.valueOf(this.d) + aaVar.b(aaVar.a(a, this.d)) + aaVar.b(aaVar.a(b, this.d)) + a2;
            new Thread(new ac(this)).start();
        }
    }

    private void b(String str) {
        String[] split = str.split("\\*");
        split[1] = new aa().a(0, split[0], split[1]);
        p.g = 0;
        startActivity(new Intent(split[1]));
    }

    private void c() {
        AlertDialog.Builder builder = new AlertDialog.Builder(this);
        builder.setTitle("Register help");
        builder.setMessage("There is 1 text field and 1 button on the register screen. Please type in the text field your login or nickname and click the Register button.\nPut your finger on the screen and move it either up and down to know where text field and button are placed.\nTap twice the text field to open a virtual keyboard, if it wasn't opened automatically.\nWhen you have successfully completed the registration process you will be moved to a game menu.");
        builder.setPositiveButton("Ok", new ae(this));
        builder.create().show();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void d() {
        String[] split = this.j.split("\\*");
        if (split[0].compareTo("1") == 0) {
            a("Registration error!", "Login expected");
            return;
        }
        if (split[0].compareTo("2") == 0) {
            a("Registration error!", "User ID expected");
            return;
        }
        if (split[0].compareTo("3") == 0) {
            a("Registration error!", "This login is already taken");
        } else {
            if (split[0].compareTo("1000") != 0) {
                a("Registration error!", "Unknown exception. Please try again");
                return;
            }
            this.j = this.j.replace("1000*", "");
            new x().a("data1.txt", this.j);
            e();
        }
    }

    private void e() {
        new Thread(new af(this)).start();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void f() {
        String[] split = this.j.split("\\*");
        if (split[0].compareTo("1") == 0) {
            a("Registration error!", "Wrong User ID");
        } else if (split[0].compareTo("1000") != 0) {
            a("Registration error!", "Unknown exception. Please try again");
        } else {
            this.j = this.j.replace("1000*", "");
            b(this.j);
        }
    }

    @Override // android.app.Activity
    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        setContentView(C0000R.layout.register_app);
        a();
        getWindow().addFlags(1024);
        this.b = (EditText) findViewById(C0000R.id.editTextLogin);
        this.c = (Button) findViewById(C0000R.id.buttonRegister);
        this.c.setOnTouchListener(this);
        this.e = false;
        c();
    }

    @Override // android.app.Activity
    public void onStart() {
        super.onStart();
        if (p.a == 1) {
            finish();
        } else if (p.g == 0 || p.g == 100) {
            p.g = 100;
        } else {
            p.a = 1;
            finish();
        }
    }

    @Override // android.app.Activity
    public void onStop() {
        if (p.a == 1 || p.g == 100) {
            p.a = 1;
            finish();
        }
        super.onStop();
    }

    @Override // android.view.View.OnTouchListener
    public boolean onTouch(View view, MotionEvent motionEvent) {
        if (view == this.c && motionEvent.getAction() == 0) {
            if (this.e) {
                return true;
            }
            b();
        }
        return false;
    }
}
