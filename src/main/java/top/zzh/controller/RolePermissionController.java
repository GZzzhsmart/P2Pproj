package top.zzh.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import top.zzh.bean.Permission;
import top.zzh.enums.ControllerStatusEnum;
import top.zzh.service.RolePermissionService;
import top.zzh.vo.ControllerStatusVO;
import top.zzh.vo.Select2;

import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by XIE Shanlin on 2018.01.04.
 */
@Controller
@RequestMapping("/rolePermission")
public class RolePermissionController {

    private Logger logger = LoggerFactory.getLogger(RolePermissionController.class);

    @Autowired
    private RolePermissionService rolePermissionService;


    @RequestMapping("rolePermissionPage")
    public String rolePermissionPage(String roleId) {
        return "authorityManagement/rolePermission";
    }

    @RequestMapping("roleList")
    @ResponseBody
    public List<Select2> role(HttpSession session){
        List<Select2> list = rolePermissionService.listRole();
        session.removeAttribute("roleId");
        return list;
    }

    @RequestMapping("permissionList")
    @ResponseBody
    public List<Permission> permissionList(){
        return rolePermissionService.listPermission();
    }


    @RequestMapping("saveOrUpdateRP")
    @ResponseBody
    public ControllerStatusVO saveOrUpdateRP(String roleId,String permissionIds){
        try {
            if(permissionIds == null || "".equals(permissionIds)){
                rolePermissionService.deleteRolePermission(roleId);
                return ControllerStatusVO.status(ControllerStatusEnum.ROLE_PERMISSION_SAVE_PERMISSION_NULL);
            }else {
                rolePermissionService.deleteRolePermission(roleId);
                rolePermissionService.saveRolePermission(roleId,permissionIds);
                return ControllerStatusVO.status(ControllerStatusEnum.ROLE_PERMISSION_SAVE_SUCCESS);
            }
        }catch (Exception e){
            logger.error("角色分配权限发生错误"+e.getMessage());
            return ControllerStatusVO.status(ControllerStatusEnum.ROLE_PERMISSION_SAVE_FAIL);
        }
    }

    @RequestMapping("initSelectedP")
    @ResponseBody
    public List<Permission> initSelectedP(String roleId){
        return rolePermissionService.initSelectedP(roleId);
    }
}
