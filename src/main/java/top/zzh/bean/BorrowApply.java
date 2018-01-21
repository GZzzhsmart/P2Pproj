package top.zzh.bean;

import java.math.BigDecimal;
import java.util.Date;

//申请借款表
public class BorrowApply {

    private Long baid;
    private String rname;//真实姓名
    private BigDecimal money;//申请金额
    private Long uid;//借款人id
    private Long bzid;//标种id
    private Date time;//审核时间
    private Byte state;//审核状态（0表示为审核，1表示已审核）
    private Byte type;//借款类型为标种的主键字段
    private Integer term;//借款期限
    private Date deadline;//截止时间
    private String bzname;
    private Long huid;
    private String reason;
    private Long bdid;
    private String uname;
    private String lxname;
    private Long lxid;
    private String username;


    public BorrowApply(Long bdid,String username,Long huid,String reason,Long lxid,String lxname,String uname,String bzname,Long baid, String rname, BigDecimal money, Long uid, Long bzid, Date time, Byte state, Byte type, Integer term, Date deadline) {
        this.baid = baid;
        this.bdid = bdid;
        this.uname = uname;
        this.username = username;
        this.huid = huid;
        this.reason = reason;
        this.lxname = lxname;
        this.bzname = bzname;
        this.lxid = lxid;
        this.rname = rname;
        this.money = money;
        this.uid = uid;
        this.bzid = bzid;
        this.time = time;
        this.state = state;
        this.type = type;
        this.term = term;
        this.deadline = deadline;
    }

    public void setBdid(Long bdid) {
        this.bdid = bdid;
    }

    public Long getBdid() {
        return bdid;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getUsername() {
        return username;
    }

    public void setHuid(Long huid) {
        this.huid = huid;
    }

    public Long getHuid() {
        return huid;
    }

    public void setReason(String reason) {
        this.reason = reason;
    }

    public String getReason() {
        return reason;
    }

    public void setLxid(Long lxid) {
        this.lxid = lxid;
    }

    public Long getLxid() {
        return lxid;
    }

    public void setLxname(String lxname) {
        this.lxname = lxname;
    }

    public String getLxname() {
        return lxname;
    }

    public void setUname(String uname) {
        this.uname = uname;
    }

    public String getUname() {
        return uname;
    }

    public void setBzname(String bzname) {
        this.bzname = bzname;
    }

    public String getBzname() {
        return bzname;
    }

    public BorrowApply() {
        super();
    }

    public Long getBaid() {
        return baid;
    }

    public void setBaid(Long baid) {
        this.baid = baid;
    }

    public String getRname() {
        return rname;
    }

    public void setRname(String rname) {
        this.rname = rname == null ? null : rname.trim();
    }

    public BigDecimal getMoney() {
        return money;
    }

    public void setMoney(BigDecimal money) {
        this.money = money;
    }

    public Long getUid() {
        return uid;
    }

    public void setUid(Long uid) {
        this.uid = uid;
    }

    public Long getBzid() {
        return bzid;
    }

    public void setBzid(Long bzid) {
        this.bzid = bzid;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    public Byte getState() {
        return state;
    }

    public void setState(Byte state) {
        this.state = state;
    }

    public Byte getType() {
        return type;
    }

    public void setType(Byte type) {
        this.type = type;
    }

    public Integer getTerm() {
        return term;
    }

    public void setTerm(Integer term) {
        this.term = term;
    }

    public Date getDeadline() {
        return deadline;
    }

    public void setDeadline(Date deadline) {
        this.deadline = deadline;
    }

}