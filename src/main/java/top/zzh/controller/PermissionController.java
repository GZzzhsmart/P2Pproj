package top.zzh.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import top.zzh.bean.Permission;
import top.zzh.common.Pager;
import top.zzh.enums.ControllerStatusEnum;
import top.zzh.service.PermissionService;
import top.zzh.vo.ControllerStatusVO;

/**
 * Created by XIE Shanlin on 2017.12.27.
 */
@Controller
@RequestMapping("/permission")
public class PermissionController {

    private Logger logger = LoggerFactory.getLogger(PermissionController.class);

    @Autowired
    private PermissionService permissionService;

    @RequestMapping("permissionPage")
    public String permissionPage() {
        return "authorityManagement/permission";
    }

    @RequestMapping("permissionCriteriaQuery")
    @ResponseBody
    public Pager permissionByCriteria(int pageIndex, int pageSize,Permission permission) {
        logger.info("按条件查询权限");
        return permissionService.permissionListPagerCriteria(pageIndex,pageSize,permission);
    }

    @RequestMapping("addPermission")
    @ResponseBody
    public ControllerStatusVO addPermission(Permission permission){
        logger.info("超级管理员新增权限");
        try {
            permissionService.addPermission(permission);
            return ControllerStatusVO.status(ControllerStatusEnum.PERMISSION_ADD_SUCCESS);
        }catch (Exception e){
            logger.error("超级管理员新增权限失败"+e.getMessage());
            return ControllerStatusVO.status(ControllerStatusEnum.PERMISSION_ADD_FAIL);
        }
    }

    @RequestMapping("updatePermission")
    @ResponseBody
    public ControllerStatusVO updatePermission(Permission permission) {
        logger.info("超级管理员修改权限");
        try {

            permissionService.updatePermission(permission);
            return ControllerStatusVO.status(ControllerStatusEnum.PERMISSION_UPDATE_SUCCESS);
        }catch (Exception e){
            logger.error("超级管理员修改权限失败"+e.getMessage());
            return ControllerStatusVO.status(ControllerStatusEnum.PERMISSION_UPDATE_FAIL);
        }
    }

    @RequestMapping("updateStatus")
    @ResponseBody
    public ControllerStatusVO updateStatus(String permissionId,String status){
        try{
            permissionService.updateStatus(Integer.parseInt(permissionId),Integer.parseInt(status));
            return ControllerStatusVO.status(ControllerStatusEnum.PERMISSION_UPDATE_STATUS_SUCCESS);
        }catch (Exception e){
            logger.error("超级管理员修改状态失败"+e.getMessage());
            return ControllerStatusVO.status(ControllerStatusEnum.PERMISSION_UPDATE_STATUS_FAIL);
        }


    }






}
