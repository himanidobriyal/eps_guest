package com.ireps.admin.auction.dao;

import com.ireps.admin.auction.model.Auction;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import java.util.*;

@Repository
public class AuctionDao {

	@Autowired
	private JdbcTemplate jdbcTemplate;

	// Live Auctions with Dynamic Filters
	public List<Auction> getLiveAuctions(int page, int pageSize, String orgCode, String zoneCode, String unitCode,
			String categoryId,String catalogNo, String fromDate, String toDate) {
		// Base SQL to get the core auction data
		StringBuilder sqlBuilder = new StringBuilder();
		sqlBuilder.append("SELECT DISTINCT ");
		sqlBuilder.append(
				"    cat.depot_id, cat.schedule_id, bv1to1.pkg_common.get_deptname(cat.depot_id) AS dept_name, ");
		sqlBuilder.append("    cat.catalog_id, cat.catalog_no, ");
		sqlBuilder.append(
				"    TO_CHAR( (SELECT MIN(lot_start_datetime) FROM bv1to1.lease_auction_lot_master alm WHERE cat.catalog_id = alm.catalog_id), 'DD-MM-YY HH24:MI:SS') AS auction_start_date, ");
		sqlBuilder.append(
				"    (SELECT bidding_system FROM bv1to1.lease_schedule_master asm WHERE asm.schedule_id = cat.schedule_id) AS bidding_system, ");
		sqlBuilder.append(
				"    (SELECT to_char(asm.tech_bid_close_time, 'DD-MM-YY HH24:MI:SS') FROM bv1to1.lease_schedule_master asm WHERE asm.schedule_id = cat.schedule_id) AS tech_bid_close_time, ");
		sqlBuilder.append(
				"    TO_CHAR( (SELECT MAX(lot_end_datetime) FROM bv1to1.lease_auction_lot_master alm WHERE cat.catalog_id = alm.catalog_id), 'DD-MM-YY HH24:MI:SS') AS auction_end_date, ");
		sqlBuilder.append(
				"    (SELECT ou_name FROM bv1to1.ireps_org_units WHERE ou_type = 2 AND ou_code <> '00' AND org_code = '01' AND status = 'A' AND org_zone = (SELECT org_zone FROM bv1to1.ireps_department_master WHERE org_code = '01' AND department_id = cat.depot_id) AND ireps_acct_id IS NOT NULL) AS org_zone_name, ");
		sqlBuilder.append(
				"    (SELECT LISTAGG(DISTINCT category_name, ', ') WITHIN GROUP(ORDER BY category_id) FROM bv1to1.lease_category_master a, bv1to1.lease_lot_register b, bv1to1.lease_auction_lot_master xt WHERE a.category_id = b.asset_category_id AND b.lot_id = xt.lot_id AND xt.catalog_id = cat.catalog_id) AS categ_name, ");
		sqlBuilder.append(
				"    (SELECT b.asset_category_id FROM bv1to1.lease_lot_register b, bv1to1.lease_auction_lot_master xt WHERE b.lot_id = xt.lot_id AND xt.catalog_id = cat.catalog_id AND ROWNUM = 1) AS category_id ");
		sqlBuilder.append("FROM ");
		sqlBuilder.append("    bv1to1.lease_auction_lot_master lot, ");
		sqlBuilder.append("    bv1to1.lease_auction_catalogue_master cat ");

		// Build the dynamic WHERE clause
		StringBuilder whereClause = new StringBuilder();
		List<Object> params = new ArrayList<>();

		// Condition 1: Live auctions
		whereClause.append(
				" WHERE lot.lot_current_status = 13 AND lot.lot_start_datetime <= sysdate AND lot.LOT_END_DATETIME >= sysdate AND cat.catalog_id = lot.catalog_id ");

		// Condition 2: Filter out specific depots
		whereClause.append(
				" AND cat.depot_id NOT IN (SELECT department_id FROM bv1to1.ireps_department_master WHERE org_code = '01' AND org_zone IN (95, 99)) ");
		whereClause.append(
				" AND cat.depot_id IN (SELECT department_id FROM bv1to1.ireps_department_master ) ");

		// Add dynamic filters if present
		if (orgCode != null && !orgCode.isEmpty()) {
			whereClause.append(
					" AND cat.depot_id IN (SELECT department_id FROM bv1to1.ireps_department_master WHERE org_code = ?) ");
			params.add(orgCode);
		}
		if (zoneCode != null && !zoneCode.isEmpty()) {
			whereClause.append(
					" AND cat.depot_id IN (SELECT department_id FROM bv1to1.ireps_department_master WHERE org_zone = ?) ");
			params.add(zoneCode);
		}
		if (unitCode != null && !unitCode.isEmpty()) {
			whereClause.append(" AND cat.depot_id = ? ");
			params.add(unitCode);
		}
		if (categoryId != null && !categoryId.isEmpty()) {
			whereClause.append(
					" AND (SELECT b.asset_category_id FROM bv1to1.lease_lot_register b, bv1to1.lease_auction_lot_master xt WHERE b.lot_id = xt.lot_id AND xt.catalog_id = cat.catalog_id AND ROWNUM = 1) = ? ");
			params.add(categoryId);
		}

		sqlBuilder.append(whereClause);
		sqlBuilder.append(" ORDER BY auction_start_date ASC ");

		// Wrap the final query for pagination
		String finalSql = "SELECT * FROM (" + "SELECT ROWNUM seq, a.* FROM (" + sqlBuilder.toString()
				+ ") a WHERE ROWNUM <= ? ) WHERE seq > ?";

		int offset = (page - 1) * pageSize;
		int limit = page * pageSize;

		params.add(limit);
		params.add(offset);

		return jdbcTemplate.query(finalSql, params.toArray(), this::mapAuction);
	}

