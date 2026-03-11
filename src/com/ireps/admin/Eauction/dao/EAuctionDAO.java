package com.ireps.admin.Eauction.dao;
 
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.ireps.admin.Eauction.model.AuctionSchedule;

@Repository
public class EAuctionDAO {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    /**
     * Get all accounts (initial load for dropdown)
     */ 
    public List<Map<String, Object>> getAllAccounts() {
        String sql = "SELECT DISTINCT ACCOUNT_NAME, ACCOUNT_ID " +
                     "FROM IREPS_DEPARTMENT_MASTER " +
                     "WHERE DEPT_TYPE = -77 AND ACCOUNT_ID > 0 " +
                     "ORDER BY ACCOUNT_NAME";

        try {
            System.out.println("Executing: getAllAccounts");
            List<Map<String, Object>> result = jdbcTemplate.queryForList(sql);
            System.out.println("getAllAccounts returned: " + result.size() + " records");
            return result;
        } catch (Exception e) {
            System.err.println("Error in getAllAccounts: " + e.getMessage());
            e.printStackTrace();
            return new ArrayList<>();
        }
    }

    /**
     * Get Indian Railway accounts (excluding DMRC)
     */
    public List<Map<String, Object>> getIndianRailwayAccounts() {
        String sql = "SELECT DISTINCT ACCOUNT_NAME, ACCOUNT_ID " +
                     "FROM IREPS_DEPARTMENT_MASTER " +
                     "WHERE DEPT_TYPE = -77 " +
                     "AND ACCOUNT_ID NOT IN (30941, 55541) " +
                     "ORDER BY ACCOUNT_NAME";

        try {
            System.out.println("Executing: getIndianRailwayAccounts");
            List<Map<String, Object>> result = jdbcTemplate.queryForList(sql);
            System.out.println("getIndianRailwayAccounts returned: " + result.size() + " records");
            return result;
        } catch (Exception e) {
            System.err.println("Error in getIndianRailwayAccounts: " + e.getMessage());
            e.printStackTrace();
            return new ArrayList<>();
        }
    }

    /**
     * Get DMRC accounts only
     */
    public List<Map<String, Object>> getDMRCAccounts() {
        String sql = "SELECT DISTINCT ACCOUNT_NAME, ACCOUNT_ID " +
                     "FROM IREPS_DEPARTMENT_MASTER " +
                     "WHERE DEPT_TYPE = -77 " +
                     "AND ACCOUNT_ID IN (30941, 55541) " +
                     "ORDER BY ACCOUNT_NAME";

        try {
            System.out.println("Executing: getDMRCAccounts");
            List<Map<String, Object>> result = jdbcTemplate.queryForList(sql);
            System.out.println("getDMRCAccounts returned: " + result.size() + " records");
            return result;
        } catch (Exception e) {
            System.err.println("Error in getDMRCAccounts: " + e.getMessage());
            e.printStackTrace();
            return new ArrayList<>();
        }
    }

    /**
     * Get other accounts
     */
    public List<Map<String, Object>> getOtherAccounts() {
        return getAllAccounts();
    }

    /**
     * Get depots by account ID
     */
    public List<Map<String, Object>> getDepotsByAccountId(String accountId) {
        String sql = "SELECT DEPOT_ID, DEPOT_NAME " +
                     "FROM AUCTION_DEPOT_MASTER " +
                     "WHERE ACCOUNT_ID = ? " +
                     "AND DEPT_TYPE = -77 " +
                     "ORDER BY DEPOT_NAME";
        
        try {
            System.out.println("Executing: getDepotsByAccountId for accountId: " + accountId);
            List<Map<String, Object>> result = jdbcTemplate.queryForList(sql, accountId);
            System.out.println("getDepotsByAccountId returned: " + result.size() + " records");
            return result;
        } catch (Exception e) {
            System.err.println("Error in getDepotsByAccountId: " + e.getMessage());
            e.printStackTrace();
            return new ArrayList<>();
        }
    }

