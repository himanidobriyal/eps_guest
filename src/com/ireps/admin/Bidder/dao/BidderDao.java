package com.ireps.admin.Bidder.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.ireps.admin.Bidder.model.BidderForm;
import com.ireps.admin.Bidder.model.Biddermodel;

@Repository
public class BidderDao {

	private final JdbcTemplate jdbcTemplate;
	private final NamedParameterJdbcTemplate namedJdbc;

	@Autowired
	public BidderDao(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
		this.namedJdbc = new NamedParameterJdbcTemplate(jdbcTemplate);
	}

	// ---------- dropdowns ----------
	public List<Map<String, Object>> getActiveStatesWithIds() {
		String sql = "SELECT state_id, state_name FROM ireps_state_master "
				+ "WHERE active_flag='A' AND oid='10141' ORDER BY state_name";
		return jdbcTemplate.query(sql, (rs, i) -> {
			Map<String, Object> m = new HashMap<>();
			m.put("id", rs.getInt("state_id"));
			m.put("name", rs.getString("state_name"));
			return m;
		});
	}

	public List<Map<String, Object>> getRailwayUnits(String bidderType) {
		String sql = "SELECT DISTINCT ACCOUNT_ID, ACCOUNT_NAME " + "FROM bv1to1.IREPS_DEPARTMENT_MASTER "
				+ "WHERE dept_type = -77 AND ACCOUNT_ID NOT IN (-1"
				+ (bidderType != null && !bidderType.trim().isEmpty() ? ",301" : "") + ") ORDER BY ACCOUNT_NAME ASC";

		return jdbcTemplate.query(sql, (rs, rn) -> {
			Map<String, Object> m = new HashMap<>();
			m.put("accountId", rs.getInt("ACCOUNT_ID"));
			m.put("accountName", rs.getString("ACCOUNT_NAME"));
			return m;
		});
	}

	public List<Biddermodel> getDepotsByAccountId(int accountId) {
		String sql = "SELECT DEPOT_ID, DEPOT_NAME FROM AUCTION_DEPOT_MASTER "
				+ "WHERE ACCOUNT_ID = ? AND dept_type = -77 ORDER BY DEPOT_NAME";
		return jdbcTemplate.query(sql, new Object[] { accountId }, (rs, row) -> {
			Biddermodel d = new Biddermodel();
			d.setDepotId(rs.getInt("DEPOT_ID"));
			d.setDepotName(rs.getString("DEPOT_NAME"));
			return d;
		});
	}

	// ---------- validators ----------
	private static final String GST_CHECK_QUERY = "SELECT cnt FROM ("
			+ "  SELECT COUNT(*) cnt FROM bv1to1.mr_acct_profile "
			+ "  WHERE upper(bidder_reg_gstno)=upper(?) AND account_type='8' "
			+ "    AND NOT REGEXP_LIKE(account_name,'^(BIDDER|CRIS TEST|Cris)')" + "  UNION "
			+ "  SELECT COUNT(*) cnt FROM bv1to1.mr_acct_profile ap, bv1to1.gst_profile gp "
			+ "  WHERE ap.account_id=gp.account_id AND upper(gst_no)=upper(?) AND gp.account_type='8' "
			+ "    AND NOT REGEXP_LIKE(account_name,'^(BIDDER|CRIS TEST)') AND gp.active_flag='A' " + "  UNION "
			+ "  SELECT COUNT(*) cnt FROM bidder_online_regis_temp " + "  WHERE status<>-5 AND upper(gst_no)=upper(?) "
			+ "    AND upper(firm_name) NOT LIKE upper('%CRIS%TEST%')" + ") ORDER BY cnt DESC FETCH FIRST 1 ROWS ONLY";

	public boolean isGstAlreadyUsed(String gstNo) {
		Integer c = jdbcTemplate.queryForObject(GST_CHECK_QUERY, new Object[] { gstNo, gstNo, gstNo }, Integer.class);
		return c != null && c > 0;
	}

