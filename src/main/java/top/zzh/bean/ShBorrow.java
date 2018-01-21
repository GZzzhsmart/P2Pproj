package top.zzh.bean;

import java.util.Date;

//借款审核表
public class ShBorrow {
    private Long shid;

    private Long huid;//审核人id

    private Byte isok;//审核是否通过（0未通过，1已通过）

    private String excute;//审核理由

    private Date date;//审核时间

    private Long baid;//借款人id

    public ShBorrow(Long shid, Long huid, Byte isok, String excute, Date date, Long baid) {
        this.shid = shid;
        this.huid = huid;
        this.isok = isok;
        this.excute = excute;
        this.date = date;
        this.baid = baid;
    }

    public ShBorrow() {
        super();
    }

    public Long getShid() {
        return shid;
    }

    public void setShid(Long shid) {
        this.shid = shid;
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

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public Long getBaid() {
        return baid;
    }

    public void setBaid(Long baid) {
        this.baid = baid;
    }
}