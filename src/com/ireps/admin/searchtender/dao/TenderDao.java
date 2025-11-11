package com.ireps.admin.searchtender.dao;

import com.ireps.admin.searchtender.model.Tender;
import oracle.jdbc.OracleTypes;
import org.springframework.stereotype.Repository;

import javax.sql.DataSource;
import java.sql.*;
import java.util.*;

@Repository
public class TenderDao {

    private final DataSource dataSource;

    public TenderDao(DataSource dataSource) {
        this.dataSource = dataSource;
    }
    // ✅ Helper to convert YYYY-MM-DD → DD/MM/YYYY
    private String convertToDDMMYYYY(String yyyyMMdd) {
        if (yyyyMMdd == null || yyyyMMdd.trim().isEmpty()) return "";
        String[] p = yyyyMMdd.split("-");
        if (p.length != 3) return yyyyMMdd; // fallback
        return p[2] + "/" + p[1] + "/" + p[0];
    }

    // ===========================
    // ✅ DEFAULT TAB SEARCH
    // ===========================
    public List<Tender> getTenders(String tabType) {
        List<Tender> tenders = new ArrayList<>();

        String sql = "{call PKG_IREPS_SEARCH_NEW.IREPS_ADVANCE_SEARCH(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}";

        try (Connection con = dataSource.getConnection();
             CallableStatement cs = con.prepareCall(sql)) {

            cs.setInt(1, -1); // USERIDIN
            cs.setString(2, "-1"); // WORKAREA
            cs.setString(3, getSearchForString(tabType)); // SEARCH TEXT
            cs.setInt(4, -1); // RAILZONE
            cs.setInt(5, -1); // DEPT
            cs.setInt(6, -1); // UNIT
            cs.setInt(7, -1); // DEALSEC
            cs.setInt(8, -1); // TENDER STATUS
            cs.setInt(9, -1); // TENDER TYPE
            cs.setInt(10, -1); // BIDDING SYSTEM
            cs.setString(11, ""); // TODTPD

            // ✅ Date only in closed tabs
            if (tabType.equals("closed") || tabType.equals("closedERA")) {
                cs.setString(12, "03/09/2025");
                cs.setString(13, "03/09/2025");
            } else {
                cs.setString(12, "");
                cs.setString(13, "");
            }

            cs.setInt(14, 10);
            cs.setInt(15, 1);
            cs.setInt(16, 1);
            cs.setInt(17, 0);
            cs.setInt(18, -1);

            cs.registerOutParameter(19, Types.VARCHAR);
            cs.registerOutParameter(20, Types.INTEGER);
            cs.registerOutParameter(21, OracleTypes.CURSOR);

            cs.setString(22, "01"); // ORG CODE

            cs.execute();

            ResultSet rs = (ResultSet) cs.getObject(21);

            while (rs.next()) {
                Tender t = new Tender();
                t.setTenderNo(rs.getString("TENDER_NUMBER"));
                t.setTenderTitle(rs.getString("TENDER_DESCRIPTION"));
                t.setStatus(rs.getString("TENDER_STATUS"));
                t.setDueDate(rs.getString("DUE_DATE"));
                t.setDueDays(rs.getString("DUEDAYS"));
                t.setRailZone(rs.getString("RAIL_ZONE"));
                t.setDept(rs.getString("DEPT"));
                t.setDeptName(rs.getString("DEPTNAME"));
                t.setBidSys(rs.getString("BID_SYS"));
                tenders.add(t);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return tenders;
    }

    // ===========================
    // ✅ CUSTOM SEARCH (FORM)
    // ===========================
    public List<Tender> getCustomTenders(Map<String, String> params) {

        List<Tender> list = new ArrayList<>();

        String sql = "{call PKG_IREPS_SEARCH_NEW.IREPS_ADVANCE_SEARCH(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}";

        try (Connection con = dataSource.getConnection();
             CallableStatement cs = con.prepareCall(sql)) {

        	System.out.println("===== CUSTOM SEARCH START =====");
        	params.forEach((k, v) -> System.out.println(k + "=" + v));
        	System.out.println("================================");

        	// ✅ Normalize DEPTCODE & UNITCODE if empty
        	String deptCode = params.get("deptCode");
        	if (deptCode == null || deptCode.trim().isEmpty()) {
        	    deptCode = "-1";
        	    params.put("deptCode", "-1");
        	}

        	String unitCode = params.get("unitCode");
        	if (unitCode == null || unitCode.trim().isEmpty()) {
        	    unitCode = "-1";
        	    params.put("unitCode", "-1");
        	}

            // ✅ Convert dates before calling the procedure
            String fromDate = convertToDDMMYYYY(params.get("fromDate"));
            String toDate   = convertToDDMMYYYY(params.get("toDate"));


            // ✅ Correct IN parameter mapping

            cs.setInt(1, -1); // USERIDIN
            cs.setString(2, params.getOrDefault("workArea", "-1"));
            cs.setString(3, params.getOrDefault("searchText", "")); // ✅ main text
            cs.setString(4, params.getOrDefault("puCode", "-1"));
            cs.setString(5, deptCode);
            cs.setString(6, unitCode);

            cs.setString(7, "-1");
            cs.setString(8, params.getOrDefault("tenderStatus", "-1"));
            cs.setString(9, params.getOrDefault("tenderType", "-1"));
            cs.setString(10, params.getOrDefault("biddingType", "-1"));
            cs.setString(11, params.getOrDefault("tenderDateType", "TENDER_OPENING_DATE"));
            cs.setString(12, fromDate);
            cs.setString(13, toDate);

            cs.setInt(14, 25); // ✅ show 25 results
            cs.setInt(15, 1);
            cs.setInt(16, 1);
            cs.setInt(17, 0);
            cs.setInt(18, -1);

            cs.registerOutParameter(19, Types.VARCHAR);
            cs.registerOutParameter(20, Types.INTEGER);
            cs.registerOutParameter(21, OracleTypes.CURSOR);

            cs.setString(22, params.getOrDefault("orgCode", "01"));

            System.out.println("===== PROCEDURE PARAM VALUES =====");
            System.out.println("1 USERIDIN = -1");
            System.out.println("2 WORKAREA = " + params.get("workArea"));
            System.out.println("3 SEARCHFORSTRING = " + params.get("searchText"));
            System.out.println("4 RAILZONEIN = " + params.get("puCode"));
            System.out.println("5 DEPTIN = " + params.get("deptCode"));
            System.out.println("6 UNITIN = " + params.get("unitCode"));
            System.out.println("7 DEALSECIN = -1");
            System.out.println("8 TENDERSTATUSIN = " + params.get("tenderStatus"));
            System.out.println("9 TENDERTYPEIN = " + params.get("tenderType"));
            System.out.println("10 BIDDINGSYSIN = " + params.get("biddingType"));
            System.out.println("11 TODTPDIN = " + params.get("tenderDateType"));
            System.out.println("12 DT1IN = " + params.get("fromDate"));
            System.out.println("13 DT2IN = " + params.get("toDate"));
            System.out.println("22 ORGCODE = " + params.get("orgCode"));
            System.out.println("===================================");

            cs.execute();

            ResultSet rs = (ResultSet) cs.getObject(21);

            while (rs.next()) {
                Tender t = new Tender();

                t.setTenderNo(rs.getString("TENDER_NUMBER"));
                t.setTenderTitle(rs.getString("TENDER_DESCRIPTION"));
                t.setStatus(rs.getString("TENDER_STATUS"));
                t.setDueDate(rs.getString("DUE_DATE"));
                t.setDueDays(rs.getString("DUEDAYS"));
                t.setRailZone(rs.getString("RAIL_ZONE"));
                t.setDept(rs.getString("DEPTNAME"));

                list.add(t);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    // ✅ Helper
    private String getSearchForString(String tabType) {

        switch (tabType) {
            case "allActive": return "showPageLive";
            case "closed": return "showPageClosed";
            case "liveERA": return "showPageLiveAuction";
            case "closedERA": return "showPageClosedAuction";
            case "closingToday": return "closedTender";
            default: return "showPageLive";
        }
    }
}
