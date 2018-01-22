package top.zzh.service.impl;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import top.zzh.bean.UserTicket;
import top.zzh.common.Constants;
import top.zzh.common.Pager;
import top.zzh.dao.UserTicketDAO;
import top.zzh.service.AbstractService;
import top.zzh.service.UserTicketService;
import top.zzh.vo.UserTicketVo;

import javax.servlet.http.HttpSession;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
@Service
public class UserTicketServiceImpl extends AbstractService implements UserTicketService {
    private UserTicketDAO userTicketDAO;
    private Logger logger= LoggerFactory.getLogger(UserTicketServiceImpl.class);
    @Autowired
    public void setUserTicketDAO(UserTicketDAO userTicketDAO) {
        super.setBaseDAO(userTicketDAO);
        this.userTicketDAO = userTicketDAO;
    }

    @Override
    public List<UserTicketVo> unuse(Long uid) {
        return userTicketDAO.unuse(uid);
    }

    @Override
    public List<UserTicketVo> used(Long uid) {
        return userTicketDAO.used(uid);
    }

    @Override
    public List<UserTicketVo> overed(Long uid) {
        return userTicketDAO.overed(uid);
    }

    @Override
    public Integer unuseCount(Long uid) {
        return userTicketDAO.unuseCount(uid);
    }

    @Override
    public Integer usedCount(Long uid) {
        return userTicketDAO.usedCount(uid);
    }

    @Override
    public Integer overedCount(Long uid) {
        return userTicketDAO.overedCount(uid);
    }

    @Override
    public void regTktsave(Long uid) {
        List<Long> kidList=userTicketDAO.selectKidListByName("注册");
        logger.info("reTksave====uid====="+uid);
        logger.info("reTksave====uid====="+uid);
        logger.info("kidList的长度==="+kidList.size());
        logger.info("kidList的长度==="+kidList.size());
        logger.info("kidList的长度==="+kidList.size());
        UserTicket userTicket=null;
        for(Long kid:kidList){
            userTicket=new UserTicket();
            userTicket.setUid(uid);
            userTicket.setKid(kid);
            userTicketDAO.save(userTicket);
        }
        logger.info("用户注册领券成功");
        logger.info("用户注册领券成功");
        logger.info("用户注册领券成功");
    }

    @Override
    public List<UserTicketVo> selectUtkListByName(String tname,Long uid) {
        return userTicketDAO.selectUtkListByName(tname,uid);
    }

    @Override
    public void updateEGold() {
        userTicketDAO.updateEGold();
    }

    @Override
    public UserTicketVo list(Long uid) {
        return userTicketDAO.list(uid);
    }

    @Override
    public void updateState(Object object) {
        userTicketDAO.updateState(object);
    }
}
