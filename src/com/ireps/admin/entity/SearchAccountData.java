
package com.ireps.admin.entity;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.Id;

import lombok.Data;

@Data
@Entity
public class SearchAccountData implements Serializable{
	
	private static final long serialVersionUID = 1L;
	
	@Id
	private String ACCOUNT_ID;
	private String ACCOUNT_NAME;
	private String MMIS_VENDOR_CODE;
	private String ACCOUNT_TYPE;
	private String ACTIVE;
	private String EMAIL;

}
