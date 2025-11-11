package com.ireps.admin.viewireps.service;

import com.ireps.admin.viewireps.model.Document;
import java.util.List;

public interface DocumentService {
    List<Document> getDocuments(int offset, int size);
    int getDocumentCount();
}
