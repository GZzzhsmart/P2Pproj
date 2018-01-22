package top.zzh.bean;

import java.util.Date;
//公司动态表
public class Dynamic {
    private Long dyid;

    private String title;//标题

    private String date;//时间

    private String content;//内容

    private String pic;//封面图片

    private Byte state;

    private String contentToSub;

    public String getContentToSub() {
        if(content.length()>=200) {
            return content.substring(0, 200);
        }else{
            return content;
        }
    }

    public Dynamic() {
    }

    public Dynamic(Long dyid, String title, String date, String content, String pic, Byte state) {
        this.dyid = dyid;
        this.title = title;
        this.date = date;
        this.content = content;
        this.pic = pic;
        this.state = state;
    }

    public Long getDyid() {
        return dyid;
    }

    public void setDyid(Long dyid) {
        this.dyid = dyid;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getPic() {
        return pic;
    }

    public void setPic(String pic) {
        this.pic = pic;
    }

    public Byte getState() {
        return state;
    }

    public void setState(Byte state) {
        this.state = state;
    }
}