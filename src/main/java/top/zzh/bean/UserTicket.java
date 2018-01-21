package top.zzh.bean;

import java.util.Date;

//领劵表
public class UserTicket {
    private Long ukid;

    public UserTicket(Long uid, Long kid, Date tktime, Byte usestatus) {
        this.uid = uid;
        this.kid = kid;
        this.tktime = tktime;
        this.usestatus = usestatus;
    }

    public UserTicket(Long ukid, Long uid, Long kid, Date tktime, Byte usestatus) {
        this.ukid = ukid;
        this.uid = uid;

        this.kid = kid;
        this.tktime = tktime;
        this.usestatus = usestatus;
    }

    private Long uid;//用户id

    private Long kid;//劵id

    private Date tktime;//领劵时间

    public Byte getUsestatus() {
        return usestatus;
    }

    public void setUsestatus(Byte usestatus) {
        this.usestatus = usestatus;
    }

    private Byte usestatus;

    public UserTicket() {
        super();
    }

    public Long getUkid() {
        return ukid;
    }

    public void setUkid(Long ukid) {
        this.ukid = ukid;
    }

    public Long getUid() {
        return uid;
    }

    public void setUid(Long uid) {
        this.uid = uid;
    }

    public Long getKid() {
        return kid;
    }

    public void setKid(Long kid) {
        this.kid = kid;
    }

    public Date getTktime() {
        return tktime;
    }

    public void setTktime(Date tktime) {
        this.tktime = tktime;
    }
}