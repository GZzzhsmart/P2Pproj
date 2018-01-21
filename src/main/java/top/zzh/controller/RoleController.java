package top.zzh.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import top.zzh.bean.Role;
import top.zzh.common.Pager;
import top.zzh.enums.ControllerStatusEnum;
import top.zzh.service.RoleService;
import top.zzh.vo.ControllerStatusVO;

/**
 * Created by XIE Shanlin on 2017.12.27.
 */
@Controller
@RequestMapping("/role")
public class RoleController {

    private Logger logger = LoggerFactory.getLogger(RoleController.class);

    @Autowired
    private RoleService roleService;

    @RequestMapping("rolePage")
    public String permissionPage() {
        return "authorityManagement/role";
    }

    @RequestMapping("roleQuery")
    @ResponseBody
    public Pager roleQuery(int pageIndex, int pageSize) {
        logger.info("查询角色");
        return roleService.listPager(pageIndex,pageSize);
    }

    @RequestMapping("addRole")
    @ResponseBody
    public ControllerStatusVO addRole(Role role){
        logger.info("超级管理员新增角色");
        try {
            roleService.addRole(role);
            return ControllerStatusVO.status(ControllerStatusEnum.ROLE_ADD_SUCCESS);
        }catch (Exception e){
            logger.error("超级管理员新增角色失败"+e.getMessage());
            return ControllerStatusVO.status(ControllerStatusEnum.ROLE_ADD_FAIL);
        }
    }

    @RequestMapping("updateRole")
    @ResponseBody
    public ControllerStatusVO updatePermission(Role role) {
        logger.info("超级管理员修改角色");
        try {
            roleService.updateRole(role);
            return ControllerStatusVO.status(ControllerStatusEnum.ROLE_UPDATE_SUCCESS);
        }catch (Exception e){
            logger.error("超级管理员修改角色失败"+e.getMessage());
            return ControllerStatusVO.status(ControllerStatusEnum.ROLE_UPDATE_FAIL);
        }
    }

    @RequestMapping("updateStatus")
    @ResponseBody
    public ControllerStatusVO updateStatus(String roleId,String status){
        logger.info("超级管理员修改角色状态");
        try{
            roleService.updateStatus(Long.valueOf(roleId),Integer.parseInt(status));
            return ControllerStatusVO.status(ControllerStatusEnum.ROLE_UPDATE_STATUS_SUCCESS);
        }catch (Exception e){
            logger.error("超级管理员修改角色状态失败："+e.getMessage());
            return ControllerStatusVO.status(ControllerStatusEnum.ROLE_UPDATE_STATUS_FAIL);
        }


    }



}
