package com.ireps.admin.searchtender.model;

public class Organization {
    private String value;   // ou_name
    private String intCode; // org_code

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
