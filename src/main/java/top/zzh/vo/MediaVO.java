package top.zzh.vo;

public class MediaVO {
    private Long mid;

    private String title;//标题

    private String content;//内容

    private String pic;//封面图片

    private String date;//时间

    private String url;//报道的URL地址

    private Byte state;//状态

    private String contentToSub;

    public MediaVO() {
    }

    public MediaVO(Long mid, String title, String content, String pic, String date, String url, Byte state, String contentToSub) {
        this.mid = mid;
        this.title = title;
        this.content = content;
        this.pic = pic;
        this.date = date;
        this.url = url;
        this.state = state;
        this.contentToSub = contentToSub;
    }

    public String getContentToSub() {
        if(content.length()>=200) {
            return content.substring(0, 200);
        }else{
            return content;
        }
    }
    public Long getMid() {
        return mid;
    }

    public void setMid(Long mid) {
        this.mid = mid;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
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

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public Byte getState() {
        return state;
    }

    public void setState(Byte state) {
        this.state = state;
    }
}
