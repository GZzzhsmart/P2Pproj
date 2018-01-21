package top.zzh.service;

import top.zzh.bean.Notice;

import java.util.List;

/**
 * @version :1.0
 * CREATE TIME :2018/1/1 19:52
 * @authro :LH
 */
public interface NoticeService extends BaseService{
    List<Object> listNotice(int pageIndex, int pageSize);
}