	public String validateGst(String gstNo) {
		if (gstNo == null || gstNo.trim().isEmpty())
			return "INVALID";
		String pat = "^[0-9]{2}[A-Z]{5}[0-9]{4}[A-Z]{1}[1-9A-Z]{1}Z[0-9A-Z]{1}$";
		if (!gstNo.matches(pat))
			return "INVALID";

		String sql = "SELECT LISTAGG(DISTINCT account_name,'^') WITHIN GROUP (ORDER BY account_name) AS account_name "
				+ "FROM ( " + "  SELECT account_name FROM bv1to1.mr_acct_profile "
				+ "  WHERE upper(bidder_reg_gstno)=upper(?) AND account_type='8' "
				+ "    AND NOT REGEXP_LIKE(account_name,'^(BIDDER|CRIS TEST|Cris)') AND deleted<>1 AND active<>0 "
				+ "  UNION " + "  SELECT account_name FROM bv1to1.mr_acct_profile ap, bv1to1.gst_profile gp "
				+ "  WHERE ap.account_id=gp.account_id AND upper(gst_no)=upper(?) "
				+ "    AND gp.account_type='8' AND ap.account_type='8' "
				+ "    AND NOT REGEXP_LIKE(account_name,'^(BIDDER|CRIS TEST|Cris)') AND gp.active_flag='A' "
				+ "  UNION " + "  SELECT account_name FROM bv1to1.bidder_online_regis_temp "
				+ "  WHERE upper(gst_no)=upper(?) AND upper(firm_name) NOT LIKE upper('%CRIS%TEST%') AND status<>-5 "
				+ ")";
		try {
			String names = jdbcTemplate.queryForObject(sql, new Object[] { gstNo, gstNo, gstNo }, String.class);
			return (names == null || names.trim().isEmpty()) ? "AVAILABLE" : names;
		} catch (Exception e) {
			return "AVAILABLE";
		}
	}

	public String checkEmail(String email) {
		String sql = "SELECT MAX(cnt) FROM ("
				+ "  SELECT COUNT(*) cnt FROM bv1to1.vendor_registeration_requests WHERE upper(email)=upper(?) "
				+ "  UNION ALL " + "  SELECT COUNT(*) cnt FROM bv1to1.mr_acct_profile WHERE upper(email)=upper(?) "
				+ "  UNION ALL " + "  SELECT COUNT(*) cnt FROM bv1to1.bv_user_profile WHERE upper(email)=upper(?) "
				+ "  UNION ALL "
				+ "  SELECT COUNT(*) cnt FROM bv1to1.bidder_online_regis_temp WHERE upper(email)=upper(?) AND status<>-5)";
		Integer c = jdbcTemplate.queryForObject(sql, Integer.class, email, email, email, email);
		return (c == null) ? "AVAILABLE" : (c > 0 ? "USED" : "AVAILABLE");
	}

	// ---------- helpers ----------
	// ---------- helpers ----------
	private static String nvl(String s) {
		if (s == null)
			return null;
		String t = s.trim();
		if (t.isEmpty())
			return null;

		// common placeholder tokens we want to treat as "missing"
		// expand this set if needed (e.g., "N/A", "-", "--", "?", "unknown")
		String lowered = t.toLowerCase();
		if (lowered.equals("?") || lowered.equals("-") || lowered.equals("n/a") || lowered.equals("na")
				|| lowered.equals("--") || lowered.equals("unknown")) {
			return null;
		}

		return t;
	}

	private static String trimTo(String s, int max) {
		if (s == null)
			return null;
		String t = s.trim();
		return t.length() <= max ? t : t.substring(0, max);
	}

	private Integer resolveStateIdByName(String stateName) {
		if (stateName == null)
			return null;
		try {
			return jdbcTemplate.queryForObject(
					"SELECT state_id FROM ireps_state_master "
							+ "WHERE UPPER(state_name)=UPPER(?) AND oid='10141' AND active_flag='A'",
					Integer.class, stateName.trim());
		} catch (Exception ex) {
			return null;
		}
	}
	

