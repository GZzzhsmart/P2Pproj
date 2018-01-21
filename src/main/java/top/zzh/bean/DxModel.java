package top.zzh.bean;

//短信模板表
public class DxModel {
    private Long dxid;

    private String content;//内容

    public DxModel(Long dxid, String content) {
        this.dxid = dxid;
        this.content = content;
    }

    public DxModel() {
        super();
    }

    public Long getDxid() {
        return dxid;
    }

    public void setDxid(Long dxid) {
        this.dxid = dxid;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content == null ? null : content.trim();
    }
}