    /**
     * Get live auctions with PDF path
     */
    public List<AuctionSchedule> getLiveAuctions(String accountId, String depotId,
            String catalogStatus, Date fromDate, Date toDate,
            String scheduleNo,
            int page, int pageSize){
        
        StringBuilder sql = new StringBuilder(
            "SELECT * FROM (" +
            "SELECT A.SCHEDULE_NO AS SCHEDULE_NO, " +
            "A.SCHEDULE_ID AS SCHEDULE_ID, " +
            "C.ACCOUNT_ID AS ACCOUNT_ID, " +
            "A.SCHEDULE_STATUS AS SCHEDULE_STATUS, " +
            "NVL(D.CATALOG_ID, -5) AS CATALOG_ID, " +
            "D.CAT_FILE_PATH, " +
            "D.CATALOG_STATUS AS CATALOG_STATUS, " +
            "(SELECT ACCOUNT_NAME FROM MR_ACCT_PROFILE " +
            " WHERE ACCOUNT_ID = (SELECT ACCOUNT_ID FROM AUCTION_DEPOT_MASTER " +
            "                     WHERE DEPOT_ID = D.DEPOT_ID)) AS ACCOUNT_NAME, " +
            "(SELECT DEPOT_NAME FROM AUCTION_DEPOT_MASTER " +
            " WHERE DEPOT_ID = D.DEPOT_ID) AS DEPOT_NAME, " +
            "D.DEPOT_ID, " +
            "D.CATALOG_NO, " +
            "DECODE(D.CATALOG_STATUS, 0, 'Draft', 1, 'Published', 2, 'Closed') AS CATALOGSTATUS, " +
            "D.AUCTION_TYPE, " +
            "TO_CHAR(A.AUCTION_START_DATETIME, 'dd/mm/yy hh24:mi:ss') AS AUCTION_START_DATETIME, " +
            "A.AUCTION_START_DATETIME AS SORT_COL, " +
            "(SELECT TO_CHAR(MAX(LOT_END_DATETIME), 'DD/MM/YY HH24:MI:SS') " +
            " FROM AUCTION_LOT_MASTER WHERE CATALOG_ID = D.CATALOG_ID) AS AUCTION_END_DATETIME " +
            "FROM AUCTION_SCHEDULE_MASTER A, " +
            "AUCTION_CATALOG_MASTER D, " +
            "AUCTION_DEPOT_MASTER B, " +
            "MR_ACCT_PROFILE C " +
            "WHERE D.SCHEDULE_ID(+) = A.SCHEDULE_ID " +
            "AND D.CATALOG_STATUS IN (1) " +
            "AND A.DEPOT_ID = B.DEPOT_ID " +
            "AND B.ACCOUNT_ID = C.ACCOUNT_ID " +
            "AND A.SCHEDULE_STATUS IN (-1, 1) " +
            "AND A.AUCTION_START_DATETIME <= SYSDATE " +
            "AND B.ACCOUNT_ID NOT IN ('30941', '55541') " +
            ") X WHERE X.SORT_COL >= (SYSDATE - (365*3)) "
        );

        List<Object> params = new ArrayList<>();

        if (accountId != null && !accountId.isEmpty()) {
            sql.append("AND X.ACCOUNT_ID = ? ");
            params.add(accountId);
        }

        if (depotId != null && !depotId.isEmpty()) {
            sql.append("AND X.DEPOT_ID = ? ");
            params.add(depotId);
        }

        if (catalogStatus != null && !catalogStatus.isEmpty()) {
            sql.append("AND X.CATALOG_STATUS = ? ");
            params.add(Integer.parseInt(catalogStatus));
        }

        if (fromDate != null) {
            sql.append("AND TRUNC(X.SORT_COL) >= TRUNC(?) ");
            params.add(new java.sql.Date(fromDate.getTime()));
        }

        if (toDate != null) {
            sql.append("AND TRUNC(X.SORT_COL) <= TRUNC(?) ");
            params.add(new java.sql.Date(toDate.getTime()));
        }
        
     // ⭐ ADD THIS FOR SEARCH BY SCHEDULE NO

     // ⭐ CORRECT SEARCH — use LIKE instead of =

        if (scheduleNo != null && !scheduleNo.trim().isEmpty()) {

            sql.append("AND UPPER(X.SCHEDULE_NO) LIKE UPPER(?) ");

            params.add("%" + scheduleNo.trim() + "%");

        }


     // ⭐ FINAL PAGINATION FIX FOR ORACLE 11g

        int startRow = (page - 1) * pageSize;
        int endRow = page * pageSize;

        String finalQuery =
            "SELECT * FROM (" +
            " SELECT inner_query.*, ROWNUM rn FROM (" +
            sql.toString() +
            " ORDER BY X.SORT_COL DESC " +
            " ) inner_query WHERE ROWNUM <= ?" +
            ") WHERE rn > ?";

        params.add(endRow);
        params.add(startRow);

        sql = new StringBuilder(finalQuery);



        try {
            System.out.println("Executing getLiveAuctions");
            

            List<AuctionSchedule> result = jdbcTemplate.query(sql.toString(), params.toArray(), 
                    new AuctionScheduleRowMapper());
            System.out.println("getLiveAuctions returned: " + result.size() + " records");
            return result;
        } catch (Exception e) {
            System.err.println("Error in getLiveAuctions: " + e.getMessage());
            e.printStackTrace();
            return new ArrayList<>();
        }
    }

