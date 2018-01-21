package top.zzh.message;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.URL;
import java.net.URLConnection;
import net.sf.json.JSONObject;

/**
 * 获取短信验证码
 * @author Administrator
 * May 21, 2017
 */
public class GetPhoneMessage {
	/**
	 * 用户ID
	 */
	public static final String ACCOUNT_SID = "fa02b5969cd847168ac01892935c60ae";
	/**
	 * 密匙
	 */
	public static final String AUTH_TOKEN = "81f1a599c1e5476697aa4de9500e194f";
	/**
	 * 请求地址前半部分
	 */
	public static final String BASE_URL = "https://api.miaodiyun.com/20150822/industrySMS/sendSMS";
	//验证码
	public static String randNum = RandUtil.getRandNum();
	public static String smsContent = "【亿人宝】您的验证码为"+randNum+"，请于2分钟内正确输入，如非本人操作，请忽略此短信。";//账号内已有模板
	/**
	 * 获取短信验证码
	 * @param to
	 * @return
	 */
	public static String getResult(String to){
		String args = QueryUtil.queryArguments(ACCOUNT_SID, AUTH_TOKEN, smsContent, to);
		OutputStreamWriter out = null;
		BufferedReader br = null;
		StringBuffer sb = new StringBuffer();
		try {
			URL url = new URL(BASE_URL);
			URLConnection connection = url.openConnection();//打开链接
			connection.setDoOutput(true);
			connection.setDoInput(true);
			//设置响应时间:5秒还未请求到就取消请求———链接超时
			connection.setConnectTimeout(5000);
			//设置读取的响应时间————读取超时
			connection.setReadTimeout(10000);
			//提交数据
			out = new OutputStreamWriter(connection.getOutputStream(),"utf-8");
			out.write(args);
			out.flush();
			//读取返回数据
			br = new BufferedReader(new InputStreamReader(connection.getInputStream()));//节点流
			//循环读取
			String line = "";
			while((line = br.readLine()) != null){
				sb.append(line);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{//关闭流
			try {
				if(br != null){
					br.close();
				}
				if(out != null){
					out.close();
				}
			}catch (IOException e) {
				e.printStackTrace();
			}
		}
		JSONObject jsonObject = JSONObject.fromObject(sb.toString());
		Object object = jsonObject.get("respCode");
		if(!object.equals("00000")){
			System.out.println("异常编码："+object);
			return "error";
		}else {
//			System.out.println("正常编码："+object);
			return randNum;
		}
	}

	public static void main(String[] args) {
		String result = getResult("18720865791");//手机号
		System.out.println(result);
		System.out.println("验证码是："+randNum);
	}
}
