package com.ireps.admin.viewireps.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

@Service
public class IrepsDocumentService {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    public List<Map<String, Object>> getFilteredDocuments(String orgCode, String zone, String dept, String adminUnit) {
        String sql = "SELECT id.DOC_KEY, id.DOCUMENT_ID, id.FILE_NAME, id.FILE_DESCRIPTION, "
                   + "TO_CHAR(id.UPLOADIND_DATE,'dd/mm/yyyy hh24:mi') as UPLOAD_TIME, id.VERSION_NO, "
                   + "decode(id.DOC_TYPE,11,'General Instructions',12,'User Manuals/Guidelines',13,'Tender Conditions',"
                   + "14,'Contract Conditions',15,'Others',20,'Price Variation Clause') as DOC_TYPE_VAL, "
                   + "FILE_SIZE "
                   + "FROM bv1to1.ireps_documents id, bv1to1.ireps_department_master idm "
                   + "WHERE id.department_id = idm.department_id "
                   + "AND id.org_code = idm.org_code "
                   + "AND id.RLY_DEPT = idm.ORG_SUBUNIT_DEPT "
                   + "AND id.org_code = ? "
                   + "AND id.rly_dept = ? "
                   + "AND idm.org_zone = ? "
                   + "AND idm.admin_unit LIKE ? "
                   + "AND id.PUBLIC_FLAG = '1' "
                   + "AND id.doc_scope LIKE '%%' "
                   + "AND doc_status LIKE '1' "
                   + "AND work_area='PT' "
                   + "AND DOC_TYPE NOT IN (20) "
                   + "ORDER BY doc_type, id.LAST_UPDATED_ON";

        return jdbcTemplate.queryForList(sql, orgCode, dept, zone, "%" + adminUnit + "%");
    }
}
