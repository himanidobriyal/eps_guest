<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lot Details | IREPS E-Auction</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
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
            overflow-x: hidden;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: white;
            color: #333;
            line-height: 1.6;
           
            flex-direction: column;
            min-height: 100vh;
        }

        /* Header Styles */
        .ireps-header {
            display: flex;
            align-items: center;
            justify-content: space-between;
            background-color: #0b253f;
            padding: 40px 20px;
            color: white;
           
            margin-top: 0 !important;
        }

        .left-section {
            display: flex;
            align-items: center;
            gap: 15px;
            height: 50px;
        }

        .left-section img {
            height: 80px;
            width: auto;
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

        .menu-icon {
            font-size: 26px;
            cursor: pointer;
            margin-left: 15px;
            color: white;
        }

        /* Sidebar */
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

        /* Main Container */
        .main-container {
            
            margin: 20px 0;
            max-width: 100%;
            padding: 0;
            
        }

        /* Content Card */
        .content-card {
            background: white;
            border: 2px solid #2c5aa0;
            border-radius: 8px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            overflow: visible;
            max-width: 1000px;
            width: 95%;
            margin: 0 auto 20px auto;
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

        /* Success Banner Style for Lot Header */
        .lot-banner {
            background: linear-gradient(135deg, #3b82f6 0%, #1e40af 100%);
            color: white;
            padding: 12px 20px;
            display: flex;
            align-items: center;
            gap: 12px;
            border-bottom: 2px solid #1e40af;
        }

        .lot-icon {
            background: rgba(255, 255, 255, 0.2);
            padding: 6px 10px;
            border-radius: 50%;
            font-size: 22px;
        }

        .lot-text {
            flex: 1;
        }

        .lot-text h3 {
            font-size: 16px;
            font-weight: 600;
            margin-bottom: 4px;
        }

        .lot-text div {
            font-size: 14px;
        }

        .lot-badge {
            background: rgba(255, 255, 255, 0.2);
            padding: 3px 10px;
            border-radius: 15px;
            font-size: 13px;
            font-weight: 600;
        }

        /* Content Body */
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

        .status-badge {
            display: inline-flex;
            align-items: center;
            gap: 6px;
            padding: 4px 10px;
            border-radius: 15px;
            font-size: 12px;
            font-weight: 600;
        }

        .status-active {
            background: #d1fae5;
            color: #065f46;
        }

        .status-pending {
            background: #fef3c7;
            color: #92400e;
        }

        .status-withdrawn {
            background: #fee2e2;
            color: #991b1b;
        }

        /* Description Box */
        .description-card {
            background: white;
            border: 1px solid #ddd;
            border-radius: 6px;
            padding: 15px;
            margin-bottom: 12px;
        }

        .description-card strong {
            color: #2c5aa0;
            display: block;
            margin-bottom: 10px;
            font-size: 14px;
        }

        .description-card p {
            color: #333;
            font-size: 14px;
            line-height: 1.6;
            margin: 0;
        }

        /* Conditions Section */
        .conditions-card {
            background: #fff4e6;
            border: 1px solid #fed7aa;
            border-radius: 6px;
            padding: 15px;
            margin-bottom: 12px;
        }

        .conditions-card strong {
            color: #92400e;
            display: block;
            margin-bottom: 10px;
            font-size: 14px;
        }

        .conditions-card p {
            color: #78350f;
            font-size: 14px;
            line-height: 1.6;
            margin: 0;
        }

        /* Error Box */
        .error-box {
            background: #fef2f2;
            border: 2px solid #dc2626;
            color: #991b1b;
            padding: 30px;
            border-radius: 8px;
            text-align: center;
            margin: 20px;
        }

        .error-box i {
            font-size: 48px;
            margin-bottom: 15px;
            opacity: 0.6;
        }

        /* Action Bar */
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

        .btn-success {
            background: linear-gradient(45deg, #10b981, #059669);
            color: white;
        }

        .btn-success:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 15px rgba(16, 185, 129, 0.4);
        }

        /* Footer */
        .footer {
            
            background: #05173c !important;
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
            
            margin-bottom: 0 !important;
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

        /* Print Styles */
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
            }
        }

        /* Responsive */
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
                width: 95%;
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
        }
    </style>
</head>
<body>
    <!-- Header -->
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

    <!-- Sidebar -->
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


    <!-- Main Container -->
    <div class="main-container">
        <div class="content-card">
            <div class="content-header">
                <h2>Auction Lot Details</h2>
            </div>

            <c:choose>
                <c:when test="${not empty error}">
                    <!-- Error State -->
                    <div class="error-box">
                        <i class="fas fa-exclamation-triangle"></i>
                        <h3>Error Loading Lot Details</h3>
                        <p><c:out value="${error}"/></p>
                    </div>
                </c:when>

                <c:when test="${empty lotDetails}">
                    <!-- No Data State -->
                    <div class="error-box">
                        <i class="fas fa-inbox"></i>
                        <h3>No Data Available</h3>
                        <p>Lot details could not be retrieved. Please check the lot ID and try again.</p>
                    </div>
                </c:when>

                <c:otherwise>
                    <!-- Lot Banner -->
                    <div class="lot-banner">
                        <div class="lot-icon">
                            <i class="bi bi-box-seam"></i>
                        </div>
                        <div class="lot-text">
                            <h3>Lot Details Retrieved Successfully!</h3>
                            <div>
                                Lot Number: 
                                <span class="lot-badge">
                                    <c:out value="${lotDetails.LOT_NO}" default="N/A"/>
                                </span>
                            </div>
                        </div>
                    </div>

                    <div class="content-body">
                        <!-- Lot Information -->
                        <div class="section-title">
                            <i class="bi bi-info-circle"></i> Lot Information
                        </div>
                        <div class="info-card">
                            <div class="info-grid">
                                <div class="info-row">
                                    <div class="info-label">Lot ID:</div>
                                    <div class="info-value">
                                        <c:out value="${lotDetails.LOT_ID}" default="N/A"/>
                                    </div>
                                </div>
                                <div class="info-row">
                                    <div class="info-label">Lot Number:</div>
                                    <div class="info-value">
                                        <strong><c:out value="${lotDetails.LOT_NO}" default="N/A"/></strong>
                                    </div>
                                </div>
                                <div class="info-row">
                                    <div class="info-label">Lot Status:</div>
                                    <div class="info-value">
                                        <c:choose>
                                            <c:when test="${lotDetails.LOT_STATUS == 1}">
                                                <span class="status-badge status-active">
                                                    <i class="fas fa-check-circle"></i> Active
                                                </span>
                                            </c:when>
                                            <c:when test="${lotDetails.LOT_STATUS == 2}">
                                                <span class="status-badge status-pending">
                                                    <i class="fas fa-clock"></i> Pending
                                                </span>
                                            </c:when>
                                            <c:when test="${lotDetails.LOT_STATUS == 3}">
                                                <span class="status-badge status-withdrawn">
                                                    <i class="fas fa-times-circle"></i> Withdrawn
                                                </span>
                                            </c:when>
                                            <c:otherwise>
                                                <span class="status-badge">Unknown</span>
                                            </c:otherwise>
                                        </c:choose>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Organizational Details -->
                        <div class="section-title">
                            <i class="bi bi-building"></i> Organizational Details
                        </div>
                        <div class="info-card">
                            <div class="info-grid">
                                <div class="info-row">
                                    <div class="info-label">Account / Railway:</div>
                                    <div class="info-value">
                                        <c:out value="${lotDetails.ACCOUNT_NAME}" default="N/A"/>
                                    </div>
                                </div>
                                <div class="info-row">
                                    <div class="info-label">Depot Name:</div>
                                    <div class="info-value">
                                        <c:out value="${lotDetails.DEPOT_NAME}" default="N/A"/>
                                    </div>
                                </div>
                                <div class="info-row">
                                    <div class="info-label">Location:</div>
                                    <div class="info-value">
                                        <c:out value="${lotDetails.LOCATION}" default="N/A"/>
                                    </div>
                                </div>
                                <div class="info-row">
                                    <div class="info-label">Custodian:</div>
                                    <div class="info-value">
                                        <c:out value="${lotDetails.CUSTODIAN}" default="N/A"/>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Quantity Details -->
                        <div class="section-title">
                            <i class="bi bi-calculator"></i> Quantity Details
                        </div>
                        <div class="info-card">
                            <div class="info-grid">
                                <div class="info-row">
                                    <div class="info-label">Sale Quantity:</div>
                                    <div class="info-value">
                                        <strong>
                                            <c:out value="${lotDetails.LOT_QTY}" default="0"/>
                                            <c:if test="${not empty lotDetails.SALE_UNIT_NAME}">
                                                <c:out value="${lotDetails.SALE_UNIT_NAME}"/>
                                            </c:if>
                                        </strong>
                                    </div>
                                </div>
                                <div class="info-row">
                                    <div class="info-label">Buyer Quantity:</div>
                                    <div class="info-value">
                                        <c:out value="${lotDetails.BUYER_QTY}" default="N/A"/>
                                        <c:if test="${not empty lotDetails.BUYER_UNIT_NAME}">
                                            <c:out value="${lotDetails.BUYER_UNIT_NAME}"/>
                                        </c:if>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Material Description -->
                        <c:if test="${not empty lotDetails.LOT_MATERIAL_DESC}">
                            <div class="section-title">
                                <i class="bi bi-file-text"></i> Material Description
                            </div>
                            <div class="description-card">
                                <strong>
                                    <i class="fas fa-cube"></i> Material Details
                                </strong>
                                <p><c:out value="${lotDetails.LOT_MATERIAL_DESC}"/></p>
                            </div>
                        </c:if>

                        <!-- Category & Financial Details -->
                        <div class="section-title">
                            <i class="bi bi-receipt"></i> Category & Financial Information
                        </div>
                        <div class="info-card">
                            <div class="info-grid">
                                <div class="info-row">
                                    <div class="info-label">Category:</div>
                                    <div class="info-value">
                                        <c:out value="${lotDetails.CATEGORY_NAME}" default="N/A"/>
                                    </div>
                                </div>
                                <div class="info-row">
                                    <div class="info-label">PL Number:</div>
                                    <div class="info-value">
                                        <c:out value="${lotDetails.PL_NO}" default="N/A"/>
                                    </div>
                                </div>
                                <div class="info-row">
                                    <div class="info-label">Book Rate:</div>
                                    <div class="info-value">
                                        <c:choose>
                                            <c:when test="${not empty lotDetails.BOOK_RATE}">
                                                Rs. <fmt:formatNumber value="${lotDetails.BOOK_RATE}" pattern="##,##,##0.00"/>
                                            </c:when>
                                            <c:otherwise>N/A</c:otherwise>
                                        </c:choose>
                                    </div>
                                </div>
                                <div class="info-row">
                                    <div class="info-label">Sales Tax:</div>
                                    <div class="info-value">
                                        <c:out value="${lotDetails.SALES_TAX}" default="N/A"/>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Special Conditions -->
                        <c:if test="${not empty lotDetails.SPECIAL_CONDITIONS}">
                            <div class="section-title">
                                <i class="bi bi-exclamation-triangle"></i> Special Conditions
                            </div>
                            <div class="conditions-card">
                                <strong>
                                    <i class="fas fa-flag"></i> Important Conditions
                                </strong>
                                <p><c:out value="${lotDetails.SPECIAL_CONDITIONS}"/></p>
                            </div>
                        </c:if>

                        <!-- Excluded Items -->
                        <c:if test="${not empty lotDetails.EXCLUDED_ITEMS}">
                            <div class="section-title">
                                <i class="bi bi-x-circle"></i> Excluded Items
                            </div>
                            <div class="conditions-card" style="background: #fef2f2; border-color: #fecaca;">
                                <strong style="color: #991b1b;">
                                    <i class="fas fa-times-circle"></i> Items Not Included
                                </strong>
                                <p style="color: #7c2d12;"><c:out value="${lotDetails.EXCLUDED_ITEMS}"/></p>
                            </div>
                        </c:if>

                        <!-- Action Bar -->
                        <div class="action-bar">
                            <button class="btn btn-secondary" onclick="window.print()">
                                <i class="bi bi-printer"></i> Print
                            </button>
                            <button class="btn btn-success" onclick="placeBid('<c:out value="${lotDetails.LOT_ID}"/>')">
                                <i class="fas fa-gavel"></i> Place Bid
                            </button>
                            <button class="btn btn-primary" onclick="window.history.back()">
                                <i class="bi bi-arrow-left"></i> Back to Catalog
                            </button>
                        </div>
                    </div>
                </c:otherwise>
            </c:choose>
        </div>
    </div>

    <!-- Footer -->
    <footer class="footer">
        <img src="${pageContext.request.contextPath}/assets/images/stqc.png" alt="STQC">
        <img src="${pageContext.request.contextPath}/assets/images/cris.png" alt="CRIS">
        <div class="footer-text">
            Centre For Railway Information Systems, Designed, Developed and Hosted by CRIS &nbsp;
            <strong>Version 7.1.0</strong>
        </div>
    </footer>

    <script>
        const ctx = '<c:out value="${pageContext.request.contextPath}"/>';

        function placeBid(lotId) {
            console.log('Placing bid for Lot ID:', lotId);
            alert('Bid placement feature coming soon!');
            // TODO: Implement bid placement functionality
        }

        function openSidebar() {
            document.getElementById('mySidebar').style.width = '250px';
        }

        function closeSidebar() {
            document.getElementById('mySidebar').style.width = '0';
        }

        function selectOption(option, el) {
            console.log('Selected option:', option);
            document.querySelectorAll('.sidebar a').forEach(link => link.classList.remove('active-option'));
            if (el) el.classList.add('active-option');
            window.location.href = ctx + '/jsp/admin/home/login.jsp?redirect=' + option;
        }

        function logoutNow() {
            alert("Logout Successful");
            window.location.href = ctx + "/logonBody.jsp";
        }

        // Auto print if requested
        const urlParams = new URLSearchParams(window.location.search);
        if (urlParams.get('autoPrint') === 'true') {
            window.onload = function() {
                setTimeout(function() {
                    window.print();
                }, 500);
            };
        }
    </script>
</body>
</html>