package top.zzh.bean;

//后台用户表
public class HUser {
    private Long huid;

    private String rname;//真实姓名

    private Byte sex;//性别（0男，1女）

    private String phone;//手机号码

    private String huname;//用户名称

    private Integer oid;//所属组id

    private String oname;//组名称

    private String email;//电子邮箱

    private Long state;

    private String hpwd;


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

    public Byte getSex() {
        return sex;
    }

    public void setSex(Byte sex) {
        this.sex = sex;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getHuname() {
        return huname;
    }

    public void setHuname(String huname) {
        this.huname = huname;
    }

    public Integer getOid() {
        return oid;
    }

    public void setOid(Integer oid) {
        this.oid = oid;
    }

    public String getOname() {
        return oname;
    }

    public void setOname(String oname) {
        this.oname = oname;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Long getState() {
        return state;
    }

    public void setState(Long state) {
        this.state = state;
    }

    public String getHpwd() {
        return hpwd;
    }

    public void setHpwd(String hpwd) {
        this.hpwd = hpwd;
    }
}