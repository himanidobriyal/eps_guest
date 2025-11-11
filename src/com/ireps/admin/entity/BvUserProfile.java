package com.ireps.admin.entity;

import java.io.Serializable;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name="bv1to1.BV_USER_PROFILE")
public class BvUserProfile implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;


	@Id
	@Column(name="USER_ID")	
	private String userId;
	

	@Column(name="EMAIL")
	private String email;
	
	@Column(name="CERT_THUMBPRINT")
	private String certThumbprint;
	
	@Column(name="NAME")
	private String name;
	
	@Column(name="NEW_GRADE")
	private String newGrade;
	
	
	@Column(name="IREPS_USER_TYPE")
	private String userType;
	
	@OneToOne(fetch = FetchType.EAGER,cascade = CascadeType.ALL)
	@JoinColumn(name="USER_ID")
	private WASUser wasUser; 
	
	
	public BvUserProfile() {
		
	}
	public BvUserProfile(BvUserProfile users) {
		this.email = users.getEmail();
		this.name = users.getName();
		this.certThumbprint = users.getCertThumbprint();
		this.newGrade = users.getNewGrade();
		this.userId = users.getUserId();
		this.wasUser = users.getWasUser();
	}

	public String getNewGrade() {
		return newGrade;
	}

	public void setNewGrade(String newGrade) {
		this.newGrade = newGrade;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	
	public WASUser getWasUser() {
		return wasUser;
	}

	public void setWasUser(WASUser wasUser) {
		this.wasUser = wasUser;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getCertThumbprint() {
		return certThumbprint;
	}

	public void setCertThumbprint(String certThumbprint) {
		this.certThumbprint = certThumbprint;
	}
	public String getUserType() {
		return userType;
	}
	
	

	
	
}
