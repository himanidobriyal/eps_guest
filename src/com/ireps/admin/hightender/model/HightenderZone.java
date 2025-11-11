package com.ireps.admin.hightender.model;

public class HightenderZone {
    private String zoneCode;
    private String zoneName;
    private String orgCode;

    public HightenderZone() {}

    public HightenderZone(String zoneCode, String zoneName) {
        this.zoneCode = zoneCode;
        this.zoneName = zoneName;
    }

    public HightenderZone(String zoneCode, String zoneName, String orgCode) {
        this.zoneCode = zoneCode;
        this.zoneName = zoneName;
        this.orgCode = orgCode;
    }

    // Getters & Setters
    public String getZoneCode() { return zoneCode; }
    public void setZoneCode(String zoneCode) { this.zoneCode = zoneCode; }

    public String getZoneName() { return zoneName; }
    public void setZoneName(String zoneName) { this.zoneName = zoneName; }

    public String getOrgCode() { return orgCode; }
    public void setOrgCode(String orgCode) { this.orgCode = orgCode; }

    @Override
    public String toString() {
        return "HightenderZone{" +
                "zoneCode='" + zoneCode + '\'' +
                ", zoneName='" + zoneName + '\'' +
                ", orgCode='" + orgCode + '\'' +
                '}';
    }
}