	// ---------- insert ----------
	@Transactional
	public long insertBidderOnlineTemp(BidderForm f) {

		// map constitution -> number (Java 7 switch)
		long constitutionCode;
		String cons = nvl(f.getConstitution());
		if (cons == null) {
			constitutionCode = 90L;
		} else {
			switch (cons.toLowerCase()) {
			case "partnership":
				constitutionCode = 1L;
				break;
			case "private ltd.":
				constitutionCode = 2L;
				break;
			case "proprietorship":
				constitutionCode = 3L;
				break;
			case "public ltd.":
				constitutionCode = 4L;
				break;
			case "limited liability partnership":
				constitutionCode = 5L;
				break;
			case "government":
			case "govt.":
				constitutionCode = 6L;
				break;
			default:
				constitutionCode = 9L;
			}
		}

		final int countryId = 10141; // India
		Integer stateId = f.getStateId();
		if (stateId == null) {
			// fallback only if you still keep name around:
			stateId = resolveStateIdByName(f.getState());
		}
		if (stateId == null) {
			throw new RuntimeException("Invalid state selection. Please select a valid state.");
		}

		String firmName = nvl(f.getFirmName());
		String city = nvl(f.getCityName());
		String accountName = (firmName == null) ? null : (city == null ? firmName : (firmName + " - " + city));

		String selectedRailway = trimTo(nvl(f.getRailUnitName()), 10);
		String selectedDepot = trimTo(nvl(f.getDepotUnitName()), 20);

		int storeId = (f.getStoreId() == null ? 102 : f.getStoreId());
		int lastModifyBy = (f.getLastModifyBy() == null ? 0 : f.getLastModifyBy());
		int transactionId = (f.getTransactionId() == null ? 20002 : f.getTransactionId());
		String lastModifyFrom = (nvl(f.getLastModifyFrom()) == null ? "WEB" : f.getLastModifyFrom().trim());

		final String sql = "INSERT INTO bv1to1.BIDDER_ONLINE_REGIS_TEMP("
				+ "  OID, BIDDER_ID, STORE_ID, CREATION_TIME, STATUS, DELETED, LAST_MOD_TIME,"
				+ "  ACCOUNT_NAME, FIRM_NAME, FIRM_URL, COMPANY_REGISTRATION_NO, PAN_TAN_NO,"
				+ "  FIRM_SALES_TAX_NO, CONSTITUTION_OF_FIRM, EMAIL, ALTER_NATE_EMAIL,"
				+ "  FIRST_NAME, MIDDLE_NAME, LAST_NAME, ADDRESS1, ADDRESS2, CITY, COUNTRY,"
				+ "  STATE, ZIP, PHONE1, PHONE2, CELL_PHONE, FAX, EXTRA_COLUMN2, EXTRA_COLUMN3,"
				+ "  EXTRA_COLUMN4, LAST_MODIFY_BY, TRANSACTION_ID, LAST_MODIFY_FROM,"
				+ "  SIGNATURE, THUMBPRINT, CERT_THUMBPRINT, SELECTED_RAILWAY, SELECTED_DEPOT,"
				+ "  REASON_OF_REJECTION, REJECTED_BY, REJECTED_FROM, REJECTEDBY_SIGN,"
				+ "  REJECTEDBY_THUMBPRINT, GST_NO) " + "SELECT " + "  bv1to1.OID_SEQ.NEXTVAL, "
				+ "  bv1to1.BIDDER_ACCT_TEMP.NEXTVAL, " + "  :storeId, SYSDATE, 0, 0, SYSDATE, "
				+ "  :accountName, :firmName, :firmUrl, :companyRegNo, :panTan, "
				+ "  :firmSalesTaxNo, :constitutionCode, " + "  :email, :altEmail, "
				+ "  :firstName, :middleName, :lastName, " + "  :addr1, :addr2, :city, :countryId, :stateId, :zip, "
				+ "  :phone1, :phone2, :cellPhone, :fax, " + "  :extra2, :extra3, :extra4, "
				+ "  :lastModifyBy, :transactionId, :lastModifyFrom, " + "  NULL, NULL, NULL, " + // signature/thumbs
																									// kept NULL
				"  :selectedRailway, :selectedDepot, " + "  NULL, NULL, NULL, NULL, NULL, " + // rejection fields NULL
				"  :gstNo " + "FROM dual " + "WHERE NOT EXISTS ( "
				+ "  SELECT 1 FROM bv1to1.BIDDER_ONLINE_REGIS_TEMP t "
				+ "  WHERE ( :gstNoNotNull = 1 AND UPPER(TRIM(t.GST_NO)) = UPPER(TRIM(:gstNoMatch)) ) "
				+ "     OR ( :emailNotNull = 1 AND UPPER(TRIM(t.EMAIL))  = UPPER(TRIM(:emailMatch)) ) " + ")";

		// bind params (named)
		MapSqlParameterSource p = new MapSqlParameterSource().addValue("storeId", storeId)
				.addValue("accountName", accountName).addValue("firmName", firmName)
				.addValue("firmUrl", nvl(f.getFirmUrl())).addValue("companyRegNo", nvl(f.getCompanyRegNo()))
				.addValue("panTan", nvl(f.getPanTan())).addValue("firmSalesTaxNo", null) // as in your code
				.addValue("constitutionCode", constitutionCode).addValue("email", nvl(f.getEmailID()))
				.addValue("altEmail", nvl(f.getAlternateEmail())).addValue("firstName", nvl(f.getFirstName()))
				.addValue("middleName", nvl(f.getMiddleName())).addValue("lastName", nvl(f.getLastName()))
				.addValue("addr1", nvl(f.getAddr1())).addValue("addr2", nvl(f.getAddr2())).addValue("city", city)
				.addValue("countryId", countryId).addValue("stateId", stateId).addValue("zip", nvl(f.getPincode()))
				.addValue("phone1", nvl(f.getPhone1())).addValue("phone2", nvl(f.getPhone2()))
				.addValue("cellPhone", nvl(f.getMobileNo())).addValue("fax", nvl(f.getFax()))
				.addValue("extra2", lastModifyBy).addValue("extra3", transactionId).addValue("extra4", lastModifyFrom)
				.addValue("lastModifyBy", lastModifyBy).addValue("transactionId", transactionId)
				.addValue("lastModifyFrom", lastModifyFrom).addValue("selectedRailway", selectedRailway)
				.addValue("selectedDepot", selectedDepot).addValue("gstNo", nvl(f.getGstNumber()))
				// NOT EXISTS guards (avoid `? IS NOT NULL` fragility)
				.addValue("gstNoNotNull", nvl(f.getGstNumber()) == null ? 0 : 1)
				.addValue("gstNoMatch", nvl(f.getGstNumber()))
				.addValue("emailNotNull", nvl(f.getEmailID()) == null ? 0 : 1)
				.addValue("emailMatch", nvl(f.getEmailID()));

		int rows = namedJdbc.update(sql, p);

		if (rows == 1) {
			Long oid = jdbcTemplate.queryForObject("SELECT OID FROM bv1to1.BIDDER_ONLINE_REGIS_TEMP "
					+ "WHERE UPPER(TRIM(GST_NO)) = UPPER(TRIM(?)) " + "ORDER BY OID DESC FETCH FIRST 1 ROWS ONLY",
					Long.class, nvl(f.getGstNumber()));
			return (oid == null ? -1L : oid);
		}

		throw new RuntimeException("Duplicate GST or Email. Insert skipped.");
	}

