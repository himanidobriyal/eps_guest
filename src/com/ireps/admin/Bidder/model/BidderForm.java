package com.ireps.admin.Bidder.model;

public class BidderForm {

	// --- Firm Details ---
	private String firmName;
	private String msName;
	private String firmUrl;
	private String companyRegNo;
	private String panTan;
	private String constitution;

	// --- Contact Details ---
	private String emailID;
	private String alternateEmail;
	private String firstName;
	private String title;
	private String lastName;
	private String middleName;

	// --- Address ---
	private String addr1;
	private String addr2;
	private String cityName;
	private String pincode;
	private String country; // From JSP it comes as String (e.g., "India")
	private String state; // We convert to stateId later in DAO

	// --- Phone Numbers ---
	private String phone1;
	private String phone2;
	private String mobileNo;
	private String fax;

	// --- GST ---
	private String gstNumber;

	// --- Railway & Depot selection ---
	private Integer railwayAccountId; // value in <option value="">
	private String railUnitName; // hidden field storing accountName
	private String depotUnitName; // selected depot name string
	// --- System / hidden fields (optional defaults) ---
	private Integer storeId; // default 102 in DAO
	private Integer lastModifyBy; // default 0 in DAO
	private Integer transactionId; // default 20002 in DAO
	private String lastModifyFrom; // default "WEB" in DAO
	private String bidderType; // if you plan to use it
	private Integer stateId; // <--- add this

	public Integer getStateId() {
		return stateId;
	}

	public void setStateId(Integer stateId) {
		this.stateId = stateId;
	}

	// ----- Getters and Setters -----

	public String getFirmName() {
		return firmName;
	}

	public void setFirmName(String firmName) {
		this.firmName = firmName;
	}

	public String getMsName() {
		return msName;
	}

	public void setMsName(String msName) {
		this.msName = msName;
	}

	public String getFirmUrl() {
		return firmUrl;
	}

	public void setFirmUrl(String firmUrl) {
		this.firmUrl = firmUrl;
	}

	public String getCompanyRegNo() {
		return companyRegNo;
	}

	public void setCompanyRegNo(String companyRegNo) {
		this.companyRegNo = companyRegNo;
	}

	public String getPanTan() {
		return panTan;
	}

	public void setPanTan(String panTan) {
		this.panTan = panTan;
	}

	public String getConstitution() {
		return constitution;
	}

	public void setConstitution(String constitution) {
		this.constitution = constitution;
	}

	public String getEmailID() {
		return emailID;
	}

	public void setEmailID(String emailID) {
		this.emailID = emailID;
	}

	public String getAlternateEmail() {
		return alternateEmail;
	}

	public void setAlternateEmail(String alternateEmail) {
		this.alternateEmail = alternateEmail;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getMiddleName() {
		return middleName;
	}

	public void setMiddleName(String middleName) {
		this.middleName = middleName;
	}

	public String getAddr1() {
		return addr1;
	}

	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}

	public String getAddr2() {
		return addr2;
	}

	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}

	public String getCityName() {
		return cityName;
	}

	public void setCityName(String cityName) {
		this.cityName = cityName;
	}

	public String getPincode() {
		return pincode;
	}

	public void setPincode(String pincode) {
		this.pincode = pincode;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getPhone1() {
		return phone1;
	}

	public void setPhone1(String phone1) {
		this.phone1 = phone1;
	}

	public String getPhone2() {
		return phone2;
	}

	public void setPhone2(String phone2) {
		this.phone2 = phone2;
	}

	public String getMobileNo() {
		return mobileNo;
	}

	public void setMobileNo(String mobileNo) {
		this.mobileNo = mobileNo;
	}

	public String getFax() {
		return fax;
	}

	public void setFax(String fax) {
		this.fax = fax;
	}

	public String getGstNumber() {
		return gstNumber;
	}

	public void setGstNumber(String gstNumber) {
		this.gstNumber = gstNumber;
	}

	public Integer getRailwayAccountId() {
		return railwayAccountId;
	}

	public void setRailwayAccountId(Integer railwayAccountId) {
		this.railwayAccountId = railwayAccountId;
	}

	public String getRailUnitName() {
		return railUnitName;
	}

	public void setRailUnitName(String railUnitName) {
		this.railUnitName = railUnitName;
	}

	public String getDepotUnitName() {
		return depotUnitName;
	}

	public void setDepotUnitName(String depotUnitName) {
		this.depotUnitName = depotUnitName;
	}

	public Integer getStoreId() {
		return storeId;
	}

	public void setStoreId(Integer storeId) {
		this.storeId = storeId;
	}

	public Integer getLastModifyBy() {
		return lastModifyBy;
	}

	public void setLastModifyBy(Integer lastModifyBy) {
		this.lastModifyBy = lastModifyBy;
	}

	public Integer getTransactionId() {
		return transactionId;
	}

	public void setTransactionId(Integer transactionId) {
		this.transactionId = transactionId;
	}

	public String getLastModifyFrom() {
		return lastModifyFrom;
	}

	public void setLastModifyFrom(String lastModifyFrom) {
		this.lastModifyFrom = lastModifyFrom;
	}

	public String getBidderType() {
		return bidderType;
	}

	public void setBidderType(String bidderType) {
		this.bidderType = bidderType;
	}

}
