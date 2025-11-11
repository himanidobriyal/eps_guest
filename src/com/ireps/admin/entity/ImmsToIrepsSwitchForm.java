package com.ireps.admin.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.annotations.UpdateTimestamp;

import lombok.Data;

@Data
@Entity
@Table(name="bv1to1.EPSN_IMMS_LOGIN_SWITCH")
public class ImmsToIrepsSwitchForm {
	
	@Id
	@Column(name="USER_ID")	
	private String userId;
	
	@Column(name="SWITCH_COUNT")
	private String switchCount;
	
	@Column(name="RANDOM_SALT")
	private String randomSalt;
	
	@Column(name = "IP_ADDRESS")
	private String ipAddress;
		
	@UpdateTimestamp
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="LAST_MODIFIED_ON")
	private Date updatedOn;
	
}
