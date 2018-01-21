package top.zzh.bean;

//角色表
public class Role {
    private Long rid;
    private String rname;//角色名称
    private String content;//角色描述
    private Integer status; //1：激活  2：冻结

    public Role(Long rid, String rname, String content, Integer status) {
        this.rid = rid;
        this.rname = rname;
        this.content = content;
        this.status = status;
    }

    public Role() {
        super();
    }

    public Long getRid() {
        return rid;
    }

    public void setRid(Long rid) {
        this.rid = rid;
    }

    public String getRname() {
        return rname;
    }

    public void setRname(String rname) {
        this.rname = rname == null ? null : rname.trim();
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content == null ? null : content.trim();
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }
}