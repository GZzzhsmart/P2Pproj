package top.zzh.test;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import top.zzh.bean.Bz;
import top.zzh.bean.Jklx;
import top.zzh.service.JklxService;

/**
 * @version :1.0
 * CREATE TIME :2017/12/25 19:45
 * @authro :LH
 */
public class JklxTest extends   BaseTest {

    @Autowired
    private JklxService jklxService;

    @Test
    public void save(){
        Jklx jklx =new Jklx();
        jklx.setLxname("12");
        jklx.setState((byte)0);
        jklxService.save(jklx);
    }

    @Test
    public void update(){
        Jklx jklx = new Jklx();
        jklx.setLxname("zzz");
        jklx.setState((byte)0);
        jklx.setLxid(1L);
        jklxService.update(jklx);
    }

    @Test
    public void updateState(){
        Jklx jklx = new Jklx();
        jklx.setState((byte)1);
        jklx.setLxid(1L);
        jklxService.updateState(jklx);
    }

    @Test
    public void removeById(){
        Long lxid = 1L;
        jklxService.removeById(lxid);
    }
}
