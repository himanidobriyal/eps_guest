<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- Guard: agar form/oid nahi milta to form par bhejo (PRG safety) --%>
<c:if test="${empty form || empty oid}">
  <c:redirect url='${pageContext.request.contextPath}/eps/Bidder/bidderform.do'/>
</c:if>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>IREPS - Bidder Registration Success</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
<style>
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}
html, body {
  height: 100%;
   margin: 0 !important;
  padding: 0 !important;
 }

.body {
  display: flex;
  flex-direction: column;
  min-height: 100vh;
  margin: 0 !important;
  padding: 0 !important;
}


.ireps-header {
    display: flex;
    align-items: center;
    justify-content: space-between;
    background-color: #0b253f;
    padding: 40px 20px;
    color: white;
    flex-shrink: 0;
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
    margin-top: 20px;
    max-width: 100%;
    margin: 0;  /* 12px 0px se change karo */
    padding: 0;
    overflow-y: auto;
}


.content-card {
    background: white;
    border: 2px solid #2c5aa0;
    border-radius: 8px;
    box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
    overflow: visible;
    max-width: 900px;
    width: 95%;
    margin: 0 auto;
    display: flex;
    flex-direction: column;
    margin-top: 20px;
    margin-bottom: 20px;
}

.content-header {
    background: linear-gradient(135deg, #2c5aa0 0%, #1a4480 100%);
    color: white;
    text-align: center;
    padding: 15px;
    border-bottom: 3px solid #1a4480;
}

.content-header h2 {
    font-size: 20px;
    margin: 0;
    font-weight: 600;
    letter-spacing: 0.5px;
}

.success-banner {
    background: linear-gradient(135deg, #10b981 0%, #059669 100%);
    color: white;
    padding: 12px 20px;
    display: flex;
    align-items: center;
    gap: 12px;
    border-bottom: 2px solid #047857;
}

.success-icon {
    background: rgba(255, 255, 255, 0.2);
    padding: 6px 10px;
    border-radius: 50%;
    font-size: 22px;
}

.success-text {
    flex: 1;
}

.success-text h3 {
    font-size: 16px;
    font-weight: 600;
    margin-bottom: 4px;
}

.success-text div {
    font-size: 14px;
}

.oid-badge {
    background: rgba(255, 255, 255, 0.2);
    padding: 3px 10px;
    border-radius: 15px;
    font-size: 13px;
    font-weight: 600;
}

.content-body {
    padding: 20px;
    background: #fafbfc;
}

.section-title {
    background: linear-gradient(135deg, #2c5aa0 0%, #1a4480 100%);
    color: white;
    padding: 8px 14px;
    font-size: 15px;
    font-weight: 600;
    border-radius: 5px;
    margin: 12px 0 10px 0;
    display: flex;
    align-items: center;
    gap: 8px;
}

.info-card {
    background: white;
    border: 1px solid #ddd;
    border-radius: 6px;
    padding: 0;
    margin-bottom: 12px;
}

.info-grid {
    display: grid;
    grid-template-columns: repeat(2, 1fr);
    gap: 0;
}

.info-row {
    display: flex;
    padding: 10px 14px;
    border-bottom: 1px solid #f0f0f0;
    border-right: 1px solid #f0f0f0;
}

.info-row:nth-child(2n) {
    border-right: none;
}

.info-row:last-child,
.info-row:nth-last-child(2):nth-child(odd) {
    border-bottom: none;
}

.info-label {
    color: #555;
    font-size: 14px;
    font-weight: 600;
    min-width: 140px;
    flex-shrink: 0;
}

.info-value {
    color: #222;
    font-size: 14px;
    font-weight: 500;
    word-break: break-word;
}

.action-bar {
    display: flex;
    justify-content: center;
    gap: 12px;
    margin-top: 15px;
    padding: 15px;
    background: white;
    border-radius: 6px;
    border-top: 2px solid #e5e7eb;
}

.btn {
    padding: 10px 28px;
    border: none;
    border-radius: 25px;
    font-size: 15px;
    font-weight: 600;
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    cursor: pointer;
    transition: all 0.3s ease;
    box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
    text-decoration: none;
    display: inline-flex;
    align-items: center;
    gap: 8px;
}

.btn-secondary {
    background: transparent;
    color: #666;
    border: 2px solid #ddd;
}

.btn-secondary:hover {
    background: #f5f5f5;
    transform: translateY(-2px);
    box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
    color: #333;
}

.btn-primary {
    background: linear-gradient(45deg, #74b9ff, #0984e3);
    color: white;
}

.btn-primary:hover {
    transform: translateY(-2px);
    box-shadow: 0 4px 15px rgba(116, 185, 255, 0.4);
}

select {
    appearance: none;
    background-image: url("data:image/svg+xml;charset=US-ASCII,<svg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 4 5'><path fill='%23666' d='M2 0L0 2h4zm0 5L0 3h4z'/></svg>");
    background-repeat: no-repeat;
    background-position: right 12px center;
    background-size: 12px;
    padding-right: 35px;
}

.footer {
    flex-shrink: 0;
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

@media print {
    .ireps-header,
    .sidebar,
    .footer,
    .action-bar,
    .menu-icon,
    .icon-row {
        display: none !important;
    }
    
    body {
        background: white;
    }
    
    .content-card {
        box-shadow: none;
        border: 2px solid #000;
        max-width: 100%;
        
    }
    
    .main-container {
        padding: 0;
        margin: 0 auto;
        overflow-y: visible;
    }
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
    
    .main-container {
        padding: 10px 0;
    }

    .content-card {
        width: 95%;
        margin: 0 auto;
    }

    .info-grid {
        grid-template-columns: 1fr;
    }
    
    .info-row {
        border-right: none;
        flex-direction: column;
        gap: 4px;
    }
    
    .info-label {
        min-width: auto;
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
    /* === FIX unwanted space above header and below footer === */
html, body {
  height: 100%;
  margin: 0 !important;
  padding: 0 !important;
  overflow-x: hidden;
}

/* body container (main flex wrapper) */
.body {
  display: flex;
  flex-direction: column;
  justify-content: space-between;
  min-height: 100vh;
  margin: 0 !important;
  padding: 0 !important;
}

/* make sure header touches top */
.ireps-header {
  margin-top: 0 !important;
  border-top: none !important;
  position: relative;
  top: 0;
}

/* make sure footer touches bottom */
.footer {
  margin-bottom: 0 !important;
  padding-bottom: 12px !important; /* keep some inner space only */
  position: relative;
  bottom: 0;
}

/* remove any body default background gap */
body::before, body::after {
  content: none !important;
  display: none !important;
}
    
}
</style>
</head>
<body class="body">
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
            <h2>Bidder Registration Confirmation Slip</h2>
        </div>

        <div class="success-banner">
            <div class="success-icon">
                <i class="bi bi-check-circle-fill"></i>
            </div>
            <div class="success-text">
                <h3>Registration Completed Successfully!</h3>
                <div>
                    Registration ID: 
                    <span class="oid-badge">
                        <c:choose>
                            <c:when test="${not empty oid}"><c:out value='${oid}'/></c:when>
                            <c:otherwise>-</c:otherwise>
                        </c:choose>
                    </span>
                </div>
            </div>
        </div>

        <div class="content-body">
            <div class="section-title">
                <i class="bi bi-building"></i> Firm Details
            </div>
            <div class="info-card">
                <div class="info-grid">
                    <div class="info-row">
                        <div class="info-label">Firm Name:</div>
                        <div class="info-value">
                            <c:choose>
                                <c:when test="${not empty form.firmName}"><c:out value="${form.firmName}"/></c:when>
                                <c:otherwise>-</c:otherwise>
                            </c:choose>
                        </div>
                    </div>
                    <div class="info-row">
                        <div class="info-label">M/S:</div>
                        <div class="info-value">
                            <c:choose>
                                <c:when test="${not empty form.msName}"><c:out value="${form.msName}"/></c:when>
                                <c:otherwise>-</c:otherwise>
                            </c:choose>
                        </div>
                    </div>
                    <div class="info-row">
                        <div class="info-label">Firm URL:</div>
                        <div class="info-value">
                            <c:choose>
                                <c:when test="${not empty form.firmUrl}"><c:out value="${form.firmUrl}"/></c:when>
                                <c:otherwise>-</c:otherwise>
                            </c:choose>
                        </div>
                    </div>
                    <div class="info-row">
                        <div class="info-label">Company Reg. No.:</div>
                        <div class="info-value">
                            <c:choose>
                                <c:when test="${not empty form.companyRegNo}"><c:out value="${form.companyRegNo}"/></c:when>
                                <c:otherwise>-</c:otherwise>
                            </c:choose>
                        </div>
                    </div>
                    <div class="info-row">
                        <div class="info-label">PAN/TAN:</div>
                        <div class="info-value">
                            <c:choose>
                                <c:when test="${not empty form.panTan}"><c:out value="${form.panTan}"/></c:when>
                                <c:otherwise>-</c:otherwise>
                            </c:choose>
                        </div>
                    </div>
                    <div class="info-row">
                        <div class="info-label">GST Number:</div>
                        <div class="info-value">
                            <c:choose>
                                <c:when test="${not empty form.gstNumber}"><c:out value="${form.gstNumber}"/></c:when>
                                <c:otherwise>-</c:otherwise>
                            </c:choose>
                        </div>
                    </div>
                </div>
            </div>

            <div class="section-title">
                <i class="bi bi-person-circle"></i> Contact Person Details
            </div>
            <div class="info-card">
                <div class="info-grid">
                    <div class="info-row">
                        <div class="info-label">Title:</div>
                        <div class="info-value">
                            <c:choose>
                                <c:when test="${not empty form.title}"><c:out value="${form.title}"/></c:when>
                                <c:otherwise>-</c:otherwise>
                            </c:choose>
                        </div>
                    </div>
                    <div class="info-row">
                        <div class="info-label">First Name:</div>
                        <div class="info-value">
                            <c:choose>
                                <c:when test="${not empty form.firstName}"><c:out value="${form.firstName}"/></c:when>
                                <c:otherwise>-</c:otherwise>
                            </c:choose>
                        </div>
                    </div>
                    <div class="info-row">
                        <div class="info-label">Middle Name:</div>
                        <div class="info-value">
                            <c:choose>
                                <c:when test="${not empty form.middleName}"><c:out value="${form.middleName}"/></c:when>
                                <c:otherwise>-</c:otherwise>
                            </c:choose>
                        </div>
                    </div>
                    <div class="info-row">
                        <div class="info-label">Last Name:</div>
                        <div class="info-value">
                            <c:choose>
                                <c:when test="${not empty form.lastName}"><c:out value="${form.lastName}"/></c:when>
                                <c:otherwise>-</c:otherwise>
                            </c:choose>
                        </div>
                    </div>
                    <div class="info-row">
                        <div class="info-label">Email / User ID:</div>
                        <div class="info-value">
                            <c:choose>
                                <c:when test="${not empty form.emailID}"><c:out value="${form.emailID}"/></c:when>
                                <c:otherwise>-</c:otherwise>
                            </c:choose>
                        </div>
                    </div>
                    <div class="info-row">
                        <div class="info-label">Phone No.:</div>
                        <div class="info-value">
                            <c:choose>
                                <c:when test="${not empty form.phone1}"><c:out value="${form.phone1}"/></c:when>
                                <c:otherwise>-</c:otherwise>
                            </c:choose>
                        </div>
                    </div>
                    <div class="info-row">
                        <div class="info-label">Fax:</div>
                        <div class="info-value">
                            <c:choose>
                                <c:when test="${not empty form.fax}"><c:out value="${form.fax}"/></c:when>
                                <c:otherwise>-</c:otherwise>
                            </c:choose>
                        </div>
                    </div>
                </div>
            </div>

            <div class="section-title">
                <i class="bi bi-geo-alt"></i> Address Information
            </div>
            <div class="info-card">
                <div class="info-grid">
                    <div class="info-row">
                        <div class="info-label">Address:</div>
                        <div class="info-value">
                            <c:choose>
                                <c:when test="${not empty form.addr1}"><c:out value="${form.addr1}"/></c:when>
                                <c:otherwise>-</c:otherwise>
                            </c:choose>
                        </div>
                    </div>
                    <div class="info-row">
                        <div class="info-label">City / District:</div>
                        <div class="info-value">
                            <c:choose>
                                <c:when test="${not empty form.cityName}"><c:out value="${form.cityName}"/></c:when>
                                <c:otherwise>-</c:otherwise>
                            </c:choose>
                        </div>
                    </div>
                    <div class="info-row">
                        <div class="info-label">PIN / Zip:</div>
                        <div class="info-value">
                            <c:choose>
                                <c:when test="${not empty form.pincode}"><c:out value="${form.pincode}"/></c:when>
                                <c:otherwise>-</c:otherwise>
                            </c:choose>
                        </div>
                    </div>
                    <div class="info-row">
                        <div class="info-label">State:</div>
                        <div class="info-value">
                            <c:choose>
                                <c:when test="${not empty form.state}"><c:out value="${form.state}"/></c:when>
                                <c:otherwise>-</c:otherwise>
                            </c:choose>
                        </div>
                    </div>
                    <div class="info-row">
                        <div class="info-label">Country:</div>
                        <div class="info-value">INDIA</div>
                    </div>
                </div>
            </div>

            <div class="action-bar">
                <button class="btn btn-secondary" onclick="window.print()">
                    <i class="bi bi-printer"></i> Print
                </button>
                <a class="btn btn-primary" href="${pageContext.request.contextPath}/eps/Bidder/bidderform.do">
                    <i class="bi bi-house"></i> Go to Home
                </a>
            </div>
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
</body>
</html>