	public BidderForm findTempByOid(long oid) {
		String sql = "SELECT t.*, s.state_name " + "  FROM bv1to1.BIDDER_ONLINE_REGIS_TEMP t "
				+ "  LEFT JOIN ireps_state_master s ON s.state_id = t.state AND s.oid='10141' " + " WHERE t.oid = ?";

		return jdbcTemplate.queryForObject(sql, (rs, i) -> {
			BidderForm f = new BidderForm();
			// Use nvl(...) to normalize placeholders like "?" to null
			f.setFirmName(nvl(rs.getString("FIRM_NAME")));
			f.setMsName(nvl(rs.getString("ACCOUNT_NAME"))); // if you store ACCOUNT_NAME
			f.setFirmUrl(nvl(rs.getString("FIRM_URL")));
			f.setCompanyRegNo(nvl(rs.getString("COMPANY_REGISTRATION_NO")));
			f.setPanTan(nvl(rs.getString("PAN_TAN_NO")));
			f.setConstitution(nvl(rs.getString("CONSTITUTION_OF_FIRM")));
			f.setEmailID(nvl(rs.getString("EMAIL")));
			f.setAlternateEmail(nvl(rs.getString("ALTER_NATE_EMAIL")));
			f.setFirstName(nvl(rs.getString("FIRST_NAME")));
			f.setMiddleName(nvl(rs.getString("MIDDLE_NAME")));
			f.setLastName(nvl(rs.getString("LAST_NAME")));
			f.setAddr1(nvl(rs.getString("ADDRESS1")));
			f.setAddr2(nvl(rs.getString("ADDRESS2")));
			f.setCityName(nvl(rs.getString("CITY")));
			f.setPincode(nvl(rs.getString("ZIP")));
			// Country: you may want "India" default if null
			String countryFromDb = nvl(rs.getString("COUNTRY"));
			f.setCountry(countryFromDb == null ? "India" : countryFromDb);
			f.setState(nvl(rs.getString("state_name"))); // show name
			f.setPhone1(nvl(rs.getString("PHONE1")));
			f.setPhone2(nvl(rs.getString("PHONE2")));
			f.setMobileNo(nvl(rs.getString("CELL_PHONE")));
			f.setFax(nvl(rs.getString("FAX")));
			f.setGstNumber(nvl(rs.getString("GST_NO")));
			f.setRailUnitName(nvl(rs.getString("SELECTED_RAILWAY"))); // trimmed earlier on insert
			f.setDepotUnitName(nvl(rs.getString("SELECTED_DEPOT")));
			return f;
		}, oid);
	}

}
