package com.ireps.admin.entity;

import java.io.Serializable;
import java.util.List;

import org.springframework.stereotype.Component;

import lombok.Data;
@Data
@Component
public class UserProfieForm implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String welcomeString;
	private String userType;
	private String consUserType;
	private String lastLoginData;
	private String userId;
	private String username;
	private String accout_name;
	private String accountId;
	private String accountType;
	private String depotId;
	private String depotName;
	private String certThumbPrint;
	private String emailId;
	private String adminUnit;
	private String orgSubUnitDept;
	private String orgZone;
	private String orgCode;
	private String orgUnitType;
	private String workArea;
	private String []allowdedWorkArea;
	private String postId;
	private String designation;
	private String sessionId;
	private String docId;
	private String iMMSdp;
	private String iMMSrly;
	private String consigneeCode;
	private int grade;
	private List<String> functionIdsList;
	//Added By Sso By Owais
	  private String hrmsId;
	  private String hrmsToken;
	  private String SSOsesID;
	  private String ssouid;
	  private String app_code;
	
	//Ends Here By owais 
	
	
	public String getiMMSdp() {
		return iMMSdp;
	}
	public void setiMMSdp(String iMMSdp) {
		this.iMMSdp = iMMSdp;
	}
	public String getiMMSrly() {
		return iMMSrly;
	}
	public void setiMMSrly(String iMMSrly) {
		this.iMMSrly = iMMSrly;
	}
	public String getWelcomeString() {
		return welcomeString;
	}
	public void setWelcomeString(String welcomeString) {
		this.welcomeString = welcomeString;
	}
	public String getUserType() {
		return userType;
	}
	public void setUserType(String userType) {
		this.userType = userType;
	}
	public String getLastLoginData() {
		return lastLoginData;
	}
	public void setLastLoginData(String lastLoginData) {
		this.lastLoginData = lastLoginData;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getAccout_name() {
		return accout_name;
	}
	public void setAccout_name(String accout_name) {
		this.accout_name = accout_name;
	}
	public String getAccountId() {
		return accountId;
	}
	public void setAccountId(String accountId) {
		this.accountId = accountId;
	}
	public String getAccountType() {
		return accountType;
	}
	public void setAccountType(String accountType) {
		this.accountType = accountType;
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
	public String getCertThumbPrint() {
		return certThumbPrint;
	}
	public void setCertThumbPrint(String certThumbPrint) {
		this.certThumbPrint = certThumbPrint;
	}
	public String getEmailId() {
		return emailId;
	}
	public void setEmailId(String emailId) {
		this.emailId = emailId;
	}
	public String getAdminUnit() {
		return adminUnit;
	}
	public void setAdminUnit(String adminUnit) {
		this.adminUnit = adminUnit;
	}
	public String getOrgSubUnitDept() {
		return orgSubUnitDept;
	}
	public void setOrgSubUnitDept(String orgSubUnitDept) {
		this.orgSubUnitDept = orgSubUnitDept;
	}
	public String getOrgZone() {
		return orgZone;
	}
	public void setOrgZone(String orgZone) {
		this.orgZone = orgZone;
	}
	public String getOrgCode() {
		return orgCode;
	}
	public void setOrgCode(String orgCode) {
		this.orgCode = orgCode;
	}
	public String getOrgUnitType() {
		return orgUnitType;
	}
	public void setOrgUnitType(String orgUnitType) {
		this.orgUnitType = orgUnitType;
	}
	public String getWorkArea() {
		return workArea;
	}
	public void setWorkArea(String workArea) {
		this.workArea = workArea;
	}
	public String[] getAllowdedWorkArea() {
		return allowdedWorkArea;
	}
	public void setAllowdedWorkArea(String[] allowdedWorkArea) {
		this.allowdedWorkArea = allowdedWorkArea;
	}
	public String getPostId() {
		return postId;
	}
	public void setPostId(String postId) {
		this.postId = postId;
	}
	public String getDesignation() {
		return designation;
	}
	public void setDesignation(String designation) {
		this.designation = designation;
	}
	public String getSessionId() {
		return sessionId;
	}
	public void setSessionId(String sessionId) {
		this.sessionId = sessionId;
	}
	public String getDocId() {
		return docId;
	}
	public void setDocId(String docId) {
		this.docId = docId;
	}
	public String getConsigneeCode() {
		return consigneeCode;
	}
	public void setConsigneeCode(String consigneeCode) {
		this.consigneeCode = consigneeCode;
	}
	public List<String> getFunctionIdsList() {
		return functionIdsList;
	}
	public void setFunctionIdsList(List<String> functionIdsList) {
		this.functionIdsList = functionIdsList;
	}
	public int getGrade() {
		return grade;
	}
	public void setGrade(int grade) {
		this.grade = grade;
	}
	public String getConsUserType() {
		return consUserType;
	}
	public void setConsUserType(String consUserType) {
		this.consUserType = consUserType;
	}
}