	// ... (Repeat the same logic for getUpcomingAuctions and getClosedAuctions)

	// Upcoming Auctions with Dynamic Filters
	public List<Auction> getUpcomingAuctions(int page, int pageSize, String orgCode, String zoneCode, String unitCode,
			String categoryId,String catalogNo, String fromDate, String toDate) {
		// Base SQL to get the core auction data
		StringBuilder sqlBuilder = new StringBuilder();
		sqlBuilder.append("SELECT DISTINCT ");
		sqlBuilder.append(
				"    cat.depot_id, cat.schedule_id, bv1to1.pkg_common.get_deptname(cat.depot_id) AS dept_name, ");
		sqlBuilder.append("    cat.catalog_id, cat.catalog_no, ");
		sqlBuilder.append(
				"    TO_CHAR( (SELECT MIN(lot_start_datetime) FROM bv1to1.lease_auction_lot_master alm WHERE cat.catalog_id = alm.catalog_id), 'DD-MM-YY HH24:MI:SS') AS auction_start_date, ");
		sqlBuilder.append(
				"    (SELECT bidding_system FROM bv1to1.lease_schedule_master asm WHERE asm.schedule_id = cat.schedule_id) AS bidding_system, ");
		sqlBuilder.append(
				"    (SELECT to_char(asm.tech_bid_close_time, 'DD-MM-YY HH24:MI:SS') FROM bv1to1.lease_schedule_master asm WHERE asm.schedule_id = cat.catalog_id) AS tech_bid_close_time, ");
		sqlBuilder.append(
				"    TO_CHAR( (SELECT MAX(lot_end_datetime) FROM bv1to1.lease_auction_lot_master alm WHERE cat.catalog_id = alm.catalog_id), 'DD-MM-YY HH24:MI:SS') AS auction_end_date, ");
		sqlBuilder.append(
				"    (SELECT ou_name FROM bv1to1.ireps_org_units WHERE ou_type = 2 AND ou_code <> '00' AND org_code = '01' AND status = 'A' AND org_zone = (SELECT org_zone FROM bv1to1.ireps_department_master WHERE org_code = '01' AND department_id = cat.depot_id) AND ireps_acct_id IS NOT NULL) AS org_zone_name, ");
		sqlBuilder.append(
				"    (SELECT LISTAGG(DISTINCT category_name, ', ') WITHIN GROUP(ORDER BY category_id) FROM bv1to1.lease_category_master a, bv1to1.lease_lot_register b, bv1to1.lease_auction_lot_master xt WHERE a.category_id = b.asset_category_id AND b.lot_id = xt.lot_id AND xt.catalog_id = cat.catalog_id) AS categ_name, ");
		sqlBuilder.append(
				"    (SELECT b.asset_category_id FROM bv1to1.lease_lot_register b, bv1to1.lease_auction_lot_master xt WHERE b.lot_id = xt.lot_id AND xt.catalog_id = cat.catalog_id AND ROWNUM = 1) AS category_id ");
		sqlBuilder.append("FROM ");
		sqlBuilder.append("    bv1to1.lease_auction_lot_master lot, ");
		sqlBuilder.append("    bv1to1.lease_auction_catalogue_master cat ");

		// Build the dynamic WHERE clause
		StringBuilder whereClause = new StringBuilder();
		List<Object> params = new ArrayList<>();

		// Condition 1: Upcoming auctions - lot_current_status is 12 (Upcoming) or 13
		// (Live)
		// because an auction can be upcoming but not live yet.
		whereClause.append(
				" WHERE lot.lot_current_status IN (12, 13) AND lot.lot_start_datetime > sysdate AND cat.catalog_id = lot.catalog_id ");

		// Condition 2: Filter out specific depots
		whereClause.append(
				" AND cat.depot_id NOT IN (SELECT department_id FROM bv1to1.ireps_department_master WHERE org_code = '01' AND org_zone IN (95, 99)) ");
		whereClause.append(
				" AND cat.depot_id IN (SELECT department_id FROM bv1to1.ireps_department_master ) ");

		// Add dynamic filters if present
		if (orgCode != null && !orgCode.isEmpty()) {
			whereClause.append(
					" AND cat.depot_id IN (SELECT department_id FROM bv1to1.ireps_department_master WHERE org_code = ?) ");
			params.add(orgCode);
		}
		if (zoneCode != null && !zoneCode.isEmpty()) {
			whereClause.append(
					" AND cat.depot_id IN (SELECT department_id FROM bv1to1.ireps_department_master WHERE org_zone = ?) ");
			params.add(zoneCode);
		}
		if (unitCode != null && !unitCode.isEmpty()) {
			whereClause.append(" AND cat.depot_id = ? ");
			params.add(unitCode);
		}
		if (categoryId != null && !categoryId.isEmpty()) {
			whereClause.append(
					" AND (SELECT b.asset_category_id FROM bv1to1.lease_lot_register b, bv1to1.lease_auction_lot_master xt WHERE b.lot_id = xt.lot_id AND xt.catalog_id = cat.catalog_id AND ROWNUM = 1) = ? ");
			params.add(categoryId);
		}

		sqlBuilder.append(whereClause);
		sqlBuilder.append(" ORDER BY auction_start_date ASC ");

		// Wrap the final query for pagination
		String finalSql = "SELECT * FROM (" + "SELECT ROWNUM seq, a.* FROM (" + sqlBuilder.toString()
				+ ") a WHERE ROWNUM <= ? ) WHERE seq > ?";

		int offset = (page - 1) * pageSize;
		int limit = page * pageSize;

		params.add(limit);
		params.add(offset);

		return jdbcTemplate.query(finalSql, params.toArray(), this::mapAuction);
	}

