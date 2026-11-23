package com.mygames.vgzseabattle;

import android.annotation.TargetApi;
import android.os.Environment;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;

/* loaded from: classes.dex */
public class x {
    private String a;

    public x() {
        this.a = "";
        if (d()) {
            this.a = Environment.getExternalStorageDirectory().getPath();
        }
    }

    private boolean b() {
        if (!d()) {
            return false;
        }
        try {
            File file = new File(String.valueOf(this.a) + "/vipgameszone");
            if (file.exists()) {
                return file.isDirectory();
            }
            return false;
        } catch (Exception e) {
            return false;
        }
    }

    @TargetApi(9)
    private boolean c() {
        if (!d()) {
            return false;
        }
        try {
            File file = new File(String.valueOf(this.a) + "/vipgameszone");
            file.mkdir();
            file.setReadable(true, false);
            file.setWritable(true, false);
            return true;
        } catch (Exception e) {
            return false;
        }
    }

    private boolean d() {
        return Environment.getExternalStorageState().equals("mounted");
    }

    public String a(String str) {
        String str2 = "";
        if (!d() || !b()) {
            return "";
        }
        try {
            FileInputStream fileInputStream = new FileInputStream(new File(String.valueOf(p.f) + "/" + str));
            BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(fileInputStream));
            while (true) {
                String readLine = bufferedReader.readLine();
                if (readLine == null) {
                    bufferedReader.close();
                    fileInputStream.close();
                    return str2;
                }
                str2 = String.valueOf(str2) + readLine;
            }
        } catch (Exception e) {
            return "";
        }
    }

    @TargetApi(9)
    public boolean a(String str, String str2) {
        if (!d()) {
            return false;
        }
        if (!b()) {
            c();
            if (!b()) {
                return false;
            }
        }
        try {
            File file = new File(String.valueOf(p.f) + "/" + str);
            file.createNewFile();
            file.setReadable(true, true);
            file.setWritable(true, true);
            FileOutputStream fileOutputStream = new FileOutputStream(file);
            OutputStreamWriter outputStreamWriter = new OutputStreamWriter(fileOutputStream);
            outputStreamWriter.append((CharSequence) str2);
            outputStreamWriter.close();
            fileOutputStream.close();
            return true;
        } catch (Exception e) {
            return false;
        }
    }

    @TargetApi(9)
    public boolean a(String[] strArr) {
        boolean z = false;
        boolean z2 = false;
        for (int i = 0; i < strArr.length; i++) {
            if (strArr[i].length() > 0) {
                z2 = true;
            }
            if (i > 9) {
                break;
            }
        }
        if (!z2) {
            return false;
        }
        String property = System.getProperty("line.separator");
        try {
            File file = new File(String.valueOf(p.f) + "/sbs.txt");
            file.createNewFile();
            file.setReadable(true, true);
            file.setWritable(true, true);
            FileOutputStream fileOutputStream = new FileOutputStream(file);
            OutputStreamWriter outputStreamWriter = new OutputStreamWriter(fileOutputStream);
            for (int i2 = 0; i2 < strArr.length; i2++) {
                outputStreamWriter.append((CharSequence) (String.valueOf(strArr[i2]) + property));
                if (strArr[i2].length() == 0 || i2 > 9) {
                    break;
                }
            }
            outputStreamWriter.close();
            fileOutputStream.close();
            z = true;
            return true;
        } catch (Exception e) {
            return z;
        }
    }

    public String[] a() {
        int i = 0;
        String[] strArr = new String[10];
        for (int i2 = 0; i2 < strArr.length; i2++) {
            strArr[i2] = "";
        }
        try {
            FileInputStream fileInputStream = new FileInputStream(new File(String.valueOf(p.f) + "/sbs.txt"));
            BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(fileInputStream));
            while (true) {
                String readLine = bufferedReader.readLine();
                if (readLine == null) {
                    bufferedReader.close();
                    fileInputStream.close();
                    return strArr;
                }
                strArr[i] = readLine;
                i++;
            }
        } catch (Exception e) {
            return strArr;
        }
    }

    public String b(String str) {
        String str2 = "";
        try {
            File file = new File(String.valueOf(p.f) + "/" + str);
            if (!file.exists()) {
                return "";
            }
            FileInputStream fileInputStream = new FileInputStream(file);
            BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(fileInputStream));
            while (true) {
                String readLine = bufferedReader.readLine();
                if (readLine == null) {
                    bufferedReader.close();
                    fileInputStream.close();
                    return str2;
                }
                str2 = String.valueOf(str2) + readLine;
            }
        } catch (Exception e) {
            return "";
        }
    }
}
