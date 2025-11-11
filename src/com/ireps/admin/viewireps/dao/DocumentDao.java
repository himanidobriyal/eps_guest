package com.ireps.admin.viewireps.dao;

import com.ireps.admin.viewireps.model.Document;
import java.util.List;

public interface DocumentDao {
    List<Document> getDocuments(int offset, int size);
    int getDocumentCount();
}
