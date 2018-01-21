package top.zzh.bean;

import java.util.Date;

//用户反馈表
public class Option {
    private Long opid;

    private String phone;//手机号码

    private String content;//反馈内容

    private Date date;//反馈时间

    public Option(Long opid, String phone, String content, Date date) {
        this.opid = opid;
        this.phone = phone;
        this.content = content;
        this.date = date;
    }

    public Option() {
        super();
    }

    public Long getOpid() {
        return opid;
    }

    public void setOpid(Long opid) {
        this.opid = opid;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone == null ? null : phone.trim();
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content == null ? null : content.trim();
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }
}