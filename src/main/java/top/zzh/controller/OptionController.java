package top.zzh.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import top.zzh.common.Pager;
import top.zzh.service.OptionService;
import top.zzh.vo.TicketVo;

@Controller
@RequestMapping("option")
public class OptionController {
    @Autowired
    private OptionService optionService;
    private Logger logger= LoggerFactory.getLogger(OptionController.class);
    @GetMapping("page")
    public String page(){
        return "user/feedBack";
    }
    @RequestMapping("pager")
    @ResponseBody
    public Pager pager(int pageIndex, int pageSize, String phone) {
        return optionService.listPagerCriteria(pageIndex,pageSize,phone);
    }
}
