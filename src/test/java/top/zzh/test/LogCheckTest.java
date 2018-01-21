package top.zzh.test;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import top.zzh.bean.LogTx;
import top.zzh.bean.TxCheck;
import top.zzh.common.Pager;
import top.zzh.dao.LogTxDAO;
import top.zzh.dao.TxcheckDAO;
import top.zzh.vo.TxCheckVO;

import java.util.List;
/**
 * @Cander 陈桢 2017/12/25
 */
public class LogCheckTest extends BaseTest {
    @Autowired
    private TxcheckDAO txCheckDAO;
    @Autowired
    private LogTxDAO logTxDAO;

    @Test
    public void svae(){
        TxCheck  txCheck=new TxCheck();
        LogTx logTx =new LogTx();
        txCheck.setHuid(1L);
        txCheck.setTxid(1L);
        txCheck.setIsok((byte)0);
        txCheck.setExcute("审核通过！");
        txCheckDAO.save(txCheck);
        logTx.setId(1L);
        logTx.setState((byte)0);
        logTxDAO.update(logTx);

    }
    @Test
    public void listAll(){
        List<Object> objectList=txCheckDAO.listAll();
        for(Object obj:objectList){
            TxCheckVO txCheck=(TxCheckVO)obj;
            System.out.println(txCheck.getExcute());
        }
    }

    @Test
    public void listPager(){
        Pager pager=new Pager(1,2);
        List<Object> objectList=txCheckDAO.listPager(pager);
        for(Object obj:objectList){
            TxCheckVO txCheck=(TxCheckVO)obj;
            System.out.println(txCheck.getExcute());
        }
    }
}
