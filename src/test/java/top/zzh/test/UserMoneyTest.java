package top.zzh.test;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import top.zzh.bean.UserMoney;
import top.zzh.common.Pager;
import top.zzh.dao.UserMoneyDAO;

import java.math.BigDecimal;
import java.util.List;

/***
 * @Created by 陈桢
 * 2017-12—22 10:39
 */
public class UserMoneyTest extends BaseTest {
    @Autowired
    private UserMoneyDAO userMoneyDAO;

//    @Test
//    public void save(){
//        UserMoney userMoney =new UserMoney();
//        userMoney.setUid(1);
//        userMoney.setZmoney(BigDecimal.valueOf(10000));
//        userMoneyDAO.save(userMoney);
//    }
//
//    @Test
//    public void update(){
//        UserMoney userMoney =new UserMoney();
//        BigDecimal bigDecimal=new BigDecimal(10000);
//        userMoney.setUid(1);
//        userMoney.setTzmoney(bigDecimal);
//        userMoneyDAO.update(userMoney);
//    }

    @Test
    public void listPager(){
        Pager pager=new Pager(1,2);
        List<Object> objectList=userMoneyDAO.listPager(pager);
        for(Object obj:objectList){
            UserMoney userMoney=(UserMoney)obj;
            System.out.println(userMoney.getZmoney());
        }

    }

    @Test
    public void  listPagerCriteria(){
        UserMoney userMoney =new UserMoney();
        BigDecimal bigDecimal=new BigDecimal(10000);
        userMoney.setTzmoney(bigDecimal);
        Pager pager=new Pager(0,2);
        List<Object> objectList=userMoneyDAO.listPagerCriteria(pager,userMoney);
        for(Object obj:objectList){
            UserMoney userMone=(UserMoney)obj;
            System.out.println(userMone.getZmoney());
        }
    }

}
