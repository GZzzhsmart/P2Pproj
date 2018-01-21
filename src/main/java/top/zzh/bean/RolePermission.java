package top.zzh.bean;

//import org.joda.time.DateTime;

/**
 * Created by Administrator on 2017/12/21 0021.
 */
public class RolePermission {
    private Integer id;
    private Integer roleId;
    private Integer permissionId;
//    private DateTime setTime;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getRoleId() {
        return roleId;
    }

    public void setRoleId(Integer roleId) {
        this.roleId = roleId;
    }

    public Integer getPermissionId() {
        return permissionId;
    }

    public void setPermissionId(Integer permissionId) {
        this.permissionId = permissionId;
    }

//    public DateTime getSetTime() {
//        return setTime;
//    }
//
//    public void setSetTime(DateTime setTime) {
//        this.setTime = setTime;
//    }
}
