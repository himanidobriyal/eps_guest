package com.ireps.admin.itemmaster.model;

import java.util.List;

public class ItemRecord {
    private long itmRowId;
    private String itemId;
    private String orgZone;
    private String orgZoneName;
    private String deptName;
    private String directorateName;
    private String itemDescription;
    private String subItemFlag;
    private String oldItemId;
    private String oldAaName;
    
    // ✅ NEW field
    private List<SubItemRecord> subItems;

    public long getItmRowId(){return itmRowId;}
    public void setItmRowId(long v){this.itmRowId=v;}
    public String getItemId(){return itemId;}
    public void setItemId(String s){this.itemId=s;}
    public String getOrgZone(){return orgZone;}
    public void setOrgZone(String s){this.orgZone=s;}
    public String getOrgZoneName(){return orgZoneName;}
    public void setOrgZoneName(String s){this.orgZoneName=s;}
    public String getDeptName(){return deptName;}
    public void setDeptName(String s){this.deptName=s;}
    public String getDirectorateName(){return directorateName;}
    public void setDirectorateName(String s){this.directorateName=s;}
    public String getItemDescription(){return itemDescription;}
    public void setItemDescription(String s){this.itemDescription=s;}
    public String getSubItemFlag(){return subItemFlag;}
    public void setSubItemFlag(String s){this.subItemFlag=s;}
    public String getOldItemId(){return oldItemId;}
    public void setOldItemId(String s){this.oldItemId=s;}
    public String getOldAaName(){return oldAaName;}
    public void setOldAaName(String s){this.oldAaName=s;}
    
    // ✅ NEW getter/setter
    public List<SubItemRecord> getSubItems(){return subItems;}
    public void setSubItems(List<SubItemRecord> s){this.subItems=s;}
}