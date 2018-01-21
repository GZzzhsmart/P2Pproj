package top.zzh.test;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import top.zzh.bean.BorrowDetail;
import top.zzh.common.Pager;
import top.zzh.dao.BorrowDetailDAO;
import top.zzh.vo.BorrowApplyVO;

import java.math.BigDecimal;
import java.util.List;

/**
 * Created by 曾志湖 on 2017/12/25.
 */
public class BorrowDetailTest extends BaseTest {

    @Autowired
    private BorrowDetailDAO borrowDetailDAO;

    @Test
    public void save(){
        BorrowDetail borrowDetail = new BorrowDetail();
        borrowDetail.setFpic("uploads/1.jpg");
        borrowDetail.setYpic("uploads/2.jpg");
        borrowDetail.setQpic("uploads/3.jpg");
        borrowDetail.setTpic("uploads/4.jpg");
        borrowDetail.setMpurpose("用于贷款");
        borrowDetail.setHksource("***有限公司");
        borrowDetail.setSuggest("还款人介绍");
        borrowDetail.setXmdescrip("项目描述");
        borrowDetail.setGuarantee("保障措施");
        borrowDetail.setMoney(BigDecimal.valueOf(1500));
        borrowDetail.setNprofit((float)10);
        borrowDetail.setWay("收益方式");
        borrowDetail.setCpname("普金宝");
        borrowDetail.setBaid(1L);
        borrowDetailDAO.save(borrowDetail);
    }

    @Test
    public void listAll(){
        List<Object> objectList=borrowDetailDAO.listAll();
        for(Object obj:objectList){
            BorrowDetail borrowDetailVO=(BorrowDetail) obj;
            System.out.println(borrowDetailVO.getCpname());
        }
    }

    @Test
    public void listPager(){
        Pager pager=new Pager(1,2);
        List<Object> objectList=borrowDetailDAO.listPager(pager);
        for(Object obj:pager.getRows()){
            BorrowApplyVO borrowDetailVO=(BorrowApplyVO) obj;
            System.out.println(borrowDetailVO.getCpname());
        }
    }

    @Test
    public void  listPagerCriteria(){
        BorrowApplyVO borrowApply =new BorrowApplyVO();
        BigDecimal bigDecimal=new BigDecimal(1500);
        borrowApply.setMoney(bigDecimal);
        Pager pager=new Pager(1,2);
        List<Object> objectList=borrowDetailDAO.listPagerCriteria(pager,borrowApply);
        for(Object obj:objectList){
            BorrowApplyVO borrowApply1=(BorrowApplyVO) obj;
            System.out.println(borrowApply1.getMoney());
        }
    }

}
