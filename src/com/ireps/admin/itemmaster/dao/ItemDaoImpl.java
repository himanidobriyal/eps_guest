package com.ireps.admin.itemmaster.dao;

import com.ireps.admin.itemmaster.model.ItemRecord;
import com.ireps.admin.itemmaster.model.SubItemRecord;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.ArrayList;
import java.util.List;

@Repository
public class ItemDaoImpl implements ItemDao {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    private final RowMapper<ItemRecord> rowMapper = (rs, rowNum) -> {
        ItemRecord it = new ItemRecord();
        it.setItmRowId(rs.getLong("itm_row_id"));
        it.setItemId(rs.getString("item_id"));
        it.setOrgZone(rs.getString("org_zone"));
        it.setOrgZoneName(rs.getString("org_zone_name"));
        it.setDeptName(rs.getString("dept_name"));
        it.setDirectorateName(rs.getString("directorate_name"));
        it.setItemDescription(rs.getString("item_description"));
        it.setSubItemFlag(rs.getString("sub_item_flag"));
        it.setOldItemId(rs.getString("old_item_id"));
        it.setOldAaName(rs.getString("old_aa_name"));
        return it;
    };

    @Override
    public List<ItemRecord> findItems(String orgZone, String rlyDept, String subId, int page, int pageSize) {
        List<Object> params = new ArrayList<>();

        StringBuilder baseQuery = new StringBuilder();
        baseQuery.append("SELECT ITM_ROW_ID, ITEM_ID, CIM.ORG_ZONE, ")
                .append("bv1to1.GET_UVAM_APPROVING_AGENCY_NAME(CIM.APPROVE_AGENCY,'S') AS ORG_ZONE_NAME, ")
                .append("bv1to1.PKG_COMMON.GET_DEPTNAME(CIM.DEPT_ID) AS DEPT_NAME, ")
                .append("(SELECT DIRECTORATE_NAME FROM BV1TO1.CVP_DIRECTORATE_MST WHERE DIRECTORATE_ID = CIM.DIRECTORATE_ID) AS DIRECTORATE_NAME, ")
                .append("ITEM_DESCRIPTION, SUB_ITEM_FLAG, OLD_ITEM_ID, ")
                .append("bv1to1.GET_UVAM_APPROVING_AGENCY_NAME(CIM.OLD_APPROVE_AGENCY,'S') AS OLD_AA_NAME ")
                .append("FROM BV1TO1.CVP_ITEM_MST CIM WHERE 1=1 ")
                .append(" AND CIM.ITM_STATUS = 'A' ");

        if (orgZone != null && !orgZone.trim().isEmpty()) {
            baseQuery.append(" AND CIM.APPROVE_AGENCY = TO_NUMBER(?) ");
            params.add(orgZone.trim());
        }
        if (rlyDept != null && !rlyDept.trim().isEmpty()) {
            baseQuery.append(" AND CIM.ORG_DEPT = TO_NUMBER(?) ");
            params.add(rlyDept.trim());
        }
        if (subId != null && !subId.trim().isEmpty()) {
            baseQuery.append(" AND CIM.DIRECTORATE_ID = TO_NUMBER(?) ");
            params.add(subId.trim());
        }
        
       
        baseQuery.append(" ORDER BY ORG_ZONE_NAME, ITM_ROW_ID ");

        int startRow = (page - 1) * pageSize + 1;
        int endRow = page * pageSize;

        String pagedSql = "SELECT * FROM (SELECT ROWNUM rn, a.* FROM ( " + baseQuery +
                " ) a WHERE ROWNUM <= ?) WHERE rn >= ?";
        params.add(endRow);
        params.add(startRow);

        List<ItemRecord> items = jdbcTemplate.query(pagedSql, params.toArray(), rowMapper);

        for (ItemRecord item : items) {
            item.setSubItems(fetchSubItems(item.getItmRowId() + ""));
        }

        return items;
    }

