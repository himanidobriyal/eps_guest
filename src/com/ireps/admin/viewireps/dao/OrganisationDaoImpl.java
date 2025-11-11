package com.ireps.admin.viewireps.dao;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.ireps.admin.viewireps.model.Organisation;

@Repository
public class OrganisationDaoImpl implements OrganisationDao{

    @Autowired
    private JdbcTemplate jdbcTemplate;

    @Override
    public List<Organisation> getOrganisations() {
        String sql = "SELECT ORG_CODE, OU_NAME FROM bv1to1.IREPS_ORG_UNITS " +
                     "WHERE ou_type LIKE '1' AND OU_CODE <> '00' " +
                     "ORDER BY OU_NAME ASC";

        return jdbcTemplate.query(sql, (rs, rowNum) -> {
            Organisation org = new Organisation();
            org.setOrgCode(rs.getString("ORG_CODE"));
            org.setOuName(rs.getString("OU_NAME"));
            return org;
        });
    }
}
