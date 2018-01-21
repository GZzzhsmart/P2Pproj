package top.zzh.vo;

import java.math.BigDecimal;
import java.sql.Timestamp;
import java.util.Date;

/**
 * Created by 曾志湖 on 2017/12/25.
 */
public class BorrowDetailVO {

    private Long baid;
    private String rname;//真实姓名
    private BigDecimal money;//申请金额
    private Long uid;//借款人id
    private Long bzid;//标种id
    private String reason;//审核理由
    private Timestamp time;//审核时间
    private Integer state;//审核状态（0表示为审核，1表示已审核）
    private Integer type;//借款类型为标种的主键字段
    private Integer term;//借款期限
    private Timestamp deadline;//截止时间
    private Long bdid;
    private String fpic;//法人身份证照片
    private String ypic;//营业执照副本照片
    private String qpic;//企业银行账号
    private String tpic;//其他资料
    private String mpurpose;//资金用途
    private String hksource;//还款来源
    private String suggest;//借款人介绍
    private String xmdescrip;//项目描述
    private String guarantee;//保障措施
    private Float nprofit;//年化收益
    private Long juid;
    private Long lxid;
    private String lxname;
    private Long sid;
    private Long huid;
    private String way;//收益方式
    private String cpname;//产品名称
    private String bzname;//标种名称
    private String uname;//用户名
    private BigDecimal zmoney;//总资产
    private BigDecimal kymoney;//可用余额
    private BigDecimal tzmoney;//投资总金额
    private BigDecimal ytmoney;
    private BigDecimal mmoney;

    public BorrowDetailVO() {
    }

    public BorrowDetailVO(String reason,Long juid,Long huid,BigDecimal ytmoney,BigDecimal mmoney,BigDecimal zmoney,BigDecimal kymoney,BigDecimal tzmoney,Long sid,Long lxid,String lxname,Long baid, String rname, BigDecimal money, Long uid, Long bzid, Timestamp time, Integer state, Integer type, Integer term, Timestamp deadline, Long bdid, String fpic, String ypic, String qpic, String tpic, String mpurpose, String hksource, String suggest, String xmdescrip, String guarantee, Float nprofit, String way, String cpname,String bzname,String uname) {
        this.baid = baid;
        this.mmoney = mmoney;
        this.reason = reason;
        this.huid = huid;
        this.zmoney = zmoney;
        this.kymoney = kymoney;
        this.tzmoney = tzmoney;
        this.ytmoney = ytmoney;
        this.sid = sid;
        this.lxid = lxid;
        this.lxname = lxname;
        this.rname = rname;
        this.money = money;
        this.uid = uid;
        this.juid = juid;
        this.bzid = bzid;
        this.time = time;
        this.state = state;
        this.type = type;
        this.term = term;
        this.deadline = deadline;
        this.bdid = bdid;
        this.fpic = fpic;
        this.ypic = ypic;
        this.qpic = qpic;
        this.tpic = tpic;
        this.mpurpose = mpurpose;
        this.hksource = hksource;
        this.suggest = suggest;
        this.xmdescrip = xmdescrip;
        this.guarantee = guarantee;
        this.nprofit = nprofit;
        this.way = way;
        this.cpname = cpname;
        this.bzname = bzname;
        this.uname = uname;
    }

    public void setReason(String reason) {
        this.reason = reason;
    }

    public String getReason() {
        return reason;
    }

    public void setJuid(Long juid) {
        this.juid = juid;
    }

    public Long getJuid() {
        return juid;
    }

    public void setHuid(Long huid) {
        this.huid = huid;
    }

    public Long getHuid() {
        return huid;
    }

    public void setMmoney(BigDecimal mmoney) {
        this.mmoney = mmoney;
    }

    public BigDecimal getMmoney() {
        return mmoney;
    }

    public void setZmoney(BigDecimal zmoney) {
        this.zmoney = zmoney;
    }

    public BigDecimal getZmoney() {
        return zmoney;
    }

    public void setKymoney(BigDecimal kymoney) {
        this.kymoney = kymoney;
    }

    public BigDecimal getKymoney() {
        return kymoney;
    }

    public void setTzmoney(BigDecimal tzmoney) {
        this.tzmoney = tzmoney;
    }

    public BigDecimal getTzmoney() {
        return tzmoney;
    }

    public void setYtmoney(BigDecimal ytmoney) {
        this.ytmoney = ytmoney;
    }

    public BigDecimal getYtmoney() {
        return ytmoney;
    }

    public void setSid(Long sid) {
        this.sid = sid;
    }

    public Long getSid() {
        return sid;
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
        this.rname = rname;
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

    public void setTime(Timestamp time) {
        this.time = time;
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
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

    public void setDeadline(Timestamp deadline) {
        this.deadline = deadline;
    }

    public Long getBdid() {
        return bdid;
    }

    public void setBdid(Long bdid) {
        this.bdid = bdid;
    }

    public String getFpic() {
        return fpic;
    }

    public void setFpic(String fpic) {
        this.fpic = fpic;
    }

    public String getYpic() {
        return ypic;
    }

    public void setYpic(String ypic) {
        this.ypic = ypic;
    }

    public String getQpic() {
        return qpic;
    }

    public void setQpic(String qpic) {
        this.qpic = qpic;
    }

    public String getTpic() {
        return tpic;
    }

    public void setTpic(String tpic) {
        this.tpic = tpic;
    }

    public String getMpurpose() {
        return mpurpose;
    }

    public void setMpurpose(String mpurpose) {
        this.mpurpose = mpurpose;
    }

    public String getHksource() {
        return hksource;
    }

    public void setHksource(String hksource) {
        this.hksource = hksource;
    }

    public String getSuggest() {
        return suggest;
    }

    public void setSuggest(String suggest) {
        this.suggest = suggest;
    }

    public String getXmdescrip() {
        return xmdescrip;
    }

    public void setXmdescrip(String xmdescrip) {
        this.xmdescrip = xmdescrip;
    }

    public String getGuarantee() {
        return guarantee;
    }

    public void setGuarantee(String guarantee) {
        this.guarantee = guarantee;
    }

    public Float getNprofit() {
        return nprofit;
    }

    public void setNprofit(Float nprofit) {
        this.nprofit = nprofit;
    }

    public String getWay() {
        return way;
    }

    public void setWay(String way) {
        this.way = way;
    }

    public String getCpname() {
        return cpname;
    }

    public void setCpname(String cpname) {
        this.cpname = cpname;
    }

    public void setBzname(String bzname) {
        this.bzname = bzname;
    }

    public String getBzname() {
        return bzname;
    }

    public void setUname(String uname) {
        this.uname = uname;
    }

    public String getUname() {
        return uname;
    }
}
