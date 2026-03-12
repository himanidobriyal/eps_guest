package com.ireps.admin.BannedFirms.model;
    
public class BannedFirms {
    private String letNo;
    private String letDate;
    private String vname;
    private String vaddress;
    private String subj;
    private String duration;
    private String banUpto;
    private String remarks;
    private String docId;
    private String docPath;

    public String getLetNo() { return letNo; }
    public void setLetNo(String letNo) { this.letNo = letNo; }

    public String getLetDate() { return letDate; }
    public void setLetDate(String letDate) { this.letDate = letDate; }

    public String getVname() { return vname; }
    public void setVname(String vname) { this.vname = vname; }

    public String getVaddress() { return vaddress; }
    public void setVaddress(String vaddress) { this.vaddress = vaddress; }

    public String getSubj() { return subj; }
    public void setSubj(String subj) { this.subj = subj; }

    public String getDuration() { return duration; }
    public void setDuration(String duration) { this.duration = duration; }

    public String getBanUpto() { return banUpto; }
    public void setBanUpto(String banUpto) { this.banUpto = banUpto; }

    public String getRemarks() { return remarks; }
    public void setRemarks(String remarks) { this.remarks = remarks; }

    public String getDocId() { return docId; }
    public void setDocId(String docId) { this.docId = docId; }

    public String getDocPath() { return docPath; }
    public void setDocPath(String docPath) { this.docPath = docPath; }
}
