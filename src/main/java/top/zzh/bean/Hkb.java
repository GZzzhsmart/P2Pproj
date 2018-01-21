package top.zzh.bean;

import java.math.BigDecimal;
import java.util.Date;

//还款表
public class Hkb {
    private Long hkid;

    private Long uid;//用户id

    private String rname;//真实姓名

    private String cpname;//产品名称

    private Integer rnum;//已还期数

    private Integer tnum;//总期数

    private Date ytime;//应还时间

    private Date rtime;//实际还款时间

    private String bzname;//标种名称

    private BigDecimal ybx;//应还本息

    private BigDecimal rbx;//已还本息

    private BigDecimal ylx;//应还利息

    private BigDecimal rlx;//已还利息

    private BigDecimal ybj;//应还本金

    private BigDecimal rbj;//已还本金

    private BigDecimal yfx;//应还罚息

    private BigDecimal rfx;//已还罚息

    private Integer yucount;//逾期次数

    private Byte state;//还款状态（0未还款，1已还款）

    private Long baid;//借款人id

    private Date yustartime;//逾期执行时间

    private Integer djq;//还款第几期
    private Long huid;//贷后负责人

    private Long int1;

    private String str1;

    public Hkb(Integer djq,Long hkid, Long uid, String rname, String cpname, Integer rnum, Integer tnum, Date ytime, Date rtime, String bzname, BigDecimal ybx, BigDecimal rbx, BigDecimal ylx, BigDecimal rlx, BigDecimal ybj, BigDecimal rbj, BigDecimal yfx, BigDecimal rfx, Integer yucount, Byte state, Long baid, Date yustartime, Long huid, Long int1, String str1) {
        this.hkid = hkid;
        this.djq = djq;
        this.uid = uid;
        this.rname = rname;
        this.cpname = cpname;
        this.rnum = rnum;
        this.tnum = tnum;
        this.ytime = ytime;
        this.rtime = rtime;
        this.bzname = bzname;
        this.ybx = ybx;
        this.rbx = rbx;
        this.ylx = ylx;
        this.rlx = rlx;
        this.ybj = ybj;
        this.rbj = rbj;
        this.yfx = yfx;
        this.rfx = rfx;
        this.yucount = yucount;
        this.state = state;
        this.baid = baid;
        this.yustartime = yustartime;
        this.huid = huid;
        this.int1 = int1;
        this.str1 = str1;
    }

    public Hkb() {
        super();
    }

    public void setDjq(Integer djq) {
        this.djq = djq;
    }

    public Integer getDjq() {
        return djq;
    }


    public Long getHkid() {
        return hkid;
    }

    public void setHkid(Long hkid) {
        this.hkid = hkid;
    }

    public Long getUid() {
        return uid;
    }

    public void setUid(Long uid) {
        this.uid = uid;
    }

    public String getRname() {
        return rname;
    }

    public void setRname(String rname) {
        this.rname = rname == null ? null : rname.trim();
    }

    public String getCpname() {
        return cpname;
    }

    public void setCpname(String cpname) {
        this.cpname = cpname == null ? null : cpname.trim();
    }

    public Integer getRnum() {
        return rnum;
    }

    public void setRnum(Integer rnum) {
        this.rnum = rnum;
    }

    public Integer getTnum() {
        return tnum;
    }

    public void setTnum(Integer tnum) {
        this.tnum = tnum;
    }

    public Date getYtime() {
        return ytime;
    }

    public void setYtime(Date ytime) {
        this.ytime = ytime;
    }

    public Date getRtime() {
        return rtime;
    }

    public void setRtime(Date rtime) {
        this.rtime = rtime;
    }

    public String getBzname() {
        return bzname;
    }

    public void setBzname(String bzname) {
        this.bzname = bzname == null ? null : bzname.trim();
    }

    public BigDecimal getYbx() {
        return ybx;
    }

    public void setYbx(BigDecimal ybx) {
        this.ybx = ybx;
    }

    public BigDecimal getRbx() {
        return rbx;
    }

    public void setRbx(BigDecimal rbx) {
        this.rbx = rbx;
    }

    public BigDecimal getYlx() {
        return ylx;
    }

    public void setYlx(BigDecimal ylx) {
        this.ylx = ylx;
    }

    public BigDecimal getRlx() {
        return rlx;
    }

    public void setRlx(BigDecimal rlx) {
        this.rlx = rlx;
    }

    public BigDecimal getYbj() {
        return ybj;
    }

    public void setYbj(BigDecimal ybj) {
        this.ybj = ybj;
    }

    public BigDecimal getRbj() {
        return rbj;
    }

    public void setRbj(BigDecimal rbj) {
        this.rbj = rbj;
    }

    public BigDecimal getYfx() {
        return yfx;
    }

    public void setYfx(BigDecimal yfx) {
        this.yfx = yfx;
    }

    public BigDecimal getRfx() {
        return rfx;
    }

    public void setRfx(BigDecimal rfx) {
        this.rfx = rfx;
    }

    public Integer getYucount() {
        return yucount;
    }

    public void setYucount(Integer yucount) {
        this.yucount = yucount;
    }

    public Byte getState() {
        return state;
    }

    public void setState(Byte state) {
        this.state = state;
    }

    public Long getBaid() {
        return baid;
    }

    public void setBaid(Long baid) {
        this.baid = baid;
    }

    public Date getYustartime() {
        return yustartime;
    }

    public void setYustartime(Date yustartime) {
        this.yustartime = yustartime;
    }

    public Long getHuid() {
        return huid;
    }

    public void setHuid(Long huid) {
        this.huid = huid;
    }

    public Long getInt1() {
        return int1;
    }

    public void setInt1(Long int1) {
        this.int1 = int1;
    }

    public String getStr1() {
        return str1;
    }

    public void setStr1(String str1) {
        this.str1 = str1 == null ? null : str1.trim();
    }
}