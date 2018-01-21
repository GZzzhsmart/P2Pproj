package top.zzh.service;

import top.zzh.bean.BankCard;
import top.zzh.bean.Bz;

/**
 * @version :1.0
 * CREATE TIME :2017/12/25 15:35
 * @authro :LH
 */
public interface BzService extends BaseService {
    void updateState(Bz bz);
    Object getById(Long id);
}
