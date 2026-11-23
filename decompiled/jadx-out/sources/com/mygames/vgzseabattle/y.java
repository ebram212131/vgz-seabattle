package com.mygames.vgzseabattle;

import java.io.IOException;
import java.util.ArrayList;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;

/* loaded from: classes.dex */
public class y {
    public String a() {
        DefaultHttpClient defaultHttpClient = new DefaultHttpClient();
        HttpPost httpPost = new HttpPost("http://android.vipgameszone.com/sea_battle/unregistered.php");
        try {
            ArrayList arrayList = new ArrayList(1);
            arrayList.add(new BasicNameValuePair("Unregistered", "1"));
            httpPost.setEntity(new UrlEncodedFormEntity(arrayList));
            return EntityUtils.toString(defaultHttpClient.execute(httpPost).getEntity());
        } catch (ClientProtocolException e) {
            return "";
        } catch (IOException e2) {
            return "";
        }
    }

    public String a(String str) {
        DefaultHttpClient defaultHttpClient = new DefaultHttpClient();
        HttpPost httpPost = new HttpPost("http://android.vipgameszone.com/sea_battle/get_next_page.php");
        try {
            ArrayList arrayList = new ArrayList(1);
            arrayList.add(new BasicNameValuePair("UID", str));
            httpPost.setEntity(new UrlEncodedFormEntity(arrayList));
            return EntityUtils.toString(defaultHttpClient.execute(httpPost).getEntity());
        } catch (ClientProtocolException e) {
            return "";
        } catch (IOException e2) {
            return "";
        }
    }

    public String a(String str, String str2) {
        DefaultHttpClient defaultHttpClient = new DefaultHttpClient();
        HttpPost httpPost = new HttpPost("http://android.vipgameszone.com/sea_battle/top1.php");
        try {
            ArrayList arrayList = new ArrayList(2);
            arrayList.add(new BasicNameValuePair("ID", str));
            arrayList.add(new BasicNameValuePair("Score", str2));
            httpPost.setEntity(new UrlEncodedFormEntity(arrayList));
            return EntityUtils.toString(defaultHttpClient.execute(httpPost).getEntity());
        } catch (ClientProtocolException e) {
            return "";
        } catch (IOException e2) {
            return "";
        }
    }

    public String b(String str, String str2) {
        DefaultHttpClient defaultHttpClient = new DefaultHttpClient();
        HttpPost httpPost = new HttpPost("http://android.vipgameszone.com/sea_battle/register.php");
        try {
            ArrayList arrayList = new ArrayList(2);
            arrayList.add(new BasicNameValuePair("UID", str));
            arrayList.add(new BasicNameValuePair("login", str2));
            httpPost.setEntity(new UrlEncodedFormEntity(arrayList));
            return EntityUtils.toString(defaultHttpClient.execute(httpPost).getEntity());
        } catch (ClientProtocolException e) {
            return "";
        } catch (IOException e2) {
            return "";
        }
    }
}
