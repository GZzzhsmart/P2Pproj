package top.zzh.vo;

import java.sql.Timestamp;

/**
 * Created by 曾志湖 on 2017/12/26.
 * 借款审核VO
 */
public class ShBorrowVO {

    private Long shid;
    private Long huid;//审核人id
    private String rname;//审核人姓名
    private Integer isok;//审核是否通过（0未通过，1已通过）
    private String excute;//审核理由
    private String date;//审核时间
    private Long baid;//借款人id
    private String nickname;//借款人姓名

    public ShBorrowVO() {
    }

    public ShBorrowVO(Long shid, Long huid, String rname, Integer isok, String excute, String date, Long baid, String nickname) {
        this.shid = shid;
        this.huid = huid;
        this.rname = rname;
        this.isok = isok;
        this.excute = excute;
        this.date = date;
        this.baid = baid;
        this.nickname = nickname;
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

    public String getRname() {
        return rname;
    }

    public void setRname(String rname) {
        this.rname = rname;
    }

    public Integer getIsok() {
        return isok;
    }

    public void setIsok(Integer isok) {
        this.isok = isok;
    }

    public String getExcute() {
        return excute;
    }

    public void setExcute(String excute) {
        this.excute = excute;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public Long getBaid() {
        return baid;
    }

    public void setBaid(Long baid) {
        this.baid = baid;
    }

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }
}
