package top.zzh.query;

/**
 * Created by Administrator on 2018/1/5 0005.
 */
public class UserQuery {
    private Long uid;
    private String uname;//用户名
    private String phone;//手机号码
    private String email;//电子邮箱
    private String rname;//真实姓名
    private String face;//头像
    private Byte sex;//性别0男，1女
    private Byte isvip;//是否为VIP用户0是，1否
    private Long state;
    private String createTime;

    public Long getUid() {
        return uid;
    }

    public void setUid(Long uid) {
        this.uid = uid;
    }

    public String getUname() {
        return uname;
    }

    public void setUname(String uname) {
        this.uname = uname;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getRname() {
        return rname;
    }

    public void setRname(String rname) {
        this.rname = rname;
    }

    public String getFace() {
        return face;
    }

    public void setFace(String face) {
        this.face = face;
    }

    public Byte getSex() {
        return sex;
    }

    public void setSex(Byte sex) {
        this.sex = sex;
    }

    public Byte getIsvip() {
        return isvip;
    }

    public void setIsvip(Byte isvip) {
        this.isvip = isvip;
    }

    public Long getState() {
        return state;
    }

    public void setState(Long state) {
        this.state = state;
    }

    public String getCreateTime() {
        return createTime;
    }

    public void setCreateTime(String createTime) {
        this.createTime = createTime;
    }
}
