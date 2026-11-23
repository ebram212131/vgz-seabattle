package com.mygames.vgzseabattle;

/* loaded from: classes.dex */
public class aa {
    private int a(int i, String str) {
        return str.charAt(i) - '0';
    }

    private int b(int i, String str) {
        return (str.charAt(i) % '\t') + 1;
    }

    public String a(int i, String str, String str2) {
        String str3 = "";
        int b = b(a(i, str) + 10, str);
        for (int i2 = 0; i2 < str2.length(); i2++) {
            int charAt = str2.charAt(i2);
            if (charAt > 96 && (charAt = charAt - b) < 97) {
                charAt += 26;
            }
            str3 = String.valueOf(str3) + ((char) charAt);
        }
        return str3;
    }

    public String a(String str) {
        int length;
        if (str.length() < 2 || str.length() - 1 < 1) {
            return str;
        }
        String str2 = "";
        for (length = str.length() - 1; length > -1; length--) {
            str2 = String.valueOf(str2) + str.charAt(length);
        }
        return str2;
    }

    public String a(String str, String str2) {
        String str3 = "";
        int i = 0;
        for (int i2 = 0; i2 < str.length(); i2++) {
            if (str.charAt(i2) == '0') {
                str3 = String.valueOf(str3) + str2.charAt(i);
                i++;
                if (i >= str2.length()) {
                    i = 0;
                }
            } else {
                str3 = String.valueOf(str3) + str.charAt(i2);
            }
        }
        return str3;
    }

    public String b(String str) {
        String str2 = "";
        for (int i = 0; i < str.length(); i++) {
            str2 = (str.charAt(i) < '0' || str.charAt(i) > '9') ? String.valueOf(str2) + ((int) str.charAt(i)) : String.valueOf(str2) + str.charAt(i);
        }
        return str2;
    }

    public String c(String str) {
        String substring = str.substring(0, 10);
        String substring2 = str.substring(10);
        String str2 = "";
        int i = 0;
        for (int i2 = 0; i2 < substring2.length(); i2++) {
            int charAt = (substring.charAt(i) - '0') + (substring2.charAt(i2) - '0');
            if (charAt > 9) {
                charAt -= 10;
            }
            str2 = String.valueOf(str2) + charAt;
            i++;
            if (i > 9) {
                i = 0;
            }
        }
        return str2;
    }
}
