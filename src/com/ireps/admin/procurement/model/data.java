package com.ireps.admin.procurement.model;
   
public class data {
    private String plNo;
    private String nlu;
    private String sdes;
    private double avgBar;
    private int totAac;
    private double aacValue;
  
    // Getters and Setters
    public String getPlNo() { return plNo; }
    public void setPlNo(String plNo) { this.plNo = plNo; }

    public String getNlu() { return nlu; }
    public void setNlu(String nlu) { this.nlu = nlu; }

    public String getSdes() { return sdes; }
    public void setSdes(String sdes) { this.sdes = sdes; }

    public double getAvgBar() { return avgBar; }
    public void setAvgBar(double avgBar) { this.avgBar = avgBar; }

    public int getTotAac() { return totAac; }
    public void setTotAac(int totAac) { this.totAac = totAac; }

    public double getAacValue() { return aacValue; }
    public void setAacValue(double aacValue) { this.aacValue = aacValue; }
}