    /**
     * Get upcoming auctions
     */
    public List<AuctionSchedule> getUpcomingAuctions(String accountId, String depotId,
            Date fromDate, Date toDate, int page, int pageSize) {
        
        StringBuilder sql = new StringBuilder(
            "SELECT * FROM (" +
            "SELECT asm.SCHEDULE_NO, asm.SCHEDULE_ID, asm.SCHEDULE_STATUS, " +
            "idm.ACCOUNT_NAME, idm.ACCOUNT_ID, idm.DEPOT_NAME, " +
            "NULL AS CATALOG_ID, idm.DEPOT_ID, " +
            "NULL AS CATALOG_STATUS, NULL AS CATALOG_NO, NULL AS CAT_FILE_PATH, " +
            "1 AS AUCTION_TYPE, " +
            "TO_CHAR(ASM.AUCTION_START_DATETIME, 'DD/MM/YY HH24:MI:SS') AS AUCTION_START_DATETIME, " +
            "ASM.AUCTION_START_DATETIME AS SORT_COL, " +
            "TO_CHAR(ASM.AUCTION_END_DATETIME, 'DD/MM/YY HH24:MI:SS') AS AUCTION_END_DATETIME " +
            "FROM AUCTION_SCHEDULE_MASTER asm, IREPS_DEPARTMENT_MASTER idm " +
            "WHERE asm.SCHEDULE_STATUS = 0 " +
            "AND idm.DEPARTMENT_ID = asm.DEPOT_ID " +
            "AND asm.AUCTION_END_DATETIME IS NULL " +
            "AND asm.AUCTION_START_DATETIME > SYSDATE " +
            "AND idm.ACCOUNT_ID NOT IN (301) " +
            "UNION " +
            "SELECT asm.SCHEDULE_NO, asm.SCHEDULE_ID, asm.SCHEDULE_STATUS, " +
            "idm.ACCOUNT_NAME, idm.ACCOUNT_ID, idm.DEPOT_NAME, " +
            "acm.CATALOG_ID, idm.DEPOT_ID, " +
            "acm.CATALOG_STATUS AS CATALOG_STATUS, acm.CATALOG_NO, acm.CAT_FILE_PATH, " +
            "1 AS AUCTION_TYPE, " +
            "TO_CHAR(ASM.AUCTION_START_DATETIME, 'DD/MM/YY HH24:MI:SS') AS AUCTION_START_DATETIME, " +
            "ASM.AUCTION_START_DATETIME AS SORT_COL, " +
            "TO_CHAR(ASM.AUCTION_END_DATETIME, 'DD/MM/YY HH24:MI:SS') AS AUCTION_END_DATETIME " +
            "FROM AUCTION_SCHEDULE_MASTER asm, IREPS_DEPARTMENT_MASTER idm, " +
            "AUCTION_CATALOG_MASTER acm " +
            "WHERE asm.SCHEDULE_STATUS = 1 " +
            "AND acm.CATALOG_STATUS = 0 " +
            "AND idm.DEPARTMENT_ID = asm.DEPOT_ID " +
            "AND acm.SCHEDULE_ID = asm.SCHEDULE_ID " +
            "AND asm.AUCTION_START_DATETIME > SYSDATE " +
            "AND idm.ACCOUNT_ID NOT IN (301) " +
            ") X WHERE X.SORT_COL >= SYSDATE "
        );

        List<Object> params = new ArrayList<>();

        if (accountId != null && !accountId.isEmpty()) {
            sql.append("AND X.ACCOUNT_ID = ? ");
            params.add(accountId);
        }

        if (depotId != null && !depotId.isEmpty()) {
            sql.append("AND X.DEPOT_ID = ? ");
            params.add(depotId);
        }

        if (fromDate != null) {
            sql.append("AND TRUNC(X.SORT_COL) >= TRUNC(?) ");
            params.add(new java.sql.Date(fromDate.getTime()));
        }

        if (toDate != null) {
            sql.append("AND TRUNC(X.SORT_COL) <= TRUNC(?) ");
            params.add(new java.sql.Date(toDate.getTime()));
        }

     // ⭐ FINAL PAGINATION FIX FOR ORACLE 11g

        int startRow = (page - 1) * pageSize;
        int endRow = page * pageSize;

        String finalQuery =
            "SELECT * FROM (" +
            " SELECT inner_query.*, ROWNUM rn FROM (" +
            sql.toString() +
            " ORDER BY X.SORT_COL DESC " +
            " ) inner_query WHERE ROWNUM <= ?" +
            ") WHERE rn > ?";

        params.add(endRow);
        params.add(startRow);

        sql = new StringBuilder(finalQuery);



        try {
            System.out.println("Executing getUpcomingAuctions");
            
            List<AuctionSchedule> result = jdbcTemplate.query(sql.toString(), params.toArray(), 
                    new AuctionScheduleRowMapper());
            System.out.println("getUpcomingAuctions returned: " + result.size() + " records");
            return result;
        } catch (Exception e) {
            System.err.println("Error in getUpcomingAuctions: " + e.getMessage());
            e.printStackTrace();
            return new ArrayList<>();
        }
    }

