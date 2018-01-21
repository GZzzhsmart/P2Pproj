package top.zzh.common;

import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import top.zzh.bean.HUser;
import top.zzh.bean.Permission;
import top.zzh.bean.Role;
import top.zzh.bean.User;
import top.zzh.service.HuserService;
import top.zzh.service.PermissionService;
import top.zzh.service.RoleService;
import top.zzh.service.UserService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * Created by Administrator on 2017/9/27 0027.
 */
@Component
public class ShiroRealm extends AuthorizingRealm{

    //前台用户
    @Autowired
    private UserService userService;

    //后台用户
    @Autowired
    private HuserService huserService;

    @Autowired
    private RoleService roleService;

    @Autowired
    private PermissionService permissionService;

    @Autowired
    HttpServletRequest request;


     /*
    * @param authenticationToken 包含用户名及密码的令牌对象，是由shiro传递过来的参数
    * @return
    * @throws AuthenticationException
    * */

    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authenticationToken) throws AuthenticationException {
        String username = (String)authenticationToken.getPrincipal();
        String password = String.valueOf((char[])authenticationToken.getCredentials());
        HttpSession session = request.getSession();
        //判断是否为后台登陆
        if(session.getAttribute(Constants.ADMIN_LOGIN_SESSION) != null) {
            HUser hUser = huserService.getByNamePwd(username, EncryptUtils.md5(password));
            if(hUser != null) {
                session.removeAttribute(Constants.ADMIN_LOGIN_SESSION);
                return new SimpleAuthenticationInfo(authenticationToken.getPrincipal(), authenticationToken.getCredentials(),"myReam");
            }
            return null;
        }else {
            User user=userService.getByNamePwd(username, EncryptUtils.md5(password));
            List<String> stringList= roleService.listRoles(username);
            if(user!=null && user.getState()==1 && stringList.size()!=0){
                return new SimpleAuthenticationInfo(authenticationToken.getPrincipal(),authenticationToken.getCredentials(),"myReam");
            }
            return null;
        }

    }
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principalCollection) {
        String phone = (String) principalCollection.getPrimaryPrincipal();
        SimpleAuthorizationInfo authorizationInfo = new SimpleAuthorizationInfo();
        List<Role> roleList = roleService.listByAccount(phone);
        for (Role role : roleList) {
            authorizationInfo.addRole(role.getRname());
        }
        List<Permission> permissionList = permissionService.listByAccount(phone);
        for (Permission permission : permissionList) {
            authorizationInfo.addStringPermission(permission.getDesZh());
        }
        return authorizationInfo;
    }
}
