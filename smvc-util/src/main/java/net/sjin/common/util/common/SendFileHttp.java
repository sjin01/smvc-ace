package net.sjin.common.util.common;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.mime.MultipartEntity;
import org.apache.http.entity.mime.content.FileBody;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.util.EntityUtils;

import java.io.File;
import java.io.IOException;

public class SendFileHttp {
    public static String send(String serverUrl, String localUrl)
            throws ClientProtocolException, IOException {
        HttpClient httpclient = new DefaultHttpClient();

        HttpPost httppost = new HttpPost(serverUrl);

        FileBody file = new FileBody(new File(localUrl));

        MultipartEntity reqEntity = new MultipartEntity();

        reqEntity.addPart("file", file);

        httppost.setEntity(reqEntity);

        HttpResponse response = httpclient.execute(httppost);

        if (200 == response.getStatusLine().getStatusCode()) {
            HttpEntity entity = response.getEntity();

            if (entity != null) {
                String ss = EntityUtils.toString(entity);
                System.out.println(ss);
                return ss;
            }
            return "ok";
        }
        return null;
    }

    public static void main(String[] args) {
        String surl = "http://192.168.2.211:8888/upload4ck";
        String lurl = "D:\\htmltoword\\img\\wordpic\\PIC14007372516251.zip";
        try {
            String ss = send(surl, lurl);
            System.out.println(ss);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
