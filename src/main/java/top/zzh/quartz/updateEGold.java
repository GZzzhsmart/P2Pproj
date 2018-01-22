package top.zzh.quartz;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import top.zzh.service.UserTicketService;

@Component
public class updateEGold {
    @Autowired
    private UserTicketService userTicketService;
    public void run() {
        userTicketService.updateEGold();//更新体验券使用状态
    }
}
