package com.ireps.admin.goods.dao;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import com.ireps.admin.goods.model.Zone;

public interface ZoneRDao {
    List<Zone> getZonesByOrgCode(String orgCode);
}

@Repository
class ZoneRDaoImpl implements ZoneRDao {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    @Override
    public List<Zone> getZonesByOrgCode(String orgCode) {
        String sql = "SELECT ORG_ZONE, OU_NAME FROM bv1to1.IREPS_ORG_UNITS " +
                     "WHERE ou_type LIKE '2' AND OU_CODE <> '00' AND ORG_CODE LIKE ? " +
                     "ORDER BY ORG_ZONE ASC";

        return jdbcTemplate.query(sql, new Object[]{orgCode}, (rs, rowNum) -> {
            Zone zone = new Zone();
            zone.setOrgZone(rs.getString("ORG_ZONE"));
            zone.setOuName(rs.getString("OU_NAME"));
            return zone;
        });
    }
}
