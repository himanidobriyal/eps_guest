package com.ireps.admin.DepartmentCreation.dao;

import com.ireps.admin.DepartmentCreation.model.DepartmentDesignation;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class DepartmentDesignationDao {

    private final JdbcTemplate jdbcTemplate;

    public DepartmentDesignationDao(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    private final RowMapper<DepartmentDesignation> rowMapper = (rs, rowNum) ->
            new DepartmentDesignation(rs.getString("CATEGORY_ID"), rs.getString("DESIG_PREFIX"));

    public List<DepartmentDesignation> getDesignations(String orgId, String zoneId, String deptId, String gradeId) {

        // Only "30" is kept as is; any other zone (including empty/null) defaults to "00"
        String zoneParam = "30".equals(zoneId) ? "30" : "00";
        String deptParam = (deptId == null || deptId.trim().isEmpty()) ? "00" : deptId.trim();
        String orgParam  = (orgId == null || orgId.trim().isEmpty()) ? "00" : orgId.trim();
        String gradeParam= (gradeId == null || gradeId.trim().isEmpty()) ? "00" : gradeId.trim();

        String sql = "SELECT DISTINCT IPCM.DESIG_PREFIX, IPCM.CATEGORY_ID " +
                     "FROM bv1to1.IREPS_POST_GRADE_LEVEL IPGL " +
                     "JOIN bv1to1.IREPS_POST_CAT_MASTER IPCM ON IPCM.CATEGORY_ID = IPGL.CATEGORY_ID " +
                     "WHERE IPGL.GRADE_CODE = ? " +
                     "AND IPCM.ORG_CODE = ? " +
                     "AND (IPCM.UNIT_CONTROLLING_DEPT = ? OR IPCM.UNIT_CONTROLLING_DEPT = '00') " +
                     "AND IPCM.CATEGORY_STATUS = 0 " +
                     "AND IPCM.ORG_ZONE = ? " +
                     "ORDER BY IPCM.CATEGORY_ID";

        System.out.println("Fetching designations: grade=" + gradeParam + ", org=" + orgParam +
                           ", dept=" + deptParam + ", zone=" + zoneParam);

        return jdbcTemplate.query(sql, rowMapper, gradeParam, orgParam, deptParam, zoneParam);
    }
}
