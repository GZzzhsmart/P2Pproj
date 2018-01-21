package top.zzh.common;

import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.URL;

/**
 * Created by 7025 on 2018/1/15.
 */
public class HttpUtils {

    public static String sendPost(String url, String params) {
        try {
            URL realUrl = new URL(url);
            HttpURLConnection conn = (HttpURLConnection) realUrl.openConnection();
            conn.setDoInput(true);
            conn.setDoOutput(true);
            conn.setRequestMethod("POST");
            conn.setRequestProperty("Accept-Charset", "utf-8");
            conn.setRequestProperty("contentType", "utf-8");
            OutputStreamWriter out = new OutputStreamWriter(conn.getOutputStream(), "utf-8");
          //  PrintWriter printWriter = new PrintWriter(conn.getOutputStream());
            out.write(params);
            out.flush();
            InputStream inputStream = conn.getInputStream();
            byte[] bytes = new byte[1024];
            int len = -1;
            ByteArrayOutputStream baos = new ByteArrayOutputStream();
            while ((len = inputStream.read(bytes)) > 0) {
                baos.write(bytes, 0, len);
            }
            String jsonStr = baos.toString("utf-8");
            System.out.println(jsonStr);
            return jsonStr;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
}
