package top.zzh.service;

public interface TicketService extends BaseService {
   void updateStatus(Byte status,Long kid);
}
