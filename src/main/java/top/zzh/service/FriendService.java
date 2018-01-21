package top.zzh.service;

import top.zzh.bean.Friend;

import java.util.List;

/**
 * @version :1.0
 * CREATE TIME :2018/1/1 19:44
 * @authro :LH
 */
public interface FriendService extends  BaseService{
    List<Friend> listFriend();
}
