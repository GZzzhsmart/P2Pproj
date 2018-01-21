package top.zzh.dao;

import org.springframework.stereotype.Repository;
import top.zzh.vo.TicketVo;
import top.zzh.vo.YdateVo;

import javax.persistence.criteria.CriteriaBuilder;
import java.math.BigDecimal;
import java.util.List;

@Repository
public interface YdateDAO extends BaseDAO {
    YdateVo getByMaxDate();
    List<YdateVo> selectIdAndDate();
    BigDecimal countTzbMoney();
    BigDecimal countMtzbMoney();
    Integer countUserUid();
    Integer countMuserUid();
    Integer countTzbTzid();
    Integer countMtzbTzid();
    Integer countBApplyConBaid();
    Integer countMbApplyConBaid();
    Integer countBApplyBaid();
    Integer countMbApplyBaid();

}
