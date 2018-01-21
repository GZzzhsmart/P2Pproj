package top.zzh.service;

import top.zzh.bean.BankCard;
import top.zzh.bean.Sway;

/**
 * @version :1.0
 * CREATE TIME :2017/12/25 14:31
 * @authro :LH
 */
public interface SwayService extends BaseService{
    void updateState(Sway sway);
}
