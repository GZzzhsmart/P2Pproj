package top.zzh.test;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import top.zzh.bean.Sway;
import top.zzh.common.Pager;
import top.zzh.dao.SwayDAO;
import top.zzh.vo.TxCheckVO;


import java.util.List;

/**
 * @Cander 陈桢 2017/12/25
 */
public class SwayTest extends BaseTest {
    @Autowired
    private SwayDAO swayDAO;


    @Test
    public void save(){
       Sway sway =new Sway();

       sway.setWay("1+1");
       sway.setFw("1123");
       sway.setState((byte)0);
       swayDAO.save(sway);
    }

    @Test
    public void update(){
        Sway sway = new Sway();
        sway.setWay("1+2");
        sway.setFw("1123");
        sway.setState((byte)0);
        sway.setSid(1L);
        swayDAO.update(sway);
    }

    @Test
    public void updateState(){
        Sway sway = new Sway();
        sway.setState((byte)1);
        sway.setSid(1L);
        swayDAO.updateState(sway);
    }

    @Test
    public void removeById(){
        Long sid = 1L;
        swayDAO.removeById(sid);
    }
    @Test
    public void listPager(){
        Pager pager=new Pager(1,2);
        List<Object> objectList=swayDAO.listPager(pager);
        for(Object obj:objectList){
            Sway sway=(Sway)obj;
            System.out.println(sway.getWay());
        }
    }


}
