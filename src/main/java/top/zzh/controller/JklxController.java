package top.zzh.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import top.zzh.bean.Bz;
import top.zzh.bean.Jklx;
import top.zzh.common.Pager;
import top.zzh.enums.ControllerStatusEnum;
import top.zzh.service.JklxService;
import top.zzh.vo.ControllerStatusVO;

/**
 * @version :1.0
 * CREATE TIME :2017/12/28 15:37
 * @authro :LH
 */
@Controller
@RequestMapping("jklx")
public class JklxController {
    @Autowired
    private JklxService jklxService;

    @RequestMapping("pager")
    @ResponseBody
    public Pager pager(int pageIndex, int pageSize) {
        return jklxService.listPager(pageIndex,pageSize);
    }

    @RequestMapping("jklx")
    public String init() {
        return "jklx/jklx";
    }

    @RequestMapping("save")
    @ResponseBody
    public ControllerStatusVO save(Jklx jklx){
        ControllerStatusVO statusVO = null;
        try {
            jklxService.save(jklx);
        } catch (RuntimeException e) {
            statusVO = ControllerStatusVO.status(ControllerStatusEnum.JKLX_SAVE_FAIL);
        }
        statusVO = ControllerStatusVO.status(ControllerStatusEnum.JKLX_SAVE_SUCCESS);
        return statusVO;
    }

    @RequestMapping("update")
    @ResponseBody
    public ControllerStatusVO update(Jklx jklx){
        ControllerStatusVO statusVO = null;
        try {
            jklxService.update(jklx);
        } catch (RuntimeException e) {
            statusVO = ControllerStatusVO.status(ControllerStatusEnum.JKLX_UPDATE_FAIL);
        }
        statusVO = ControllerStatusVO.status(ControllerStatusEnum.JKLX_UPDATE_SUCCESS);
        return statusVO;
    }

    @RequestMapping("delete/{lxid}")
    @ResponseBody
    public ControllerStatusVO delete( @PathVariable("lxid") Long id){
        ControllerStatusVO statusVO = null;
        try {
            jklxService.removeById(id);
        } catch (RuntimeException e) {
            statusVO = ControllerStatusVO.status(ControllerStatusEnum.JKLX_DELETE_FAIL);
        }
        statusVO = ControllerStatusVO.status(ControllerStatusEnum.JKLX_DELETE_SUCCESS);
        return statusVO;
    }

    @RequestMapping("updateState/{lxid}/{state}")
    @ResponseBody
    public ControllerStatusVO updateState(@PathVariable("lxid") Long id, @PathVariable("state") Byte state){
        ControllerStatusVO statusVO = null;
        try {
            Jklx jklx = new Jklx();
            jklx.setLxid(id);
            jklx.setState(state);
            jklxService.updateState(jklx);
        } catch (RuntimeException e) {
            statusVO = ControllerStatusVO.status(ControllerStatusEnum.JKLX_UPDATE_STATE_FAIL);
        }
        statusVO = ControllerStatusVO.status(ControllerStatusEnum.JKLX_UPDATE_STATE_SUCCESS);
        return statusVO;
    }

    @RequestMapping("findJklx/{lxid}")
    @ResponseBody
    public Jklx findJklx(@PathVariable("lxid") Long lxid){
        return  (Jklx) jklxService.getById(lxid);
    }
}
