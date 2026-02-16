package com.ireps.admin.DepartmentCreation.dao;

import com.ireps.admin.DepartmentCreation.model.DepartmentOrganization;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

@Repository
public class DepartmentOrganizationDao {

    @Autowired
    private JdbcTemplate jdbcTemplate;
    

    // Constructor for XML injection
    public DepartmentOrganizationDao(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    public List<DepartmentOrganization> getAllOrganizations() {
        String sql = "SELECT DISTINCT org_code, ou_name " +
                     "FROM bv1to1.ireps_org_units " +
                     "WHERE ou_type = '1' AND ou_code <> '00' " +
                     "ORDER BY org_code";

        return jdbcTemplate.query(sql, new RowMapper<DepartmentOrganization>() {
            @Override
            public DepartmentOrganization mapRow(ResultSet rs, int rowNum) throws SQLException {
                DepartmentOrganization org = new DepartmentOrganization();
                org.setOrgCode(rs.getString("org_code"));
                org.setOuName(rs.getString("ou_name"));
                return org;
            }
        });
    }
}
