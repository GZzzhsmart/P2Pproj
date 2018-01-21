package top.zzh.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import top.zzh.bean.Bz;
import top.zzh.bean.Ticket;
import top.zzh.common.Pager;
import top.zzh.dao.BzDAO;
import top.zzh.dao.TicketDAO;
import top.zzh.service.AbstractService;
import top.zzh.service.BzService;
import top.zzh.service.TicketService;

import java.util.List;
@Service
public class TicketServiceImpl extends AbstractService implements TicketService {
    private TicketDAO tickekDao;
    @Autowired
    public void setTickekDao(TicketDAO tickekDao) {
        super.setBaseDAO(tickekDao);
        this.tickekDao = tickekDao;
    }

    @Override
    public void updateStatus(Byte status, Long kid) {
        if(status!=null && status==0){
            status=1;
        }else if(status!=null && status==1){
            status=0;
        }
        tickekDao.updateStatus(status,kid);
    }
}
