package com.ireps.admin.entity;

import java.util.HashMap;
import java.util.LinkedHashMap;

import lombok.Data;
@Data
public class AuctionUserForm {
	private String mobileNumber;//for user
    private String subUserType;
    private String userId;
    private String accountName;
    private String password;
    private String emailAddress;
    private String userStatus;
    private String firstName;
    private String middleName;
    private String lastName;
    private String userType;
    private String accountId;
    private String departmentId;
    private String accountType;
    private String day;
    private String month;
    private String year;
    private String designation;
    private String grade;
    private String gradeName;
    private String pfNumber;
    private String address1;
    private String address2;
    private String residencePhone;
    private String businessPhone;
    private String cellNumber;
    private String faxNumber;
    private String city;
    private String country;
    private String contact;
    private String state;
    private String pinCode;
    private String sectionId;
    private String companyName;
    private String active;
    private String inActive;
    private String vendorType;
    private String deleted;
    private String gender;
    private String dateOfBirth;
    private String departmentName;
    private String thumbPrint;
    private String button;
    private String back;
    private String changeCertificate;
    private String signature;
    private String certThumbprint;
    private String pubKeyCertThumbprint;
    private String[] sections;
    private String[] functions;
    private String usrSections;
    private long vendorUnitId;
    private String userNameById;
    private String unitName;
    private String ipAddress;
    private HashMap unitNames;
    private HashMap userTypes;
    private HashMap accountTypes;
    private HashMap departmentTypes;
    private LinkedHashMap railwayAccounts;
    private HashMap vendorAccounts;
    private HashMap countries;
    private HashMap grades;
    private LinkedHashMap irepsFunctions;
    private String[] functionIds;
    public String[] sectionNames;
    public HashMap departmentSections;
    public HashMap countryStates;
    private String signatureSerialNo;
    private String signatureSubject;
    private String signatureIssuer;
    private String signatureNotBefore;
    private String signatureNotAfter;
    private String alternateEmail;
    private String faxNo;
    private String businessNo;
    private String functionGroupId;
    
    public AuctionUserForm()
    {
      this.userStatus = "1";
      this.country = "10141";
      this.active = "0";
      this.gender = "0";
      this.alternateEmail = "";
      this.faxNo = "";
      this.businessNo = "";
    }
}
