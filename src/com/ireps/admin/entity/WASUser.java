package com.ireps.admin.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="bv1to1.WAS_USER")
public class WASUser {
	@Id
	@Column(name="USER_ID")	
	private String userId;
	
	@Column(name="PASSWORD")
	private String password;

	/*@OneToOne(fetch = FetchType.LAZY)
	@PrimaryKeyJoinColumn
	private BvUserProfile bvUserProfile;*/
	
	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	/*public BvUserProfile getBvUserProfile() {
		return bvUserProfile;
	}

	public void setBvUserProfile(BvUserProfile bvUserProfile) {
		this.bvUserProfile = bvUserProfile;
	}*/
}