	// Closed Auctions with Dynamic Filters
	public List<Auction> getClosedAuctions(int page, int pageSize, String orgCode, String zoneCode, String unitCode,
			String categoryId,String catalogNo, String fromDate, String toDate) {
		// Base SQL to get the core auction data
		StringBuilder sqlBuilder = new StringBuilder();
		sqlBuilder.append("SELECT DISTINCT ");
		sqlBuilder.append(
				"    cat.depot_id, cat.schedule_id, bv1to1.pkg_common.get_deptname(cat.depot_id) AS dept_name, ");
		sqlBuilder.append(
				"    TO_CHAR( (SELECT MIN(lot_start_datetime) FROM bv1to1.lease_auction_lot_master alm WHERE cat.catalog_id = alm.catalog_id), 'DD-MM-YY HH24:MI:SS') AS auction_start_date, ");
		sqlBuilder.append(
				"    (SELECT bidding_system FROM bv1to1.lease_schedule_master asm WHERE asm.schedule_id = cat.schedule_id) AS bidding_system, ");
		sqlBuilder.append(
				"    (SELECT to_char(asm.tech_bid_close_time, 'DD-MM-YY HH24:MI:SS') FROM bv1to1.lease_schedule_master asm WHERE asm.schedule_id = cat.schedule_id) AS tech_bid_close_time, ");
		sqlBuilder.append(
				"    TO_CHAR( (SELECT MAX(lot_end_datetime) FROM bv1to1.lease_auction_lot_master alm WHERE cat.catalog_id = alm.catalog_id), 'DD-MM-YY HH24:MI:SS') AS auction_end_date, ");
		sqlBuilder.append(
				"    (SELECT ou_name FROM bv1to1.ireps_org_units WHERE ou_type = 2 AND ou_code <> '00' AND org_code = '01' AND status = 'A' AND org_zone = (SELECT org_zone FROM bv1to1.ireps_department_master WHERE org_code = '01' AND department_id = cat.depot_id) AND ireps_acct_id IS NOT NULL) AS org_zone_name, ");
		sqlBuilder.append("    cat.catalog_id, cat.catalog_no, ");
		sqlBuilder.append(
				"    (SELECT LISTAGG(DISTINCT category_name, ', ') WITHIN GROUP(ORDER BY category_id) FROM bv1to1.lease_category_master a, bv1to1.lease_lot_register b, bv1to1.lease_auction_lot_master xt WHERE a.category_id = b.asset_category_id AND b.lot_id = xt.lot_id AND xt.catalog_id = cat.catalog_id) AS categ_name, ");
		sqlBuilder.append(
				"    (SELECT b.asset_category_id FROM bv1to1.lease_lot_register b, bv1to1.lease_auction_lot_master xt WHERE b.lot_id = xt.lot_id AND xt.catalog_id = cat.catalog_id AND ROWNUM = 1) AS category_id ");
		sqlBuilder.append("FROM ");
		sqlBuilder.append("    bv1to1.lease_auction_lot_master lot, ");
		sqlBuilder.append("    bv1to1.lease_auction_catalogue_master cat ");

		// Build the dynamic WHERE clause
		StringBuilder whereClause = new StringBuilder();
		List<Object> params = new ArrayList<>();

		// Condition 1: Closed auctions
		whereClause.append(
				" WHERE lot.lot_current_status NOT IN (12, 13) AND lot.lot_end_datetime < sysdate AND cat.catalog_id = lot.catalog_id ");

		// Condition 2: Filter out specific depots
		whereClause.append(
				" AND cat.depot_id NOT IN (SELECT department_id FROM bv1to1.ireps_department_master WHERE org_code = '01' AND org_zone IN (95, 99)) ");
		whereClause.append(
				" AND cat.depot_id IN (SELECT department_id FROM bv1to1.ireps_department_master WHERE org_code = '01') ");

		// Add dynamic filters if present
		if (orgCode != null && !orgCode.isEmpty()) {
			whereClause.append(
					" AND cat.depot_id IN (SELECT department_id FROM bv1to1.ireps_department_master WHERE org_code = ?) ");
			params.add(orgCode);
		}
		if (zoneCode != null && !zoneCode.isEmpty()) {
			whereClause.append(
					" AND cat.depot_id IN (SELECT department_id FROM bv1to1.ireps_department_master WHERE org_zone = ?) ");
			params.add(zoneCode);
		}
		if (unitCode != null && !unitCode.isEmpty()) {
			whereClause.append(" AND cat.depot_id = ? ");
			params.add(unitCode);
		}
		if (categoryId != null && !categoryId.isEmpty()) {
			whereClause.append(
					" AND (SELECT b.asset_category_id FROM bv1to1.lease_lot_register b, bv1to1.lease_auction_lot_master xt WHERE b.lot_id = xt.lot_id AND xt.catalog_id = cat.catalog_id AND ROWNUM = 1) = ? ");
			params.add(categoryId);
		}

		sqlBuilder.append(whereClause);
		sqlBuilder.append(" ORDER BY auction_start_date DESC ");

		// Wrap the final query for pagination
		String finalSql = "SELECT * FROM (" + "SELECT ROWNUM seq, a.* FROM (" + sqlBuilder.toString()
				+ ") a WHERE ROWNUM <= ? ) WHERE seq > ?";

		int offset = (page - 1) * pageSize;
		int limit = page * pageSize;

		params.add(limit);
		params.add(offset);

		return jdbcTemplate.query(finalSql, params.toArray(), this::mapAuction);
	}

