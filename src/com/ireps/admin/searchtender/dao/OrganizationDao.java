package com.ireps.admin.searchtender.dao;

import com.ireps.admin.searchtender.model.Organization;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import java.util.List;

@Repository
public class OrganizationDao {

    private final JdbcTemplate jdbcTemplate;

    public OrganizationDao(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    public List<Organization> getOrganizations() {
        String sql = "SELECT DISTINCT ou_name AS VALUE, org_code AS INT_CODE " +
                     "FROM bv1to1.ireps_org_units " +
                     "WHERE ou_type='1' AND ou_code <> '00' ORDER BY VALUE";

        return jdbcTemplate.query(sql, (rs, rowNum) -> {
            Organization org = new Organization();
            org.setValue(rs.getString("VALUE"));
            org.setIntCode(rs.getString("INT_CODE"));
            return org;
        });
    }
}
