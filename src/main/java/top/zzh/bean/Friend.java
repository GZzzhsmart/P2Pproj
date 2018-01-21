package top.zzh.bean;

//合作伙伴表
public class Friend {
    private Long fid;

    private String furl;//链接

    private String fpic;//图片

    public Friend(Long fid, String furl, String fpic) {
        this.fid = fid;
        this.furl = furl;
        this.fpic = fpic;
    }

    public Friend() {
        super();
    }

    public Long getFid() {
        return fid;
    }

    public void setFid(Long fid) {
        this.fid = fid;
    }

    public String getFurl() {
        return furl;
    }

    public void setFurl(String furl) {
        this.furl = furl == null ? null : furl.trim();
    }

    public String getFpic() {
        return fpic;
    }

    public void setFpic(String fpic) {
        this.fpic = fpic == null ? null : fpic.trim();
    }
}