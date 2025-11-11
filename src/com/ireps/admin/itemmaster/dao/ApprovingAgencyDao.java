package com.ireps.admin.itemmaster.dao;

import com.ireps.admin.itemmaster.model.ApprovingAgency;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

@Repository  // Marks this as a Spring-managed DAO component
public class ApprovingAgencyDao {

    @Autowired
    private JdbcTemplate jdbcTemplate;  // Inject JdbcTemplate directly

    public List<ApprovingAgency> getApprovingAgencies() {
        String sql = "SELECT AA_CODE AS INT_CODE, AA_SHORT_NAME AS VALUE FROM bv1to1.CVP_APPROVING_AGENCY_MST WHERE ACTIVE_FLAG='A' ORDER BY AA_SHORT_NAME";

        return jdbcTemplate.query(sql, (rs, rowNum) -> {
            ApprovingAgency agency = new ApprovingAgency();
            agency.setAgencyId(rs.getString("INT_CODE"));
            agency.setAgencyName(rs.getString("VALUE"));
            return agency;
        });
    }
}
