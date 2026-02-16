<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>IREPS - Bidder Registration Form</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
<style>
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

body {
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    background: white;
    min-height: 100vh;
    display: flex;
    flex-direction: column;
    overflow-x: hidden;
}

/* Header and Footer styles are retained from original code (omitted for brevity) */
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
    flex-direction: column;
    align-items: flex-end;
    font-size: 16px;
    color: white;
    margin-right: 20px;
    gap: 8px;
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
    gap: 10px;
    position: relative;
    top: 40px;
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

.sidebar a .dev-note {
    display: block;
    font-size: 11px;
    color: red;
    margin-top: 2px;
}

.main-container {
    flex: 1;
    max-width: 100%;
    margin: 0;
    padding: 0;
    overflow-y: auto;
}

.content-card {
    margin: 20px auto;
    background: rgba(255, 255, 255, 0.98);
    backdrop-filter: blur(15px);
    border-radius: 20px;
    box-shadow: 0 20px 60px rgba(0, 0, 0, 0.1);
    overflow: visible;
    max-width: 1400px;
    width: 100%;
    display: flex;
    flex-direction: column;
}

.content-header {
    background: white;
    color: #2c5aa0;
    text-align: center;
    position: relative;
    border-bottom: 3px solid #2c5aa0;
    padding: 20px;
}

.content-header h2 {
    font-size: 28px;
    position: relative;
    z-index: 1;
    letter-spacing: 0.5px;
    margin: 0;
    color: #2c5aa0;
}

.content-body {
    padding: 30px;
    background: #f8f9fc;
}

