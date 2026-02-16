package com.ireps.admin.DepartmentCreation.dao;

import com.ireps.admin.DepartmentCreation.model.DepartmentAdminUnitDetail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class DepartmentAdminUnitDetailDao {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    public List<DepartmentAdminUnitDetail> getAdminUnits(String orgCode, String zoneId, String orgUnitTypeId, String subUnitTypeId) {
        String sql = "SELECT DISTINCT admin_unit, ou_name " +
                     "FROM bv1to1.ireps_org_units " +
                     "WHERE org_code = ? " +
                     "AND org_zone = ? " +
                     "AND (org_subunit_type = ? OR ? = '-1') " +
                     "AND (org_unit_type = ? OR ? = '-1') " +
                     "AND ou_type = '7' " +
                     "ORDER BY ou_name";

        return jdbcTemplate.query(
            sql,
            (rs, rowNum) -> {
                DepartmentAdminUnitDetail admin = new DepartmentAdminUnitDetail();
                admin.setAdminUnit(rs.getString("admin_unit"));
                admin.setOuName(rs.getString("ou_name"));
                return admin;
            },
            orgCode, zoneId, subUnitTypeId, subUnitTypeId, orgUnitTypeId, orgUnitTypeId
        );
    }
}
