package top.zzh.common;

import java.math.BigDecimal;

/**
 * Created by Administrator on 2018/1/7 0007.
 */
public class JLff {
    BigDecimal t1= BigDecimal.valueOf(0);
    BigDecimal t2= BigDecimal.valueOf(50000);
    BigDecimal t3= BigDecimal.valueOf(100000);
    BigDecimal t4= BigDecimal.valueOf(500000);
    BigDecimal t5= BigDecimal.valueOf(5);

    BigDecimal x1= BigDecimal.valueOf(0.05);
    BigDecimal x2= BigDecimal.valueOf(0.03);
    BigDecimal x3= BigDecimal.valueOf(0.01);

    BigDecimal result=null;

    public  BigDecimal jlj(BigDecimal tz){
        //等于1是大于，等于-1是小于，等于0是等于
        if(tz.compareTo(t1)==1 && tz.compareTo(t2)==-1 || tz.compareTo(t2)==0){
            result= tz.multiply(x1);
        }

        if(tz.compareTo(t2)==1 &&  tz.compareTo(t3)==-1 || tz.compareTo(t3)==0){
            result= tz.multiply(x2);
        }

        if(tz.compareTo(t3)==1){
            result= tz.multiply(x3);
        }

        if(result.compareTo(t5)==-1){
            result=t5;
        }

        if(result.compareTo(t4)==1){
            result=t4;
        }
        return result;
    }


    public static void main(String []a){

        JLff jLff=new JLff();
        BigDecimal results=jLff.jlj(BigDecimal.valueOf(99.8));
        System.out.println(results);


    }

}
