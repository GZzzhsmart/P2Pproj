package top.zzh.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import top.zzh.common.Pager;
import top.zzh.service.BorrowDetailService;
import top.zzh.vo.BorrowApplyVO;
import top.zzh.vo.BorrowDetailVO;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by 曾志湖 on 2017/12/24.
 * 借款详情
 */
@Controller
@RequestMapping("/borrowdetail")
public class BorrowDetailController {

    private Logger logger = LoggerFactory.getLogger(BorrowDetailController.class);
    @Autowired
    private BorrowDetailService borrowDetailService;



    @RequestMapping("pager_criteria")
    @ResponseBody
    public Pager pagerCriteria(int pageIndex, int pageSize, BorrowApplyVO borrowDetail) {
        logger.info("借款详情信息分页+条件查询");
        return borrowDetailService.listPagerCriteria(pageIndex, pageSize, borrowDetail);
    }

    @RequestMapping("detailView")
    public String detailView(HttpServletRequest request, String row){
        String baid = null;
        if(row.contains(",")){
            String rowString[] = row.split(",");
            for(int i=0;i<rowString.length;i++){
                baid = rowString[i];
            }
            BorrowDetailVO borrowDetailVO = borrowDetailService.find(Long.valueOf(baid));
            request.setAttribute("borrowDetailVO",borrowDetailVO);
            return "manager/borrowdetail";
        }
        BorrowDetailVO borrowDetailVO = borrowDetailService.find(Long.valueOf(row));
        request.setAttribute("borrowDetailVO",borrowDetailVO);
        return "manager/borrowdetail";
    }

}
