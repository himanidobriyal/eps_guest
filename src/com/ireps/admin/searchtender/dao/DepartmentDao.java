package com.ireps.admin.searchtender.dao;

import com.ireps.admin.searchtender.model.Department;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class DepartmentDao {

    private final JdbcTemplate jdbcTemplate;

    public DepartmentDao(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    public List<Department> getDepartmentsByOrg(String orgCode) {
        String sql = "SELECT OU_CODE AS INT_CODE, OU_NAME AS VALUE " +
                     "FROM BV1TO1.IREPS_ORG_UNITS " +
                     "WHERE OU_TYPE='4' " +
                     "AND org_code=? " +
                     "AND OU_CODE <> '00' " +
                     "ORDER BY OU_CODE";

        return jdbcTemplate.query(sql, (rs, rowNum) -> {
            Department dept = new Department();
            dept.setIntCode(rs.getString("INT_CODE"));
            dept.setValue(rs.getString("VALUE"));
            return dept;
        }, orgCode);
    }
}
