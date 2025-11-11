package com.ireps.admin.searchtender.dao;

import com.ireps.admin.searchtender.model.PU;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import java.util.List;

@Repository
public class PUdao {

    private final JdbcTemplate jdbcTemplate;

    public PUdao(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    public List<PU> getPUsByOrg(String orgCode) {
        String sql = "SELECT ireps_acct_id AS INT_CODE, ou_name AS VALUE " +
                     "FROM bv1to1.ireps_org_units " +
                     "WHERE ou_type=2 AND ou_code <> '00' AND org_code=? " +
                     "AND status='A' AND ireps_acct_id IS NOT NULL " +
                     "ORDER BY ou_name";

        return jdbcTemplate.query(sql, (rs, rowNum) -> {
            PU pu = new PU();
            pu.setIntCode(rs.getString("INT_CODE"));
            pu.setValue(rs.getString("VALUE"));
            return pu;
        }, orgCode); 
    }
}
