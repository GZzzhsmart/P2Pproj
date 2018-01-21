package top.zzh.query;


public class LoginLogQuery {

    private Long id;
    private Long userId;
    private String loginTime;
    private Integer isOnline;
    private String uname;
    private String loginIp;
    private String logoutTime;

    public LoginLogQuery() {
    }

    public LoginLogQuery(Long id, Long userId, String loginTime, Integer isOnline, String uname, String loginIp, String logoutTime) {
        this.id = id;
        this.userId = userId;
        this.loginTime = loginTime;
        this.isOnline = isOnline;
        this.uname = uname;
        this.loginIp = loginIp;
        this.logoutTime = logoutTime;
    }

    public void setLoginIp(String loginIp) {
        this.loginIp = loginIp;
    }

    public String getLoginIp() {
        return loginIp;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public String getLoginTime() {
        return loginTime;
    }

    public void setLoginTime(String loginTime) {
        this.loginTime = loginTime;
    }

    public Integer getIsOnline() {
        return isOnline;
    }

    public void setIsOnline(Integer isOnline) {
        this.isOnline = isOnline;
    }

    public String getUname() {
        return uname;
    }

    public void setUname(String uname) {
        this.uname = uname;
    }

    public String getLogoutTime() {
        return logoutTime;
    }

    public void setLogoutTime(String logoutTime) {
        this.logoutTime = logoutTime;
    }
}
