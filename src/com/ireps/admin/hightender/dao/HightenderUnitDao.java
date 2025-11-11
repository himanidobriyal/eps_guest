package com.ireps.admin.hightender.dao;

import com.ireps.admin.hightender.model.HightenderUnit;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.ArrayList;

@Repository
public class HightenderUnitDao {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    public List<HightenderUnit> getUnitsByDeptAndZone(String zoneCode, String deptCode) {
        System.out.println("=== DEBUG HightenderUnitDao ===");
        System.out.println("Fetching units for zoneCode: " + zoneCode + ", deptCode: " + deptCode);

        // Test table accessibility
        try {
            Integer count = jdbcTemplate.queryForObject(
                "SELECT COUNT(*) FROM bv1to1.ireps_department_master WHERE ROWNUM <= 5",
                Integer.class
            );
            System.out.println("Department master accessible, sample count: " + count);
        } catch (Exception e) {
            System.err.println("Cannot access ireps_department_master: " + e.getMessage());
            return new ArrayList<>();
        }

        // --- Primary query (matches Maven DAO) ---
        String sql = "SELECT DISTINCT dm.org_subunit_dept AS unitCode, " +
                     "       dm.department_name AS unitName " +
                     "FROM bv1to1.ireps_department_master dm " +
                     "WHERE dm.org_zone = ? AND dm.org_subunit_dept = ? " +
                     "ORDER BY dm.department_name";

        try {
            List<HightenderUnit> units = jdbcTemplate.query(sql, new Object[]{zoneCode, deptCode},
                new HightenderUnitRowMapper());
            System.out.println("Units found: " + units.size());
            return units;
        } catch (Exception e) {
            System.err.println("Primary units query failed: " + e.getMessage());
        }

        // --- Fallback: all units for the zone ---
        try {
            String fallbackSql = "SELECT DISTINCT dm.org_subunit_dept AS unitCode, " +
                                 "       dm.department_name AS unitName " +
                                 "FROM bv1to1.ireps_department_master dm " +
                                 "WHERE dm.org_zone = ? " +
                                 "ORDER BY dm.department_name";

            List<HightenderUnit> fallbackUnits = jdbcTemplate.query(fallbackSql, new Object[]{zoneCode},
                new HightenderUnitRowMapper());
            System.out.println("Fallback units found: " + fallbackUnits.size());
            return fallbackUnits;
        } catch (Exception e2) {
            System.err.println("Fallback units query failed: " + e2.getMessage());
            return new ArrayList<>();
        }
    }

    private static class HightenderUnitRowMapper implements RowMapper<HightenderUnit> {
        @Override
        public HightenderUnit mapRow(ResultSet rs, int rowNum) throws SQLException {
            HightenderUnit unit = new HightenderUnit();
            unit.setUnitCode(rs.getString("unitCode"));
            unit.setUnitName(rs.getString("unitName"));
            System.out.println("Mapped unit: " + unit.getUnitCode() + " - " + unit.getUnitName());
            return unit;
        }
    }
}
