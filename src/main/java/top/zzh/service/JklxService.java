package top.zzh.service;

import org.springframework.stereotype.Service;
import top.zzh.bean.BankCard;
import top.zzh.bean.Jklx;

/**
 * @version :1.0
 * CREATE TIME :2017/12/25 19:19
 * @authro :LH
 */
@Service
public interface JklxService extends BaseService {
    void updateState(Jklx jklx);
    Object getById(Long id);
}
