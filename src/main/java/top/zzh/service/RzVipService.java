package top.zzh.service;

import top.zzh.query.RzvipDetails;

/**
 * @version :1.0
 * CREATE TIME :2017/12/25 15:35
 * @authro :LH
 */
public interface RzVipService extends BaseService {
    RzvipDetails findDetails(Long uid);
}
