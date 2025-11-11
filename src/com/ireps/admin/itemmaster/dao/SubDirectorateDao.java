package com.ireps.admin.itemmaster.dao;

import com.ireps.admin.itemmaster.model.SubDirectorate;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

@Repository  // Marks this as a DAO bean
public class SubDirectorateDao {

    @Autowired
    private JdbcTemplate jdbcTemplate;  // Spring will inject the JdbcTemplate

    /**
     * Fetches list of Sub-Directorates for given orgCode, orgZone, and rlyDept.
     */
    public List<SubDirectorate> getSubDirectorates(String orgCode, String orgZone, String rlyDept) {
        String sql = "SELECT DIRECTORATE_ID, DIRECTORATE_NAME " +
                     "FROM bv1to1.CVP_DIRECTORATE_MST " +
                     "WHERE ORG_CODE = ? AND ORG_ZONE = ? AND RLY_DEPT = ?";

        return jdbcTemplate.query(
            sql,
            new Object[]{orgCode, orgZone, rlyDept},
            (rs, rowNum) -> {
                SubDirectorate sub = new SubDirectorate();
                sub.setSubId(rs.getString("DIRECTORATE_ID"));
                sub.setSubName(rs.getString("DIRECTORATE_NAME"));
                return sub;
            }
        );
    }
}
