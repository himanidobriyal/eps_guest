package com.ireps.admin.auction.dao;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.ireps.admin.auction.model.AuctionOrganisation;
@Repository
public class AuctionOrganisationDaoImpl implements AuctionOrganisationDao {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    @Override
    public List<AuctionOrganisation> getAllOrganisations() {
        String sql = "SELECT ORG_CODE, OU_NAME FROM bv1to1.IREPS_ORG_UNITS " +
                     "WHERE OU_TYPE LIKE '1' AND OU_CODE <> 00 ORDER BY OU_NAME ASC";

        return jdbcTemplate.query(sql, (rs, rowNum) -> {
            AuctionOrganisation org = new AuctionOrganisation();
            org.setOrgCode(rs.getString("ORG_CODE"));
            org.setOuName(rs.getString("OU_NAME"));
            return org;
        });
    }

    
    
}