package com.ireps.admin.hightender.dao;

import com.ireps.admin.hightender.model.HightenderOrganization;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

@Repository
public class HightenderOrganizationDao {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    public List<HightenderOrganization> getAllOrganisations() {
        String sql = "SELECT DISTINCT ou_name AS value, org_code AS int_code " +
                     "FROM bv1to1.ireps_org_units " +
                     "WHERE ou_type = '1' AND ou_code <> '00' " +
                     "ORDER BY org_code";

        return jdbcTemplate.query(sql, (ResultSet rs, int rowNum) -> {
            HightenderOrganization org = new HightenderOrganization();
            org.setValue(rs.getString("value"));
            org.setIntCode(rs.getString("int_code"));
            return org;
        });
    }
}
