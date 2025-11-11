package com.ireps.admin.entity;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

@Component
@Entity
@Table(name="bv1to1.USER_LOGIN_HISTORY")
public class UserLoginHistory implements Serializable{	
	
	  	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	    @Id	    
	    @Column(name="LOGIN_ROW_ID")
	    @GeneratedValue(strategy=GenerationType.IDENTITY)	    
	    private Long loginRowId;
	    
		@Column(name="COMPATIBILITY_VIEW")
	    private String compatabilityView;
	    
	    @Column(name="BROWSER_NAME_VERSION")
	    private String browserNameVersion;
	    
	    @Column(name="OS_NAME")
	    private String osname;
	    
	    @Column(name="OS_VERSION")
	    private String osVersion;
	    
	    @Column(name="IP_ADDRESS")
	    private String ipAddress;
	    
	    @Column(name="MAC_ADDRESS")
	    private String macAddress;
	    
	    @Column(name="BROWSER_FULL_VERSION")
	    private String browserFullVersion;
	    
	    @Column(name="X_IP_ADDRESS")
	    private String xIpAddress;
	    
	    @Column(name="USER_ID")
	    private String userId;
	    
	    public Long getLoginRowId() {
			return loginRowId;
		}

		public void setLoginRowId(Long loginRowId) {
			this.loginRowId = loginRowId;
		}

		public String getCompatabilityView() {
			return compatabilityView;
		}

		public void setCompatabilityView(String compatabilityView) {
			this.compatabilityView = compatabilityView;
		}

		public String getBrowserNameVersion() {
			return browserNameVersion;
		}

		public void setBrowserNameVersion(String browserNameVersion) {
			this.browserNameVersion = browserNameVersion;
		}

		public String getOsname() {
			return osname;
		}

		public void setOsname(String osname) {
			this.osname = osname;
		}

		public String getOsVersion() {
			return osVersion;
		}

		public void setOsVersion(String osVersion) {
			this.osVersion = osVersion;
		}

		public String getIpAddress() {
			return ipAddress;
		}

		public void setIpAddress(String ipAddress) {
			this.ipAddress = ipAddress;
		}

		public String getMacAddress() {
			return macAddress;
		}

		public void setMacAddress(String macAddress) {
			this.macAddress = macAddress;
		}

		public String getBrowserFullVersion() {
			return browserFullVersion;
		}

		public void setBrowserFullVersion(String browserFullVersion) {
			this.browserFullVersion = browserFullVersion;
		}

		public String getxIpAddress() {
			return xIpAddress;
		}

		public void setxIpAddress(String xIpAddress) {
			this.xIpAddress = xIpAddress;
		}

		public String getUserId() {
			return userId;
		}

		public void setUserId(String userId) {
			this.userId = userId;
		}
		
}

