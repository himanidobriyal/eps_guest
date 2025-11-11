

package com.ireps.admin.itemmaster.dao;

import com.ireps.admin.itemmaster.model.ItemRecord;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;
import org.springframework.beans.factory.annotation.Autowired;

import java.sql.ResultSet;
import java.sql.SQLException;
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
                .append("FROM BV1TO1.CVP_ITEM_MST CIM WHERE 1=1 ");

        if (orgZone != null && !orgZone.trim().isEmpty()) {
            baseQuery.append(" AND CIM.APPROVE_AGENCY = ? ");
            params.add(orgZone);
        }
        if (rlyDept != null && !rlyDept.trim().isEmpty()) {
            baseQuery.append(" AND INSTR(UPPER(TRIM(CIM.DEPT_ID)), ?) > 0 ");
            params.add(rlyDept.trim().toUpperCase());
        }

        if (subId != null && !subId.trim().isEmpty()) {
            baseQuery.append(" AND INSTR(UPPER(TRIM(CIM.DIRECTORATE_ID)), ?) > 0 ");
            params.add(subId.trim().toUpperCase());
        }


        baseQuery.append(" ORDER BY ORG_ZONE_NAME, ITM_ROW_ID ");

        int startRow = (page - 1) * pageSize + 1;
        int endRow = page * pageSize;

        String pagedSql = "SELECT * FROM (SELECT ROWNUM rn, a.* FROM ( " + baseQuery +
                " ) a WHERE ROWNUM <= ?) WHERE rn >= ?";

        params.add(endRow);
        params.add(startRow);

        return jdbcTemplate.query(pagedSql, params.toArray(), rowMapper);
    }

    @Override
    public int countItems(String orgZone, String rlyDept, String subId) {
        List<Object> params = new ArrayList<>();
        StringBuilder cnt = new StringBuilder("SELECT COUNT(1) FROM BV1TO1.CVP_ITEM_MST CIM WHERE 1=1 ");

        if (orgZone != null && !orgZone.trim().isEmpty()) {
            cnt.append(" AND CIM.APPROVE_AGENCY = ? ");
            params.add(orgZone);
        }
        
        if (rlyDept != null && !rlyDept.trim().isEmpty()) {
            cnt.append(" AND INSTR(UPPER(TRIM(CIM.DEPT_ID)), ?) > 0 ");
            params.add(rlyDept.trim().toUpperCase());
        }

        if (subId != null && !subId.trim().isEmpty()) {
            cnt.append(" AND INSTR(UPPER(TRIM(CIM.DIRECTORATE_ID)), ?) > 0 ");
            params.add(subId.trim().toUpperCase());
        }


        return jdbcTemplate.queryForObject(cnt.toString(), params.toArray(), Integer.class);
    }
}