    /**
     * Get PDF path by catalog ID
     */
    public String getCatalogPDFPath(Long catalogId) {
        String sql = "SELECT CAT_FILE_PATH FROM AUCTION_CATALOG_MASTER WHERE CATALOG_ID = ?";
        
        try {
            System.out.println("Fetching PDF path for catalog ID: " + catalogId);
            List<Map<String, Object>> results = jdbcTemplate.queryForList(sql, catalogId);
            
            if (!results.isEmpty() && results.get(0).get("CAT_FILE_PATH") != null) {
                String path = results.get(0).get("CAT_FILE_PATH").toString();
                System.out.println("Found PDF path: " + path);
                return path;
            }
            
            System.out.println("No PDF path found for catalog ID: " + catalogId);
            return null;
            
        } catch (Exception e) {
            System.err.println("Error fetching PDF path: " + e.getMessage());
            e.printStackTrace();
            return null;
        }
    }

    /**
     * Get catalog details with PDF info
     */
    public Map<String, Object> getCatalogDetails(Long catalogId) {
        String sql = "SELECT CATALOG_ID, CATALOG_NO, CAT_FILE_PATH, CATALOG_STATUS, " +
                     "DEPOT_ID, SCHEDULE_ID, AUCTION_TYPE, " +
                     "TO_CHAR(CREATED_DATE, 'DD/MM/YYYY HH24:MI:SS') AS CREATED_DATE " +
                     "FROM AUCTION_CATALOG_MASTER WHERE CATALOG_ID = ?";
        
        try {
            System.out.println("Fetching catalog details for ID: " + catalogId);
            List<Map<String, Object>> results = jdbcTemplate.queryForList(sql, catalogId);
            
            if (!results.isEmpty()) {
                return results.get(0);
            }
            
            return null;
            
        } catch (Exception e) {
            System.err.println("Error fetching catalog details: " + e.getMessage());
            e.printStackTrace();
            return null;
        }
    }
    
