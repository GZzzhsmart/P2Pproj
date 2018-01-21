package top.zzh.bean;

import java.util.Date;

//银行绑卡表
public class BankCard {

    private Long bcid;

    private Long uid;//用户id

    private String cardno;//银行卡号

    private String rname;//绑卡人姓名

    private String idno;//身份证号

    private String type;//所属银行

    private Byte state;//银行卡状态，0激活，1冻结

    private Date date;//绑卡时间

    public BankCard(Long bcid, Long uid, String cardno, String rname, String idno, String type, Byte state, Date date) {
        this.bcid = bcid;
        this.uid = uid;
        this.cardno = cardno;
        this.rname = rname;
        this.idno = idno;
        this.type = type;
        this.state = state;
        this.date = date;
    }

    public BankCard() {
        super();
    }

    public Long getBcid() {
        return bcid;
    }

    public void setBcid(Long bcid) {
        this.bcid = bcid;
    }

    public Long getUid() {
        return uid;
    }

    public void setUid(Long uid) {
        this.uid = uid;
    }

    public String getCardno() {
        return cardno;
    }

    public void setCardno(String cardno) {
        this.cardno = cardno == null ? null : cardno.trim();
    }

    public String getRname() {
        return rname;
    }

    public void setRname(String rname) {
        this.rname = rname == null ? null : rname.trim();
    }

    public String getIdno() {
        return idno;
    }

    public void setIdno(String idno) {
        this.idno = idno == null ? null : idno.trim();
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type == null ? null : type.trim();
    }

    public Byte getState() {
        return state;
    }

    public void setState(Byte state) {
        this.state = state;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }
}