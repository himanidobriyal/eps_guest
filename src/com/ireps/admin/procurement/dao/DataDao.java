package com.ireps.admin.procurement.dao;
 
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;
  
@Repository
public class DataDao {

    private final JdbcTemplate jdbcTemplate;

    public DataDao(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }
 
    // ================= PAGINATED DATA =================
    public List<Map<String, Object>> fetchStockSummary(
            String plNo,
            String zone,
            String description,
            int offset,
            int size) {

        plNo = (plNo == null) ? "" : plNo.trim();
        zone = (zone == null) ? "" : zone.trim();
        description = (description == null) ? "" : description.trim();

        String sql =
        		"SELECT * FROM ( " +
        		" SELECT inner_query.*, ROWNUM rnum FROM ( " +

        		" SELECT a.pl_no, immis.Unit(a.nlu) nlu, b.des sdes, " +
        		" ROUND(SUM(NVL(a.bar,0))/COUNT(*),2) avg_bar, " +
        		" SUM(NVL(a.aac,0)) tot_aac, " +
        		" round(ROUND(SUM(NVL(a.bar,0))/COUNT(*),2) * SUM(NVL(a.aac,0)),2) aac_value " +

        		" FROM immis.mmm_stock a, immis.mmm_item b " +

        		" WHERE a.rly = ? " +

        		" AND (a.pl_no LIKE ?||'%' and UPPER(b.des) like '%'||UPPER(?)||'%') " +

        		" AND NVL(a.status,'O') NOT IN('C','X') " +
        		" AND NVL(a.srs_ind,'Y') <> 'N' " +
        		" AND NVL(a.AAC,0) > 0 " +

        		" AND b.rly = a.rly " +
        		" AND b.pl_no = a.pl_no " +

        		" AND (b.rly > '29' OR SUBSTR(b.pl_no,1,2) NOT IN ('98','79','92')) " +

        		" AND NVL(b.abc_cat,'C') <> 'D' " +

        		" GROUP BY a.pl_no,b.des,a.nlu " +

        		" ORDER BY a.pl_no " +

        		" ) inner_query WHERE ROWNUM <= ? " +

        		") WHERE rnum > ?";

        return jdbcTemplate.queryForList(
                sql,
                zone,
                plNo,
                description,
                offset + size,
                offset
        );
    }

    // ================= TOTAL COUNT =================
    public int fetchStockSummaryCount(
            String plNo,
            String zone,
            String description) {

        plNo = (plNo == null) ? "" : plNo.trim();
        zone = (zone == null) ? "" : zone.trim();
        description = (description == null) ? "" : description.trim();

        String countSql =
        		"SELECT COUNT(distinct a.pl_no) " +

        		"FROM immis.mmm_stock a, immis.mmm_item b " +

        		"WHERE a.rly = ? " +

        		" AND (a.pl_no LIKE ?||'%' and UPPER(b.des) like '%'||UPPER(?)||'%') " +

        		" AND NVL(a.status,'O') NOT IN('C','X') " +
        		" AND NVL(a.srs_ind,'Y') <> 'N' " +
        		" AND NVL(a.AAC,0) > 0 " +

        		" AND b.rly = a.rly " +
        		" AND b.pl_no = a.pl_no " +

        		" AND (b.rly > '29' OR SUBSTR(b.pl_no,1,2) NOT IN ('98','79','92')) " +

        		" AND NVL(b.abc_cat,'C') <> 'D'";

        return jdbcTemplate.queryForObject(
                countSql,
                Integer.class,
                zone,
                plNo,
                description
        );
    }
}