    /**
     * ⭐ FIXED: Get catalog header details
     * AUCTION_TYPE is in AUCTION_CATALOG_MASTER table
     */
    public Map<String, Object> getCatalogHeaderDetails(Long catalogId) {
        String sql = 
            "SELECT c.CATALOG_ID, c.CATALOG_NO, c.CATALOG_STATUS, " +
            "       c.SCHEDULE_ID, s.SCHEDULE_NO, " +
            "       c.DEPOT_ID, d.DEPOT_NAME, " +
            "       d.ACCOUNT_ID, a.ACCOUNT_NAME, " +
            "       TO_CHAR(s.AUCTION_START_DATETIME, 'DD/MM/YYYY HH24:MI:SS') AS AUCTION_START_DATETIME, " +
            "       TO_CHAR(s.AUCTION_END_DATETIME, 'DD/MM/YYYY HH24:MI:SS') AS AUCTION_END_DATETIME, " +
            "       c.CAT_FILE_PATH, " +
            "       c.AUCTION_TYPE, " +
            "       DECODE(c.CATALOG_STATUS, 0, 'Draft', 1, 'Published', 2, 'Closed', 'Unknown') AS STATUS_LABEL " +
            "FROM AUCTION_CATALOG_MASTER c " +
            "LEFT JOIN AUCTION_SCHEDULE_MASTER s ON c.SCHEDULE_ID = s.SCHEDULE_ID " +
            "LEFT JOIN AUCTION_DEPOT_MASTER d ON c.DEPOT_ID = d.DEPOT_ID " +
            "LEFT JOIN MR_ACCT_PROFILE a ON d.ACCOUNT_ID = a.ACCOUNT_ID " +
            "WHERE c.CATALOG_ID = ?";
        
        try {
            System.out.println("========================================");
            System.out.println("Fetching catalog header for ID: " + catalogId);
            List<Map<String, Object>> results = jdbcTemplate.queryForList(sql, catalogId);
            
            if (!results.isEmpty()) {
                Map<String, Object> header = results.get(0);
                System.out.println("✓ Catalog header found!");
                System.out.println("  - Catalog No: " + header.get("CATALOG_NO"));
                System.out.println("  - Account: " + header.get("ACCOUNT_NAME"));
                System.out.println("  - Depot: " + header.get("DEPOT_NAME"));
                System.out.println("  - Status: " + header.get("CATALOG_STATUS"));
                System.out.println("  - Auction Type: " + header.get("AUCTION_TYPE"));
                System.out.println("========================================");
                return header;
            }
            
            System.out.println("⚠ No catalog found for ID: " + catalogId);
            System.out.println("========================================");
            return null;
            
        } catch (Exception e) {
            System.err.println("========================================");
            System.err.println("✗ Error fetching catalog header: " + e.getMessage());
            e.printStackTrace();
            System.err.println("========================================");
            return null;
        }
    }

