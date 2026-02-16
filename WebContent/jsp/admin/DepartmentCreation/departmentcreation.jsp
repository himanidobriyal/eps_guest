<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Railway Unit/Department Creation - IREPS</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: #ffffff;
            min-height: 100vh;
            padding: 20px;
            color: #333;
        }

        .container {
            max-width: 100%px;
            margin: 0 auto;
            background: transparent;
            border-radius: 8px;
            overflow: visible;
            animation: slideUp 0.6s ease-out;
        }

        @keyframes slideUp {
            from {
                opacity: 0;
                transform: translateY(30px);
            }

            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .ireps-header {
					display: flex;
					align-items: center;
					justify-content: space-between;
					background-color: #0b253f;
					padding: 40px 20px;
					color: white;
				}

				.left-section {
					display: flex;
					align-items: center;
					gap: 15px;
					height: 50px;
				}

				.center-section {
					text-align: center;
					flex: 1;
					transform: translateX(-70px);
				}

				.main-title {
					font-size: 30px;
					font-weight: 500;
				}

				.sub-title {
					color: #ffd700;
					font-size: 28px;
					font-weight: bold;
				}

				.right-section {
    display: flex;
    flex-direction: column;  /* stack dropdown and HOME vertically */
    align-items: flex-end;   /* align both to the right */
    font-size: 16px;
    color: white;
    margin-right: 20px;
    gap: 8px; /* space between dropdown and HOME */
}

				.right-section label {
					color: white;
					font-weight: 500;
					margin-right: 8px;
				}

				.language-dropdown {
					background-color: #0b253f;
					color: white;
					border: 1px solid #ccc;
					padding: 6px 12px;
					border-radius: 4px;
					font-size: 16px;
					appearance: none;
					cursor: pointer;
					}
					.lang-container {
    display: flex;
    align-items: center;
    gap: 8px;
}
.icon-row {
    display: flex;
    gap: 10px;  /* ✅ spacing between home & logout */
    position: relative;
    top: 40px;  /* ✅ jahan aapka home icon placed hai */
}

.home-icon,
.logout-icon {
    font-size: 26px;
    color: white;
    background-color: #0000B;
    padding: 4px 10px;
    border-radius: 4px;
    display: inline-flex;
    align-items: center;
    justify-content: center;
    cursor: pointer;
    text-decoration: none;
}
        .power-icon {
            position: absolute;
            top: 15px;
            right: 25px;
            width: 35px;
            height: 35px;
            background: rgba(255, 255, 255, 0.15);
            border-radius: 6px;
            display: flex;
            align-items: center;
            justify-content: center;
            cursor: pointer;
            transition: all 0.3s ease;
            z-index: 2;
        }

        .power-icon:hover {
            background: rgba(255, 255, 255, 0.25);
            transform: scale(1.05);
        }

        .status-check {
            background: #ffffff;
            backdrop-filter: blur(10px);
            padding: 25px;
            border: 1px solid #e5e7eb;
            border-radius: 8px;
            margin-bottom: 20px;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
        }

        .status-check h3 {
            color: #1e3a5f;
            margin-bottom: 20px;
            font-size: 1.1rem;
            font-weight: 600;
        }

        .status-form {
            display: flex;
            gap: 15px;
            align-items: end;
            flex-wrap: wrap;
        }

        .form-group {
            flex: 1;
            min-width: 200px;
        }

        .form-group label {
            display: block;
            margin-bottom: 8px;
            color: #374151;
            font-weight: 500;
            font-size: 0.95rem;
        }

        .form-control {
            width: 100%;
            padding: 12px 16px;
            border: 2px solid #e5e7eb;
            border-radius: 10px;
            font-size: 1rem;
            transition: all 0.3s ease;
            background: #fff;
        }

        .form-control:focus {
            outline: none;
            border-color: #1e3a5f;
            box-shadow: 0 0 0 3px rgba(30, 58, 95, 0.1);
            transform: translateY(-1px);
        }

        .btn {
            padding: 12px 24px;
            border: none;
            border-radius: 10px;
            font-size: 1rem;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }

        .btn-primary {
            background: linear-gradient(135deg, #1e3a5f 0%, #2d4a6b 100%);
            color: white;
            box-shadow: 0 3px 12px rgba(30, 58, 95, 0.3);
        }

        .btn-primary:hover {
            transform: translateY(-2px);
            box-shadow: 0 6px 20px rgba(30, 58, 95, 0.4);
        }

        .note-section {
            background: linear-gradient(135deg, #fee2e2 0%, #fecaca 100%);
            border: 1px solid #f87171;
            border-radius: 8px;
            padding: 15px;
            margin-bottom: 20px;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
        }

        .note-section strong {
            color: #dc2626;
            display: block;
            margin-bottom: 8px;
            font-weight: 700;
        }

        .note-section span {
            color: #7f1d1d;
            font-size: 0.95rem;
            line-height: 1.5;
        }

        /* Card styling for each section */
        .section-card {
            background: #ffffff;
            border-radius: 8px;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
            border: 1px solid #e5e7eb;
            margin-bottom: 20px;
            overflow: hidden;
        }

        .section-header {
            background: linear-gradient(135deg, #1e3a5f 0%, #2d4a6b 100%);
            color: white;
            padding: 18px 25px;
            font-size: 1.2rem;
            font-weight: 600;
            text-shadow: 0 1px 2px rgba(0, 0, 0, 0.2);
            margin: 0;
        }

        .form-text {
            font-size: 0.85rem;
            color: #6b7280;
            margin-top: 5px;
        }

        .form-section {
            padding: 25px;
            background: #ffffff;
            border: 1px solid #e5e7eb;
            margin-bottom: 20px;
            border-radius: 0 0 8px 8px;
        }

        .form-row {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 25px;
            margin-bottom: 25px;
        }

        .required {
            color: #dc2626;
            font-weight: 700;
        }

        .checkbox-group {
            display: flex;
            align-items: center;
            gap: 10px;
            margin-bottom: 20px;
        }

        .checkbox-group input[type="checkbox"] {
            width: 18px;
            height: 18px;
            accent-color: #1e3a5f;
            cursor: pointer;
        }

        .checkbox-group label {
            margin: 0;
            cursor: pointer;
            color: #374151;
            font-weight: 500;
        }

        .hidden {
            display: none;
            opacity: 0;
            transform: translateY(-10px);
            transition: all 0.3s ease;
        }

        .show {
            display: block;
            opacity: 1;
            transform: translateY(0);
        }

        .request-status {
            display: none;
            background: #f0f9ff;
            border: 2px solid #1e3a5f;
            border-radius: 8px;
            padding: 18px;
            margin-top: 18px;
            animation: fadeIn 0.5s ease-out;
        }

        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: translateY(-10px);
            }

            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .status-content {
            color: #1e3a5f;
            font-weight: 500;
            text-align: center;
            font-size: 1rem;
        }

        @media (max-width: 768px) {
            .container {
                margin: 0 10px;
                border-radius: 15px;
            }

            .header h1 {
                font-size: 1.5rem;
                padding-right: 60px;
            }

            .form-row {
                grid-template-columns: 1fr;
                gap: 20px;
            }

            .status-form {
                flex-direction: column;
                align-items: stretch;
            }
        }

        /* Custom select styling */
        select.form-control {
            cursor: pointer;
            background-image: url("data:image/svg+xml;charset=UTF-8,%3csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 24 24' fill='none' stroke='%231e3a5f' stroke-width='2' stroke-linecap='round' stroke-linejoin='round'%3e%3cpolyline points='6,9 12,15 18,9'%3e%3c/polyline%3e%3c/svg%3e");
            background-repeat: no-repeat;
            background-position: right 12px center;
            background-size: 16px;
            padding-right: 40px;
        }

        /* Smooth animations for form interactions */
        .form-group {
            transition: all 0.3s ease;
        }

        .form-group:hover {
            transform: translateY(-1px);
        }
        
         .sidebar {

	height: 100%;

	width: 0;

	position: fixed;

	z-index: 1000;

	top: 0;

	left: 0;

	background-color: #0b253f;

	overflow-x: hidden;

	transition: 0.4s;

	padding-top: 60px;

	}



	.sidebar a {

	padding: 12px 20px;

	text-decoration: none;

	font-size: 18px;

	color: #fff;

	display: block;

	transition: 0.3s;

	}



	.sidebar a:hover {

	background-color: #1e3a8a;

	}



	.sidebar .closebtn {

	position: absolute;

	top: 15px;

	right: 20px;

	font-size: 28px;

	color: white;

	cursor: pointer;

	}



	.menu-icon {

	font-size: 26px;

	cursor: pointer;

	margin-left: 15px;

	color: white;

	}



	select {

	appearance: none;

	background-image: url("data:image/svg+xml;charset=US-ASCII,<svg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 4 5'><path fill='%23666' d='M2 0L0 2h4zm0 5L0 3h4z'/></svg>");

	background-repeat: no-repeat;

	background-position: right 12px center;

	background-size: 12px;

	padding-right: 40px;

	}

	.sidebar a .dev-note {

 display: block;

 font-size: 11px;

 color: red;

 

 margin-top: 2px;

}
    </style>
</head>

<body>
<header class="ireps-header">
    <div class="left-section">
    <span class="menu-icon" onclick="openSidebar()">&#9776;</span>
        <img src="${pageContext.request.contextPath}/assets/images/logo.png" alt="Logo">
    </div>
    <div class="center-section">
        <div class="main-title">Government eMarketplace</div>
        <div class="sub-title">Indian Railways E-Procurement System</div>
    </div>
    <div class="right-section">
        <div class="lang-container">
            <label for="language">Select Your Language</label>
           
        </div>
        			<!-- ⭐ REQUIRED for BHASHINI PLUGIN -->
    <div class="bhashini-plugin-container"></div>
     <div class="icon-row">
        <a href="${pageContext.request.contextPath}/logon" class="home-icon">
    <i class="fa-solid fa-house"></i>
</a>
 <a href="${pageContext.request.contextPath}/logon" class="logout-icon" onclick="logoutNow()">
            <i class="fa-solid fa-right-from-bracket"></i>
        </a>
</div>

    </div>
</header>
<div id="mySidebar" class="sidebar">
			<a href="javascript:void(0)" class="closebtn" onclick="closeSidebar()">&times;</a>

			<a href="javascript:void(0)" onclick="selectOption('hightender', this)">High Value Tenders</a>
    <a href="javascript:void(0)" onclick="selectOption('searchtender', this)">
        Search Tender
        
    </a>

			<a href="javascript:void(0)" onclick="selectOption('itemmaster', this)">Item Master</a>
			<a href="javascript:void(0)" onclick="selectOption('projection', this)">Procurement Projection</a>
			<a href="javascript:void(0)" onclick="selectOption('viewireps', this)">View Ireps Document</a>
			<a href="javascript:void(0)" onclick="selectOption('goods', this)">Goods and Services</a>
			<a href="javascript:void(0)" onclick="selectOption('auction', this)">Auction Leasing</a>
			<a href="javascript:void(0)" onclick="selectOption('SPO', this)">Search Purchase Orders</a>
			<a href="javascript:void(0)" onclick="selectOption('Eauction', this)">E-Auction System</a>
			<a href="javascript:void(0)" onclick="selectOption('LearningCenter', this)">Learning Center</a>
			<a href="javascript:void(0)" onclick="selectOption('BannedFirms', this)">Banned Firms</a>
			<a href="javascript:void(0)" onclick="selectOption('Helpdesk', this)">Helpdesk</a>
			<a href="javascript:void(0)" onclick="selectOption('Bidder', this)">New Bidder(E-Auction Sale)</a>
			<a href="javascript:void(0)" onclick="selectOption('DepartmentCreation', this)">Department Creation</a>
			<a href="javascript:void(0)" onclick="selectOption('BannedFirms', this)"></a>
		</div>

    <div class="container">
        <!-- Status Check Section -->
        <div class="status-check">
            <h3 id="statusToggle" style="cursor: pointer; display: flex; align-items: center; gap: 10px;">
                <span>Click here to check your Request status</span>
                <svg width="16" height="16" fill="currentColor" viewBox="0 0 24 24"
                    style="transition: transform 0.3s ease;">
                    <path d="M7 10l5 5 5-5H7z" />
                </svg>
            </h3>

            <div id="statusForm" class="status-form hidden">
                <div class="form-group">
                    <label for="requestId">Enter Request ID</label>
                    <input type="text" id="requestId" class="form-control" placeholder="Enter your request ID">
                </div>
                <button type="button" class="btn btn-primary" onclick="submitRequest()">Sign & Submit</button>
            </div>

            <div id="requestStatus" class="request-status">
                <div class="status-content">
                    Request submitted successfully! Your request ID has been processed.
                </div>
            </div>
        </div>

        <!-- Note Section -->
        <div class="note-section">
            <strong>Note:</strong>
            <span>This form is meant for Railway officials (for E-Tendering for Works Contracts only) & not for Vendors
                / Contractors</span>
        </div>

        <!-- Department Details Section -->
        <div class="section-card">
            <div class="section-header">Department Details</div>
            <div class="form-section">
                <div class="form-row">
                    <div class="form-group">
                       <label for="organization">Organization <span class="required">*</span></label>
						<select id="organization" class="form-control">
						    <option value="">Select</option>
						    <c:forEach var="org" items="${organizations}">
						        <option value="${org.orgCode}">${org.ouName}</option>
						    </c:forEach>
						</select>

                    </div>

                    <div class="form-group">
                        <label for="zone">Zone/PU/CTI <span class="required">*</span></label>
							<select id="zone" class="form-control">
							    <option value="">Select</option>
							</select>
                    </div>
                </div>

                <div class="form-row">
                    <div class="form-group">
                        <label for="orgUnitType">Org. Unit Type <span class="required">*</span></label>
							<select id="orgUnitType" class="form-control">
							    <option value="">Select</option>
							</select>
                    </div>

                    <div class="form-group">
                      <label for="adminControlling">Admin Unit Controlling Deptt <span class="required">*</span></label>
						<select id="adminControlling" class="form-control">
						    <option value="">Select</option>
						</select>
                    </div>
                </div>

                <div class="form-row">
                    <div class="form-group">
                       <label for="subUnitType">Sub Unit Type</label>
							<select id="subUnitType" class="form-control">
							    <option value="">Select</option>
							</select>
                    </div>

                    <div class="form-group">
                        <label for="tenderingDept">Tendering Dept <span class="required">*</span></label>
                        <select id="tenderingDept" class="form-control">
                            <option value="">Select</option>
                            <option value="works">Works Department</option>
                            <option value="purchase">Purchase Department</option>
                            <option value="stores">Stores Department</option>
                        </select>
                    </div>
                </div>

                <div class="form-row">
                    <div class="form-group">
                       <label for="adminUnit">Admin Unit <span class="required">*</span></label>
						<select id="adminUnit" class="form-control">
						    <option value="">Select</option>
						</select>
						<!-- Input field for 'Other', initially hidden -->
<input type="text" id="adminUnitOther" class="form-control mt-2" placeholder="Enter Admin Unit" style="display:none;">
                    </div>

                    <div class="form-group">
                        <label for="workAreas">Work Areas Required <span class="required">*</span></label>
                        <select id="workAreas" class="form-control">
                            <option value="">Select an option</option>
                            <option value="civil">Civil Works</option>
                            <option value="electrical">Electrical Works</option>
                            <option value="mechanical">Mechanical Works</option>
                            <option value="signal">Signal Works</option>
                        </select>
                    </div>
                </div>

                <div class="form-row">
                    <div class="form-group">
                        <div class="checkbox-group">
                            <input type="checkbox" id="issueTender" checked>
                            <label for="issueTender">Are you going to issue tender?</label>
                        </div>
                        <input type="text" id="tenderAuthority" class="form-control"
                            placeholder="Tender Calling Authority">
                    </div>

                    <div class="form-group">
                        <div class="checkbox-group">
                            <input type="checkbox" id="issueAuction" onchange="toggleAuctionAuthority()">
                            <label for="issueAuction">Are you going to issue auction?</label>
                        </div>
                        <div id="auctionAuthorityGroup" class="hidden">
                            <input type="text" id="auctionAuthority" class="form-control"
                                placeholder="Auctioning Authority">
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Admin Post Details Section -->
        <div class="section-card">
            <div class="section-header">Admin Post Details</div>
            <div class="form-section">
                <div class="form-row">
                    <div class="form-group">
                        <label for="department">Department <span class="required">*</span></label>
							<select id="department" class="form-control">
							    <option value="">Select</option>
							</select>
                    </div>

                    <div class="form-group">
                       <div class="form-group">
    <label for="grade">Grade <span class="required">*</span></label>
    <select id="grade" class="form-control">
        <option value="">Select</option>
    </select>


                    </div>
                </div>

           <div class="form-row">
				    <div class="form-group">
				        <label for="designation">Designation <span class="required">*</span></label>
				        <div style="display: flex; gap: 10px;">
				            <select id="designation" class="form-control">
				                <option value="">Select</option>
				            </select>
				            <input type="text" id="designationOther" class="form-control"
				                   placeholder="Other designation" style="flex: 1; display:none;">
				        </div>
				    </div>
				</div>

            </div>
        </div>

        <!-- Admin User Details Section -->
        <div class="section-card">
            <div class="section-header">Admin User Details</div>
            <div class="form-section">
                <div class="form-row">
                    <div class="form-group">
                        <label for="email">Email <span class="required">*</span></label>
                        <input type="email" id="email" class="form-control" placeholder="Enter email address">
                    </div>

                    <div class="form-group">
                        <label for="dob">DOB(DD/MM/YYYY) <span class="required">*</span></label>
                        <input type="date" id="dob" class="form-control">
                    </div>
                </div>

                <div class="form-row">
                    <div class="form-group">
                        <label for="firstName">First Name <span class="required">*</span></label>
                        <input type="text" id="firstName" class="form-control" placeholder="Enter first name">
                    </div>

                    <div class="form-group">
                        <label for="middleName">Middle Name</label>
                        <input type="text" id="middleName" class="form-control" placeholder="Enter middle name">
                    </div>
                </div>

                <div class="form-row">
                    <div class="form-group">
                        <label for="lastName">Last Name <span class="required">*</span></label>
                        <input type="text" id="lastName" class="form-control" placeholder="Enter last name">
                    </div>

                    <div class="form-group">
                        <label for="gender">Gender <span class="required">*</span></label>
                        <select id="gender" class="form-control">
                            <option value="">Select</option>
                            <option value="male">Male</option>
                            <option value="female">Female</option>
                            <option value="other">Other</option>
                        </select>
                    </div>
                </div>

                <div class="form-row">
                    <div class="form-group">
                        <label for="aadhaarNumber">Aadhaar Number</label>
                        <input type="text" id="aadhaarNumber" class="form-control" placeholder="Enter Aadhaar number"
                            maxlength="12">
                    </div>

                    <div class="form-group">
                        <label for="faxNo1">Fax No.</label>
                        <input type="text" id="faxNo1" class="form-control" placeholder="Enter fax number">
                    </div>
                </div>

                <div class="form-row">
                    <div class="form-group">
                        <label for="mobileNo">Mobile No. <span class="required">*</span></label>
                        <div style="display: flex; gap: 10px;">
                            <input type="text" id="countryCode1" class="form-control" placeholder="Country Code"
                                style="flex: 0 0 120px;" value="+91">
                            <input type="text" id="mobileNumber" class="form-control" placeholder="Mobile No."
                                style="flex: 1;" maxlength="10">
                        </div>
                        <small class="form-text">(Country Code) (Mobile No.)</small>
                    </div>
                </div>
            </div>
        </div>

        <!-- Address / Contact Details Section -->
        <div class="section-card">
            <div class="section-header">Address / Contact Details</div>
            <div class="form-section">
                <div class="form-row">
                    <div class="form-group">
                        <label for="addressLine1">Address Line 1 <span class="required">*</span></label>
                        <input type="text" id="addressLine1" class="form-control" placeholder="Enter address line 1">
                    </div>

                    <div class="form-group">
                        <label for="addressLine2">Address Line 2</label>
                        <input type="text" id="addressLine2" class="form-control" placeholder="Enter address line 2">
                    </div>
                </div>

                <div class="form-row">
                    <div class="form-group">
                        <label for="country">Country <span class="required">*</span></label>
                        <select id="country" class="form-control">
                            <option value="">Select</option>
                            <option value="india">India</option>
                            <option value="usa">United States</option>
                            <option value="uk">United Kingdom</option>
                            <option value="canada">Canada</option>
                            <option value="australia">Australia</option>
                        </select>
                    </div>

                    <div class="form-group">
                        <label for="state">State <span class="required">*</span></label>
                        <select id="state" class="form-control">
                            <option value="">Select</option>
                            <option value="delhi">Delhi</option>
                            <option value="mumbai">Maharashtra</option>
                            <option value="kolkata">West Bengal</option>
                            <option value="chennai">Tamil Nadu</option>
                            <option value="uttar_pradesh">Uttar Pradesh</option>
                        </select>
                    </div>
                </div>

                <div class="form-row">
                    <div class="form-group">
                        <label for="city">City <span class="required">*</span></label>
                        <input type="text" id="city" class="form-control" placeholder="Enter city">
                    </div>

                    <div class="form-group">
                        <label for="pinCode">Pin / Zip Code <span class="required">*</span></label>
                        <input type="text" id="pinCode" class="form-control" placeholder="Enter pin/zip code"
                            maxlength="6">
                    </div>
                </div>

                <div class="form-row">
                    <div class="form-group">
                        <label for="phoneNo">Phone No.</label>
                        <div style="display: flex; gap: 10px;">
                            <input type="text" id="phoneCountryCode" class="form-control" placeholder="Country Code"
                                style="flex: 0 0 100px;" value="+91">
                            <input type="text" id="phoneStdCode" class="form-control" placeholder="STD Code"
                                style="flex: 0 0 100px;">
                            <input type="text" id="phoneNumber" class="form-control" placeholder="Phone No."
                                style="flex: 1;">
                        </div>
                        <small class="form-text">(Country Code) (STD Code) (Phone No.)</small>
                    </div>

                    <div class="form-group">
                        <label for="faxNo2">Fax No.</label>
                        <input type="text" id="faxNo2" class="form-control" placeholder="Enter fax number">
                    </div>
                </div>
            </div>
        </div>

        <!-- Details of Official Submitting the Request Form Section -->
        <div class="section-card">
            <div class="section-header">Details of Official Submitting the Request Form</div>
            <div class="form-section">
                <div class="form-row">
                    <div class="form-group">
                        <label for="officialName">Name <span class="required">*</span></label>
                        <input type="text" id="officialName" class="form-control" placeholder="Enter official's name">
                    </div>

                    <div class="form-group">
                        <label for="officialEmailId">E-Mail Id <span class="required">*</span></label>
                        <input type="email" id="officialEmailId" class="form-control"
                            placeholder="Enter official's email">
                    </div>
                </div>

                <div class="form-row">
                    <div class="form-group">
                        <label for="officialDesignation">Designation <span class="required">*</span></label>
                        <input type="text" id="officialDesignation" class="form-control"
                            placeholder="Enter official's designation">
                    </div>

                    <div class="form-group">
                        <label for="railway">Railway <span class="required">*</span></label>
                        <input type="text" id="railway" class="form-control" placeholder="Enter railway">
                    </div>
                </div>

                <div class="form-row">
                    <div class="form-group">
                        <label for="officialMobNo">Mob. No.</label>
                        <div style="display: flex; gap: 10px;">
                            <input type="text" id="officialCountryCode" class="form-control" placeholder="Country Code"
                                style="flex: 0 0 120px;" value="+91">
                            <input type="text" id="officialMobileNumber" class="form-control" placeholder="Mobile No."
                                style="flex: 1;" maxlength="10">
                        </div>
                        <small class="form-text">(Country Code) (Mobile No.)</small>
                    </div>

                    <div class="form-group">
                        <label for="officialFaxNo">Fax No.</label>
                        <input type="text" id="officialFaxNo" class="form-control" placeholder="Enter fax number">
                    </div>
                </div>

                <!-- Submit Button -->
                <div style="text-align: center; margin-top: 30px;">
                    <button type="submit" class="btn btn-primary"
                        style="padding: 15px 40px; font-size: 1.1rem;">Submit</button>
                </div>
            </div>
        </div>
        </div>
        </div>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script>
        const ctx = '<%= request.getContextPath() %>';
        let selected = '';

        function selectOption(option, el) {
        	selected = option;

        	document.querySelectorAll('.sidebar a')
        		.forEach(link => link.classList.remove('active-option'));
        	el.classList.add('active-option');

        	// Redirect to dummy login instead of direct function
        	window.location.href = ctx + '/jsp/admin/home/login.jsp?redirect=' + option;

        }

        function openSidebar() { document.getElementById('mySidebar').style.width = '250px'; }
        function closeSidebar() { document.getElementById('mySidebar').style.width = '0'; }
                
            // Toggle status form
            document.getElementById('statusToggle').addEventListener('click', function () {
                const statusForm = document.getElementById('statusForm');
                const arrow = this.querySelector('svg');

                if (statusForm.classList.contains('hidden')) {
                    statusForm.classList.remove('hidden');
                    statusForm.classList.add('show');
                    arrow.style.transform = 'rotate(180deg)';
                } else {
                    statusForm.classList.add('hidden');
                    statusForm.classList.remove('show');
                    arrow.style.transform = 'rotate(0deg)';
                }
            });

            // Submit request function
            function submitRequest() {
                const requestId = document.getElementById('requestId').value;
                if (requestId.trim() === '') {
                    alert('Please enter a Request ID');
                    return;
                }

                const statusDiv = document.getElementById('requestStatus');
                statusDiv.style.display = 'block';

                setTimeout(() => {
                    statusDiv.style.display = 'none';
                }, 5000);
            }

            // Toggle auction authority field
            function toggleAuctionAuthority() {
                const checkbox = document.getElementById('issueAuction');
                const authorityGroup = document.getElementById('auctionAuthorityGroup');

                if (checkbox.checked) {
                    authorityGroup.classList.remove('hidden');
                    authorityGroup.classList.add('show');
                } else {
                    authorityGroup.classList.add('hidden');
                    authorityGroup.classList.remove('show');
                }
            }

            // Add smooth scrolling and form validation
            document.addEventListener('DOMContentLoaded', function () {
                // Add focus effects to form controls
                const formControls = document.querySelectorAll('.form-control');
                formControls.forEach(control => {
                    control.addEventListener('focus', function () {
                        this.parentElement.style.transform = 'scale(1.02)';
                    });

                    control.addEventListener('blur', function () {
                        this.parentElement.style.transform = 'scale(1)';
                    });
                });

                // Power icon click effect
                document.querySelector('.power-icon').addEventListener('click', function () {
                    this.style.background = 'rgba(255, 255, 255, 0.4)';
                    setTimeout(() => {
                        this.style.background = 'rgba(255, 255, 255, 0.2)';
                    }, 200);
                });
            });
            $(document).ready(function() {
                function fetchZones(orgCode) {
                    $.ajax({
                        url: '${pageContext.request.contextPath}/eps/departmentcreation/getZones',
                        data: { orgCode: orgCode },
                        success: function(data) {
                            var html = '<option value="">Select</option>';
                            $.each(data, function(i, zone) {
                                html += '<option value="' + zone.ouCode + '">' + zone.ouName + '</option>';
                            });
                            $('#zone').html(html);
                        }
                    });
                }
             // New: Fetch Org Unit Types
                function fetchOrgUnitTypes(orgCode) {
                    $.ajax({
                        url: '${pageContext.request.contextPath}/eps/departmentcreation/getOrgUnitTypes',
                        data: { orgCode: orgCode },
                        dataType: 'json',
                        success: function(data) {
                            var html = '<option value="">Select</option>';
                            $.each(data, function(i, ou) {
                                html += '<option value="' + ou.ouCode + '">' + ou.ouName + '</option>';
                            });
                            $('#orgUnitType').html(html);
                        },
                        error: function(xhr, status, error) {
                            console.error("Error fetching Org Unit Types:", error);
                        }
                    });
                }
             // New: Fetch Admin Units
                function fetchAdminUnits(orgCode) {
                    $.ajax({
                        url: '${pageContext.request.contextPath}/eps/departmentcreation/getAdminUnits',
                        data: { orgCode: orgCode },
                        dataType: 'json',
                        success: function(data) {
                            var html = '<option value="">Select</option>';
                            $.each(data, function(i, au) {
                                html += '<option value="' + au.ouCode + '">' + au.ouName + '</option>';
                            });
                            $('#adminControlling').html(html);
                        },
                        error: function(xhr, status, error) {
                            console.error("Error fetching Admin Units:", error);
                        }
                    });
                }
             // Fetch Sub Unit Types
                function fetchSubUnitTypes() {
                    var orgCode = $('#organization').val();
                    var orgUnitType = $('#orgUnitType').val();
                    var adminUnitDept = $('#adminControlling').val();

                    if (orgCode && orgUnitType && adminUnitDept) {
                        $.ajax({
                            url: '${pageContext.request.contextPath}/eps/departmentcreation/getSubUnitTypes',
                            data: {
                                orgCode: orgCode,
                                orgUnitType: orgUnitType,
                                adminUnitDept: adminUnitDept
                            },
                            dataType: 'json',
                            success: function(data) {
                                var html = '<option value="">Select</option>';
                                $.each(data, function(i, sub) {
                                    html += '<option value="' + sub.ouCode + '">' + sub.ouName + '</option>';
                                });
                                $('#subUnitType').html(html);
                            },
                            error: function(xhr, status, error) {
                                console.error("Error fetching Sub Unit Types:", error);
                            }
                        });
                    } else {
                        $('#subUnitType').html('<option value="">Select</option>');
                    }
                }
                function fetchAdminUnitsDetails() {
                    var orgCode = $('#organization').val();
                    var zoneId = $('#zone').val();
                    var orgUnitTypeId = $('#orgUnitType').val();
                    var subUnitTypeId = $('#subUnitType').val();

                    if (orgCode) {
                        $.ajax({
                            url: '${pageContext.request.contextPath}/eps/departmentcreation/getAdminUnitsDetails',
                            data: {
                                orgCode: orgCode,
                                zoneId: zoneId || '-1',
                                orgUnitTypeId: orgUnitTypeId || '-1',
                                subUnitTypeId: subUnitTypeId || '-1'
                            },
                            dataType: 'json',
                            success: function(data) {
                                var html = '<option value="">Select</option>';
                                $.each(data, function(i, admin) {
                                    html += '<option value="' + admin.adminUnit + '">' + admin.ouName + '</option>';
                                });
                                html += '<option value="OTHER">Other</option>'; // add "Other" option
                                $('#adminUnit').html(html);
                            },
                            error: function(xhr, status, error) {
                                console.error("Error fetching Admin Unit Details:", error);
                            }
                        });
                    } else {
                        $('#adminUnit').html('<option value="">Select</option>');
                    }
                }

                // Show/hide "Other" input based on selection
                $(document).on('change', '#adminUnit', function() {
                    if ($(this).val() === 'OTHER') {
                        $('#adminUnitOther').show();
                    } else {
                        $('#adminUnitOther').hide();
                    }
                });
                                                                
                function fetchDepartments(orgCode) {
                    $.ajax({
                        url: '${pageContext.request.contextPath}/eps/departmentcreation/getDepartments',
                        data: { orgCode: orgCode },
                        dataType: 'json',
                        success: function(data) {
                            var html = '<option value="">Select</option>';
                            $.each(data, function(i, dept) {
                                html += '<option value="' + dept.ouCode + '">' + dept.ouName + '</option>';
                            });
                            $('#department').html(html);
                        },
                        error: function(xhr, status, error) {
                            console.error("Error fetching departments:", error);
                        }
                    });
                }

                function fetchGrades() {
                    var orgCode = $('#organization').val();
                    var zoneId = $('#zone').val(); // optional
                    var adminUnitDept = $('#department').val();

                    if (orgCode && adminUnitDept) {
                        $.ajax({
                            url: '${pageContext.request.contextPath}/eps/departmentcreation/getGrades',
                            data: {
                                orgCode: orgCode,
                                zoneId: zoneId,
                                adminUnitDept: adminUnitDept
                            },
                            dataType: 'json',
                            success: function(data) {
                                var html = '<option value="">Select</option>';
                                $.each(data, function(i, grade) {
                                    html += '<option value="' + grade.gradeCode + '">' + grade.grade + '</option>';
                                });
                                $('#grade').html(html);
                            },
                            error: function(xhr, status, error) {
                                console.error("Error fetching grades:", error);
                            }
                        });
                    } else {
                        $('#grade').html('<option value="">Select</option>');
                    }
                }

             // Fetch Sub Unit Types when Org Unit Type changes (if Admin Unit already selected)
                $(document).on('change', '#orgUnitType', function() {
                    if ($('#organization').val() && $('#adminControlling').val()) {
                        fetchSubUnitTypes();
                    }
                });
                $(document).on('change', '#organization, #zone, #orgUnitType, #subUnitType', function() {
                    fetchAdminUnitsDetails();
                });

                // Fetch Sub Unit Types when Admin Unit changes (if Org Unit Type already selected)
                $(document).on('change', '#adminControlling', function() {
                    if ($('#organization').val() && $('#orgUnitType').val()) {
                        fetchSubUnitTypes();
                    }
                });
                                
                // Organization change
                $('#organization').change(function() {
                    var orgCode = $(this).val();

                    // Reset dependent dropdowns
                    $('#zone, #department, #grade, #orgUnitType, #adminControlling').html('<option value="">Select</option>');

                    if (orgCode === "") return;

                    fetchZones(orgCode);
                    fetchDepartments(orgCode);
                    fetchOrgUnitTypes(orgCode); 
                    fetchAdminUnits(orgCode); 
                });

                // Grade fetch occurs **only after user selects a department**
                $(document).on('change', '#department', function() {
                    fetchGrades();
                });

                // Optionally fetch grades if zone changes and department already selected
                $(document).on('change', '#zone', function() {
                    if ($('#department').val()) {
                        fetchGrades();
                    }
                });

                function fetchDesignations() {
                    var orgCode = $('#organization').val();
                    var zoneId = $('#zone').val() || "00"; 
                    var deptId = $('#department').val();
                    var gradeId = $('#grade').val(); // Important: depends on selected grade

                    if(orgCode && deptId && gradeId) {
                        $.ajax({
                            url: '${pageContext.request.contextPath}/getDesignations',
                            data: {
                                orgCode: orgCode,
                                zoneId: zoneId,
                                deptId: deptId,
                                gradeId: gradeId
                            },
                            dataType: 'json',
                            success: function(data) {
                                console.log("Designations fetched:", data); // <-- add this for debugging
                                var html = '<option value="">Select</option>';
                                $.each(data, function(i, desig) {
                                    html += '<option value="' + desig.categoryId + '">' + desig.desigPrefix + '</option>';
                                });
                                html += '<option value="OTHER">Other</option>';
                                $('#designation').html(html);
                            },
                            error: function(xhr, status, error) {
                                console.error("Error fetching designations:", error);
                            }
                        });
                    } else {
                        $('#designation').html('<option value="">Select</option>');
                    }
                }

                // Show/hide "Other" input
                $(document).on('change', '#designation', function() {
                    if ($(this).val() === 'OTHER') {
                        $('#designationOther').show();
                    } else {
                        $('#designationOther').hide();
                    }
                });

                // Trigger fetch when grade changes
                $(document).on('change', '#grade', function() {
                    fetchDesignations();
                });
                                
            });

</script>
<script 
    src="https://translation-plugin.bhashini.co.in/v3/website_translation_utility.js"
    language-icon-color="#ffffff">
</script>
<script src="${pageContext.request.contextPath}/assets/bhashini/bhashini-init.js"></script>
</body>
</html>