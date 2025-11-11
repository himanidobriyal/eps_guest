package com.ireps.admin.auction.dao;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import com.ireps.admin.auction.model.AuctionZone;


@Repository
public class AuctionZoneDaoImpl implements AuctionZoneDao {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    @Override
    public List<AuctionZone> getZonesByOrgCode(String orgCode) {
        String sql = "SELECT ORG_ZONE AS intCode, OU_NAME AS value " +
                     "FROM bv1to1.IREPS_ORG_UNITS " +
                     "WHERE OU_TYPE=2 AND OU_CODE <> '00' " +
                     "AND ORG_CODE = ? AND STATUS='A' " +
                     "AND IREPS_ACCT_ID IS NOT NULL " +
                     "AND ORG_ZONE NOT IN (95,99) " +
                     "ORDER BY OU_NAME";

        return jdbcTemplate.query(sql, new Object[]{orgCode}, (rs, rowNum) -> {
            AuctionZone zone = new AuctionZone();
            zone.setIntCode(rs.getString("intCode"));
            zone.setValue(rs.getString("value"));
            return zone;
        });
    }

}