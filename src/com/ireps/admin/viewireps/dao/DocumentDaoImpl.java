package com.ireps.admin.viewireps.dao;

import com.ireps.admin.viewireps.dao.DocumentDao;
import com.ireps.admin.viewireps.model.Document;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

@Repository
public class DocumentDaoImpl implements DocumentDao {

    private final JdbcTemplate jdbcTemplate;

    public DocumentDaoImpl(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    @Override
    public List<Document> getDocuments(int offset, int size) {
        String sql = "SELECT * FROM documents LIMIT ? OFFSET ?";
        return jdbcTemplate.query(sql, new Object[]{size, offset}, (rs, rowNum) -> mapRow(rs));
    }

    @Override
    public int getDocumentCount() {
        String sql = "SELECT COUNT(*) FROM documents";
        return jdbcTemplate.queryForObject(sql, Integer.class);
    }

    private Document mapRow(ResultSet rs) throws SQLException {
        Document doc = new Document();
        doc.setId(rs.getInt("id"));
        doc.setDescription(rs.getString("description"));
        doc.setVersion(rs.getInt("version"));
        doc.setDocumentType(rs.getString("document_type"));
        doc.setUploadOn(rs.getTimestamp("upload_on"));
        doc.setFileSize(rs.getDouble("file_size"));
        return doc;
    }
}
