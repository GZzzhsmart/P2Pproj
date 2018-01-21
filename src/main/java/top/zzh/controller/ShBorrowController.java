package top.zzh.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import top.zzh.bean.ShBorrow;
import top.zzh.common.Pager;
import top.zzh.enums.ControllerStatusEnum;
import top.zzh.service.BorrowApplyService;
import top.zzh.service.ShBorrowService;
import top.zzh.vo.ControllerStatusVO;

/**
 * Created by 曾志湖 on 2017/12/26.
 * 借款审核
 */
@Controller
@RequestMapping("/shborrow")
public class ShBorrowController {

    private Logger logger = LoggerFactory.getLogger(ShBorrowController.class);
    @Autowired
    private ShBorrowService shBorrowService;

    @RequestMapping("page")
    public String page(){
        return "manager/shborrow";
    }

    @RequestMapping("update/{id}/{isok}")
    @ResponseBody
    public ControllerStatusVO update(@PathVariable("id") Long id,@PathVariable("isok") int isok, ShBorrow shBorrow){
        logger.info("修改审核信息");
        shBorrow.setIsok((byte)isok);
        shBorrow.setExcute(shBorrow.getExcute());
        ControllerStatusVO statusVO = null;
        try {
            shBorrowService.update(shBorrow);
            statusVO = ControllerStatusVO.status(ControllerStatusEnum.CHECK_USER_SUCCESS);
        }catch (RuntimeException e){
            statusVO = ControllerStatusVO.status(ControllerStatusEnum.CHECK_USER_FAIL);
        }
        return statusVO;
    }


}