.alert-error {
    background: linear-gradient(135deg, #fff5f5 0%, #ffe5e5 100%);
    border-left: 5px solid #dc3545;
    padding: 15px 20px;
    margin-bottom: 20px;
    border-radius: 8px;
    color: #991b1b;
    font-size: 15px;
}

.notice-card {
    background: linear-gradient(135deg, #fef3c7 0%, #fde68a 100%);
    border-left: 5px solid #f59e0b;
    padding: 20px;
    margin-bottom: 20px;
    border-radius: 8px;
    box-shadow: 0 2px 8px rgba(245, 158, 11, 0.1);
}

.notice-card h3 {
    color: #92400e;
    font-size: 17px;
    margin-bottom: 12px;
    font-weight: 700;
}

.notice-card p {
    color: #78350f;
    line-height: 1.7;
    margin-bottom: 8px;
    font-size: 15px;
}

.red-text {
    color: #dc2626;
    font-weight: 700;
}

.form-hint {
    background: white;
    border: 2px solid #e5e7eb;
    border-left: 4px solid #3b82f6;
    padding: 12px 18px;
    border-radius: 8px;
    font-size: 14px;
    color: #374151;
    margin-bottom: 25px;
}

.required {
    color: #dc2626;
    font-weight: 700;
}

.section-title {
    background: linear-gradient(135deg, #2c5aa0 0%, #1a4480 100%);
    color: white;
    padding: 14px 20px;
    font-size: 16px;
    font-weight: 600;
    border-radius: 10px;
    margin: 25px 0 20px 0;
    display: flex;
    align-items: center;
    gap: 10px;
    box-shadow: 0 4px 15px rgba(44, 90, 160, 0.2);
}

.form-row {
    display: grid;
    grid-template-columns: repeat(2, 1fr);
    gap: 20px;
    margin-bottom: 20px;
}

.form-field {
    display: flex;
    flex-direction: column;
    gap: 8px;
}

.form-label {
    color: #1f2937;
    font-weight: 600;
    font-size: 14px;
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
}

.form-input {
    padding: 11px 14px;
    border: 2px solid #ddd;
    border-radius: 10px;
    font-size: 14px;
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    font-weight: 500;
    transition: all 0.3s ease;
    background: white;
    color: #2d3436;
    min-height: 42px;
}

.form-input:focus {
    outline: none;
    border-color: #74b9ff;
    box-shadow: 0 0 0 3px rgba(116, 185, 255, 0.1);
}

.form-input:hover:not(:focus) {
    border-color: #9ca3af;
}

.form-input:read-only {
    background: #f3f4f6;
    color: #6b7280;
    cursor: not-allowed;
}

.field-help {
    font-size: 12px;
    color: #6b7280;
    margin-top: 4px;
}

.text-success {
    color: #16a34a !important;
    font-weight: 600;
}

.text-danger {
    color: #dc2626 !important;
    font-weight: 600;
}

.action-bar {
    display: flex;
    justify-content: center;
    gap: 16px;
    margin-top: 30px;
    padding: 25px;
    background: white;
    border-radius: 12px;
    border-top: 2px solid #e5e7eb;
}

.btn {
    padding: 12px 36px;
    border: none;
    border-radius: 50px;
    font-size: 16px;
    font-weight: 600;
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    cursor: pointer;
    transition: all 0.3s ease;
    box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
}

.btn-secondary {
    background: transparent;
    color: #666;
    border: 2px solid #ddd;
}

.btn-secondary:hover {
    background: #f5f5f5;
    transform: translateY(-2px);
    box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
    color: #333;
}

.btn-primary {
    background: linear-gradient(45deg, #74b9ff, #0984e3);
    color: white;
}

.btn-primary:hover:not(:disabled) {
    transform: translateY(-2px);
    box-shadow: 0 8px 25px rgba(116, 185, 255, 0.3);
}

.btn-primary:disabled {
    background: #ccc;
    cursor: not-allowed;
    box-shadow: none;
}

.footer {
    background-color: #0b253f;
    color: white;
    text-align: center;
    padding: 16px 10px;
    font-family: "Segoe UI", sans-serif;
    font-size: 15px;
    display: flex;
    justify-content: center;
    align-items: center;
    flex-wrap: wrap;
    gap: 12px;
    width: 100%;
    margin-top: auto;
    position: relative;
    background: #05173c !important;
    background-image: none !important;
}

.footer img {
    height: 50px;
    width: auto;
    vertical-align: middle;
    object-fit: contain;
}

.footer-text {
    margin-left: 10px;
}

select {
    appearance: none;
    background-image: url("data:image/svg+xml;charset=US-ASCII,<svg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 4 5'><path fill='%23666' d='M2 0L0 2h4zm0 5L0 3h4z'/></svg>");
    background-repeat: no-repeat;
    background-position: right 12px center;
    background-size: 12px;
    padding-right: 40px;
}

@media (max-width: 768px) {
    .ireps-header {
        flex-direction: column;
        gap: 15px;
        padding: 15px;
    }

    .center-section {
        transform: translateX(0);
    }

    .main-title {
        font-size: 24px;
    }

    .sub-title {
        font-size: 20px;
    }

    .content-card {
        margin: 10px;
    }

    .form-row {
        grid-template-columns: 1fr;
    }

    .action-bar {
        flex-direction: column;
    }

    .btn {
        width: 100%;
        justify-content: center;
    }

    .footer {
        flex-direction: column;
        padding: 12px 10px;
    }

    .footer img {
        height: 40px;
    }
}

/* --- New Styles for Tabs/Steps --- */
.step-navigation {
    display: flex;
    justify-content: space-between;
    padding: 0 30px;
    margin-bottom: 25px;
    border-bottom: 1px solid #ddd;
}

.step-tab {
    cursor: pointer;
    padding: 12px 20px;
    font-weight: 600;
    color: #6b7280;
    border-bottom: 3px solid transparent;
    transition: all 0.3s ease;
    font-size: 15px;
    flex-grow: 1;
    text-align: center;
}

.step-tab.active {
    color: #2c5aa0;
    border-bottom-color: #2c5aa0;
}

.step-content {
    display: none;
    padding: 0 30px;
}

.step-content.active {
    display: block;
}

.step-actions {
    display: flex;
    justify-content: flex-end;
    gap: 16px;
    padding: 20px 30px 10px;
}

.step-actions .btn {
    padding: 10px 25px;
}

.step-actions .btn-secondary {
    display: none; /* Hide 'Previous' button on the first step */
}
/* --- End New Styles --- */

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
            <select id="language" class="language-dropdown">
                <option value="en">English</option>
                <option value="hi">Hindi</option>
            </select>
        </div>
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


<div class="main-container">
    <div class="content-card">
        <div class="content-header">
            <h2>Bidder Registration Form</h2>
        </div>

        <div class="content-body">
            <c:if test="${not empty error}">
                <div class="alert-error">${error}</div>
            </c:if>

            <div class="notice-card">
                <h3>📋 Important Requirements</h3>
                <p><strong>Bidders must have a valid Class III Digital Signature Certificate issued by a licensed CA with Firm Name.</strong></p>
                <p>(Note: Bidders need to submit a one-time <span class="red-text">Refundable</span> Registration Fee of ₹10,000)</p>
            </div>

            <div class="form-hint">
                Fields marked with <span class="required">*</span> are mandatory.
            </div>

            <form id="bidderForm" method="post" action="${pageContext.request.contextPath}/eps/Bidder/register.do" autocomplete="off" novalidate>
                <input type="hidden" name="lastModifyFrom" value="<c:out value='${empty bidderForm.lastModifyFrom ? "WEB" : bidderForm.lastModifyFrom}'/>" />

                <div class="step-navigation" id="stepNav">
                    <div class="step-tab active" data-step="1">1. Firm Details</div>
                    <div class="step-tab" data-step="2">2. Contact Details</div>
                    <div class="step-tab" data-step="3">3. Address</div>
                    <div class="step-tab" data-step="4">4. Contact Numbers</div>
                    <div class="step-tab" data-step="5">5. Railway & Depot</div>
                </div>
                <div class="step-content active" data-step="1">
                    <div class="section-title">
                        <i class="bi bi-building"></i> Firm Details
                    </div>
                    <div class="form-row">
                        <div class="form-field">
                            <label class="form-label">Firm Name <span class="required">*</span></label>
                            <input type="text" class="form-input" name="firmName" maxlength="150" required value="<c:out value='${bidderForm.firmName}'/>">
                        </div>
                        <div class="form-field">
                            <label class="form-label">M/S</label>
                            <input type="text" class="form-input" name="msName" maxlength="150" value="<c:out value='${bidderForm.msName}'/>" placeholder="Enter M/S">
                        </div>
                    </div>

                    <div class="form-row">
                        <div class="form-field">
                            <label class="form-label">Firm URL</label>
                            <input type="url" class="form-input" name="firmUrl" maxlength="100" value="<c:out value='${bidderForm.firmUrl}'/>" placeholder="http://...">
                        </div>
                        <div class="form-field">
                            <label class="form-label">Company Registration No.</label>
                            <input type="text" class="form-input" name="companyRegNo" maxlength="150" value="<c:out value='${bidderForm.companyRegNo}'/>">
                        </div>
                    </div>

                    <div class="form-row">
                        <div class="form-field">
                            <label class="form-label">PAN/TAN No.</label>
                            <input type="text" class="form-input" name="panTan" maxlength="10" value="<c:out value='${bidderForm.panTan}'/>" oninput="this.value=this.value.toUpperCase();"
                            placeholder="ABCDE1234A">
                            <small class="field-help">PAN format: 5 letters + 4 digits + 1 letter</small>
                        </div>
                        <div class="form-field">
                            <label class="form-label">Constitution of Firm</label>
                            <select class="form-input" name="constitution">
                                <c:set var="cons" value="${bidderForm.constitution}" />
                                <option value="Partnership" <c:if test="${cons=='Partnership'}">selected</c:if>>Partnership</option>
                                <option value="Private Ltd." <c:if test="${cons=='Private Ltd.'}">selected</c:if>>Private Ltd.</option>
                                <option value="Proprietorship" <c:if test="${cons=='Proprietorship'}">selected</c:if>>Proprietorship</option>
                                <option value="Public Ltd." <c:if test="${cons=='Public Ltd.'}">selected</c:if>>Public Ltd.</option>
                                <option value="Limited Liability Partnership" <c:if test="${cons=='Limited Liability Partnership'}">selected</c:if>>Limited Liability Partnership</option>
                                <option value="Govt." <c:if test="${cons=='Govt.' || cons=='Government'}">selected</c:if>>Govt.</option>
                                <option value="Other" <c:if test="${empty cons || cons=='Other'}">selected</c:if>>Other</option>
                            </select>
                        </div>
                    </div>
                    <div class="step-actions">
                        <button type="button" class="btn btn-primary next-step">Next <i class="bi bi-arrow-right"></i></button>
                    </div>
                </div>
                <div class="step-content" data-step="2">
                    <div class="section-title">
                        <i class="bi bi-person-circle"></i> Contact Details
                    </div>
                    <div class="form-row">
                        <div class="form-field">
                            <label class="form-label">E-Mail / User ID <span class="required">*</span></label>
                            <input type="email" id="email" name="emailID" class="form-input" maxlength="50" required value="<c:out value='${bidderForm.emailID}'/>" placeholder="name@example.com" oninput="checkEmailAvailability()">
                            <small id="emailStatus" class="text-muted"></small>
                        </div>
                        <div class="form-field">
                            <label class="form-label">Alternate E-Mail ID</label>
                            <input type="email" class="form-input" name="alternateEmail" maxlength="50" value="<c:out value='${bidderForm.alternateEmail}'/>">
                        </div>
                    </div>

                    <div class="form-row">
                        <div class="form-field">
                            <label class="form-label">User First Name <span class="required">*</span></label>
                            <input type="text" class="form-input" name="firstName" maxlength="60" required value="<c:out value='${bidderForm.firstName}'/>">
                        </div>
                        <div class="form-field">
                            <label class="form-label">Title <span class="required">*</span></label>
                            <select class="form-input" name="title" required>
                                <c:set var="ttl" value="${bidderForm.title}" />
                                <option value="Mr." <c:if test="${ttl=='Mr.'}">selected</c:if>>Mr.</option>
                                <option value="Ms." <c:if test="${ttl=='Ms.'}">selected</c:if>>Ms.</option>
                                <option value="Mrs." <c:if test="${ttl=='Mrs.'}">selected</c:if>>Mrs.</option>
                            </select>
                        </div>
                    </div>

                    <div class="form-row">
                        <div class="form-field">
                            <label class="form-label">Last Name</label>
                            <input type="text" class="form-input" name="lastName" maxlength="50" value="<c:out value='${bidderForm.lastName}'/>">
                        </div>
                        <div class="form-field">
                            <label class="form-label">Middle Name</label>
                            <input type="text" class="form-input" name="middleName" maxlength="50" value="<c:out value='${bidderForm.middleName}'/>">
                        </div>
                    </div>
                    <div class="step-actions">
                        <button type="button" class="btn btn-secondary prev-step"><i class="bi bi-arrow-left"></i> Previous</button>
                        <button type="button" class="btn btn-primary next-step">Next <i class="bi bi-arrow-right"></i></button>
                    </div>
                </div>
                <div class="step-content" data-step="3">
                    <div class="section-title">
                        <i class="bi bi-geo-alt"></i> Address
                    </div>
                    <div class="form-row">
                        <div class="form-field">
                            <label class="form-label">Address Line 1 <span class="required">*</span></label>
                            <input type="text" class="form-input" name="addr1" maxlength="255" required value="<c:out value='${bidderForm.addr1}'/>">
                        </div>
                        <div class="form-field">
                            <label class="form-label">Address Line 2</label>
                            <input type="text" class="form-input" name="addr2" maxlength="255" value="<c:out value='${bidderForm.addr2}'/>">
                        </div>
                    </div>

                    <div class="form-row">
                        <div class="form-field">
                            <label class="form-label">District / City <span class="required">*</span></label>
                            <input type="text" class="form-input" name="cityName" maxlength="50" required value="<c:out value='${bidderForm.cityName}'/>">
                        </div>
                        <div class="form-field">
                            <label class="form-label">Pin / Zip Code <span class="required">*</span></label>
                            <input type="text" class="form-input" name="pincode" maxlength="6" required value="<c:out value='${bidderForm.pincode}'/>" pattern="^\d{6}$" placeholder="6 digits">
                        </div>
                    </div>

                    <div class="form-row">
                        <div class="form-field">
                            <label class="form-label">Country <span class="required">*</span></label>
                            <select class="form-input" name="country" required>
                                <option value="India" selected>India</option>
                            </select>
                            <small class="field-help">Country is fixed to India (DB stores ID 10141)</small>
                        </div>
                        <div class="form-field">
                            <label class="form-label">State <span class="required">*</span></label>
                            <select class="form-input" name="stateId" required>
                                <c:forEach var="s" items="${states}">
                                    <option value="${s.id}" <c:if test="${bidderForm.stateId == s.id}">selected</c:if>>${s.name}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="step-actions">
                        <button type="button" class="btn btn-secondary prev-step"><i class="bi bi-arrow-left"></i> Previous</button>
                        <button type="button" class="btn btn-primary next-step">Next <i class="bi bi-arrow-right"></i></button>
                    </div>
                </div>
                <div class="step-content" data-step="4">
                    <div class="section-title">
                        <i class="bi bi-telephone"></i> Contact Numbers
                    </div>
                    <div class="form-row">
                        <div class="form-field">
                            <label class="form-label">Phone No. 1 <span class="required">*</span></label>
                            <input type="tel" id="phone1" name="phone1" class="form-input" maxlength="20" required value="<c:out value='${bidderForm.phone1}'/>" pattern="^\d{10}$" placeholder="10 digits">
                            <small id="phone1Msg" class="text-danger"></small>
                        </div>
                        <div class="form-field">
                            <label class="form-label">Phone No. 2</label>
                            <input type="tel" id="phone2" name="phone2" class="form-input" maxlength="20" value="<c:out value='${bidderForm.phone2}'/>" pattern="^\d{10}$" placeholder="10 digits">
                            <small id="phone2Msg" class="text-danger"></small>
                        </div>
                    </div>

                    <div class="form-row">
                        <div class="form-field">
                            <label class="form-label">Cell Phone No. <span class="required">*</span></label>
                            <input type="tel" id="cellPhone" name="mobileNo" class="form-input" maxlength="20" required value="<c:out value='${bidderForm.mobileNo}'/>" pattern="^\d{10}$" placeholder="10 digits">
                            <small id="cellMsg" class="text-danger"></small>
                        </div>
                        <div class="form-field">
                            <label class="form-label">Fax No.</label>
                            <input type="tel" id="fax" name="fax" class="form-input" maxlength="50" value="<c:out value='${bidderForm.fax}'/>" pattern="^\d{12}$" placeholder="12 digits">
                            <small id="faxMsg" class="text-danger"></small>
                        </div>
                    </div>

                    <div class="section-title">
                        <i class="bi bi-cash-stack"></i> Taxation Details
                    </div>
                    <div class="form-row">
                        <div class="form-field">
                            <label class="form-label">GST Number <span class="required">*</span></label>
                            <input type="text" id="gstNo" name="gstNumber" class="form-input" maxlength="15" required value="<c:out value='${bidderForm.gstNumber}'/>" oninput="this.value=this.value.toUpperCase();"
                            placeholder="22AAAAA0000A1Z5">
                            <span id="gstMessage" style="font-size: 13px; margin-top: 4px;"></span>
                            <small class="field-help">We'll auto-block duplicates with existing registrations.</small>
                        </div>
                    </div>

                    <div class="step-actions">
                        <button type="button" class="btn btn-secondary prev-step"><i class="bi bi-arrow-left"></i> Previous</button>
                        <button type="button" class="btn btn-primary next-step">Next <i class="bi bi-arrow-right"></i></button>
                    </div>
                </div>
                <div class="step-content" data-step="5">
                    <div class="section-title">
                        <i class="bi bi-train-front"></i> Railway & Depot Selection
                    </div>
                    <div class="form-row">
                        <div class="form-field">
                            <label class="form-label">Select Railway for Registration</label>
                            <select id="railwaySelect" name="railwayAccountId" class="form-input">
                                <option value="">-- Select Railway --</option>
                                <c:forEach var="r" items="${railwayList}">
                                    <option value="${r.accountId}" <c:if test="${bidderForm.railwayAccountId == r.accountId}">selected</c:if>>${r.accountName}</option>
                                </c:forEach>
                            </select>
                            <input type="hidden" name="railUnitName" id="railUnitName" value="<c:out value='${bidderForm.railUnitName}'/>">
                            <small class="field-help">Only first 10 chars of Railway name are stored.</small>
                        </div>
                        <div class="form-field">
                            <label class="form-label">Select Depot for Registration</label>
                            <select id="depotSelect" name="depotUnitName" class="form-input">
                                <option value="">-- Select Depot --</option>
                            </select>
                            <small class="field-help">Only first 20 chars of Depot name are stored.</small>
                        </div>
                    </div>

                    <div class="action-bar">
                        <button type="button" class="btn btn-secondary prev-step"><i class="bi bi-arrow-left"></i> Previous</button>
                        <button type="button" class="btn btn-secondary" onclick="window.print()">
                            <i class="bi bi-printer"></i> Print Form
                        </button>
                        <button type="submit" id="submitBtn" class="btn btn-primary">
                            <i class="bi bi-check-circle"></i> Sign &amp; Submit
                        </button>
                    </div>
                </div>
                </form>
        </div>
    </div>
</div>

<footer class="footer">
    <img src="${pageContext.request.contextPath}/assets/images/stqc.png" alt="STQC">
    <img src="${pageContext.request.contextPath}/assets/images/cris.png" alt="CRIS">
    <div class="footer-text">
        Centre For Railway Information Systems, Designed, Developed and Hosted by CRIS &nbsp;
        <strong>Version 7.1.0</strong>
    </div>
</footer>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<script>
const ctx = '<%= request.getContextPath() %>';
let selected = '';
function selectOption(option, el) {
    selected = option;
    document.querySelectorAll('.sidebar a').forEach(link => link.classList.remove('active-option'));
    el.classList.add('active-option');
    window.location.href = ctx + '/jsp/admin/home/login.jsp?redirect=' + option;
}

function openSidebar() {
    document.getElementById('mySidebar').style.width = '250px';
}

function closeSidebar() {
    document.getElementById('mySidebar').style.width = '0';
}
</script>

<script>
$(document).ready(function() {
    // --- Step Navigation Logic ---
    let currentStep = 1;
    const $steps = $(".step-content");
    const $tabs = $(".step-tab");

    function showStep(step) {
        $steps.removeClass("active").eq(step - 1).addClass("active");
        $tabs.removeClass("active").eq(step - 1).addClass("active");
        currentStep = step;

        // Manage Previous button visibility
        const $prevBtn = $steps.eq(step - 1).find('.prev-step');
        $prevBtn.css('display', step === 1 ? 'none' : 'inline-block');
    }

    // Function to check if required fields in the current step are filled
    function isStepValid(step) {
        let isValid = true;
        const $currentStepContent = $steps.eq(step - 1);
        
        // Find all required fields within the current step that are visible
        $currentStepContent.find('input[required], select[required]').each(function() {
            if (!$(this).val()) {
                isValid = false;
                $(this).addClass('is-invalid'); // Optional: Add some visual feedback
            } else {
                $(this).removeClass('is-invalid');
            }
        });
        return isValid;
    }

    $(".next-step").on("click", function() {
        const currentStepIndex = $(this).closest('.step-content').data('step');
        
        // Validate current step before moving
        if (isStepValid(currentStepIndex)) {
             // For step 4, perform GST and Contact number validations before moving to next step
            if(currentStepIndex === 4 && (!/^\d{10}$/.test($('#phone1').val()) || $('#gstMessage').hasClass('text-danger'))) {
                alert("Please correct required fields and validation errors before proceeding.");
                return;
            }

            if (currentStep < $steps.length) {
                showStep(currentStep + 1);
            }
        } else {
            alert("Please fill all mandatory fields (*).");
        }
    });

    $(".prev-step").on("click", function() {
        if (currentStep > 1) {
            showStep(currentStep - 1);
        }
    });
    
    // Clicking on tabs
    $tabs.on("click", function() {
        const targetStep = $(this).data('step');
        // Optional: Add logic to prevent jumping to future steps if current step is invalid.
        showStep(targetStep);
    });
    
    // Initialize form to first step
    showStep(1);

    // --- Original Scripts Retained & Integrated ---

    // Railway/Depot Logic (Retained from original script)
    $("#railwaySelect").on("change", function() {
        var $opt = $(this).find("option:selected");
        $("#railUnitName").val($opt.text());

        var accountId = $(this).val();
        if (accountId) {
            $.ajax({
                url: "${pageContext.request.contextPath}/eps/Bidder/getDepots",
                type: "GET",
                data: { accountId: accountId },
                success: function(data) {
                    var $depot = $("#depotSelect");
                    $depot.empty().append('<option value="">-- Select Depot --</option>');
                    $.each(data, function(i, depot) {
                        var selected = "";
                        if ("${bidderForm.depotUnitName}" && depot.depotName === "${bidderForm.depotUnitName}") {
                            selected = " selected";
                        }
                        $depot.append('<option value="' + depot.depotName + '"' + selected + '>' + depot.depotName + '</option>');
                    });
                },
                error: function() {
                    alert("Failed to load depots.");
                    $("#depotSelect").empty().append('<option value="">-- Select Depot --</option>');
                }
            });
        } else {
            $("#railUnitName").val("");
            $("#depotSelect").empty().append('<option value="">-- Select Depot --</option>');
        }
    });

    $("#railwaySelect").trigger("change");
    
    // Submit Button Disable (Retained from original script)
    $("#bidderForm").on("submit", function() {
        // Final check on Step 5 fields just before submit
        if (!isStepValid(5)) {
             alert("Please fill all mandatory fields (*) in the final step.");
             return false;
        }
        $("#submitBtn").prop("disabled", true);
    });

    // GST Validation (Retained from original script)
    $("#gstNo").on("input blur", function() {
        var gstNo = $(this).val().trim().toUpperCase();
        $(this).val(gstNo);
        var msg = $("#gstMessage");
        msg.removeClass("text-success text-danger").text("");
        
        // Control submit button based on validation, but only in the last step
        const isLastStep = currentStep === 5;
        if (isLastStep) $("#submitBtn").prop("disabled", true);

        if (gstNo.length === 0) {
            return;
        }

        var gstRegex = /^[0-9]{2}[A-Z]{5}[0-9]{4}[A-Z]{1}[1-9A-Z]{1}Z[0-9A-Z]{1}$/;
        if (!gstRegex.test(gstNo)) {
            msg.addClass("text-danger").text("Invalid GST Number format.");
            return;
        }

        $.ajax({
            url: "${pageContext.request.contextPath}/eps/Bidder/checkGst",
            type: "GET",
            data: { gstNo: gstNo },
            success: function(response) {
                msg.removeClass("text-success text-danger").text("");
                if (response === "AVAILABLE") {
                    msg.addClass("text-success").text("GST Number is available for registration.");
                    if (isLastStep) $("#submitBtn").prop("disabled", false);
                } else if (response === "INVALID") {
                    msg.addClass("text-danger").text("Invalid GST Number format.");
                } else {
                    msg.addClass("text-danger").text("GST already in use by: " + response);
                }
            },
            error: function() {
                msg.addClass("text-danger").text("Error checking GST. Please try again.");
            }
        });
    });

    // Phone/Fax Validation (Retained from original script)
    $("#phone1").on("input", function() {
        const v = $(this).val().trim();
        $("#phone1Msg").text(v && !/^\d{10}$/.test(v) ? "Phone No. 1 must be exactly 10 digits." : "");
    });
    
    $("#phone2").on("input", function() {
        const v = $(this).val().trim();
        $("#phone2Msg").text(v && !/^\d{10}$/.test(v) ? "Phone No. 2 must be exactly 10 digits." : "");
    });
    
    $("#cellPhone").on("input", function() {
        const v = $(this).val().trim();
        $("#cellMsg").text(v && !/^\d{10}$/.test(v) ? "Cell Phone must be exactly 10 digits." : "");
    });
    
    $("#fax").on("input", function() {
        const v = $(this).val().trim();
        $("#faxMsg").text(v && !/^\d{12}$/.test(v) ? "Fax number must be exactly 12 digits." : "");
    });

});
</script>

<script>
// Email Validation (Retained from original script)
function checkEmailAvailability() {
    var email = $("#email").val().trim();
    var status = $("#emailStatus");
    status.removeClass("text-danger text-success").text("");
    
    // Only disable submit button if we are on the final step
    const isLastStep = parseInt($(".step-content.active").data('step')) === 5;
    if (isLastStep) {
        $("#submitBtn").prop("disabled", true);
    }
    
    if (email.length === 0) {
        return;
    }

    var emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    if (!emailRegex.test(email)) {
        status.addClass("text-danger").text("Invalid email format.");
        return;
    }

    $.ajax({
        url: "${pageContext.request.contextPath}/eps/Bidder/checkEmail",
        type: "GET",
        data: { email: email },
        success: function(response) {
            status.removeClass("text-danger text-success");
            if (response === "REGISTERED") {
                status.addClass("text-danger").text("This email is already registered.");
            } else if (response === "AVAILABLE") {
                status.addClass("text-success").text("Email is available for registration.");
                // Re-enable submit button only if on the last step AND GST is valid/available
                if (isLastStep && !$('#gstMessage').hasClass('text-danger') && $('#gstNo').val().trim()) {
                     $("#submitBtn").prop("disabled", false);
                }
            } else {
                status.addClass("text-danger").text("Error validating email. Please try again.");
            }
        },
        error: function() {
            status.addClass("text-danger").text("Server error. Try again later.");
        }
    });
}
</script>

</body>
</html>