	// Common mapper
	private Auction mapAuction(ResultSet rs, int rowNum) throws SQLException {
		Auction auction = new Auction();
		auction.setDepotId(rs.getString("DEPOT_ID"));
		auction.setScheduleId(rs.getString("SCHEDULE_ID"));
		auction.setDeptName(rs.getString("DEPT_NAME"));
		auction.setCatalogId(rs.getString("CATALOG_ID"));
		auction.setCatalogNo(rs.getString("CATALOG_NO"));
		auction.setAuctionStartDate(rs.getString("AUCTION_START_DATE"));
		auction.setBiddingSystem(rs.getString("BIDDING_SYSTEM"));
		auction.setTechBidCloseTime(rs.getString("TECH_BID_CLOSE_TIME"));
		auction.setAuctionEndDate(rs.getString("AUCTION_END_DATE"));
		auction.setOrgZoneName(rs.getString("ORG_ZONE_NAME"));
		auction.setCategName(rs.getString("CATEG_NAME"));
		return auction;
	}

	// Fetch schedule info
	public Map<String, Object> getScheduleById(int scheduleId) {
		String sql = "SELECT schedule_id, "
				+ "to_char(auction_start_datetime, 'DD-MM-YY HH24:MI:SS') auction_start_datetime, "
				+ "depot_id, schedule_no, " + "bv1to1.PKG_COMMON.GET_DEPTNAME(depot_id) DEPT_NAME "
				+ "FROM bv1to1.lease_schedule_master " + "WHERE schedule_id = ?";
		return jdbcTemplate.queryForMap(sql, scheduleId);
	}

