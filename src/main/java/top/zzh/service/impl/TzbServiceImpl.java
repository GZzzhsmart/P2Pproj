package top.zzh.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import top.zzh.bean.BorrowApply;
import top.zzh.bean.Hkb;
import top.zzh.bean.LogMoney;
import top.zzh.bean.UserMoney;
import top.zzh.calculator.ACMLoanCalculator;
import top.zzh.calculator.ACPIMLoanCalculator;
import top.zzh.calculator.LoanByMonth;
import top.zzh.calculator.LoanUtil;
import top.zzh.common.DateFormateUtils;
import top.zzh.common.Pager;
import top.zzh.dao.*;
import top.zzh.enums.ControllerStatusEnum;
import top.zzh.enums.HkStateEnum;
import top.zzh.service.AbstractService;
import top.zzh.service.TzbService;
import top.zzh.vo.BorrowDetailVO;
import top.zzh.vo.ControllerStatusVO;
import top.zzh.vo.TzbVO;
import top.zzh.vo.UserMoneyVO;

import java.math.BigDecimal;
import java.util.Date;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

/**
 * Created by 曾志湖 on 2017/12/22.
 * 投资表
 */
@Service
public class TzbServiceImpl extends AbstractService implements TzbService {

    private TzbDAO tzbDAO;
    private UserMoneyDAO userMoneyDAO;
    private BorrowDetailDAO borrowDetailDAO;
    private BorrowApplyDAO borrowApplyDAO;
    private HkbDAO hkbDAO;
    private LogMoneyDAO logMoneyDAO;

    @Autowired
    public void setTzbDAO(TzbDAO tzbDAO) {
        super.setBaseDAO(tzbDAO);
        this.tzbDAO = tzbDAO;
    }


    @Override
    public void save(Object obj) {
        tzbDAO.save(obj);
    }

    @Override
    public Pager listPagerById(int pageNo, int pageSize, Long id) {
        Pager pager = new Pager(pageNo, pageSize);
        pager.setRows(tzbDAO.listPagerById(pager, id));
        pager.setTotal(tzbDAO.countById(id));
        return pager;
    }

    @Override
    public Pager listPagerByUId(int pageNo, int pageSize, Object obj) {
        Pager pager =new Pager(pageNo,pageSize);
        pager.setRows(tzbDAO.listPagerByUId(pager, obj));
        pager.setTotal(tzbDAO.getCount(obj));
        return pager;
    }



    @Override
    public Long getCount(Object obj) {
        return tzbDAO.getCount(obj);
    }

