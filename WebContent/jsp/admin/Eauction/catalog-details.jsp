<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Auction Catalogue Details | IREPS</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Arial', sans-serif;
            background: #f5f5f5;
            color: #333;
            line-height: 1.6;
            /* padding: 20px; Removed for header/footer integration */
            margin: 0 !important;
            padding: 0 !important;
        }
        
        .body-wrapper {
            display: flex;
            flex-direction: column;
            min-height: 100vh;
        }
        
        /* --- START: Added Header/Footer CSS from Success.jsp --- */
        html, .body-wrapper {
          height: 100%;
          margin: 0 !important;
          padding: 0 !important;
          overflow-x: hidden;
        }
        
        .ireps-header {
            display: flex;
            align-items: center;
            justify-content: space-between;
            background-color: #0b253f;
            padding: 40px 20px;
            color: white;
            flex-shrink: 0;
            margin-top: 0 !important;
            border-top: none !important;
            position: relative;
            top: 0;
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
            background-image: url("data:image/svg+xml;charset=US-ASCII,<svg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 4 5'><path fill='%23fff' d='M2 0L0 2h4zm0 5L0 3h4z'/></svg>"); /* Changed fill to white for contrast */
            background-repeat: no-repeat;
            background-position: right 12px center;
            background-size: 12px;
            padding-right: 35px;
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
            background-color: #0b253f; /* Darker blue */
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
            margin: 20px auto; /* Centering the main content area */
            max-width: 1400px;
            width: 95%;
            padding: 0;
            background: white;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }
        
        .footer {
            flex-shrink: 0;
            background-color: #05173c !important;
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
            bottom: 0;
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
        /* --- END: Added Header/Footer CSS from Success.jsp --- */


        .container {
            /* max-width: 1400px;
            margin: 0 auto;
            background: white;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1); */
            /* The 'container' styles are merged into '.main-container' to fit the new layout */
            padding: 30px;
            width: 100%;
            box-shadow: none; /* Shadow is on .main-container */
        }

        .page-header {
            background: linear-gradient(135deg, #1e3a8a, #1e40af);
            color: white;
            padding: 25px;
            border-radius: 8px 8px 0 0;
            margin: -30px -30px 30px -30px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            flex-wrap: wrap;
            gap: 15px;
        }

        .page-header h1 {
            font-size: 26px;
            font-weight: 700;
            display: flex;
            align-items: center;
            gap: 12px;
        }

        .header-actions {
            display: flex;
            gap: 10px;
        }

        .btn {
            padding: 10px 18px;
            border: none;
            border-radius: 5px;
            font-size: 14px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s;
            display: inline-flex;
            align-items: center;
            gap: 8px;
            text-decoration: none;
        }

        .btn-light {
            background: white;
            color: #1e3a8a;
        }

        .btn-light:hover {
            background: #f0f0f0;
        }

        .btn-success {
            background: #10b981;
            color: white;
        }

        .btn-success:hover {
            background: #059669;
        }

        .btn-primary {
            background: #3b82f6;
            color: white;
            font-size: 12px;
            padding: 6px 12px;
        }

        .btn-primary:hover {
            background: #2563eb;
        }

        .btn-info {
            background: #0ea5e9;
            color: white;
            font-size: 12px;
            padding: 6px 12px;
        }

        .btn-info:hover {
            background: #0284c7;
        }

        .section {
            margin-bottom: 30px;
        }

        .section-title {
            background: #f8fafc;
            border-left: 4px solid #f59e0b;
            padding: 12px 20px;
            margin-bottom: 20px;
            font-size: 18px;
            font-weight: 700;
            color: #1e3a8a;
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .info-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 20px;
            margin-bottom: 20px;
        }

        .info-item {
            display: flex;
            flex-direction: column;
            padding: 15px;
            background: #f9fafb;
            border-radius: 6px;
            border: 1px solid #e5e7eb;
        }

        .info-label {
            font-size: 12px;
            font-weight: 600;
            color: #6b7280;
            margin-bottom: 6px;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }

        .info-value {
            font-size: 15px;
            font-weight: 600;
            color: #1f2937;
        }

        .status-badge {
            display: inline-flex;
            align-items: center;
            gap: 6px;
            padding: 6px 14px;
            border-radius: 20px;
            font-size: 13px;
            font-weight: 600;
            width: fit-content;
        }

        .status-published {
            background: #d1fae5;
            color: #065f46;
        }

        .status-draft {
            background: #fef3c7;
            color: #92400e;
        }

        .status-closed {
            background: #fee2e2;
            color: #991b1b;
        }

        .table-wrapper {
            overflow-x: auto;
            border: 1px solid #e5e7eb;
            border-radius: 8px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            background: white;
        }

        thead {
            background: #1e3a8a;
        }

        th {
            padding: 14px 12px;
            text-align: left;
            font-weight: 600;
            font-size: 13px;
            color: white;
            border-bottom: 2px solid #f59e0b;
            white-space: nowrap;
        }

        tbody tr {
            border-bottom: 1px solid #f1f5f9;
            transition: background 0.2s;
        }

        tbody tr:hover {
            background: #fef3c7;
        }

        td {
            padding: 12px;
            font-size: 14px;
        }

        .lot-desc {
            max-width: 300px;
            overflow: hidden;
            text-overflow: ellipsis;
            white-space: nowrap;
        }

        .lot-desc:hover {
            white-space: normal;
            word-wrap: break-word;
        }

        .highlight-box {
            background: linear-gradient(135deg, #dbeafe, #e0f2fe);
            border: 2px solid #0ea5e9;
            border-radius: 8px;
            padding: 20px;
            margin: 20px 0;
            text-align: center;
        }

        .highlight-box a {
            color: #0c4a6e;
            text-decoration: none;
            font-weight: 700;
            font-size: 16px;
            border-bottom: 2px solid #0ea5e9;
            transition: all 0.3s;
        }

        .highlight-box a:hover {
            color: #075985;
            border-bottom-color: #075985;
        }

        .error-box {
            background: #fef2f2;
            border: 2px solid #dc2626;
            color: #991b1b;
            padding: 20px;
            border-radius: 8px;
            text-align: center;
            margin: 20px auto; /* Centered in new layout */
            max-width: 900px;
            width: 95%;
        }

        .error-box i {
            font-size: 48px;
            margin-bottom: 15px;
            opacity: 0.5;
        }

        .empty-state {
            text-align: center;
            padding: 50px;
            color: #9ca3af;
        }

        .empty-state i {
            font-size: 48px;
            margin-bottom: 15px;
            opacity: 0.5;
        }

        .action-buttons {
            display: flex;
            gap: 8px;
            justify-content: center;
        }
        
        /* Removed original footer styles */
        /*
        .footer-original {
            text-align: center;
            margin-top: 30px;
            padding-top: 20px;
            border-top: 2px solid #e5e7eb;
        }
        
        .footer-original p {
            color: #6b7280;
            font-size: 14px;
        }
        */

        @media print {
            .ireps-header, 
            .sidebar, 
            .footer, 
            .header-actions, 
            .btn, 
            .action-buttons, 
            .menu-icon, 
            .icon-row {
                display: none !important;
            }
            body {
                background: white;
            }
            .main-container {
                box-shadow: none;
                max-width: 100%;
                margin: 0;
            }
            .container {
                padding: 0;
            }
            .page-header {
                display: none !important;
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
                margin: 20px auto;
            }
            
            .info-grid {
                grid-template-columns: 1fr;
            }
            
            table {
                font-size: 12px;
            }
            
            th, td {
                padding: 8px 6px;
            }

            .action-buttons {
                flex-direction: column;
            }
            
            .footer {
                flex-direction: column;
                padding: 12px 10px;
            }
        
            .footer img {
                height: 40px;
            }
        }
    </style>
</head>
<body class="body-wrapper">
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
        <div class="container">
            <div class="page-header">
                <h1>
                    <i class="fas fa-file-invoice"></i>
                    Auction Catalogue
                </h1>
                <div class="header-actions">
                    <button class="btn btn-light" onclick="window.print()">
                        <i class="fas fa-print"></i> Print
                    </button>
                    <button class="btn btn-light" onclick="window.close()">
                        <i class="fas fa-times"></i> Close
                    </button>
                </div>
            </div>

            <c:choose>
                <c:when test="${not empty error}">
                    <div class="error-box">
                        <i class="fas fa-exclamation-triangle"></i>
                        <h3>Error Loading Catalog</h3>
                        <p><c:out value="${error}"/></p>
                    </div>
                </c:when>

                <c:when test="${empty catalogHeader}">
                    <div class="error-box">
                        <i class="fas fa-inbox"></i>
                        <h3>No Data Available</h3>
                        <p>Catalog data could not be retrieved.
                        Please check the catalog ID and try again.</p>
                    </div>
                </c:when>

                <c:otherwise>
                    <div class="section">
                        <div class="section-title">
                            <i class="fas fa-info-circle"></i>
                            Auction Catalogue Header
                        </div>

                        <div class="info-grid">
                            <div class="info-item">
                                <span class="info-label">Depot/Railway Unit</span>
                                <span class="info-value">
                                    <c:out value="${catalogHeader.ACCOUNT_NAME}" default="N/A"/>
                                </span>
                            </div>

                            <div class="info-item">
                                <span class="info-label">Depot Name</span>
                                <span class="info-value">
                                    <c:out value="${catalogHeader.DEPOT_NAME}" default="N/A"/>
                                </span>
                            </div>

                            <div class="info-item">
                                <span class="info-label">Auction Catalogue No.</span>
                                <span class="info-value">
                                    <c:out value="${catalogHeader.CATALOG_NO}" default="N/A"/>
                                </span>
                            </div>

                            <div class="info-item">
                                <span class="info-label">Schedule No</span>
                                <span class="info-value">
                                    <c:out value="${catalogHeader.SCHEDULE_NO}" default="N/A"/>
                                </span>
                            </div>

                            <div class="info-item">
                                <span class="info-label">Auction Type</span>
                                <span class="info-value">
                                    <c:choose>
                                        <c:when test="${catalogHeader.AUCTION_TYPE == 1}">Close Ended</c:when>
                                        <c:when test="${catalogHeader.AUCTION_TYPE == 2}">Open Ended</c:when>
                                        <c:otherwise>Unknown</c:otherwise>
                                    </c:choose>
                                </span>
                            </div>

                            <div class="info-item">
                                <span class="info-label">Auction Start Date/Time</span>
                                <span class="info-value">
                                    <c:out value="${catalogHeader.AUCTION_START_DATETIME}" default="N/A"/>
                                </span>
                            </div>

                            <div class="info-item">
                                <span class="info-label">Auction Close Date/Time</span>
                                <span class="info-value">
                                    <c:out value="${catalogHeader.AUCTION_END_DATETIME}" default="N/A"/>
                                </span>
                            </div>

                            <div class="info-item">
                                <span class="info-label">Status</span>
                                <span class="info-value">
                                    <c:choose>
                                        <c:when test="${catalogHeader.CATALOG_STATUS == 1}">
                                            <span class="status-badge status-published">
                                                <i class="fas fa-check-circle"></i> Published
                                            </span>
                                        </c:when>
                                        <c:when test="${catalogHeader.CATALOG_STATUS == 2}">
                                            <span class="status-badge status-closed">
                                                <i class="fas fa-times-circle"></i> Closed
                                            </span>
                                        </c:when>
                                        <c:otherwise>
                                            <span class="status-badge status-draft">
                                                <i class="fas fa-edit"></i> Draft
                                            </span>
                                        </c:otherwise>
                                    </c:choose>
                                </span>
                            </div>
                        </div>

                        <div class="highlight-box">
                            <i class="fas fa-file-pdf" style="font-size: 24px; margin-right: 10px;"></i>
                            <a href="https://trial.ireps.gov.in/ireps/upload/resources/Uniform_E_Sale_condition.pdf" 
                               target="_blank">
                                Click to view Uniform E-Sale Conditions
                            </a>
                        </div>

                        <c:if test="${not empty catalogHeader.CAT_FILE_PATH}">
                            <div class="highlight-box" style="background: linear-gradient(135deg, #d1fae5, #dcfce7); border-color: #10b981;">
                                <i class="fas fa-download" style="font-size: 24px; margin-right: 10px;"></i>
                                <a href="https://trial.ireps.gov.in${catalogHeader.CAT_FILE_PATH}" 
                                   target="_blank"
                                   style="color: #065f46; border-bottom-color: #10b981;">
                                    Click to View Attached File
                                </a>
                            </div>
                        </c:if>
                    </div>

                    <div class="section">
                        <div class="section-title">
                            <i class="fas fa-list"></i>
                            Auction Catalogue Lots
                            <c:if test="${not empty lotList}">
                                <span style="margin-left: auto; font-weight: 400; font-size: 14px;">
                                    (Total: ${fn:length(lotList)} lots)
                                </span>
                            </c:if>
                        </div>

                        <c:choose>
                            <c:when test="${empty lotList}">
                                <div class="empty-state">
                                    <i class="fas fa-inbox"></i>
                                    <div>No lots found for this catalogue</div>
                                </div>
                            </c:when>
                            <c:otherwise>
                                <div class="table-wrapper">
                                    <table>
                                        <thead>
                                            <tr>
                                                <th>Seq No</th>
                                                <th>Lot No</th>
                                                <th>Material Description</th>
                                                <th>Lot Qty</th>
                                                <th>Start Date/Time</th>
                                                <th>Close Date/Time</th>
                                                <th>Status</th>
                                                <th>Bid Increment</th>
                                                <th>Actions</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${lotList}" var="lot" varStatus="status">
                                                <tr>
                                                    <td><c:out value="A/${status.index + 1}"/></td>
                                                    <td><strong><c:out value="${lot.LOT_NO}" default="N/A"/></strong></td>
                                                    <td class="lot-desc" title="${lot.LOT_MATERIAL_DESC}">
                                                        <c:out value="${lot.LOT_MATERIAL_DESC}" default="N/A"/>
                                                    </td>
                                                    <td>
                                                        <c:out value="${lot.LOT_QTY}" default="0"/>
                                                        <c:if test="${not empty lot.SALE_UNIT_NAME}">
                                                            <c:out value="${lot.SALE_UNIT_NAME}"/>
                                                        </c:if>
                                                    </td>
                                                    <td><c:out value="${lot.LOT_START_DATETIME}" default="N/A"/></td>
                                                    <td><c:out value="${lot.LOT_END_DATETIME}" default="N/A"/></td>
                                                    <td>
                                                        <c:choose>
                                                            <c:when test="${lot.LOT_STATUS == 1}">
                                                                <span style="color: #10b981; font-weight: 600;">Active</span>
                                                            </c:when>
                                                            <c:when test="${lot.LOT_STATUS == 2}">
                                                                <span style="color: #f59e0b; font-weight: 600;">Pending</span>
                                                            </c:when>
                                                            <c:when test="${lot.LOT_STATUS == 3}">
                                                                <span style="color: #dc2626; font-weight: 600;">Withdrawn</span>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <span style="color: #6b7280;">Unknown</span>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </td>
                                                    <td>
                                                        <c:choose>
                                                            <c:when test="${not empty lot.BID_INCREMENT}">
                                                                <strong><c:out value="${lot.BID_INCREMENT}"/></strong>
                                                            </c:when>
                                                            <c:otherwise>N/A</c:otherwise>
                                                        </c:choose>
                                                    </td>
                                                    <td>
                                                        <div class="action-buttons">
                                                            <a href="#" class="btn btn-primary" 
                                                               onclick="viewLotDetails('${lot.LOT_ID}'); return false;"
                                                               title="View Lot Details">
                                                                <i class="fas fa-eye"></i> View
                                                            </a>
                                                        </div>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </c:otherwise>
            </c:choose>
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
        const contextPath = window.location.pathname.split('/').slice(0, -1).join('/');

        // View Lot Details function
        function viewLotDetails(lotId) {
            console.log('Opening lot details for LOT ID:', lotId);
            
            if (!lotId || lotId.trim() === '') {
                alert('Invalid Lot ID');
                return;
            }
            
            const url = contextPath + '/viewLotDetails.do?lotId=' + encodeURIComponent(lotId);
            console.log('Opening URL:', url);
            window.open(url, '_blank');
        }

        // Auto print functionality
        const urlParams = new URLSearchParams(window.location.search);
        if (urlParams.get('autoPrint') === 'true') {
            window.onload = function() {
                setTimeout(function() {
                    window.print();
                }, 500);
            };
        }
        
        // --- START: Added Sidebar JS from Success.jsp ---
        const ctx = '<%= request.getContextPath() %>';
        let selected = '';

        function selectOption(option, el) {
            selected = option;
            document.querySelectorAll('.sidebar a').forEach(link => link.classList.remove('active-option'));
            el.classList.add('active-option');
            // Assuming the context for redirection from the success.jsp is relevant
            window.location.href = ctx + '/jsp/admin/home/login.jsp?redirect=' + option;
        }

        function openSidebar() {
            document.getElementById('mySidebar').style.width = '250px';
        }

        function closeSidebar() {
            document.getElementById('mySidebar').style.width = '0';
        }
        
        function logoutNow() {
            // Placeholder for actual logout logic
            console.log("Logout function called.");
        }
        // --- END: Added Sidebar JS from Success.jsp ---
    </script>
</body>
</html>