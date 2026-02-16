package com.ireps.admin.DepartmentCreation.dao;

import com.ireps.admin.DepartmentCreation.model.DepartmentAdminUnit;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class DepartmentAdminUnitDao {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    public List<DepartmentAdminUnit> getAdminUnitsByOrg(String orgCode) {
        String sql = "SELECT DISTINCT ou_code, ou_name " +
                     "FROM bv1to1.ireps_org_units " +
                     "WHERE org_code = ? AND ou_type = '4' AND ou_code <> '00' " +
                     "ORDER BY ou_name";

        return jdbcTemplate.query(
            sql,
            (rs, rowNum) -> {
                DepartmentAdminUnit au = new DepartmentAdminUnit();
                au.setOuCode(rs.getString("ou_code"));
                au.setOuName(rs.getString("ou_name"));
                return au;
            },
            orgCode
        );
    }
}
