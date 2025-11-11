package com.ireps.admin.searchtender.dao;

import com.ireps.admin.searchtender.model.Unit;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class UnitDao {

    private final JdbcTemplate jdbcTemplate;

    public UnitDao(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    // Case 1: Work area not selected (-1)
    public List<Unit> getUnitsForAllWorkAreas(String orgCode) {
        String sql = "SELECT idm.department_id AS INT_CODE, idm.department_name AS VALUE " +
                     "FROM bv1to1.ireps_department_master idm, bv1to1.ireps_workarea_dtls iwd " +
                     "WHERE iwd.ref_type=2 " +
                     "AND idm.department_id=iwd.ref_id " +
                     "AND iwd.work_area IN ('PT', 'WT') " +
                     "AND iwd.WORKAREA_STATUS=0 " +
                     "AND idm.org_code=? " +
                     "AND idm.dept_type <> 0";

        return jdbcTemplate.query(sql, (rs, rowNum) -> {
            Unit unit = new Unit();
            unit.setIntCode(rs.getString("INT_CODE"));
            unit.setValue(rs.getString("VALUE"));
            return unit;
        }, orgCode);
    }

    // Case 2: Specific work area selected
    public List<Unit> getUnitsByWorkArea(String workArea, String orgCode) {
        String sql = "SELECT idm.department_id AS INT_CODE, idm.department_name AS VALUE " +
                     "FROM bv1to1.ireps_department_master idm, bv1to1.ireps_workarea_dtls iwd " +
                     "WHERE iwd.ref_type=2 " +
                     "AND idm.department_id=iwd.ref_id " +
                     "AND iwd.work_area=? " +
                     "AND iwd.WORKAREA_STATUS=0 " +
                     "AND idm.org_code=? " +
                     "AND idm.dept_type <> 0";

        return jdbcTemplate.query(sql, (rs, rowNum) -> {
            Unit unit = new Unit();
            unit.setIntCode(rs.getString("INT_CODE"));
            unit.setValue(rs.getString("VALUE"));
            return unit;
        }, workArea, orgCode);
    }
}
