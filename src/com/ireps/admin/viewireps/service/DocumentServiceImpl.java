package com.ireps.admin.viewireps.service;

import com.ireps.admin.viewireps.dao.DocumentDao;
import com.ireps.admin.viewireps.model.Document;
import com.ireps.admin.viewireps.service.DocumentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DocumentServiceImpl implements DocumentService {

    @Autowired
    private DocumentDao documentDao;

    @Override
    public List<Document> getDocuments(int offset, int size) {
        return documentDao.getDocuments(offset, size);
    }

    @Override
    public int getDocumentCount() {
        return documentDao.getDocumentCount();
    }
}
