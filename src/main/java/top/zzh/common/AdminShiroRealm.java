package top.zzh.common;

import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import top.zzh.service.HuserService;
import top.zzh.service.PermissionService;
import top.zzh.service.RoleService;

import javax.annotation.Resource;

/**
 * Created by XIE Shanlin on 2018.01.17.
 */


public class AdminShiroRealm extends AuthorizingRealm {


    private HuserService huserService;

    private RoleService roleService;

    private PermissionService permissionService;


    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principalCollection) {
        return null;
    }

    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authenticationToken) throws AuthenticationException {
        return null;
    }


    @Resource
    public void setHuserService(HuserService huserService) {
        this.huserService = huserService;
    }

    @Resource
    public void setRoleService(RoleService roleService) {
        this.roleService = roleService;
    }

    @Resource
    public void setPermissionService(PermissionService permissionService) {
        this.permissionService = permissionService;
    }
}
