package top.zzh.test;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import top.zzh.bean.LogTx;
import top.zzh.common.Pager;
import top.zzh.dao.LogTxDAO;

import java.math.BigDecimal;
import java.util.List;
/**
 * cander 陈桢 2017/12/22
 */

public class LogtxTest extends BaseTest {
    @Autowired
    private LogTxDAO logTxDAO;

    @Test
    public void svae(){
        LogTx logTx =new LogTx();
        logTx.setUid(1L);
        logTx.setBankcard("1023");
        logTx.setBanktype("建设银行");
        logTx.setMoney(BigDecimal.valueOf(1000));
        logTx.setState((byte)0);
        logTxDAO.save(logTx);
    }
    @Test
    public void update(){
        LogTx logTx =new LogTx();
        logTx.setUid(1L);
        logTx.setState((byte)1);
        logTxDAO.update(logTx);
    }

    @Test
    public void listPager(){
        Pager pager =new Pager(1,2);
        List<Object> objectList=logTxDAO.listPager(pager);
        for(Object obj:objectList){
            LogTx logTx =(LogTx)obj;
            System.out.println(logTx.getBanktype());
        }

    }
    @Test
    public void removeById(){
        logTxDAO.removeById(1L);
    }
}
