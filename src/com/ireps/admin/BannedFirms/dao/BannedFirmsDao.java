package com.ireps.admin.BannedFirms.dao;
  
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;
import com.ireps.admin.BannedFirms.model.BannedFirms;
 
@Repository
public class BannedFirmsDao {

	private final JdbcTemplate jdbcTemplate;

	public BannedFirmsDao(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}  

	public List<BannedFirms> getBannedFirmsByType(String type) {
		String sql = "SELECT let_no, TO_CHAR(let_dt, 'dd/mm/yyyy') let_dt_s, vname, vaddress, subj, duration, "
				+ "TO_CHAR(ban_upto, 'dd/mm/yyyy') ban_upto, remarks, doc_id, LPAD(doc_id, 9, '0') AS doc_path "
				+ "FROM immis.rly_ban_tbl WHERE (ban_upto IS NULL OR ban_upto > SYSDATE) ";

		// Apply filter condition based on type
		if ("banned".equalsIgnoreCase(type)) {
			sql += "AND UPPER(subj) LIKE '%BANN%' ";
		} else if ("suspended".equalsIgnoreCase(type)) {
			sql += "AND UPPER(subj) LIKE '%SUSPEN%' ";
		}

		sql += "ORDER BY let_dt";

		return jdbcTemplate.query(sql, new RowMapper<BannedFirms>() {
			@Override
			public BannedFirms mapRow(ResultSet rs, int rowNum) throws SQLException {
				BannedFirms firm = new BannedFirms();
				firm.setLetNo(rs.getString("let_no"));
				firm.setLetDate(rs.getString("let_dt_s"));
				firm.setVname(rs.getString("vname"));
				firm.setVaddress(rs.getString("vaddress"));
				firm.setSubj(rs.getString("subj"));
				firm.setDuration(rs.getString("duration"));
				firm.setBanUpto(rs.getString("ban_upto"));
				firm.setRemarks(rs.getString("remarks"));
				firm.setDocId(rs.getString("doc_id"));
				firm.setDocPath(rs.getString("doc_path"));
				return firm;
			}
		});
	}
}
