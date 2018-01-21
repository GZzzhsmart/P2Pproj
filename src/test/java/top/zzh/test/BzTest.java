package top.zzh.test;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import top.zzh.bean.Bz;
import top.zzh.bean.Sway;
import top.zzh.common.Pager;
import top.zzh.dao.BzDAO;
import top.zzh.dao.SwayDAO;
import top.zzh.service.BzService;
import top.zzh.vo.TxCheckVO;

import java.util.List;

/**
 * @Cander 陈桢 2017/12/25
 */
public class BzTest extends BaseTest {
    @Autowired
    private BzService bzService;


    @Test
    public void save(){
       Bz bz =new Bz();
       bz.setBzname("zz");
       bz.setState((byte)0);
        bzService.save(bz);
    }

    @Test
    public void update(){
        Bz bz = new Bz();
        bz.setBzname("zzz");
        bz.setState((byte)0);
        bz.setBzid(1L);
        bzService.update(bz);
    }

    @Test
    public void updateState(){
        Bz bz = new Bz();
        bz.setState((byte)1);
        bz.setBzid(1L);
        bzService.updateState(bz);
    }

    @Test
    public void removeById(){
        Long bzid = 1L;
        bzService.removeById(bzid);
    }

    @Test
    public void listPager(){
        Pager pager=new Pager(1,2);
        pager  =bzService.listPager(1,2);
        System.out.println(pager.getRows());
    }

}