    @Transactional
    @Override
    public ControllerStatusVO add(Object obj) {
        TzbVO tzb = (TzbVO) obj;
        ControllerStatusVO statusVO = null;
        UserMoneyVO userMoneyVO=userMoneyDAO.getByUid(tzb.getUid());

        //当用户可用余额小于投资金额时，提醒用户充值
        if(userMoneyVO.getKymoney().compareTo(tzb.getMoney())==-1){
            statusVO = ControllerStatusVO.status(ControllerStatusEnum.USER_MONEY_ENOUGH);
            return  statusVO;
        }

        BigDecimal money = tzb.getMoney();
        BorrowDetailVO borrow = (BorrowDetailVO)borrowDetailDAO.findDetails(tzb.getBaid());
        //判断是否已经投过这个标
        TzbVO tzb1 = tzbDAO.listTzb(tzb.getUid(), tzb.getBaid());
        if (tzb1 == null) {
            tzb.setJuid(borrow.getUid());
            float x=borrow.getNprofit();
            double y=0.01;
            double r;
            r=x*y;
            tzb.setNprofit((float)r);

            tzb.setCpname(borrow.getCpname());
            tzbDAO.save(tzb);
            statusVO = ControllerStatusVO.status(ControllerStatusEnum.USER_TZ_SUCCESS);
        } else {
            tzb1.setMoney(tzb1.getMoney().add(money));
            tzbDAO.update(tzb1);
            statusVO = ControllerStatusVO.status(ControllerStatusEnum.CHECK_TZ_SUCCESS);
        }

        //修改自己的资产
        userMoneyVO.setKymoney(userMoneyVO.getKymoney().subtract(money));
        userMoneyVO.setZmoney(userMoneyVO.getZmoney().subtract(money));
        userMoneyVO.setTzmoney(userMoneyVO.getTzmoney().add(money));
        userMoneyVO.setUid(tzb.getUid()+"");

        //判断该标是否满标，如未满标则修改已投金额
        BorrowDetailVO borrowDetail = new BorrowDetailVO();
        borrowDetail.setMoney(borrow.getMmoney().add(money));
        borrowDetail.setBaid(borrow.getBaid());
        borrowDetailDAO.updateBybaid(borrowDetail);

        //还款期数
        Integer term = borrow.getTerm();
        //年化收益
        Float nprofit = (Float)borrow.getNprofit().floatValue();

        //月利率
        Float monthNpro = nprofit / 12;
        BigDecimal syMoney = BigDecimal.valueOf(0);
        //一次还清和先息后本
        if (borrow.getWay().equals("一次性还本付息") || borrow.getWay().equals("先息后本")) {
            //投资金额乘以年利率
            syMoney = tzb.getMoney().multiply(BigDecimal.valueOf(monthNpro / 100)).multiply(new BigDecimal(term)).setScale(2, BigDecimal.ROUND_HALF_UP);
            // 利息  =投资金 *   月利率*还款期数    取4位小数点精确到2位
        }
        //等额本息
        if (borrow.getWay().equals("等额本息")) {
            syMoney = new ACPIMLoanCalculator().calLoan(money, term, nprofit, LoanUtil.RATE_TYPE_YEAR).getTotalInterest();
        }
        // 等额本金
        if (borrow.getWay().equals("等额本金")) {
            syMoney = new ACMLoanCalculator().calLoan(money, term, nprofit, LoanUtil.RATE_TYPE_YEAR).getTotalInterest();
        }
        userMoneyVO.setDsmoney(userMoneyVO.getDsmoney().add(money.add(syMoney)));
        userMoneyVO.setZmoney(userMoneyVO.getZmoney().add(syMoney));
        userMoneyDAO.update(userMoneyVO);

        //修改借款人的冻结金额
        UserMoneyVO userMoneyVO2=userMoneyDAO.getByUid(borrow.getUid());
        userMoneyVO2.setZmoney(userMoneyVO2.getZmoney().add(money));
        userMoneyVO2.setUid(borrow.getUid()+"");

        BigDecimal sq=borrow.getMoney();
        BigDecimal xq=borrow.getMmoney().add(money);


        if (sq.compareTo(xq) == 0) {

            //满标时将借款人的冻结金额变成可用余额
            userMoneyVO2.setDjmoney(userMoneyVO2.getDjmoney().add(money).subtract(borrow.getMoney()));
            userMoneyVO2.setKymoney(userMoneyVO2.getKymoney().add(borrow.getMoney()));

            userMoneyDAO.update(userMoneyVO2);

            Long huid = borrow.getHuid();
            //一次还清的还款清单
            Calendar calendar = Calendar.getInstance();
            calendar.setTime(Calendar.getInstance().getTime());
            if (borrow.getWay().equals("一次性还本付息")) {
                Hkb hkb = new Hkb();
                hkb.setBzname(borrow.getBzname());
                hkb.setCpname(borrow.getCpname());
                hkb.setRname(borrow.getRname());
                hkb.setUid(borrow.getUid());
                hkb.setState((byte) HkStateEnum.UNREPAY.getCode());
                hkb.setYbj(borrow.getMoney());
                hkb.setDjq(1);

                syMoney = borrow.getMoney().multiply(BigDecimal.valueOf(monthNpro / 100)).multiply(new BigDecimal(term)).setScale(2, BigDecimal.ROUND_HALF_UP);


                hkb.setYlx(syMoney);
                hkb.setYbx(syMoney.add(borrow.getMoney()));
                hkb.setTnum(1);
                calendar.add(Calendar.MONTH, term);
                hkb.setYtime(calendar.getTime());
                hkb.setHuid(huid);
                hkb.setBaid(tzb.getBaid());
                hkbDAO.save(hkb);

            } else {
                List <Hkb> hkbList = new ArrayList <>();
                for (int i = 1; i <= term; i++) {
                    Hkb hkb = new Hkb();
                    hkb.setBzname(borrow.getBzname());
                    hkb.setCpname(borrow.getCpname());
                    hkb.setRname(borrow.getRname());
                    hkb.setUid(borrow.getUid());
                    hkb.setState((byte) HkStateEnum.UNREPAY.getCode());
                    hkb.setHuid(huid);
                    hkb.setTnum(term);
                    hkb.setDjq(i);
                    calendar.add(Calendar.MONTH, 1);
                    hkb.setYtime(calendar.getTime());

                    Float np2= nprofit / 100;
                    Float monthNpro2 = np2 / 12;

                    //每月利息金额
                    BigDecimal bigMonthNpro = BigDecimal.valueOf(monthNpro2);
                    //先息后本还款表
                    if (borrow.getWay().equals("先息后本")) {
                        //每月利息等于总借款乘以月利率
                        hkb.setYlx(borrow.getMoney().multiply(bigMonthNpro));

                        hkb.setYbj(BigDecimal.valueOf(0));
                        //最后一个月还本金加利息
                        if (i == term) {
                            //应还本金
                            hkb.setYbj(borrow.getMoney());
                        }

                    }
                    // 等额本金还款算法
                    else if (borrow.getWay().equals("等额本金")) {
                        LoanByMonth loanByMonth = new ACMLoanCalculator().calLoan(borrow.getMoney(), term, nprofit, LoanUtil.RATE_TYPE_YEAR).getAllLoans().get(i - 1);
                        // 月还本金
                        hkb.setYbj(loanByMonth.getPayPrincipal());
                        // 月利息
                        hkb.setYlx(loanByMonth.getInterest());

                    }
                    // 等额本息还款算法
                    else if (borrow.getWay().equals("等额本息")) {

                        LoanByMonth loanByMonth = new ACPIMLoanCalculator().calLoan(borrow.getMoney(), term, nprofit, LoanUtil.RATE_TYPE_YEAR).getAllLoans().get(i - 1);
                        //每月利息
                        hkb.setYlx(loanByMonth.getInterest());
                        //每月还款本金
                        hkb.setYbj(loanByMonth.getPayPrincipal());

                    }
                    hkb.setYbx(hkb.getYlx().add(hkb.getYbj()));

                    hkb.setBaid(tzb.getBaid());
                    hkbList.add(hkb);
                }
                hkbDAO.saveList(hkbList);
            }
        } else {
            userMoneyVO2.setDjmoney(userMoneyVO2.getDjmoney().add(money));
            userMoneyDAO.update(userMoneyVO2);
        }

        //新增流水记录
        LogMoney logMoney = new LogMoney();
        logMoney.setType((byte) 4);
        logMoney.setIn(new BigDecimal(0));
        logMoney.setOut(money);
        logMoney.setUid(tzb.getUid());
        logMoneyDAO.save(logMoney);

        return statusVO;
    }

    @Override
    public Long count() {
        return tzbDAO.count();
    }


    @Autowired
    public void setBorrowDetailDAO(BorrowDetailDAO borrowDetailDAO) {
        this.borrowDetailDAO = borrowDetailDAO;
    }


    @Autowired
    public void setUserMoneyDAO(UserMoneyDAO userMoneyDAO) {
        this.userMoneyDAO = userMoneyDAO;
    }

    @Autowired
    public void setHkbDAO(HkbDAO hkbDAO) {
        this.hkbDAO = hkbDAO;
    }

    @Autowired
    public void setLogMoneyDAO(LogMoneyDAO logMoneyDAO) {
        this.logMoneyDAO = logMoneyDAO;
    }

    @Autowired
    public void setBorrowApplyDAO(BorrowApplyDAO borrowApplyDAO) {
        this.borrowApplyDAO = borrowApplyDAO;
    }
}