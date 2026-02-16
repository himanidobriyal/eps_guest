package com.ireps.admin.DepartmentCreation.dao;

import com.ireps.admin.DepartmentCreation.model.DepartmentSubUnitType;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class DepartmentSubUnitTypeDao {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    public List<DepartmentSubUnitType> getSubUnitTypes(String orgCode, String orgUnitType, String adminUnitDept) {
        String sql = "SELECT DISTINCT ou_code, ou_name, ou_short_name " +
                     "FROM bv1to1.ireps_org_units " +
                     "WHERE org_code = ? AND ou_type = '5' AND ou_code <> '00' " +
                     "AND org_unit_type = ? AND UNIT_CONTROLLING_DEPT = ? " +
                     "ORDER BY ou_name";

        return jdbcTemplate.query(
            sql,
            (rs, rowNum) -> {
                DepartmentSubUnitType sub = new DepartmentSubUnitType();
                sub.setOuCode(rs.getString("ou_code"));
                sub.setOuName(rs.getString("ou_name"));
                sub.setOuShortName(rs.getString("ou_short_name"));
                return sub;
            },
            orgCode, orgUnitType, adminUnitDept
        );
    }
}