    /**
     * ⭐ SIMPLIFIED VERSION: Get lots by catalog ID - Only existing columns
     * AUCTION_LOT_MASTER only has: LOT_ID, CATALOG_ID, LOT_START_DATETIME, LOT_END_DATETIME
     */
    public List<Map<String, Object>> getLotsByCatalogId(Long catalogId) {
        String sql = 
            "SELECT L.LOT_ID, L.LOT_NO, " +
            "       A.ACCOUNT_ID, A.ACCOUNT_NAME, " +
            "       L.DEPOT_ID, D.DEPOT_NAME, " +
            "       L.LOT_QTY, L.SALE_UNIT, " +
            "       (SELECT VALUE FROM bv_enum_values WHERE TYPE_NAME='MESURMENT_UNIT' AND INT_CODE = L.SALE_UNIT) AS SALE_UNIT_NAME, " +
            "       L.BUYER_QTY, L.BUYER_UNIT, " +
            "       (SELECT VALUE FROM bv_enum_values WHERE TYPE_NAME='MESURMENT_UNIT' AND INT_CODE = L.BUYER_UNIT) AS BUYER_UNIT_NAME, " +
            "       L.CATEGORY_ID, " +
            "       (SELECT CATEGORY_NAME FROM AUCTION_CATEGORY_MASTER WHERE CATEGORY_ID = L.CATEGORY_ID) AS CATEGORY_NAME, " +
            "       L.LOCATION, L.CUSTODIAN, L.SALES_TAX, " +
            "       L.PL_NO, L.BOOK_RATE, " +
            "       L.LOT_MATERIAL_DESC, L.SPECIAL_CONDITIONS, " +
            "       L.EXCLUDED_ITEMS, L.LOT_STATUS, " +
            "       TO_CHAR(ALM.LOT_START_DATETIME, 'DD/MM/YY HH24:MI:SS') AS LOT_START_DATETIME, " +
            "       TO_CHAR(ALM.LOT_END_DATETIME, 'DD/MM/YY HH24:MI:SS') AS LOT_END_DATETIME, " +
            "       NULL AS RESERVE_PRICE, " +
            "       NULL AS BID_INCREMENT " +
            "FROM LOT_REGISTER L " +
            "INNER JOIN AUCTION_LOT_MASTER ALM ON L.LOT_ID = ALM.LOT_ID " +
            "LEFT JOIN AUCTION_DEPOT_MASTER D ON L.DEPOT_ID = D.DEPOT_ID " +
            "LEFT JOIN MR_ACCT_PROFILE A ON D.ACCOUNT_ID = A.ACCOUNT_ID " +
            "WHERE ALM.CATALOG_ID = ? " +
            "ORDER BY L.LOT_NO ASC";
        
        try {
            System.out.println("========================================");
            System.out.println("✓ Fetching lots for catalog ID: " + catalogId);
            
            List<Map<String, Object>> results = jdbcTemplate.queryForList(sql, catalogId);
            
            System.out.println("✓ Query executed successfully!");
            System.out.println("  - Total lots found: " + results.size());
            
            if (!results.isEmpty()) {
                System.out.println("  - First lot details:");
                Map<String, Object> firstLot = results.get(0);
                System.out.println("    - Lot No: " + firstLot.get("LOT_NO"));
                System.out.println("    - Material: " + firstLot.get("LOT_MATERIAL_DESC"));
                System.out.println("    - Qty: " + firstLot.get("LOT_QTY") + " " + firstLot.get("SALE_UNIT_NAME"));
                System.out.println("    - Start: " + firstLot.get("LOT_START_DATETIME"));
                System.out.println("    - End: " + firstLot.get("LOT_END_DATETIME"));
                System.out.println("    - Status: " + firstLot.get("LOT_STATUS"));
            } else {
                System.out.println("⚠ WARNING: No lots found!");
                
                // Debug check 1
                String checkCatalog = "SELECT COUNT(*) FROM AUCTION_CATALOG_MASTER WHERE CATALOG_ID = ?";
                Integer catalogExists = jdbcTemplate.queryForObject(checkCatalog, Integer.class, catalogId);
                System.out.println("  - Catalog exists: " + (catalogExists > 0 ? "YES ✓" : "NO ✗"));
                
                // Debug check 2
                String checkLotMapping = "SELECT COUNT(*) FROM AUCTION_LOT_MASTER WHERE CATALOG_ID = ?";
                Integer lotCount = jdbcTemplate.queryForObject(checkLotMapping, Integer.class, catalogId);
                System.out.println("  - Lots mapped in AUCTION_LOT_MASTER: " + lotCount);
                
                // Debug check 3 - Show lot IDs if any
                if (lotCount > 0) {
                    String getLotIds = "SELECT LOT_ID FROM AUCTION_LOT_MASTER WHERE CATALOG_ID = ?";
                    List<Map<String, Object>> lotIds = jdbcTemplate.queryForList(getLotIds, catalogId);
                    System.out.println("  - Lot IDs in mapping: " + lotIds);
                }
            }
            
            System.out.println("========================================");
            return results;
            
        } catch (Exception e) {
            System.err.println("========================================");
            System.err.println("✗ ERROR fetching lots!");
            System.err.println("  - Catalog ID: " + catalogId);
            System.err.println("  - Error Message: " + e.getMessage());
            e.printStackTrace();
            System.err.println("========================================");
            return new ArrayList<>();
        }
    }

