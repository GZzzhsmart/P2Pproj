package top.zzh.quartz;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import top.zzh.bean.YDate;
import top.zzh.service.YdateService;

import java.math.BigDecimal;
import java.util.Calendar;
import java.util.Date;

@Component
public class CreateRundata {
    @Autowired
    private YdateService ydateService;
    public void run() {
        YDate yDate = new YDate();
        yDate.setDate(new Date(Calendar.getInstance().getTime().getDate()));
        yDate.setTmoney(yDate.getTmoney());
        yDate.setMmoney(yDate.getMmoney());
        yDate.setTuser(yDate.getTuser());
        yDate.setMuser(yDate.getMuser());
        yDate.setTtzno(yDate.getTtzno());
        yDate.setMtzno(yDate.getMtzno());
        yDate.setTdkno(yDate.getTdkno());
        yDate.setMdkno(yDate.getMdkno());
        yDate.setTdkbno(yDate.getTdkbno());
        yDate.setMdkbno(yDate.getMdkbno());
        ydateService.save(yDate);
    }
}
