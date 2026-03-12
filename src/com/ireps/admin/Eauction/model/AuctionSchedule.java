package com.ireps.admin.Eauction.model;

import java.io.Serializable;
import java.util.Date;
  
public class AuctionSchedule implements Serializable {
     
    private static final long serialVersionUID = 1L;
    
    private String scheduleNo;
    private Long scheduleId;
    private String accountId;
    private String accountName;
    private String depotId;
    private String depotName;
    private Long catalogId;
    private String catalogNo;
    private Integer catalogStatus;
    private String catalogStatusLabel;
    private String catFilePath;
    private Integer auctionType;
    private String auctionStartDatetime;
    private String auctionEndDatetime;
    private Date sortCol;
    private Integer scheduleStatus;

    // Default Constructor
    public AuctionSchedule() {
    }

    // Parameterized Constructor
    public AuctionSchedule(String scheduleNo, Long scheduleId, String accountName, 
                          String depotName, String catalogStatusLabel, 
                          String auctionStartDatetime, String auctionEndDatetime) {
        this.scheduleNo = scheduleNo;
        this.scheduleId = scheduleId;
        this.accountName = accountName;
        this.depotName = depotName;
        this.catalogStatusLabel = catalogStatusLabel;
        this.auctionStartDatetime = auctionStartDatetime;
        this.auctionEndDatetime = auctionEndDatetime;
    }

    // Getters and Setters
    public String getScheduleNo() {
        return scheduleNo;
    }

    public void setScheduleNo(String scheduleNo) {
        this.scheduleNo = scheduleNo;
    }

    public Long getScheduleId() {
        return scheduleId;
    }

    public void setScheduleId(Long scheduleId) {
        this.scheduleId = scheduleId;
    }

    public String getAccountId() {
        return accountId;
    }

    public void setAccountId(String accountId) {
        this.accountId = accountId;
    }

    public String getAccountName() {
        return accountName;
    }

    public void setAccountName(String accountName) {
        this.accountName = accountName;
    }

    public String getDepotId() {
        return depotId;
    }

    public void setDepotId(String depotId) {
        this.depotId = depotId;
    }

    public String getDepotName() {
        return depotName;
    }

    public void setDepotName(String depotName) {
        this.depotName = depotName;
    }

    public Long getCatalogId() {
        return catalogId;
    }

    public void setCatalogId(Long catalogId) {
        this.catalogId = catalogId;
    }

    public String getCatalogNo() {
        return catalogNo;
    }

    public void setCatalogNo(String catalogNo) {
        this.catalogNo = catalogNo;
    }

    public Integer getCatalogStatus() {
        return catalogStatus;
    }

    public void setCatalogStatus(Integer catalogStatus) {
        this.catalogStatus = catalogStatus;
    }

    public String getCatalogStatusLabel() {
        return catalogStatusLabel;
    }

    public void setCatalogStatusLabel(String catalogStatusLabel) {
        this.catalogStatusLabel = catalogStatusLabel;
    }

    public String getCatFilePath() {
        return catFilePath;
    }

    public void setCatFilePath(String catFilePath) {
        this.catFilePath = catFilePath;
    }

    public Integer getAuctionType() {
        return auctionType;
    }

    public void setAuctionType(Integer auctionType) {
        this.auctionType = auctionType;
    }

    public String getAuctionStartDatetime() {
        return auctionStartDatetime;
    }

    public void setAuctionStartDatetime(String auctionStartDatetime) {
        this.auctionStartDatetime = auctionStartDatetime;
    }

    public String getAuctionEndDatetime() {
        return auctionEndDatetime;
    }

    public void setAuctionEndDatetime(String auctionEndDatetime) {
        this.auctionEndDatetime = auctionEndDatetime;
    }

    public Date getSortCol() {
        return sortCol;
    }

    public void setSortCol(Date sortCol) {
        this.sortCol = sortCol;
    }

    public Integer getScheduleStatus() {
        return scheduleStatus;
    }
 
    public void setScheduleStatus(Integer scheduleStatus) {
        this.scheduleStatus = scheduleStatus;
    }

    @Override
    public String toString() {
        return "AuctionSchedule{" +
                "scheduleNo='" + scheduleNo + '\'' +
                ", scheduleId=" + scheduleId +
                ", accountId='" + accountId + '\'' +
                ", accountName='" + accountName + '\'' +
                ", depotId='" + depotId + '\'' +
                ", depotName='" + depotName + '\'' +
                ", catalogId=" + catalogId +
                ", catalogNo='" + catalogNo + '\'' +
                ", catalogStatus=" + catalogStatus +
                ", catalogStatusLabel='" + catalogStatusLabel + '\'' +
                ", auctionStartDatetime='" + auctionStartDatetime + '\'' +
                ", auctionEndDatetime='" + auctionEndDatetime + '\'' +
                '}';
    }
}