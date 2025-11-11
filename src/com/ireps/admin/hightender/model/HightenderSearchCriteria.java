package com.ireps.admin.hightender.model;

public class HightenderSearchCriteria {
    private String organization;
    private String zone;
    private String department;
    private String unit;
    private String workArea;
    private String fromDate;
    private String toDate;

    public HightenderSearchCriteria() {}

    // Getters and Setters
    public String getOrganization() { return organization; }
    public void setOrganization(String organization) { this.organization = organization; }

    public String getZone() { return zone; }
    public void setZone(String zone) { this.zone = zone; }

    public String getDepartment() { return department; }
    public void setDepartment(String department) { this.department = department; }

    public String getUnit() { return unit; }
    public void setUnit(String unit) { this.unit = unit; }

    public String getWorkArea() { return workArea; }
    public void setWorkArea(String workArea) { this.workArea = workArea; }

    public String getFromDate() { return fromDate; }
    public void setFromDate(String fromDate) { this.fromDate = fromDate; }

    public String getToDate() { return toDate; }
    public void setToDate(String toDate) { this.toDate = toDate; }

    @Override
    public String toString() {
        return "HightenderSearchCriteria{" +
                "organization='" + organization + '\'' +
                ", zone='" + zone + '\'' +
                ", department='" + department + '\'' +
                ", unit='" + unit + '\'' +
                ", workArea='" + workArea + '\'' +
                ", fromDate='" + fromDate + '\'' +
                ", toDate='" + toDate + '\'' +
                '}';
    }
}
