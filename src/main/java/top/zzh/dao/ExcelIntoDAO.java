package top.zzh.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import top.zzh.bean.Permission;

import java.util.List;

/**
 * Created by XIE Shanlin on 2017.12.26.
 */
@Repository
public interface ExcelIntoDAO extends BaseDAO{

    void intoDB(@Param("permissionList") List<Permission> permissionList);
}
