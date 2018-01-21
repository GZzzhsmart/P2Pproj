package top.zzh.test;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import top.zzh.bean.LogMoney;
import top.zzh.common.Pager;
import top.zzh.dao.LogMoneyDAO;
import top.zzh.vo.LogMoneyVO;

import java.math.BigDecimal;
import java.util.List;

/**
 * @Cander 陈桢 2017/12/25
 *
 */
public class LogMoneyTest extends  BaseTest {
    @Autowired
    private LogMoneyDAO logMoneyDAO;

    @Test
    public void  save(){
        LogMoney logMoney =new LogMoney();
        logMoney.setUid(1L);
        logMoney.setIn(BigDecimal.valueOf(6200));
        logMoney.setType((byte)0);
        logMoneyDAO.save(logMoney);
    }

    @Test
    public void update(){

    }

    @Test
    public void listPager(){
        Pager pager =new Pager(1,3);
        List<Object> objectList =logMoneyDAO.listPager(pager);
        for(Object obj:objectList){
            LogMoneyVO logMoney =(LogMoneyVO) obj;
            System.out.println(logMoney.getRname());
        }
    }
}
