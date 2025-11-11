package com.ireps.admin.viewireps.dao;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import com.ireps.admin.viewireps.model.ViewDepartment;

@Repository
public class ViewDepartmentDao {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    public List<ViewDepartment> findDepartments(String orgCode, String orgZone) {
        String sql = "SELECT DISTINCT u.OU_NAME AS SUB_UNIT_DEPT_NAME, " +
                     "d.ORG_SUBUNIT_DEPT " +
                     "FROM bv1to1.ireps_department_master d " +
                     "JOIN bv1to1.IREPS_ORG_UNITS u " +
                     "ON u.ORG_SUBUNIT_DEPT = d.ORG_SUBUNIT_DEPT " +
                     "WHERE u.OU_TYPE LIKE '6' " +
                     "AND u.OU_CODE <> 0 " +
                     "AND u.org_code = ? " +
                     "AND d.org_zone LIKE ? " +
                     "AND d.org_code LIKE ? " +
                     "ORDER BY SUB_UNIT_DEPT_NAME";

        return jdbcTemplate.query(
            sql,
            new Object[]{orgCode, orgZone, orgCode},
            new BeanPropertyRowMapper<>(ViewDepartment.class)
        );
    }
}
