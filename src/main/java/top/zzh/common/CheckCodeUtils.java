package top.zzh.common;

import java.awt.*;
import java.awt.image.BufferedImage;
import java.util.Random;

/**
 * Created by Administrator on 2017/12/7 0007.
 */
public class CheckCodeUtils {

    private static final String CODES = "abcdefghjkmnpqrstuvwxyzABCDEFGHJKLMNPQRSTUVWXY0123456789";

    private static final int CODE_LENGTH = 5;

    private static final int IMAGE_WIDTH = 85;

    private static final int IMAGE_HEIGHT = 40;

    private static final int LINE_COUNT = 5;

    public static String randomCode(int length) {
        char[] chars = CODES.toCharArray();
        Random random = new Random();//随机数
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < length; i++) {
            sb.append(chars[random.nextInt(CODES.length())]);
        }
        return sb.toString();
    }

    public static String randomCode() {
        return randomCode(CODE_LENGTH);
    }

    public static BufferedImage generateImage(String code) {
        BufferedImage image = new BufferedImage(IMAGE_WIDTH, IMAGE_HEIGHT, BufferedImage.TYPE_INT_RGB);
        Graphics graphics = image.getGraphics();//画笔
        graphics.setColor(Color.YELLOW);
        graphics.fillRect(0, 0, IMAGE_WIDTH, IMAGE_HEIGHT);//填充图片
        graphics.setColor(Color.blue);//设置字体颜色
        graphics.setFont(new Font("宋体", Font.BOLD, 28));//设置字体
        graphics.drawString(code, 3, 30);//图片画到那个位置
        for (int i = 0; i < LINE_COUNT; i++) {
            graphics.setColor(randomColor());
            Point pStart = randomPoint();
            Point pEnd = randomPoint();
            graphics.drawLine((int) pStart.getX(), (int) pStart.getY(), (int) pEnd.getX(), (int) pEnd.getX());//画随机线
        }
        return image;

    }

    private static Point randomPoint() {
        Point p = new Point();//画点
        Random random = new Random();
        p.setLocation(random.nextInt(IMAGE_WIDTH), random.nextInt(IMAGE_HEIGHT));//设置随机点的范围
        return p;
    }

    private static Color randomColor() {
        Random random = new Random();
        return new Color(random.nextInt(255), random.nextInt(255), random.nextInt(255));
    }
//邀请码的生成
    public static String tzmCode() {
//        String[] code = {"0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "a", "b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","v","u","w","x","y","z"};
        String[] code = {"0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "a", "b","c","d","e"};
        String tzm = "";
        for (int i = 0; i < 5; i++) {
            int id = (int) Math.ceil(Math.random() * 14);
            tzm += code[id];
        }
        return tzm;
    }

}
