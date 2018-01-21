package top.zzh.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import top.zzh.bean.Recommend;
import top.zzh.bean.Sway;
import top.zzh.common.Pager;
import top.zzh.enums.ControllerStatusEnum;
import top.zzh.service.SwayService;
import top.zzh.vo.ControllerStatusVO;

/**
 * @version :1.0
 * CREATE TIME :2017/12/26 11:36
 * @authro :LH
 */
@Controller
@RequestMapping("/sway")
public class SwayController {

    @Autowired
    SwayService swayService;

    @RequestMapping("pager")
    @ResponseBody
    public Pager pager(int pageIndex, int pageSize) {
        return swayService.listPager(pageIndex,pageSize);
    }

    @RequestMapping("sway")
    public String init() {
        return "Sway/Sway";
    }

    @RequestMapping("save")
    @ResponseBody
    public ControllerStatusVO save(Sway sway){
        ControllerStatusVO statusVO = null;
        try {
            swayService.save(sway);
        } catch (RuntimeException e) {
            statusVO = ControllerStatusVO.status(ControllerStatusEnum.SWAY_SAVE_FAIL);
        }
        statusVO = ControllerStatusVO.status(ControllerStatusEnum.SWAY_SAVE_SUCCESS);
        return statusVO;
    }

    @RequestMapping("update")
    @ResponseBody
    public ControllerStatusVO update(Sway sway){
        ControllerStatusVO statusVO = null;
        try {
            swayService.update(sway);
        } catch (RuntimeException e) {
            statusVO = ControllerStatusVO.status(ControllerStatusEnum.SWAY_UPDATE_FAIL);
        }
        statusVO = ControllerStatusVO.status(ControllerStatusEnum.SWAY_UPDATE_SUCCESS);
        return statusVO;
    }

    @RequestMapping("delete/{sid}")
    @ResponseBody
    public ControllerStatusVO delete( @PathVariable("sid") Long id){
        ControllerStatusVO statusVO = null;
        try {
            swayService.removeById(id);
        } catch (RuntimeException e) {
            statusVO = ControllerStatusVO.status(ControllerStatusEnum.SWAY_DELETE_FAIL);
        }
        statusVO = ControllerStatusVO.status(ControllerStatusEnum.SWAY_DELETE_SUCCESS);
        return statusVO;
    }

    @RequestMapping("updateState/{sid}/{state}")
    @ResponseBody
    public ControllerStatusVO updateState(@PathVariable("sid") Long id,@PathVariable("state") Byte state){
        ControllerStatusVO statusVO = null;
        try {
            Sway sway = new Sway();
            sway.setSid(id);
            sway.setState(state);

            swayService.updateState(sway);
        } catch (RuntimeException e) {
            statusVO = ControllerStatusVO.status(ControllerStatusEnum.SWAY_UPDATE_STATE_FAIL);
        }
        statusVO = ControllerStatusVO.status(ControllerStatusEnum.SWAY_UPDATE_STATE_SUCCESS);
        return statusVO;
    }

    @RequestMapping("findSway/{sid}")
    @ResponseBody
    public Sway findSway(@PathVariable("sid") Long sid){
        return  (Sway) swayService.getById(sid);
    }
}
