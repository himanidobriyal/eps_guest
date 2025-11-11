package com.ireps.admin.hightender.model;

public class HightenderOrganization {
    private String value;   // ou_name
    private String intCode;    // org_code

    public HightenderOrganization() {}

    public HightenderOrganization(String value, String intCode) {
        this.value = value;
        this.intCode = intCode;
    }

    public String getValue() {
        return value;
    }
    public void setValue(String value) {
        this.value = value;
    }

    public String getIntCode() {
        return intCode;
    }
    public void setIntCode(String intCode) {
        this.intCode = intCode;
    }
}
