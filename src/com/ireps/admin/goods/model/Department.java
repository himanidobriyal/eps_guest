package com.ireps.admin.goods.model;

public class Department {

    private String orgSubunitDept;
    private String subUnitDeptName;

    // Constructors
    public Department() {
    }

    public Department(String orgSubunitDept, String subUnitDeptName) {
        this.orgSubunitDept = orgSubunitDept;
        this.subUnitDeptName = subUnitDeptName;
    }

    // Getters and Setters
    public String getOrgSubunitDept() {
        return orgSubunitDept;
    }

    public void setOrgSubunitDept(String orgSubunitDept) {
        this.orgSubunitDept = orgSubunitDept;
    }

    public String getSubUnitDeptName() {
        return subUnitDeptName;
    }

    public void setSubUnitDeptName(String subUnitDeptName) {
        this.subUnitDeptName = subUnitDeptName;
    }
}
