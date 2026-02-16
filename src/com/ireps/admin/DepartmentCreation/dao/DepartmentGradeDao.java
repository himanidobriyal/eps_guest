package com.ireps.admin.DepartmentCreation.dao;

import com.ireps.admin.DepartmentCreation.model.DepartmentGrade;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

public interface DepartmentGradeDao {
    List<DepartmentGrade> getGrades(String orgId, String zoneId, String orgSubUnitDeptId);
}

@Repository
class GradeDaoImpl implements DepartmentGradeDao {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    @Override
    public List<DepartmentGrade> getGrades(String orgId, String zoneId, String orgSubUnitDeptId) {

        // Determine the org_zone based on orgId and zoneId
        String orgZone = "01".equalsIgnoreCase(orgId) && "30".equalsIgnoreCase(zoneId) ? "30" : "00";

        // Single query now, with org_zone as parameter
        String query = "SELECT DISTINCT ipgl.grade, ipgl.grade_code " +
                       "FROM bv1to1.ireps_post_cat_master ipcm, bv1to1.ireps_post_grade_level ipgl " +
                       "WHERE ipcm.category_id = ipgl.category_id " +
                       "AND ipcm.org_zone = ? " +
                       "AND (ipcm.unit_controlling_dept = ? OR ipcm.unit_controlling_dept = '00') " +
                       "AND ipcm.org_code = ? " +
                       "ORDER BY ipgl.grade_code";

        // Execute query with parameters: orgZone, orgSubUnitDeptId, orgId
        return jdbcTemplate.query(query, new GradeRowMapper(), orgZone, orgSubUnitDeptId, orgId);
    }

    // RowMapper to map ResultSet to Grade object
    private static class GradeRowMapper implements RowMapper<DepartmentGrade> {
        @Override
        public DepartmentGrade mapRow(ResultSet rs, int rowNum) throws SQLException {
            DepartmentGrade grade = new DepartmentGrade();
            grade.setGrade(rs.getString("grade"));
            grade.setGradeCode(rs.getString("grade_code"));
            return grade;
        }
    }
}
