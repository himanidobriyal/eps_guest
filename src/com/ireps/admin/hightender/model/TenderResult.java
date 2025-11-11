package com.ireps.admin.hightender.model;

public class TenderResult {
    private String nitId;
    private String oid;
    private String workArea;
    private String tenderType;
    private String tenderDescription;
    private String zone;
    private String dept;
    private String deptName;
    private String unit;  // Added missing field
    private String tenderNumber;
    private String closingDate;  // Added missing field
    private String year;
    private String month;
    private String department;
    private String tenderOpeningDate;
    private Double estimatedValue;
    private String biddingSystem;
    private String biddingStyle;
    private String globalTender;
    private String evaluationCriteria;
    
    public TenderResult() {}
    
    // Getters and Setters
    public String getNitId() { return nitId; }
    public void setNitId(String nitId) { this.nitId = nitId; }
    
    public String getOid() { return oid; }
    public void setOid(String oid) { this.oid = oid; }
    
    public String getWorkArea() { return workArea; }
    public void setWorkArea(String workArea) { this.workArea = workArea; }
    
    public String getTenderType() { return tenderType; }
    public void setTenderType(String tenderType) { this.tenderType = tenderType; }
    
    public String getTenderDescription() { return tenderDescription; }
    public void setTenderDescription(String tenderDescription) { this.tenderDescription = tenderDescription; }
    
    public String getZone() { return zone; }
    public void setZone(String zone) { this.zone = zone; }
    
    public String getDept() { return dept; }
    public void setDept(String dept) { this.dept = dept; }
    
    public String getDeptName() { return deptName; }
    public void setDeptName(String deptName) { this.deptName = deptName; }
    
    // Added missing getter/setter for unit
    public String getUnit() { return unit; }
    public void setUnit(String unit) { this.unit = unit; }
    
    public String getTenderNumber() { return tenderNumber; }
    public void setTenderNumber(String tenderNumber) { this.tenderNumber = tenderNumber; }
    
    // Added missing getter/setter for closingDate
    public String getClosingDate() { return closingDate; }
    public void setClosingDate(String closingDate) { this.closingDate = closingDate; }
    
    public String getYear() { return year; }
    public void setYear(String year) { this.year = year; }
    
    public String getMonth() { return month; }
    public void setMonth(String month) { this.month = month; }
    
    public String getDepartment() { return department; }
    public void setDepartment(String department) { this.department = department; }
    
    public String getTenderOpeningDate() { return tenderOpeningDate; }
    public void setTenderOpeningDate(String tenderOpeningDate) { this.tenderOpeningDate = tenderOpeningDate; }
    
    public Double getEstimatedValue() { return estimatedValue; }
    public void setEstimatedValue(Double estimatedValue) { this.estimatedValue = estimatedValue; }
    
    public String getBiddingSystem() { return biddingSystem; }
    public void setBiddingSystem(String biddingSystem) { this.biddingSystem = biddingSystem; }
    
    public String getBiddingStyle() { return biddingStyle; }
    public void setBiddingStyle(String biddingStyle) { this.biddingStyle = biddingStyle; }
    
    public String getGlobalTender() { return globalTender; }
    public void setGlobalTender(String globalTender) { this.globalTender = globalTender; }
    
    public String getEvaluationCriteria() { return evaluationCriteria; }
    public void setEvaluationCriteria(String evaluationCriteria) { this.evaluationCriteria = evaluationCriteria; }
}