	// Fetch corrigendum list
	public List<Map<String, Object>> getCorrigendumByScheduleId(int scheduleId) {
		String sql = "SELECT CORRIGENDUM_ID, CORRIGENDUM_SUBJECT, CORRIGENDUM_DESCRIPTION, "
				+ "TO_CHAR(CORRIGENDUM_DATE, 'DD/MM/YYYY HH24:MI') AS CORRIGENDUM_DATE "
				+ "FROM bv1to1.LEASE_CORRIGENDUMS " + "WHERE SCHEDULE_ID = ? " + "ORDER BY CORRIGENDUM_DATE DESC";
		return jdbcTemplate.queryForList(sql, scheduleId);
	}

	public Map<String, Object> getAuctionCatalogueHeader(String catalogId) {
		String sql = "SELECT nvl(LACM.rtfr_flag, 'N') rtfr_flag, "
				+ "TO_CHAR(LACM.CAT_PUB_ON,'DD/MM/YYYY HH24:MI') AS CAT_PUB_ON, "
				+ "LACM.CATALOG_NO, LACM.AUCTIONING_AUTHORITY, "
				+ "DECODE(LACM.AUCTION_TYPE,0,'Close Ended',1,'Open Ended') AS AUCTION_TYPE, "
				+ "LACM.MAX_AUTO_EXTN, LACM.AUTO_EXTENSION_ZONE, LACM.AUTO_EXTENSION_DURATION, "
				+ "TO_CHAR((SELECT MIN(LOT_START_DATETIME) FROM LEASE_AUCTION_LOT_MASTER ALM WHERE ALM.CATALOG_ID = LACM.CATALOG_ID),'DD-MM-YY HH24:MI:SS') AS AUCTION_START, "
				+ "TO_CHAR((SELECT MAX(LOT_END_DATETIME) FROM LEASE_AUCTION_LOT_MASTER ALM WHERE ALM.CATALOG_ID = LACM.CATALOG_ID),'DD-MM-YY HH24:MI:SS') AS AUCTION_END, "
				+ "LACM.INITIAL_COOL_OFF_PERIOD, LACM.TIME_DIFF_BTN_LOTS, "
				+ "IDM.DEPARTMENT_NAME, IDM.ACCOUNT_NAME, LASM.BIDDING_SYSTEM "
				+ "FROM LEASE_AUCTION_CATALOGUE_MASTER LACM "
				+ "JOIN LEASE_SCHEDULE_MASTER LASM ON LASM.SCHEDULE_ID = LACM.SCHEDULE_ID "
				+ "JOIN IREPS_DEPARTMENT_MASTER IDM ON IDM.DEPARTMENT_ID = LACM.DEPOT_ID "
				+ "WHERE LACM.CATALOG_ID = ?";

		return jdbcTemplate.queryForMap(sql, catalogId);
	}

