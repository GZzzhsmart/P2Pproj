package top.zzh.bean;

import java.util.Date;

//提现审核表
public class TxCheck {
    private Long id;

    private Long txid;//提现人id

    private Long huid;//审核人id

    private Byte isok;//审核是否通过，0通过，1未通过

    private String excute;//审核理由

    private Date dateTime;//审核时间

    public TxCheck(Long id, Long txid, Long huid, Byte isok, String excute, Date dateTime) {
        this.id = id;
        this.txid = txid;
        this.huid = huid;
        this.isok = isok;
        this.excute = excute;
        this.dateTime = dateTime;
    }

    public TxCheck() {
        super();
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getTxid() {
        return txid;
    }

    public void setTxid(Long txid) {
        this.txid = txid;
    }

    public Long getHuid() {
        return huid;
    }

    public void setHuid(Long huid) {
        this.huid = huid;
    }

    public Byte getIsok() {
        return isok;
    }

    public void setIsok(Byte isok) {
        this.isok = isok;
    }

    public String getExcute() {
        return excute;
    }

    public void setExcute(String excute) {
        this.excute = excute == null ? null : excute.trim();
    }

    public Date getDateTime() {
        return dateTime;
    }

    public void setDateTime(Date dateTime) {
        this.dateTime = dateTime;
    }
}