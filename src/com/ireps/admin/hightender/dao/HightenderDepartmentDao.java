package com.ireps.admin.hightender.dao;

import com.ireps.admin.hightender.model.HightenderDepartment;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.ArrayList;

@Repository
public class HightenderDepartmentDao {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    public List<HightenderDepartment> getDepartmentsByOrgAndZone(String orgCode, String zoneCode) {
        System.out.println("=== DEBUG HightenderDepartmentDao ===");
        System.out.println("Getting departments for orgCode: " + orgCode + ", zoneCode: " + zoneCode);

        // Test access to key tables
        try {
            Integer testCount = jdbcTemplate.queryForObject(
                "SELECT COUNT(*) FROM bv1to1.ireps_org_units WHERE ou_type=4 AND ROWNUM <= 5", 
                Integer.class);
            System.out.println("Departments table test count (org_units): " + testCount);
        } catch (Exception e) {
            System.err.println("Cannot access ireps_org_units: " + e.getMessage());
        }

        try {
            Integer deptMasterCount = jdbcTemplate.queryForObject(
                "SELECT COUNT(*) FROM bv1to1.ireps_department_master WHERE ROWNUM <= 5", 
                Integer.class);
            System.out.println("Department master table test count: " + deptMasterCount);
        } catch (Exception e) {
            System.err.println("Cannot access ireps_department_master: " + e.getMessage());
        }

        // --- Primary Query (org_units)
        String sql1 = "SELECT DISTINCT ou_code, ou_name " +
                      "FROM bv1to1.ireps_org_units " +
                      "WHERE ou_type=? AND ou_code <> ? AND org_code = ? AND org_zone = ? " +
                      "ORDER BY ou_name";

        System.out.println("Department Query SQL: " + sql1);
        System.out.println("Parameters: ou_type=4, ou_code<>00, org_code=" + orgCode + ", org_zone=" + zoneCode);

        try {
            List<HightenderDepartment> departments = jdbcTemplate.query(sql1,
                new Object[]{"4", "00", orgCode, zoneCode}, new HightenderDepartmentRowMapper());
            System.out.println("Departments found from org_units: " + departments.size());

            if (!departments.isEmpty()) {
                for (HightenderDepartment dept : departments) {
                    System.out.println("Dept: " + dept.getDeptCode() + " - " + dept.getDeptName());
                }
                return departments;
            }
        } catch (Exception e) {
            System.err.println("Error in org_units department query: " + e.getMessage());
        }

        // --- Secondary Query (department_master)
        try {
            System.out.println("Trying department_master table...");
            String sql2 = "SELECT DISTINCT org_subunit_dept AS ou_code, " +
                         "(SELECT ou_name FROM bv1to1.ireps_org_units " +
                         " WHERE ou_code = dm.org_subunit_dept AND org_code = dm.org_code) AS ou_name " +
                         "FROM bv1to1.ireps_department_master dm " +
                         "WHERE org_code = ? AND org_zone = ? " +
                         "ORDER BY ou_name";

            List<HightenderDepartment> departments = jdbcTemplate.query(sql2,
                new Object[]{orgCode, zoneCode}, new HightenderDepartmentRowMapper());

            System.out.println("Departments found from department_master: " + departments.size());
            for (HightenderDepartment dept : departments) {
                System.out.println("Dept: " + dept.getDeptCode() + " - " + dept.getDeptName());
            }

            return departments;
        } catch (Exception e) {
            System.err.println("Error in department_master query: " + e.getMessage());
        }

        // --- Final Fallback (just org_units by org_code)
        try {
            System.out.println("Trying fallback department query...");
            String sql3 = "SELECT DISTINCT ou_code, ou_name " +
                         "FROM bv1to1.ireps_org_units " +
                         "WHERE ou_type=4 AND org_code = ? AND ou_name IS NOT NULL " +
                         "ORDER BY ou_name";

            List<HightenderDepartment> departments = jdbcTemplate.query(sql3,
                new Object[]{orgCode}, new HightenderDepartmentRowMapper());
            System.out.println("Departments found from fallback: " + departments.size());
            return departments;
        } catch (Exception e) {
            System.err.println("Fallback department query also failed: " + e.getMessage());
            return new ArrayList<>();
        }
    }

    // === Inner RowMapper class ===
    private static class HightenderDepartmentRowMapper implements RowMapper<HightenderDepartment> {
        @Override
        public HightenderDepartment mapRow(ResultSet rs, int rowNum) throws SQLException {
            HightenderDepartment dept = new HightenderDepartment();
            dept.setDeptCode(rs.getString("ou_code"));
            dept.setDeptName(rs.getString("ou_name"));
            System.out.println("Mapped department: " + dept.getDeptCode() + " - " + dept.getDeptName());
            return dept;
        }
    }
}
