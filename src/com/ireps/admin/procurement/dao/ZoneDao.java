package com.ireps.admin.procurement.dao;

import com.ireps.admin.procurement.model.Zone;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
   
@Repository
public class ZoneDao {

    private final JdbcTemplate jdbcTemplate;

    public ZoneDao(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    } 

    public List<Zone> getZones() {
        String sql = "SELECT DISTINCT ou_code, ou_name FROM bv1to1.ireps_org_units " +
                     "WHERE ou_type = 2 AND ou_code <> 00 AND ou_code <> 99 AND org_code = '01' " +
                     "AND ireps_acct_id IN (SELECT DISTINCT account_id FROM bv1to1.ireps_department_master " +
                     "WHERE org_subunit_dept = '19' AND org_code = '01') ORDER BY ou_name";

        return jdbcTemplate.query(sql, new RowMapper<Zone>() {
            public Zone mapRow(ResultSet rs, int rowNum) throws SQLException {
                Zone zone = new Zone();
                zone.setOuCode(rs.getString("ou_code"));
                zone.setOuName(rs.getString("ou_name"));
                return zone;
            }
        });
    }
}
