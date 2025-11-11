package com.ireps.admin.SPO.dao;

import java.math.BigDecimal;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.ireps.admin.SPO.model.PurchaseOrder;

@Repository
public class PurchaseOrderDao {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    // RowMapper with null-safe fields and string conversions
    private final RowMapper<PurchaseOrder> purchaseOrderRowMapper = new RowMapper<PurchaseOrder>() {
        @Override
        public PurchaseOrder mapRow(ResultSet rs, int rowNum) throws SQLException {
            PurchaseOrder po = new PurchaseOrder();
            po.setRly(rs.getString("rly"));
            po.setPokey(rs.getString("pokey"));
            po.setPoNo(rs.getString("po_no"));

            // formatted PO date
            po.setPoDateStr(rs.getString("po_date"));

            po.setPurDiv(rs.getString("pur_div"));
            po.setSupplierName(rs.getString("supplier_name"));
            po.setVaddr(rs.getString("vaddr"));
            po.setVcode(rs.getString("vcode"));
            po.setNs(rs.getString("ns"));
            po.setPoValue(rs.getBigDecimal("po_value"));
            po.setUdes(rs.getString("udes"));
            po.setPlNo(rs.getString("pl_no"));
            po.setDes(rs.getString("des"));
            po.setPoSr(rs.getString("po_sr"));
            po.setCname(rs.getString("cname"));

            // po_qty as BigDecimal + String
            BigDecimal poQty = rs.getBigDecimal("po_qty");
            if (poQty != null) {
                po.setPoQty(poQty);
                po.setPoQtyStr(poQty.toPlainString());
            } else {
                po.setPoQty(BigDecimal.ZERO);
                po.setPoQtyStr("0");
            }

            // formatted Delivery date
            po.setDpdtStr(rs.getString("dpdt"));
            po.setShortname(rs.getString("shortname"));

            BigDecimal qtycanc = rs.getBigDecimal("qtycanc");
            po.setQtycanc(qtycanc != null ? qtycanc : BigDecimal.ZERO);

            BigDecimal tur = rs.getBigDecimal("tur");
            po.setTur(tur != null ? tur : BigDecimal.ZERO);

            return po;
        }
    };

    /**
     * Searches for purchase orders based on various criteria.
     */
    public List<PurchaseOrder> searchPurchaseOrders(String railway, String supplierName, String plNumber,
                                                   Date fromDate, Date toDate, BigDecimal valueFrom, BigDecimal valueTo) {
        
        StringBuilder sql = new StringBuilder();
        sql.append("SELECT h.rly, h.pokey, h.po_no, ")
           .append("TO_CHAR(h.po_date, 'DD-MON-YYYY') AS po_date, ")
           .append("h.pur_div, ")
           .append("immis.pkg_qry.firm(h.rly, h.vcode) AS supplier_name, ")
           .append("immis.pkg_qry.firm(h.rly, h.vcode) AS vaddr, ")
           .append("h.vcode, h.ns, h.po_value, ")
           .append("immis.unit(i.unit) udes, ")
           .append("d.pl_no, ")
           .append("SUBSTR(d.des, 1, 200) des, ")
           .append("i.po_sr, ")
           .append("immis.consignee(h.rly, i.consignee) cname, ")
           .append("NVL(i.po_qty,0) AS po_qty, ")
           .append("TO_CHAR(NVL(i.ext_dp, i.orig_dp), 'DD-MON-YYYY') AS dpdt, ")
           .append("r.shortname, ")
           .append("NVL(i.qty_cancelled, 0) qtycanc, ")
           .append("CASE WHEN i.po_qty > 0 THEN NVL(i.item_value, 0) / i.po_qty ELSE 0 END AS tur ")
           .append("FROM immis.mmp_po_hdr h, ")
           .append("immis.mmp_po_itemdesc d, ")
           .append("immis.mmp_po_item i, ")
           .append("immis.mgm_railways r ")
           .append("WHERE 1=1 ");

        List<Object> parameters = new ArrayList<>();

        // Railway filter
        if (railway != null && !railway.isEmpty() && !"all".equalsIgnoreCase(railway)) {
            sql.append("AND h.rly = ? ");
            parameters.add(railway);
        }

        // Date range filter
        if (fromDate != null) {
            sql.append("AND h.po_date >= ? ");
            parameters.add(new java.sql.Date(fromDate.getTime()));
        }
        if (toDate != null) {
            sql.append("AND h.po_date <= ? ");
            parameters.add(new java.sql.Date(toDate.getTime()));
        }

        // Value range filter
        if (valueFrom != null) {
            sql.append("AND h.po_value >= ? ");
            parameters.add(valueFrom);
        }
        if (valueTo != null) {
            sql.append("AND h.po_value <= ? ");
            parameters.add(valueTo);
        }

        // Supplier name filter
        if (supplierName != null && !supplierName.trim().isEmpty()) {
            sql.append("AND UPPER(immis.pkg_qry.firm(h.rly, h.vcode)) LIKE UPPER(?) ");
            parameters.add("%" + supplierName.trim() + "%");
        }

        // PL Number filter
        if (plNumber != null && !plNumber.trim().isEmpty()) {
            sql.append("AND d.pl_no = ? ");
            parameters.add(plNumber.trim());
        }

        // JOIN conditions
        sql.append("AND h.po_no IS NOT NULL ")
           .append("AND h.rly BETWEEN '01' AND '98' ")
           .append("AND r.rly = h.rly ")
           .append("AND d.rly = h.rly ")
           .append("AND d.pokey = h.pokey ")
           .append("AND i.rly = d.rly ")
           .append("AND i.pl_no = d.pl_no ")
           .append("AND i.po_no = h.po_no ")
           .append("AND i.pokey = d.pokey ")
           .append("AND i.po_qty >= 0 ")
           .append("AND h.po_date > TO_DATE('01-SEP-2016','DD-MON-YYYY') ")
           .append("AND SUBSTR(h.po_no, 9, 1) IN ('0', '1', '2') ")
           .append("ORDER BY h.po_date DESC, h.rly, h.po_no, i.po_sr, d.pl_no");

        return jdbcTemplate.query(sql.toString(), parameters.toArray(), purchaseOrderRowMapper);
    }

    public List<Map<String, Object>> getRailwayList() {
        String sql = "SELECT ireps_acct_id AS int_code, ou_name AS value " +
                    "FROM bv1to1.ireps_org_units " +
                    "WHERE ou_type = 2 AND ou_code <> '00' AND org_code = '01' " +
                    "AND status = 'A' AND ireps_acct_id IS NOT NULL " +
                    "ORDER BY ou_name";
        return jdbcTemplate.queryForList(sql);
    }

    public List<Map<String, Object>> getAccountDetails(String accountName) {
        String sql = "SELECT ACCOUNT_ID, ACCOUNT_NAME " +
                     "FROM MR_ACCT_PROFILE " +
                     "WHERE UPPER(ACCOUNT_NAME) LIKE ? " +
                     "ORDER BY ACCOUNT_NAME";
        return jdbcTemplate.queryForList(sql, accountName.toUpperCase() + "%");
    }
}
