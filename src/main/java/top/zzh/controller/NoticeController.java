package top.zzh.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import top.zzh.bean.Notice;
import top.zzh.common.Pager;
import top.zzh.enums.ControllerStatusEnum;
import top.zzh.service.NoticeService;
import top.zzh.vo.ControllerStatusVO;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

/**
 * @version :1.0
 * CREATE TIME :2018/1/2 11:16
 * @authro :LH
 */
@Controller
@RequestMapping("notice")
public class NoticeController {

    @Autowired
    private NoticeService noticeService;


    @RequestMapping("pager")
    @ResponseBody
    public Pager pager(int pageIndex, int pageSize) {
        return noticeService.listPager(pageIndex,pageSize);
    }

    @RequestMapping("initPager/{pageIndex}")
    public String initPager(int pageIndex,HttpServletRequest request) {
        List<Object> noticeList = new ArrayList<>();
        if (pageIndex==0){
            pageIndex=1;
        }
        noticeList = noticeService.listNotice(pageIndex,5);
        request.setAttribute("noticeList",noticeList);
        return "index/ad";
    }

    @RequestMapping("notice")
    public String init() {
        return "notice/notice";
    }

    @RequestMapping("add")
    public String add() {
        return "notice/noticeAdd";
    }

    @RequestMapping("initNotice/{nid}")
    public String initNotice(@PathVariable("nid") Long nid ,HttpServletRequest request) {
        Notice notice = (Notice) noticeService.getById(nid);
        request.setAttribute("notice",notice);
        return "notice/initNoticce";
    }

    @RequestMapping("findNotice/{nid}")
    public String findNotice(@PathVariable("nid") Long nid ,HttpServletRequest request) {
        Notice notice = (Notice) noticeService.getById(nid);
        request.setAttribute("notice",notice);
        return "notice/findNotice";
    }

    @RequestMapping("initUpdate/{nid}")
    public String initUpdate(@PathVariable("nid") Long nid  ,HttpServletRequest request) {
        Notice notice = (Notice) noticeService.getById(nid);
        request.setAttribute("notice",notice);
        return "notice/noticeUpdate";
    }



    @RequestMapping("save")
    public String save(Notice notice, HttpServletRequest request){
        noticeService.save(notice);
        request.setAttribute("statusVO", "新增成功");
        return "notice/notice";
    }

    @RequestMapping("update")
    public String update(Notice notice, HttpServletRequest request){

        ControllerStatusVO statusVO = null;
        try {
            noticeService.update(notice);
        } catch (RuntimeException e) {
            statusVO = ControllerStatusVO.status(ControllerStatusEnum.NOTICE_SAVE_FAIL);
            request.setAttribute("statusVO", statusVO);
        }
        statusVO = ControllerStatusVO.status(ControllerStatusEnum.NOTICE_SAVE_SUCCESS);
        request.setAttribute("statusVO", "修改成功");
        return "notice/notice";
    }

    @RequestMapping("delete/{nid}")
    @ResponseBody
    public ControllerStatusVO delete( @PathVariable("nid") Long id){
        ControllerStatusVO statusVO = null;
        try {
            noticeService.removeById(id);
        } catch (RuntimeException e) {
            statusVO = ControllerStatusVO.status(ControllerStatusEnum.FRIEND_DELETE_FAIL);
        }
        statusVO = ControllerStatusVO.status(ControllerStatusEnum.FRIEND_DELETE_SUCCESS);
        return statusVO;
    }




}
