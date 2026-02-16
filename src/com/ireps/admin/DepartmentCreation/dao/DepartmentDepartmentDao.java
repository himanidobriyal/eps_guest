package com.ireps.admin.DepartmentCreation.dao;

import com.ireps.admin.DepartmentCreation.model.DepartmentDepartment;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import java.util.List;

@Repository
public class DepartmentDepartmentDao {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    public List<DepartmentDepartment> getDepartmentsByOrg(String orgCode) {
        String sql = "SELECT DISTINCT ou_code, ou_name " +
                     "FROM bv1to1.IREPS_ORG_UNITS " +
                     "WHERE org_code = ? AND ou_type = '4' AND ou_code <> '00' " +
                     "ORDER BY ou_name";

        return jdbcTemplate.query(
            sql,
            (rs, rowNum) -> {
                DepartmentDepartment dept = new DepartmentDepartment();
                dept.setOuCode(rs.getString("ou_code"));
                dept.setOuName(rs.getString("ou_name"));
                return dept;
            },
            orgCode
        );
    }
}
