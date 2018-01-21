package top.zzh.test;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import top.zzh.bean.Tzb;
import top.zzh.common.Pager;
import top.zzh.dao.TzbDAO;
import top.zzh.vo.TzbVO;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

/**
 * Created by 曾志湖 on 2017/12/26.
 * 投资表测试类
 */
public class TzbTest extends BaseTest {

    @Autowired
    private TzbDAO tzbDAO;

    @Test
    public void save(){
        Tzb tzb = new Tzb();
        tzb.setUid(1L);
        tzb.setJuid(2L);
        tzb.setMoney(BigDecimal.valueOf(2000));
        tzb.setTime(new Date());
        tzb.setNprofit((float)0.65);
        tzb.setCpname("余额宝");
        tzb.setBaid(1L);
        tzbDAO.save(tzb);
    }

    @Test
    public void listPager(){
        Pager pager=new Pager(1,2);
        List<Object> objectList=tzbDAO.listPager(pager);
        for(Object obj:objectList){
            Tzb tzb=(Tzb) obj;
            System.out.println(tzb.getCpname());
        }
    }

    @Test
    public void  listPagerCriteria(){
        Tzb tzb = new Tzb();
        tzb.setCpname("余额宝");
        Pager pager=new Pager(1,2);
        List<Object> objectList=tzbDAO.listPagerCriteria(pager,tzb);
        for(Object obj:objectList){
            Tzb tzb1=(Tzb) obj;
            System.out.println(tzb1.getMoney());
        }
    }

    @Test
    public void add(){
        TzbVO tzb = new TzbVO();
        tzb.setUid(1L);
        tzb.setJuid(1L);
        tzb.setMoney(BigDecimal.valueOf(2000));
        tzb.setTime(new Date());
        tzb.setNprofit((float)0.44);
        tzb.setCpname("YRB1101");
        tzb.setBaid(2L);
        tzbDAO.save(tzb);
    }

}