	public List<Map<String, Object>> getLotDetails(String catalogId) {
		String sql = "SELECT CASE WHEN (SYSDATE BETWEEN ALM.LOT_START_DATETIME AND ALM.LOT_END_DATETIME) "
				+ "THEN 'LIVE' WHEN (ALM.LOT_START_DATETIME > SYSDATE) THEN 'YETTOSTART' ELSE 'CLOSED' END AS LOT_RUN_FLAG, "
				+ "ALM.RP_VALUE, TO_CHAR(ALM.CP_START_DATETIME,'MM/DD/YYYY HH12:MI:SS PM') AS CP_START_DATETIME, "
				+ "GREATEST(ROUND((LOT_END_DATETIME - SYSDATE)*24*60*60,0),0) AS TIMELEFT, "
				+ "Maxbidrate(ALM.CATALOG_ID,ALM.LOT_AUCTION_ID,'N') AS BID_RATE, ALM.LOT_SEQUENCE_NO, "
				+ "TO_CHAR(ALM.LOT_END_DATETIME,'DD-MM-YYYY HH24:MI:SS') AS LIVE_LOT_END_DATETIME, "
				+ "LOT_CURRENT_STATUS, DECODE(LOT_CURRENT_STATUS, 11, 'In Draft Catalog', 12, 'New in Draft Catalogue', "
				+ "13, 'New in Published Catalogue', 14, 'Decision Pending', -5, 'Decision Pending', 15, 'Sold - Bid Sheet not signed', "
				+ "99, 'Sold - Bid Sheet not signed', 16, 'Rejected', 17, 'Withdrawn', 18, 'Decision Pending', 19, 'No Bids Received', "
				+ "20, 'Sold - Bid Sheet signed', 21, 'Sold - Bid Sheet signed', 'Not Available') AS LOT_STATUS_DESC, "
				+ "LR.LOT_ID, LR.LOT_NO, LR.LOT_MATERIAL_DESC, ALM.LOT_AUCTION_ID, TO_CHAR(ALM.LOT_START_DATETIME,'DD-MM-YY HH24:MI:SS') AS LOT_START_DATETIME, "
				+ "TO_CHAR(ALM.LOT_END_DATETIME,'DD-MM-YY HH24:MI:SS') AS LOT_END_DATETIME, ALM.MIN_INCR_AMT, LR.LOT_QTY, LR.NUMBER_OF_TRIPS, "
				+ "(SELECT UNIT_DESCRIPTION FROM IREPS_MEASUREMENT_UNITS WHERE UNIT_ID = LR.RATE_UNIT) AS RATE_UNIT, "
				+ "ALM.SEQ, ALM.SEQ_CATEGORY_PREFIX, ALM.SEQ_SUBCATEGORY_PREFIX, LR.QTY_UNIT, "
				+ "(SELECT VALUE FROM BV_ENUM_VALUES WHERE TYPE_NAME='MESURMENT_UNIT' AND INT_CODE = LR.QTY_UNIT) AS QTY_UNITNAME, "
				+ "LR.ASSET_CATEGORY_ID AS CATEGORY_ID, LR.ASSET_SUBCATEGORY_ID AS SUBCATEGORY_ID, "
				+ "(SELECT CATEGORY_NAME FROM LEASE_CATEGORY_MASTER WHERE CATEGORY_ID LIKE LR.ASSET_CATEGORY_ID) AS CATEGORY_NAME, "
				+ "(SELECT CATEGORY_NAME FROM LEASE_CATEGORY_MASTER WHERE CATEGORY_ID LIKE LR.ASSET_SUBCATEGORY_ID) AS SUBCATEGORY_NAME, "
				+ "(ALM.SEQ_CATEGORY_PREFIX || ALM.SEQ_SUBCATEGORY_PREFIX || '/' || ALM.SEQ) AS SEQCHAR, "
				+ "(SELECT MONETARY_LIMIT FROM LEASE_TURNOVER_REQ WHERE EXP_EARN_CODE = ALM.EXP_EARN_CODE) AS TQ, "
				+ "(SELECT COUNT(1) FROM LEASE_AUCTION_BID_DTLS WHERE LOT_ID=ALM.LOT_AUCTION_ID) AS BID_COUNT, "
				+ "ALM.EMD_PERCENTAGE, EMD_RS, ALM.RTFR_FLAG, BV1TO1.PKG_COMMON.GET_ACCT_NAME(ALM.RTFR_FIRM_ID) AS RTFR_FIRM_NAME, "
				+ "ALM.RTFR_FIRM_ID, ALM.TECH_BID_EMD " + "FROM LEASE_LOT_REGISTER LR, LEASE_AUCTION_LOT_MASTER ALM "
				+ "WHERE ALM.LOT_ID = LR.LOT_ID AND ALM.CATALOG_ID = ? "
				+ "ORDER BY SEQ_CATEGORY_PREFIX, SEQ_SUBCATEGORY_PREFIX, SEQ";

		return jdbcTemplate.queryForList(sql, catalogId);
	}

