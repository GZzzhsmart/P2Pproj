package top.zzh.service;

import org.jfree.chart.JFreeChart;
import org.springframework.stereotype.Service;
import top.zzh.vo.TicketVo;
import top.zzh.vo.YdateVo;

import javax.servlet.http.HttpServletRequest;
import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;

@Service
public interface YdateService extends BaseService {
    //查询日期最大的记录
    YdateVo getByMaxDate();
    //查询Id和日期
    List<YdateVo> selectIdAndDate();
    //总投资金额
    BigDecimal countTzbMoney();
    //月投资金额
    BigDecimal countMtzbMoney();
    //总注册用户数
    Integer countUserUid();
    //月用户数
    Integer countMuserUid();
    //总投资笔数
    Integer countTzbTzid();
    //月投资笔数
    Integer countMtzbTzid();
    //总贷款人数
    Integer countBApplyConBaid();
    //月投资人数
    Integer countMbApplyConBaid();
    //总贷款笔数
    Integer countBApplyBaid();
    //月贷款笔数
    Integer countMbApplyBaid();

    public void setParames(HashMap params, Long yid);
    public void setParamesPic(HashMap params, HttpServletRequest request);
    public void createSexChart(HashMap param);
    public void createAgeChart(HashMap param);
    public void createRingChart(HashMap param);

}
