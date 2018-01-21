package top.zzh.message;

import java.security.MessageDigest;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * 发送验证码工具类
 * @author Administrator
 * May 21, 2017
 */
public class QueryUtil {
	
	public static String queryArguments(String ACCOUNT_SID,String AUTH_TOKEN,String smsContent,String to){
		/**
		 * 时间戳
		 */
		String timestamp = getTimestamp();
		/**
		 * 签名验证
		 */
		String sig = MD5(ACCOUNT_SID,AUTH_TOKEN,timestamp);
		
		String str = "accountSid="+ACCOUNT_SID+"&smsContent="+
		smsContent+"&to="+to+"&timestamp="+timestamp+"&sig="+sig;
		return str;
	}
	/**
	 * 获取时间戳
	 * @return
	 */
	public static String getTimestamp(){
		SimpleDateFormat format = new SimpleDateFormat("yyyyMMddHHmmss");
		return format.format(new Date());
	}
	/**
	 * 动态传参数
	 * @param args
	 * @return
	 */
	public static String MD5(String... args){
		StringBuffer result = new StringBuffer();
		if (args==null || args.length==0){
			return "";
		}else {
			StringBuffer str = new StringBuffer();
			for(String strs : args){
				str.append(strs);
			}
			System.out.println("加密前：\t"+str.toString());
			try {
				MessageDigest digest = MessageDigest.getInstance("MD5");
				byte[] byteArray =  str.toString().getBytes("UTF-8");//统一字符编码,默认为GBK
				byte[] bytes = digest.digest(byteArray);
				
				for(byte b : bytes){
					String hex = Integer.toHexString(b&0xff);//转化为十六进制
					if (hex.length()==1){
						result.append("0"+hex);
					}else {
						result.append(hex);
					}
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return result.toString();
	}
//	public static void main(String[] args) {
//		String md5 = MD5("你好");
//		System.out.println(md5);
//	}

}