	public List<Map<String, Object>> getCategoryList(String categoryId) {
		String sql;
		if (!"999999".equalsIgnoreCase(categoryId)) {
			sql = "SELECT CATEGORY_ID, CATEGORY_NAME FROM LEASE_CATEGORY_MASTER "
					+ "WHERE CATEGORY_ATTRIBUTE = 'BOTH' AND PARENT_CATEGORY_ID = '000' "
					+ "AND CURRENT_STATUS = 'LIVE' AND CATEGORY_ID = ?";
			return jdbcTemplate.queryForList(sql, categoryId);
		} else {
			sql = "SELECT CATEGORY_ID, CATEGORY_NAME FROM LEASE_CATEGORY_MASTER "
					+ "WHERE CATEGORY_ATTRIBUTE = 'BOTH' AND PARENT_CATEGORY_ID = '000' "
					+ "AND CURRENT_STATUS = 'LIVE'";
			return jdbcTemplate.queryForList(sql);
		}
	}

	// ✅ Fetch Zone List
	public List<Map<String, Object>> getZoneList() {
		String sql = "SELECT org_zone AS int_code, ou_name AS value " + "FROM bv1to1.ireps_org_units "
				+ "WHERE ou_type = 2 " + "AND ou_code <> '00' " + "AND org_code = '01' " + "AND status = 'A' "
				+ "AND ireps_acct_id IS NOT NULL " + "AND org_zone NOT IN (95, 99) " + "ORDER BY ou_name";
		return jdbcTemplate.queryForList(sql);
	}

	// ✅ Fetch Unit List (Dependent on Zone)
	public List<Map<String, Object>> getUnitList(String orgZone) {
		String sql = "SELECT DEPARTMENT_ID AS INT_CODE, DEPARTMENT_NAME AS VALUE "
				+ "FROM BV1TO1.IREPS_DEPARTMENT_MASTER " + "WHERE ORG_CODE = '01' AND ORG_ZONE = ? "
				+ "ORDER BY DEPARTMENT_NAME";
		return jdbcTemplate.queryForList(sql, orgZone);
	}

