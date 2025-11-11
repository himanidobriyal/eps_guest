package com.ireps.admin.searchtender.model;

public class Tender {
    private String tenderNo;        // TENDER_NUMBER
    private String tenderTitle;
    private String workArea; // TENDER_DESCRIPTION
    private String status;          // TENDER_STATUS
    private String dueDate;         // DUE_DATE
    private String dueDays;         // DUEDAYS
    private String railZone;        // RAIL_ZONE
    private String dept;            // DEPT
    private String bidSys;          // BID_SYS
    private String deptName;        // DEPTNAME
    private String actionFlag;      // ACTION_FLAG
    private String tenderType;     // TENDER_TYPE
    private String biddingSystem;  // BIDDING_SYSTEM
    private String tenderStatus;   // TENDER_STATUS

    // --- Getters & Setters ---
    public String getTenderNo() {
        return tenderNo;
    }
    public void setTenderNo(String tenderNo) {
        this.tenderNo = tenderNo;
    }

    public String getTenderTitle() {
        return tenderTitle;
    }
    public void setTenderTitle(String tenderTitle) {
        this.tenderTitle = tenderTitle;
    }
    public String getWorkArea() { return workArea; }   // ✅ ye getter required hai
    public void setWorkArea(String workArea) { this.workArea = workArea; }
    public String getStatus() {
        return status;
    }
    public void setStatus(String status) {
        this.status = status;
    }

    public String getDueDate() {
        return dueDate;
    }
    public void setDueDate(String dueDate) {
        this.dueDate = dueDate;
    }

    public String getDueDays() {
        return dueDays;
    }
    public void setDueDays(String dueDays) {
        this.dueDays = dueDays;
    }

    public String getRailZone() {
        return railZone;
    }
    public void setRailZone(String railZone) {
        this.railZone = railZone;
    }

    public String getDept() {
        return dept;
    }
    public void setDept(String dept) {
        this.dept = dept;
    }

    public String getBidSys() {
        return bidSys;
    }
    public void setBidSys(String bidSys) {
        this.bidSys = bidSys;
    }

    public String getDeptName() {
        return deptName;
    }
    public void setDeptName(String deptName) {
        this.deptName = deptName;
    }

    public String getActionFlag() {
        return actionFlag;
    }
    public void setActionFlag(String actionFlag) {
        this.actionFlag = actionFlag;
    }

 // getters and setters
 public String getTenderType() { return tenderType; }
 public void setTenderType(String tenderType) { this.tenderType = tenderType; }

 public String getBiddingSystem() { return biddingSystem; }
 public void setBiddingSystem(String biddingSystem) { this.biddingSystem = biddingSystem; }

 public String getTenderStatus() { return tenderStatus; }
 public void setTenderStatus(String tenderStatus) { this.tenderStatus = tenderStatus; }
}
