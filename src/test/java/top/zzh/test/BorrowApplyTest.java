package top.zzh.test;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import top.zzh.bean.BorrowApply;
import top.zzh.bean.BorrowDetail;
import top.zzh.bean.ShBorrow;
import top.zzh.common.Pager;
import top.zzh.dao.BorrowApplyDAO;
import top.zzh.service.BorrowDetailService;
import top.zzh.service.ShBorrowService;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

/**
 * Created by 曾志湖 on 2017/12/25.
 */
public class BorrowApplyTest extends BaseTest {

    @Autowired
    private BorrowApplyDAO borrowApplyDAO;

    @Autowired
    private BorrowDetailService borrowDetailService;

    @Autowired
    private ShBorrowService shBorrowService;

    @Test
    public void save(){
        BorrowApply borrowApply = new BorrowApply();
        borrowApply.setRname("张六");
        borrowApply.setMoney(BigDecimal.valueOf(2500));
        borrowApply.setUid(38L);
        borrowApply.setBzid(3L);
        borrowApply.setState((byte)0);
        borrowApply.setTerm(6);
        borrowApply.setType((byte)1);
        borrowApply.setDeadline(new Date());
        borrowApplyDAO.save(borrowApply);
        BorrowDetail borrowDetail = new BorrowDetail();
        borrowDetail.setMpurpose("用于投资");
        borrowDetail.setHksource("***科技公司");
        borrowDetail.setSuggest("建议");
        borrowDetail.setXmdescrip("工程描述");
        borrowDetail.setGuarantee("工程措施");
        borrowDetail.setNprofit((float)40);
        borrowDetail.setWay("借款方式");
        borrowDetail.setCpname("YRB"+borrowApply.getBzid()+borrowApply.getLxid()+borrowApply.getBaid());
        borrowDetail.setBaid(borrowApply.getBaid());
        borrowDetail.setMoney(borrowApply.getMoney());
        borrowDetailService.save(borrowDetail);
        ShBorrow shBorrow = new ShBorrow();
        shBorrow.setBaid(borrowApply.getBaid());
        shBorrow.setIsok((byte)1);
        shBorrowService.save(shBorrow);
    }

    @Test
    public void update(){
        BorrowApply borrowApply = new BorrowApply();
        borrowApply.setBaid(1L);
        borrowApply.setRname("李四");
        borrowApplyDAO.update(borrowApply);
    }

    @Test
    public void listAll(){
        List<Object> objectList=borrowApplyDAO.listAll();
        for(Object obj:objectList){
            BorrowApply borrowDetailVO=(BorrowApply) obj;
            System.out.println(borrowDetailVO.getRname());
        }
    }

    @Test
    public void listPager(){
        Pager pager=new Pager(1,2);
        List<Object> objectList=borrowApplyDAO.listPager(pager);
        for(Object obj:objectList){
            BorrowApply borrowDetailVO=(BorrowApply) obj;
            System.out.println(borrowDetailVO.getRname());
        }
    }

    @Test
    public void  listPagerCriteria(){
        BorrowApply borrowApply =new BorrowApply();
        BigDecimal bigDecimal=new BigDecimal(1500);
        borrowApply.setMoney(bigDecimal);
        Pager pager=new Pager(1,2);
        List<Object> objectList=borrowApplyDAO.listPagerCriteria(pager,borrowApply);
        for(Object obj:objectList){
            BorrowApply borrowApply1=(BorrowApply) obj;
            System.out.println(borrowApply1.getMoney());
        }
    }

}
