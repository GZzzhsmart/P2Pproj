package top.zzh.service;

/**
 * Created by 陈桢 on 2018/1/8.
 */
public interface BankService extends BaseService{

    String getDeposit(String id);
    String getBankName( String id);
}
