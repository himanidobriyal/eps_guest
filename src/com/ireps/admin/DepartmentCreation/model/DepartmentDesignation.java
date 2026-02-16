package com.ireps.admin.DepartmentCreation.model;

public class DepartmentDesignation {
    private String categoryId;  // CATEGORY_ID from DB
    private String desigPrefix; // DESIG_PREFIX from DB

    // Constructors
    public DepartmentDesignation() {}
    public DepartmentDesignation(String categoryId, String desigPrefix) {
        this.categoryId = categoryId;
        this.desigPrefix = desigPrefix;
    }

    // Getters & Setters
    public String getCategoryId() {
        return categoryId;
    }
    public void setCategoryId(String categoryId) {
        this.categoryId = categoryId;
    }
    public String getDesigPrefix() {
        return desigPrefix;
    }
    public void setDesigPrefix(String desigPrefix) {
        this.desigPrefix = desigPrefix;
    }
}
