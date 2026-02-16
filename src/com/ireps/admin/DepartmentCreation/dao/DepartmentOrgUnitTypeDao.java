package com.ireps.admin.DepartmentCreation.dao;

import com.ireps.admin.DepartmentCreation.model.DepartmentOrgUnitType;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class DepartmentOrgUnitTypeDao {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    public List<DepartmentOrgUnitType> getOrgUnitTypesByOrg(String orgCode) {
        String sql = "SELECT DISTINCT ou_code, ou_name " +
                     "FROM bv1to1.ireps_org_units " +
                     "WHERE org_code = ? AND ou_type = '3' AND ou_code <> '00' " +
                     "ORDER BY ou_name";

        return jdbcTemplate.query(
            sql,
            (rs, rowNum) -> {
                DepartmentOrgUnitType ou = new DepartmentOrgUnitType();
                ou.setOuCode(rs.getString("ou_code"));
                ou.setOuName(rs.getString("ou_name"));
                return ou;
            },
            orgCode
        );
    }
}
