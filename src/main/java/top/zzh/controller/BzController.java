package top.zzh.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import top.zzh.bean.Bz;
import top.zzh.bean.Sway;
import top.zzh.common.Pager;
import top.zzh.enums.ControllerStatusEnum;
import top.zzh.service.BzService;
import top.zzh.vo.ControllerStatusVO;

/**
 * @version :1.0
 * CREATE TIME :2017/12/28 14:58
 * @authro :LH
 */
@Controller
@RequestMapping("bz")
public class BzController {

    @Autowired
    private BzService bzService;

    @RequestMapping("pager")
    @ResponseBody
    public Pager pager(int pageIndex, int pageSize) {
        return bzService.listPager(pageIndex,pageSize);
    }

    @RequestMapping("bz")
    public String init() {
        return "bz/bz";
    }

    @RequestMapping("save")
    @ResponseBody
    public ControllerStatusVO save(Bz bz){
        ControllerStatusVO statusVO = null;
        try {
            bzService.save(bz);
        } catch (RuntimeException e) {
            statusVO = ControllerStatusVO.status(ControllerStatusEnum.BZ_SAVE_FAIL);
        }
        statusVO = ControllerStatusVO.status(ControllerStatusEnum.BZ_SAVE_SUCCESS);
        return statusVO;
    }

    @RequestMapping("update")
    @ResponseBody
    public ControllerStatusVO update(Bz bz){
        ControllerStatusVO statusVO = null;
        try {
            bzService.update(bz);
        } catch (RuntimeException e) {
            statusVO = ControllerStatusVO.status(ControllerStatusEnum.BZ_UPDATE_FAIL);
        }
        statusVO = ControllerStatusVO.status(ControllerStatusEnum.BZ_UPDATE_SUCCESS);
        return statusVO;
    }

    @RequestMapping("delete/{bzid}")
    @ResponseBody
    public ControllerStatusVO delete( @PathVariable("bzid") Long id){
        ControllerStatusVO statusVO = null;
        try {
            bzService.removeById(id);
        } catch (RuntimeException e) {
            statusVO = ControllerStatusVO.status(ControllerStatusEnum.BZ_DELETE_FAIL);
        }
        statusVO = ControllerStatusVO.status(ControllerStatusEnum.BZ_DELETE_SUCCESS);
        return statusVO;
    }

    @RequestMapping("updateState/{bzid}/{state}")
    @ResponseBody
    public ControllerStatusVO updateState(@PathVariable("bzid") Long id, @PathVariable("state") Byte state){
        ControllerStatusVO statusVO = null;
        try {
            Bz bz = new Bz();
            bz.setBzid(id);
            bz.setState(state);
            bzService.updateState(bz);
        } catch (RuntimeException e) {
            statusVO = ControllerStatusVO.status(ControllerStatusEnum.BZ_UPDATE_STATE_FAIL);
        }
        statusVO = ControllerStatusVO.status(ControllerStatusEnum.BZ_UPDATE_STATE_SUCCESS);
        return statusVO;
    }

    @RequestMapping("findBz/{bzid}")
    @ResponseBody
    public Bz findBz(@PathVariable("bzid") Long bzid){
        return  (Bz) bzService.getById(bzid);
    }
}
