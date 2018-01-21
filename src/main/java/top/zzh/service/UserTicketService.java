package top.zzh.service;

import top.zzh.vo.UserTicketVo;

import java.util.List;

public interface UserTicketService extends BaseService{
    List<UserTicketVo> unuse(Long uid);
    List<UserTicketVo> used(Long uid);
    List<UserTicketVo> overed(Long uid);

    Integer unuseCount(Long uid);
    Integer usedCount(Long uid);
    Integer overedCount(Long uid);
    void regTktsave(Long uid);
    List<UserTicketVo> selectUtkListByName(String tname,Long uid);
    public void updateEGold();

    //将余额充值进余额，修改状态
    UserTicketVo list(Long uid);
    void updateState(Object object);
}
