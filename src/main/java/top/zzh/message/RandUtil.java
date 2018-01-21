package top.zzh.message;

import java.util.Random;

/**
 * 随机数工具类
 * @author Administrator
 * May 21, 2017
 */
public class RandUtil {
	public static String getRandNum(){
		String randNum = new Random().nextInt(899999)+100000+"";
		return randNum;
	}

//	public static void main(String[] args) {
//		String string = getRandNum();
//		System.out.println("随机数为："+string);
//	}

}
