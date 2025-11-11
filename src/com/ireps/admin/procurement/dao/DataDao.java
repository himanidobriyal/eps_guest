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

    public List<Map<String, Object>> fetchStockSummary(String plNo, String zone, String description) {
        plNo = (plNo == null) ? "" : plNo.trim();
        zone = (zone == null) ? "" : zone.trim();
        description = (description == null) ? "" : description.trim();

        String sql = "SELECT " +
                "a.pl_no, " +
                "immis.unit(a.nlu) AS nlu, " +
                "b.des AS sdes, " +
                "ROUND(SUM(NVL(a.bar, 0)) / COUNT(*), 2) AS avg_bar, " +
                "SUM(NVL(a.aac, 0)) AS tot_aac, " +
                "ROUND(ROUND(SUM(NVL(a.bar, 0)) / COUNT(*), 2) * SUM(NVL(a.aac, 0)), 2) AS aac_value " +
                "FROM immis.mmm_stock a " +
                "JOIN immis.mmm_item b ON b.rly = a.rly AND b.pl_no = a.pl_no " +
                "WHERE a.rly = ? " +
                "AND a.pl_no LIKE ? " +
                "AND b.des LIKE ? " +
                "GROUP BY a.pl_no, b.des, a.nlu";

        return jdbcTemplate.queryForList(
                sql,
                zone,
                plNo + "%",
                "%" + description + "%"
        );
    }
}
