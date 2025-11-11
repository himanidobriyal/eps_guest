package com.ireps.admin.hightender.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;
import com.ireps.admin.hightender.model.TenderResult;
import com.ireps.admin.hightender.model.HightenderSearchCriteria;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.ArrayList;
import java.text.DecimalFormat;

@Repository
public class TenderSearchDao {
    
    @Autowired
    private JdbcTemplate jdbcTemplate;
    
    public List<TenderResult> searchTenders(HightenderSearchCriteria criteria) {
        StringBuilder sql = new StringBuilder();
        sql.append("SELECT ")
           .append("a.nit_id, ")
           .append("a.oid, ")
           .append("DECODE(a.work_area, 'PT', 'supply', 'WT', 'works', 'LT', 'lease') AS work_area, ")
           .append("tender_type, ")
           .append("SUBSTR(tender_description, 1, 50) AS tender_description, ")
           .append("(SELECT ou_short_name FROM bv1to1.ireps_org_units WHERE ou_short_name IS NOT NULL AND ireps_acct_id = railway_zone) AS zone, ")
           .append("(SELECT ou_name FROM bv1to1.ireps_org_units WHERE ou_type = '4' AND org_code = a.org_code AND ou_code <> '00' AND ou_code = rly_dept) AS dept, ")
           .append("bv1to1.pkg_common.get_deptname(department) AS dept_name, ")
           .append("rly_dept, ")
           .append("tender_number, ")
           .append("TO_CHAR(tender_opening_date, 'YYYY') AS year, ")
           .append("TO_CHAR(tender_opening_date, 'MM') AS month, ")
           .append("department, ")
           .append("TO_CHAR(tender_opening_date, 'DD/MM/YYYY') AS tender_opening_date_n, ")
           .append("NVL(corrected_est_value, estimated_value) AS estimated_value, ")
           .append("bidding_system, ")
           .append("bidding_style, ")
           .append("global_tender, ")
           .append("evaluation_criteria ")
           .append("FROM bv1to1.ireps_tender_header a, bv1to1.ireps_department_master b ")
           .append("WHERE ");
        
        List<Object> params = new ArrayList<>();
        
        // Date range filter - using your format
        if (criteria.getFromDate() != null && !criteria.getFromDate().isEmpty()) {
            sql.append("tender_publishing_date >= TO_DATE(?, 'YYYY-MM-DD') ");
            params.add(criteria.getFromDate());
        } else {
            sql.append("tender_publishing_date >= TO_DATE('01/01/2010', 'DD/MM/YYYY') ");
        }
        
        sql.append("AND ");
        
        if (criteria.getToDate() != null && !criteria.getToDate().isEmpty()) {
            sql.append("tender_publishing_date <= TO_DATE(?, 'YYYY-MM-DD') ");
            params.add(criteria.getToDate());
        } else {
            sql.append("tender_publishing_date <= TO_DATE('01/01/2025', 'DD/MM/YYYY') ");
        }
        
        // High value tender filter (between 100 Cr and max value)
        sql.append("AND NVL(corrected_est_value, estimated_value) BETWEEN 1000000000 AND 999999999999999 ");
        
        // Work area filter
        if (criteria.getWorkArea() != null && !criteria.getWorkArea().isEmpty() && !criteria.getWorkArea().equals("-1")) {
            sql.append("AND work_area = ? ");
            params.add(criteria.getWorkArea());
        }
        
        // Join conditions
        sql.append("AND a.department = b.department_id ")
           .append("AND a.org_code = b.org_code ")
           .append("AND a.rly_dept = b.org_subunit_dept ");
        
        // Organization filter
        if (criteria.getOrganization() != null && !criteria.getOrganization().equals("-1")) {
            sql.append("AND b.org_code = ? ");
            params.add(criteria.getOrganization());
        } else {
            sql.append("AND (? = '-1' OR b.org_code = ?) ");
            params.add("-1");
            params.add("-1");
        }
        
        // Zone filter
        if (criteria.getZone() != null && !criteria.getZone().equals("-1")) {
            sql.append("AND b.org_zone = ? ");
            params.add(criteria.getZone());
        } else {
            sql.append("AND (? = '-1' OR b.org_zone = ?) ");
            params.add("-1");
            params.add("-1");
        }
        
        // Department filter
        if (criteria.getDepartment() != null && !criteria.getDepartment().equals("-1")) {
            sql.append("AND b.org_subunit_dept = ? ");
            params.add(criteria.getDepartment());
        } else {
            sql.append("AND (? = '-1' OR b.org_subunit_dept = ?) ");
            params.add("-1");
            params.add("-1");
        }
        
        // Unit filter
        if (criteria.getUnit() != null && !criteria.getUnit().equals("-1")) {
            sql.append("AND b.department_id = ? ");
            params.add(criteria.getUnit());
        } else {
            sql.append("AND (? = '-1' OR b.department_id = ?) ");
            params.add("-1");
            params.add("-1");
        }
        
        // Status filters
        sql.append("AND tender_status NOT IN (0, 5.7) ")
           .append("AND railway_zone != 301 ")
           .append("ORDER BY estimated_value DESC");
        
        System.out.println("\n==========================");
        System.out.println("🔎 Executing Tender Search");
        System.out.println("==========================");
        System.out.println("Generated SQL:\n" + sql);
        System.out.println("Parameters passed: " + params);
        System.out.println("--------------------------");

        try {
            List<TenderResult> results = jdbcTemplate.query(sql.toString(), params.toArray(), new TenderResultRowMapper());
            if (results.isEmpty()) {
                System.out.println("⚠️ No tenders found for given criteria.");
            } else {
                System.out.println("✅ Query executed successfully. Results found: " + results.size());
            }
            return results;
        } catch (Exception e) {
            System.err.println("❌ ERROR: Tender search query failed!");
            System.err.println("Message: " + e.getMessage());
            e.printStackTrace();
            return new ArrayList<>();
        }
    }
    private static class TenderResultRowMapper implements RowMapper<TenderResult> {
        private DecimalFormat formatter = new DecimalFormat("#,##0.00");