    /**
     * Row mapper for AuctionSchedule
     */
    private class AuctionScheduleRowMapper implements RowMapper<AuctionSchedule> {
        @Override
        public AuctionSchedule mapRow(ResultSet rs, int rowNum) throws SQLException {
            AuctionSchedule auction = new AuctionSchedule();
            
            try { auction.setScheduleNo(rs.getString("SCHEDULE_NO")); } 
            catch (Exception e) { auction.setScheduleNo(null); }
            
            try { auction.setScheduleId(rs.getLong("SCHEDULE_ID")); } 
            catch (Exception e) { auction.setScheduleId(null); }
            
            try { auction.setAccountId(rs.getString("ACCOUNT_ID")); } 
            catch (Exception e) { auction.setAccountId(null); }
            
            try { auction.setScheduleStatus(rs.getInt("SCHEDULE_STATUS")); } 
            catch (Exception e) { auction.setScheduleStatus(null); }
            
            try {
                Object catalogId = rs.getObject("CATALOG_ID");
                if (catalogId != null) {
                    auction.setCatalogId(((Number) catalogId).longValue());
                }
            } catch (Exception e) { auction.setCatalogId(null); }
            
            try { auction.setCatFilePath(rs.getString("CAT_FILE_PATH")); } 
            catch (Exception e) { auction.setCatFilePath(null); }
            
            try {
                Object catalogStatus = rs.getObject("CATALOG_STATUS");
                if (catalogStatus != null) {
                    auction.setCatalogStatus(((Number) catalogStatus).intValue());
                }
            } catch (Exception e) { auction.setCatalogStatus(null); }
            
            try { auction.setAccountName(rs.getString("ACCOUNT_NAME")); } 
            catch (Exception e) { auction.setAccountName(null); }
            
            try { auction.setDepotName(rs.getString("DEPOT_NAME")); } 
            catch (Exception e) { auction.setDepotName(null); }
             
            try { auction.setDepotId(rs.getString("DEPOT_ID")); } 
            catch (Exception e) { auction.setDepotId(null); }
            
            try { auction.setCatalogNo(rs.getString("CATALOG_NO")); } 
            catch (Exception e) { auction.setCatalogNo(null); }
            
            try { auction.setCatalogStatusLabel(rs.getString("CATALOGSTATUS")); } 
            catch (Exception e) { auction.setCatalogStatusLabel(null); }
            
            try { auction.setAuctionType(rs.getInt("AUCTION_TYPE")); } 
            catch (Exception e) { auction.setAuctionType(null); }
            
            try { auction.setAuctionStartDatetime(rs.getString("AUCTION_START_DATETIME")); } 
            catch (Exception e) { auction.setAuctionStartDatetime(null); }
            
            try { auction.setAuctionEndDatetime(rs.getString("AUCTION_END_DATETIME")); } 
            catch (Exception e) { auction.setAuctionEndDatetime(null); }
            
            return auction;
        }
    }
}