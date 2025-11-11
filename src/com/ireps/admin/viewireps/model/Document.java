package com.ireps.admin.viewireps.model;

import java.sql.Timestamp;

public class Document {
    private int id;
    private String description;
    private int version;
    private String documentType;
    private Timestamp uploadOn;
    private double fileSize;

    // ✅ Getters & Setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }

    public int getVersion() { return version; }
    public void setVersion(int version) { this.version = version; }

    public String getDocumentType() { return documentType; }
    public void setDocumentType(String documentType) { this.documentType = documentType; }

    public Timestamp getUploadOn() { return uploadOn; }
    public void setUploadOn(Timestamp timestamp) { this.uploadOn = timestamp; }

    public double getFileSize() { return fileSize; }
    public void setFileSize(double fileSize) { this.fileSize = fileSize; }
}
