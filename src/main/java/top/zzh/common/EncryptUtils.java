package top.zzh.common;

import sun.misc.BASE64Encoder;

import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

/**
 * 密码加密类
 */

public class EncryptUtils {

    public static final String UTF8 = "utf-8";

    public static final String MD5 = "md5";
    public static final String SHA1 = "sha1";
    public static final String SHA128 = "sha128";
    public static final String SHA512 = "sha512";

    public static String md5(String src) {
        try {
            MessageDigest md = MessageDigest.getInstance(MD5);
            byte[] des = md.digest(src.getBytes(UTF8));
            BASE64Encoder encoder = new BASE64Encoder();
            return encoder.encode(des);
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        return null;
    }

}
