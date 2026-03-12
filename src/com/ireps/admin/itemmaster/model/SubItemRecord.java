package com.ireps.admin.itemmaster.model;

public class SubItemRecord {
    private String subItemRowId;
    private String subItemId;
    private String subItemDesc;
    private String plNumber;
    private String drawing;   // from CVP_SUBITM_OTH_DTLS + CVP_DRAWING_MSTR
    private String spec;      // from CVP_SUBITM_OTH_DTLS + CVP_SPEC_MSTR
    private String str;       // from CVP_SUBITM_OTH_DTLS + CVP_STR_MASTER

    public String getSubItemRowId(){return subItemRowId;}
    public void setSubItemRowId(String s){this.subItemRowId=s;}
    public String getSubItemId(){return subItemId;}
    public void setSubItemId(String s){this.subItemId=s;}
    public String getSubItemDesc(){return subItemDesc;}
    public void setSubItemDesc(String s){this.subItemDesc=s;}
    public String getPlNumber(){return plNumber;}
    public void setPlNumber(String s){this.plNumber=s;}
    public String getDrawing(){return drawing;}
    public void setDrawing(String s){this.drawing=s;}
    public String getSpec(){return spec;}
    public void setSpec(String s){this.spec=s;}
    public String getStr(){return str;}
    public void setStr(String s){this.str=s;}
}