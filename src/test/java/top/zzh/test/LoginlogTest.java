package top.zzh.test;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import top.zzh.bean.ShBorrow;
import top.zzh.common.Pager;
import top.zzh.dao.LoginLogDAO;
import top.zzh.query.LoginLogQuery;

import java.util.List;

/**
 * Created by 曾志湖 on 2017/12/26.
 * 登录日志测试类
 */
public class LoginlogTest extends BaseTest {

    @Autowired
    private LoginLogDAO loginLogDAO;

    @Test
    public void  listPagerCriteria(){
        LoginLogQuery loginLogQuery = new LoginLogQuery();
        loginLogQuery.setIsOnline(1);
        Pager pager=new Pager(1,2);
        List<Object> objectList=loginLogDAO.listPagerCriteria(pager,loginLogQuery);
        for(Object obj:objectList){
            LoginLogQuery logQuery=(LoginLogQuery) obj;
            System.out.println(logQuery.getLoginIp());
        }
    }
}