    @Override
    public int countItems(String orgZone, String rlyDept, String subId) {
        List<Object> params = new ArrayList<>();
        StringBuilder cnt = new StringBuilder(
            "SELECT COUNT(1) FROM BV1TO1.CVP_ITEM_MST CIM WHERE 1=1 "
        );
        cnt.append(" AND CIM.ITM_STATUS = 'A' ");

        if (orgZone != null && !orgZone.trim().isEmpty()) {
            cnt.append(" AND CIM.APPROVE_AGENCY = TO_NUMBER(?) ");
            params.add(orgZone.trim());
        }
        if (rlyDept != null && !rlyDept.trim().isEmpty()) {
            cnt.append(" AND CIM.ORG_DEPT = TO_NUMBER(?) ");
            params.add(rlyDept.trim());
        }
        if (subId != null && !subId.trim().isEmpty()) {
            cnt.append(" AND CIM.DIRECTORATE_ID = TO_NUMBER(?) ");
            params.add(subId.trim());
        }

        return jdbcTemplate.queryForObject(cnt.toString(), params.toArray(), Integer.class);
    }

    private List<SubItemRecord> fetchSubItems(String itmRowId) {
        String sql = "SELECT SUB_ITM_ROWID, SUB_ITEM_ID, SUB_ITEM_DESC, PL_NUMBER " +
                     "FROM BV1TO1.CVP_SUB_ITEM_MST " +
                     "WHERE ITM_ROW_ID = ? " +
                     "ORDER BY SUB_ITM_ROWID";

        List<SubItemRecord> subItems;
        try {
            subItems = jdbcTemplate.query(sql, new Object[]{itmRowId}, (rs, rowNum) -> {
                SubItemRecord sub = new SubItemRecord();
                sub.setSubItemRowId(rs.getString("SUB_ITM_ROWID"));
                sub.setSubItemId(rs.getString("SUB_ITEM_ID"));
                sub.setSubItemDesc(rs.getString("SUB_ITEM_DESC"));
                sub.setPlNumber(rs.getString("PL_NUMBER"));
                return sub;
            });
        } catch (Exception e) {
            return new ArrayList<>();
        }

        for (SubItemRecord sub : subItems) {
            sub.setDrawing(fetchOthEntry(itmRowId, sub.getSubItemRowId(), "DRW"));
            sub.setSpec(fetchOthEntry(itmRowId, sub.getSubItemRowId(), "SPEC"));
            sub.setStr(fetchOthEntry(itmRowId, sub.getSubItemRowId(), "STR"));
        }

        return subItems;
    }

    private String fetchOthEntry(String itmRowId, String subItemRowId, String entryType) {
        String sq = "";

        if ("DRW".equalsIgnoreCase(entryType)) {
            sq = "SELECT DW_NUMBER AS ENTRY_NO " +
                 "FROM BV1TO1.CVP_SUBITM_OTH_DTLS D, BV1TO1.CVP_DRAWING_MSTR " +
                 "WHERE D.ITM_ROW_ID = ? AND D.SUB_ITM_ROWID = ? " +
                 "AND D.ENTRY_TYPE = 'DRW' AND D.ENTRY_ID = CVP_DW_ROWID " +
                 "AND D.STATUS = 'A' ORDER BY ENTRY_ID";

        } else if ("SPEC".equalsIgnoreCase(entryType)) {
            sq = "SELECT SPEC_NUMBER AS ENTRY_NO " +
                 "FROM BV1TO1.CVP_SUBITM_OTH_DTLS D, BV1TO1.CVP_SPEC_MSTR " +
                 "WHERE D.ITM_ROW_ID = ? AND D.SUB_ITM_ROWID = ? " +
                 "AND D.ENTRY_TYPE = 'SPEC' AND D.ENTRY_ID = CVP_SPEC_ROWID " +
                 "AND D.STATUS = 'A' ORDER BY ENTRY_ID";

        } else if ("STR".equalsIgnoreCase(entryType)) {
            sq = "SELECT STR_NUMBER AS ENTRY_NO " +
                 "FROM BV1TO1.CVP_SUBITM_OTH_DTLS D, BV1TO1.CVP_STR_MASTER " +
                 "WHERE D.ITM_ROW_ID = ? AND D.SUB_ITM_ROWID = ? " +
                 "AND D.ENTRY_TYPE = 'STR' AND D.ENTRY_ID = CVP_STR_ROWID " +
                 "AND D.STATUS = 'A' ORDER BY ENTRY_ID";
        }

        try {
            List<String> results = jdbcTemplate.queryForList(
                sq, new Object[]{itmRowId, subItemRowId}, String.class);

            if (results == null || results.isEmpty()) return "";

            StringBuilder sb = new StringBuilder();
            for (int i = 0; i < results.size(); i++) {
                if (i > 0) sb.append(", ");
                sb.append(results.get(i));
            }
            return sb.toString();

        } catch (Exception e) {
            return "";
        }
    }
}