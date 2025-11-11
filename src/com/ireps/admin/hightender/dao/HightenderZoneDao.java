package com.ireps.admin.hightender.dao;

import com.ireps.admin.hightender.model.HightenderZone;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.sql.ResultSet;
import java.util.List;

@Repository
public class HightenderZoneDao {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    public List<HightenderZone> getZonesByOrgCode(int orgCode) {
        String sql = "SELECT ou_name, ou_code " +
                     "FROM bv1to1.ireps_org_units " +
                     "WHERE ou_type = '2' AND ou_code <> '00' AND org_code = ? " +
                     "ORDER BY ou_name";

        return jdbcTemplate.query(sql, new Object[]{orgCode}, (ResultSet rs, int rowNum) -> {
            HightenderZone zone = new HightenderZone();
            zone.setZoneName(rs.getString("ou_name"));
            zone.setZoneCode(rs.getString("ou_code"));
            return zone;
        });
    }
}
