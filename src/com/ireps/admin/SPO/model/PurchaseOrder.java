package com.ireps.admin.SPO.model;

import java.math.BigDecimal;

public class PurchaseOrder {
    private String rly;
    private String pokey;
    private String poNo;

    private String poDateStr; // formatted PO date
    private String purDiv;
    private String supplierName;  
    private String vaddr;
    private String vcode;
    private String ns;
    private BigDecimal poValue;
    private String udes;
    private String plNo;
    private String des;
    private String poSr;
    private String cname;

    private BigDecimal poQty;   // numeric qty
    private String poQtyStr;    // string qty (for JSP)

    private String dpdtStr;     // formatted Delivery date
    private String shortname;
    private BigDecimal qtycanc;
    private BigDecimal tur;

    // --- Getters and Setters ---
    public String getRly() { return rly; }
    public void setRly(String rly) { this.rly = rly; }

    public String getPokey() { return pokey; }
    public void setPokey(String pokey) { this.pokey = pokey; }

    public String getPoNo() { return poNo; }
    public void setPoNo(String poNo) { this.poNo = poNo; }

    public String getPoDateStr() { return poDateStr; }
    public void setPoDateStr(String poDateStr) { this.poDateStr = poDateStr; }

    public String getPurDiv() { return purDiv; }
    public void setPurDiv(String purDiv) { this.purDiv = purDiv; }

    public String getSupplierName() { return supplierName; }
    public void setSupplierName(String supplierName) { this.supplierName = supplierName; }

    public String getVaddr() { return vaddr; }
    public void setVaddr(String vaddr) { this.vaddr = vaddr; }

    public String getVcode() { return vcode; }
    public void setVcode(String vcode) { this.vcode = vcode; }

    public String getNs() { return ns; }
    public void setNs(String ns) { this.ns = ns; }

    public BigDecimal getPoValue() { return poValue; }
    public void setPoValue(BigDecimal poValue) { this.poValue = poValue; }

    public String getUdes() { return udes; }
    public void setUdes(String udes) { this.udes = udes; }

    public String getPlNo() { return plNo; }
    public void setPlNo(String plNo) { this.plNo = plNo; }

    public String getDes() { return des; }
    public void setDes(String des) { this.des = des; }

    public String getPoSr() { return poSr; }
    public void setPoSr(String poSr) { this.poSr = poSr; }

    public String getCname() { return cname; }
    public void setCname(String cname) { this.cname = cname; }

    public BigDecimal getPoQty() { return poQty; }
    public void setPoQty(BigDecimal poQty) { this.poQty = poQty; }

    public String getPoQtyStr() { return poQtyStr; }
    public void setPoQtyStr(String poQtyStr) { this.poQtyStr = poQtyStr; }

    public String getDpdtStr() { return dpdtStr; }
    public void setDpdtStr(String dpdtStr) { this.dpdtStr = dpdtStr; }

    public String getShortname() { return shortname; }
    public void setShortname(String shortname) { this.shortname = shortname; }

    public BigDecimal getQtycanc() { return qtycanc; }
    public void setQtycanc(BigDecimal qtycanc) { this.qtycanc = qtycanc; }

    public BigDecimal getTur() { return tur; }
    public void setTur(BigDecimal tur) { this.tur = tur; }
}