	// ✅ Fetch Tax Duties (Dynamic by Zone & Department)
	public List<Map<String, Object>> getTaxDuties(String orgZone, String departmentId) {
		String sql = "SELECT " + "c.category_name, " + "b.gst_flag, " + "b.gst, " + "b.cess, " + "b.sac_code, "
				+ "b.reason_zero_gst, " + "b.rcm_applicable " + "FROM bv1to1.lease_taxes_duties_hdr a "
				+ "JOIN bv1to1.lease_taxes_duties_dtl b ON a.atd_id = b.atd_id "
				+ "JOIN bv1to1.lease_category_master c ON b.category_id = c.category_id "
				+ "JOIN bv1to1.ireps_department_master d ON a.org_code = d.org_code " + "AND a.org_zone = d.org_zone "
				+ "AND a.org_subunit_dept = d.org_subunit_dept " + "WHERE a.department_id = ? "
				+ "AND a.org_code = '01' " + "AND a.org_zone = ? " + "AND a.row_status <> 'X' "
				+ "AND a.version = (SELECT MAX(h.version) " + "                 FROM bv1to1.lease_taxes_duties_hdr h "
				+ "                 WHERE h.department_id = a.department_id "
				+ "                 AND h.row_status <> 'X' " + "                 AND h.org_code = a.org_code "
				+ "                 AND h.org_zone = a.org_zone "
				+ "                 AND h.org_subunit_dept = a.org_subunit_dept) " + "ORDER BY a.version DESC";

		return jdbcTemplate.query(sql, new Object[] { departmentId, orgZone }, (rs, rowNum) -> {
			Map<String, Object> map = new HashMap<>();
			map.put("category", rs.getString("category_name")); // ✅ Replaces category/subcategory
			map.put("gstApplicable", "Y".equalsIgnoreCase(rs.getString("gst_flag")));
			map.put("gstRate", rs.getString("gst"));
			map.put("cessRate", rs.getString("cess"));
			map.put("sacCode", rs.getString("sac_code"));
			// ✅ Leave blank if reason_zero_gst is negative
			String reason = rs.getString("reason_zero_gst");
			if (reason != null && reason.matches("-?\\d+(\\.\\d+)?") && Double.parseDouble(reason) < 0) {
				reason = "";
			}
			map.put("reason0GST", reason);
			map.put("rcmApplicable", "Y".equalsIgnoreCase(rs.getString("rcm_applicable"))); // ✅ Corrected flag usage
			return map;
		});
	}
	
	// ✅ Fetch Supporting Documents (Dynamic by Zone & Department)
	public List<Map<String, Object>> getSupportingDocuments(String orgZone, String departmentId) {

	    String sql = "SELECT "
	            + "d.doc_id, "
	            + "d.doc_name, "
	            + "d.doc_desc, "
	            + "d.doc_path, "
	            + "d.added_by_username, "
	            + "bv1to1.pkg_common.get_postname(d.added_by_postid) AS added_by_post_desc, "
	            + "TO_CHAR(d.added_on, 'dd-MON-yyyy HH24:MI') AS added_on "
	            + "FROM bv1to1.lease_taxes_duties_docs d "
	            + "WHERE d.org_zone = ? "
	            + "AND d.department_id = ? "
	            + "AND d.version = ( "
	            + "    SELECT MAX(h.version) "
	            + "    FROM bv1to1.lease_taxes_duties_hdr h "
	            + "    WHERE h.org_code = ( "
	            + "        SELECT dm.org_code FROM bv1to1.ireps_department_master dm WHERE dm.department_id = ? "
	            + "    ) "
	            + "    AND h.org_zone = ? "
	            + "    AND h.org_subunit_dept = ( "
	            + "        SELECT dm.org_subunit_dept FROM bv1to1.ireps_department_master dm WHERE dm.department_id = ? "
	            + "    ) "
	            + "    AND h.department_id = ? "
	            + "    AND NVL(h.row_status, 'A') <> 'X' "
	            + ") "
	            + "AND NVL(d.row_status, 'A') = 'A' "
	            + "ORDER BY d.added_on DESC";

	    return jdbcTemplate.query(sql,
	            new Object[] { orgZone, departmentId, departmentId, orgZone, departmentId, departmentId },
	            (rs, rowNum) -> {
	                Map<String, Object> map = new HashMap<>();
	                map.put("addedBy", rs.getString("added_by_username") + 
	                        " (" + rs.getString("added_by_post_desc") + ")");
	                map.put("description", rs.getString("doc_desc"));
	                map.put("fileName", rs.getString("doc_name"));
	                map.put("fileLink", "/uploads/" + rs.getString("doc_path")); // adjust base path as needed
	                map.put("uploadedOn", rs.getString("added_on"));
	                return map;
	            });
	}


}
