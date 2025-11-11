package com.ireps.admin.auction.dao;

import com.ireps.admin.auction.model.AuctionUnit;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

@Repository
public class AuctionUnitDao {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    public List<AuctionUnit> getUnitsByOrgAndZone(String orgCode, String zoneCode) {
        String sql = "SELECT department_id AS intCode, department_name AS value " +
                     "FROM BV1TO1.ireps_department_master " +
                     "WHERE org_code = ? AND org_zone = ? " +
                     "ORDER BY department_name";

        return jdbcTemplate.query(sql, new Object[]{orgCode, zoneCode}, (rs, rowNum) -> {
            AuctionUnit unit = new AuctionUnit();
            unit.setIntCode(rs.getString("intCode"));
            unit.setValue(rs.getString("value"));
            return unit;
        });
    }
}
