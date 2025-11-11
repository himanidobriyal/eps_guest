package com.ireps.admin.viewireps.dao;

import com.ireps.admin.viewireps.model.AdminUnit;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class AdminUnitDao {

	private final JdbcTemplate jdbcTemplate;

	public AdminUnitDao(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}

	public List<AdminUnit> findAdminUnits(String orgCode, String orgZone, String subDept) {
		String sql = "SELECT DISTINCT org.ou_name AS ADMIN_UNIT_NAME, " + "org.admin_unit AS admin_unit "
				+ "FROM (SELECT ou_name, admin_unit FROM bv1to1.ireps_org_units "
				+ "WHERE ou_type = 7 AND org_code = ? AND org_zone = ? AND org_subunit_dept = ?) org, "
				+ "bv1to1.ireps_department_master dm " + "WHERE org.admin_unit = dm.admin_unit";

		return jdbcTemplate.query(sql, new Object[] { orgCode, orgZone, subDept },
				(rs, rowNum) -> new AdminUnit(rs.getString("ADMIN_UNIT_NAME"), rs.getString("admin_unit")));
	}
}