        @Override
        public TenderResult mapRow(ResultSet rs, int rowNum) throws SQLException {
            TenderResult result = new TenderResult();

            try {
                result.setNitId(rs.getString("nit_id"));
                result.setOid(rs.getString("oid"));
                result.setWorkArea(rs.getString("work_area"));
                result.setTenderDescription(rs.getString("tender_description"));
                result.setZone(rs.getString("zone"));
                result.setDept(rs.getString("dept"));
                result.setDeptName(rs.getString("dept_name"));
                result.setTenderNumber(rs.getString("tender_number"));
                result.setYear(rs.getString("year"));
                result.setMonth(rs.getString("month"));
                result.setDepartment(rs.getString("department"));
                result.setTenderOpeningDate(rs.getString("tender_opening_date_n"));

                // Handle estimated value properly
                double estimatedValue = rs.getDouble("estimated_value");
                result.setEstimatedValue(estimatedValue);

                // --- ORIGINAL CODES ---
                String tenderTypeCode = rs.getString("tender_type");
                String globalTender = rs.getString("global_tender");
                String evaluationCriteria = rs.getString("evaluation_criteria");
                String biddingSystem = rs.getString("bidding_system");
                String biddingStyle = rs.getString("bidding_style");

                StringBuilder tenderTypeDescription = new StringBuilder();

                // Tender Type
                switch (tenderTypeCode) {
                    case "0": tenderTypeDescription.append("BT"); break;
                    case "1": tenderTypeDescription.append("LT"); break;
                    case "2": tenderTypeDescription.append("OP"); break;
                    case "3": tenderTypeDescription.append("SLT"); break;
                    case "4": tenderTypeDescription.append("PAC"); break;
                    case "5": tenderTypeDescription.append("ST"); break;
                    default: tenderTypeDescription.append(tenderTypeCode);
                }

                // Global Tender
                if ("1".equals(globalTender)) tenderTypeDescription.append("-GT");
                else if ("0".equals(globalTender)) tenderTypeDescription.append("-IN");

                // Evaluation Criteria
                switch (evaluationCriteria) {
                    case "3": tenderTypeDescription.append("-IC"); break;
                    case "4": tenderTypeDescription.append("-IT"); break;
                    case "5": tenderTypeDescription.append("-GR"); break;
                    case "6": tenderTypeDescription.append("-TV"); break;
                }

                // Bidding System
                if ("0".equals(biddingSystem)) tenderTypeDescription.append("-1P");
                else if ("1".equals(biddingSystem)) tenderTypeDescription.append("-2P");

                // Bidding Style
                if ("3".equals(biddingStyle)) tenderTypeDescription.append("-RA");

                // Set final tender type description
                result.setTenderType(tenderTypeDescription.toString());

                System.out.println("Mapped tender: " + result.getTenderNumber() + " - " 
                    + result.getTenderDescription() + " - Type: " + result.getTenderType()
                    + " - Value: " + estimatedValue);

            } catch (Exception e) {
                System.err.println("Error mapping row " + rowNum + ": " + e.getMessage());
                throw e;
            }

            return result;
        }
    }

}