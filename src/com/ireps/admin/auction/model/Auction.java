package com.ireps.admin.auction.model;

public class Auction {
    private String depotId;
    private String scheduleId;
    private String deptName;
    private String catalogId;
    private String catalogNo;
    private String auctionStartDate;
    private String biddingSystem;
    private String techBidCloseTime;
    private String auctionEndDate;
    private String orgZoneName;
    private String categName;

    // Getters and Setters
    public String getDepotId() { return depotId; }
    public void setDepotId(String depotId) { this.depotId = depotId; }

    public String getScheduleId() { return scheduleId; }
    public void setScheduleId(String scheduleId) { this.scheduleId = scheduleId; }

    public String getDeptName() { return deptName; }
    public void setDeptName(String deptName) { this.deptName = deptName; }

    public String getCatalogId() { return catalogId; }
    public void setCatalogId(String catalogId) { this.catalogId = catalogId; }

    public String getCatalogNo() { return catalogNo; }
    public void setCatalogNo(String catalogNo) { this.catalogNo = catalogNo; }

    public String getAuctionStartDate() { return auctionStartDate; }
    public void setAuctionStartDate(String auctionStartDate) { this.auctionStartDate = auctionStartDate; }

    public String getBiddingSystem() { return biddingSystem; }
    public void setBiddingSystem(String biddingSystem) { this.biddingSystem = biddingSystem; }

    public String getTechBidCloseTime() { return techBidCloseTime; }
    public void setTechBidCloseTime(String techBidCloseTime) { this.techBidCloseTime = techBidCloseTime; }

    public String getAuctionEndDate() { return auctionEndDate; }
    public void setAuctionEndDate(String auctionEndDate) { this.auctionEndDate = auctionEndDate; }

    public String getOrgZoneName() { return orgZoneName; }
    public void setOrgZoneName(String orgZoneName) { this.orgZoneName = orgZoneName; }

    public String getCategName() { return categName; }
    public void setCategName(String categName) { this.categName = categName; }
}
