package com.ireps.admin.itemmaster.dao;

import com.ireps.admin.itemmaster.model.Department;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

@Repository  // Marks this as a DAO bean
public class ItemDepartmentDao {

    @Autowired
    private JdbcTemplate jdbcTemplate;  // Inject JdbcTemplate

    public List<Department> getDepartments() {
        String sql = "SELECT OU_CODE AS DEPARTMENT_ID, OU_NAME AS DEPARTMENT_NAME " +
                     "FROM BV1TO1.IREPS_ORG_UNITS " +
                     "WHERE OU_TYPE='4' AND ORG_CODE=01 AND OU_CODE <> '00' " +
                     "AND OU_CODE IN ('19','04','05','06','18')";

        return jdbcTemplate.query(sql, (rs, rowNum) -> {
            Department dept = new Department();
            dept.setDeptId(rs.getString("DEPARTMENT_ID"));
            dept.setDeptName(rs.getString("DEPARTMENT_NAME"));
            return dept;
        });
    }
}
