package top.zzh.test;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import top.zzh.bean.ShBorrow;
import top.zzh.common.Pager;
import top.zzh.dao.ShBorrowDAO;
import top.zzh.service.ShBorrowService;
import top.zzh.vo.ShBorrowVO;
import java.util.List;
/**
 * Created by 曾志湖 on 2017/12/26.
 * 借款审核
 */
public class ShBorrowTest extends BaseTest {

    @Autowired
    private ShBorrowService shBorrowDAO;


    @Test
    public void save(){
        ShBorrow borrow = new ShBorrow();
        borrow.setHuid(1L);
        borrow.setIsok((byte)0);
        borrow.setExcute("审核不通过");
        borrow.setBaid(1L);
        shBorrowDAO.save(borrow);
    }

    @Test
    public void update(){
        ShBorrow borrow = new ShBorrow();
        borrow.setShid(2L);
        borrow.setIsok((byte)1);
        borrow.setExcute("审核通过");
        shBorrowDAO.update(borrow);
    }

    @Test
    public void updateState(){
        ShBorrow borrow = new ShBorrow();
        borrow.setShid(6L);
        borrow.setIsok((byte)1);
        borrow.setExcute("审核通过");
        shBorrowDAO.update(borrow);
    }
    @Test
    public void removeById(){
        shBorrowDAO.removeById(2L);
    }

    @Test
    public void listPager(){
        Pager pager = shBorrowDAO.listPager(1,2);
        for(Object obj:pager.getRows()){
            ShBorrowVO borrowVO=(ShBorrowVO) obj;
            System.out.println(borrowVO.getExcute());
        }
    }

//    @Test
//    public void  listPagerCriteria(){
//        ShBorrow shBorrowVO = new ShBorrow();
//        shBorrowVO.setExcute("审核通过");
//        Pager pager=new Pager(1,2);
//        List<Object> objectList=shBorrowDAO.listPagerCriteria(pager,shBorrowVO);
//        for(Object obj:objectList){
//            ShBorrow borrowVO=(ShBorrow) obj;
//            System.out.println(borrowVO.getExcute());
//        }
//    }
}
