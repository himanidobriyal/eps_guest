package com.ireps.admin.goods.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.ireps.admin.goods.model.Org;

// Interface for Organisation DAO
public interface OrgDao {
    List<Org> getOrganisations();
}

// Single implementation with a unique Spring bean name
@Repository("goodsOrganisationDaoImpl")
class OrganisationDaoImpl implements OrgDao {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    @Override
    public List<Org> getOrganisations() {
        String sql = "SELECT ORG_CODE, OU_NAME FROM bv1to1.IREPS_ORG_UNITS " +
                     "WHERE ou_type LIKE '1' AND OU_CODE <> '00' " +
                     "ORDER BY OU_NAME ASC";

        return jdbcTemplate.query(sql, (rs, rowNum) -> {
            Org org = new Org();
            org.setOrgCode(rs.getString("ORG_CODE"));
            org.setOuName(rs.getString("OU_NAME"));
            return org;
        });
    }
}
