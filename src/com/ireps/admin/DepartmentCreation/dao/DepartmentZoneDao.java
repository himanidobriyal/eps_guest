package com.ireps.admin.DepartmentCreation.dao;

import com.ireps.admin.DepartmentCreation.model.DepartmentZone;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

@Repository
public class DepartmentZoneDao {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    public List<DepartmentZone> getZonesByOrg(String orgCode) {
        String sql = "SELECT DISTINCT ou_code, ou_name " +
                     "FROM bv1to1.ireps_org_units " +
                     "WHERE ou_type = ? AND ou_code <> ? AND org_code = ? " +
                     "ORDER BY ou_name";

        return jdbcTemplate.query(
            sql,
            (rs, rowNum) -> {
                DepartmentZone z = new DepartmentZone();
                z.setOuCode(rs.getString("ou_code"));
                z.setOuName(rs.getString("ou_name"));
                return z;
            },
            "2",    // ou_type
            "00",   // ou_code <> '00'
            orgCode // selected org_code
        );
    }

}
