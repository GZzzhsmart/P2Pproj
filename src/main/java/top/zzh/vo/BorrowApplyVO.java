package top.zzh.vo;

import java.math.BigDecimal;

/**
 * Created by 曾志湖 on 2017/12/25.
 */
public class BorrowApplyVO {
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

    private BigDecimal money;//金额

    private Float nprofit;//年化收益

    private Long sid;

    private String way;//收益方式

    private String cpname;//产品名称

    private Long baid;//借款人id，baid为t_borrowapply表id

    private String rname;

    public BorrowApplyVO(Long sid,String rname,Long bdid, String fpic, String ypic, String qpic, String tpic, String mpurpose, String hksource, String suggest, String xmdescrip, String guarantee, BigDecimal money, Float nprofit, String way, String cpname, Long baid) {
        this.bdid = bdid;
        this.fpic = fpic;
        this.ypic = ypic;
        this.qpic = qpic;
        this.sid = sid;
        this.rname = rname;
        this.tpic = tpic;
        this.mpurpose = mpurpose;
        this.hksource = hksource;
        this.suggest = suggest;
        this.xmdescrip = xmdescrip;
        this.guarantee = guarantee;
        this.money = money;
        this.nprofit = nprofit;
        this.way = way;
        this.cpname = cpname;
        this.baid = baid;

    }

    public void setSid(Long sid) {
        this.sid = sid;
    }

    public Long getSid() {
        return sid;
    }

    public void setRname(String rname) {
        this.rname = rname;
    }

    public String getRname() {
        return rname;
    }

    public BorrowApplyVO() {
        super();
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
        this.fpic = fpic == null ? null : fpic.trim();
    }

    public String getYpic() {
        return ypic;
    }

    public void setYpic(String ypic) {
        this.ypic = ypic == null ? null : ypic.trim();
    }

    public String getQpic() {
        return qpic;
    }

    public void setQpic(String qpic) {
        this.qpic = qpic == null ? null : qpic.trim();
    }

    public String getTpic() {
        return tpic;
    }

    public void setTpic(String tpic) {
        this.tpic = tpic == null ? null : tpic.trim();
    }

    public String getMpurpose() {
        return mpurpose;
    }

    public void setMpurpose(String mpurpose) {
        this.mpurpose = mpurpose == null ? null : mpurpose.trim();
    }

    public String getHksource() {
        return hksource;
    }

    public void setHksource(String hksource) {
        this.hksource = hksource == null ? null : hksource.trim();
    }

    public String getSuggest() {
        return suggest;
    }

    public void setSuggest(String suggest) {
        this.suggest = suggest == null ? null : suggest.trim();
    }

    public String getXmdescrip() {
        return xmdescrip;
    }

    public void setXmdescrip(String xmdescrip) {
        this.xmdescrip = xmdescrip == null ? null : xmdescrip.trim();
    }

    public String getGuarantee() {
        return guarantee;
    }

    public void setGuarantee(String guarantee) {
        this.guarantee = guarantee == null ? null : guarantee.trim();
    }

    public BigDecimal getMoney() {
        return money;
    }

    public void setMoney(BigDecimal money) {
        this.money = money;
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
        this.way = way == null ? null : way.trim();
    }

    public String getCpname() {
        return cpname;
    }

    public void setCpname(String cpname) {
        this.cpname = cpname == null ? null : cpname.trim();
    }

    public Long getBaid() {
        return baid;
    }

    public void setBaid(Long baid) {
        this.baid = baid;
    }

}
