<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%
    String currentURL = request.getRequestURI();
    String activeTab = "schedule";
    
    if (currentURL.contains("manage.do")) {
        activeTab = "live";
    } else if (currentURL.contains("forthcoming.do")) {
        activeTab = "forthcoming";
    } else if (currentURL.contains("schedule.do")) {
        activeTab = "schedule";
    }
    
    request.setAttribute("activeTab", activeTab);
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>E-Auction Management | IREPS Portal</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
 <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/accessibility/accessibility.css">
 <script src="${pageContext.request.contextPath}/assets/accessibility/accessibility.js" defer></script>	
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
        }

        .container {
            max-width: 1400px;
            margin: 0 auto;
            padding: 0 15px;
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
				
        .system-title h1 {
            font-size: 24px;
            font-weight: 700;
            color: #1e3a8a;
            margin-bottom: 4px;
        }

        .system-title .subtitle {
            font-size: 14px;
            color: #666;
            font-weight: 500;
        }

        .trial-badge {
            background: #dc2626;
            color: white;
            padding: 8px 16px;
            border-radius: 4px;
            font-weight: 600;
            font-size: 14px;
        }

        .nav-container {
            background: #f8fafc;
            border-bottom: 2px solid #e2e8f0;
            margin-bottom: 20px;
        }

        .nav-tabs {
            display: flex;
            background: white;
            border: 1px solid #d1d5db;
            border-radius: 0;
            overflow: hidden;
        }

        .nav-tab {
            flex: 1;
            background: #f3f4f6;
            padding: 14px 20px;
            text-align: center;
            cursor: pointer;
            border-right: 1px solid #d1d5db;
            transition: all 0.3s ease;
            color: #374151;
            font-size: 14px;
            font-weight: 600;
            position: relative;
        }

        .nav-tab:last-child {
            border-right: none;
        }

        .nav-tab:hover {
            background: #e5e7eb;
        }

        .nav-tab.active {
            background: #f59e0b;
            color: white;
            box-shadow: inset 0 -3px 0 0 #d97706;
        }

        .nav-tab i {
            margin-right: 8px;
        }

        .main-content {
            padding: 20px 0;
        }

        .tab-content {
            display: none;
        }

        .tab-content.active {
            display: block;
        }

        .filter-section {
            background: white;
            padding: 25px;
            border-radius: 6px;
            margin-bottom: 25px;
            box-shadow: 0 1px 3px rgba(0,0,0,0.1);
        }

        .section-title {
            display: flex;
            align-items: center;
            gap: 10px;
            margin-bottom: 20px;
            padding-bottom: 15px;
            border-bottom: 2px solid #e5e7eb;
            color: #1e3a8a;
            font-weight: 700;
            font-size: 16px;
        }

        .section-title i {
            font-size: 18px;
        }

        .filter-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
            gap: 20px;
            margin-bottom: 20px;
        }

        .form-group {
            display: flex;
            flex-direction: column;
        }

        .form-group label {
            font-weight: 600;
            margin-bottom: 8px;
            color: #374151;
            font-size: 14px;
        }

        .form-control {
            width: 100%;
            padding: 10px 12px;
            border: 1px solid #d1d5db;
            border-radius: 4px;
            font-size: 14px;
            background: white;
            transition: all 0.3s ease;
        }

        .form-control:focus {
            outline: none;
            border-color: #1e3a8a;
            box-shadow: 0 0 0 3px rgba(30, 58, 138, 0.1);
        }

        .form-control:hover {
            border-color: #9ca3af;
        }

        .date-range {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 15px;
        }

        .action-buttons {
            display: flex;
            gap: 10px;
            justify-content: center;
            flex-wrap: wrap;
            margin-top: 20px;
        }

        .btn {
            padding: 11px 22px;
            border: none;
            border-radius: 4px;
            font-size: 14px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            display: inline-flex;
            align-items: center;
            gap: 8px;
            box-shadow: 0 1px 2px rgba(0,0,0,0.1);
        }

        .btn-primary {
            background: #1e3a8a;
            color: white;
        }

        .btn-primary:hover {
            background: #1e40af;
            box-shadow: 0 4px 12px rgba(30, 58, 138, 0.3);
        }

        .btn-secondary {
            background: #6b7280;
            color: white;
        }

        .btn-secondary:hover {
            background: #4b5563;
        }

        .btn-success {
            background: #10b981;
            color: white;
        }

        .btn-success:hover {
            background: #059669;
        }

        .btn-warning {
            background: #f59e0b;
            color: white;
        }

        .btn-warning:hover {
            background: #d97706;
        }

        .alert {
            padding: 14px 18px;
            border-radius: 4px;
            margin-bottom: 20px;
            display: none;
            border-left: 4px solid;
        }

        .alert.active {
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .alert-success {
            background: #ecfdf5;
            color: #065f46;
            border-left-color: #10b981;
        }

        .alert-error {
            background: #fef2f2;
            color: #991b1b;
            border-left-color: #dc2626;
        }

        .alert i {
            font-size: 18px;
        }

        .loading {
            display: none;
            text-align: center;
            padding: 40px;
            color: #1e3a8a;
        }

        .loading.active {
            display: block;
        }

        .spinner {
            border: 4px solid #e5e7eb;
            border-top: 4px solid #1e3a8a;
            border-radius: 50%;
            width: 40px;
            height: 40px;
            animation: spin 1s linear infinite;
            margin: 0 auto 15px;
        }

        @keyframes spin {
            0% { transform: rotate(0deg); }
            100% { transform: rotate(360deg); }
        }

        .table-wrapper {
            background: white;
            border-radius: 6px;
            overflow: hidden;
            box-shadow: 0 1px 3px rgba(0,0,0,0.1);
            overflow-x: auto;
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
            padding: 14px;
            text-align: left;
            font-weight: 600;
            font-size: 13px;
            color: white;
            border-bottom: 2px solid #f59e0b;
        }

        tbody tr {
            border-bottom: 1px solid #f1f5f9;
            transition: background-color 0.2s ease;
        }

        tbody tr:hover {
            background: #fef3c7;
        }

        td {
            padding: 14px;
            font-size: 14px;
        }

        .status-badge {
            display: inline-flex;
            align-items: center;
            gap: 6px;
            padding: 6px 12px;
            border-radius: 20px;
            font-size: 12px;
            font-weight: 600;
        }

        .status-closed {
            background: #fee2e2;
            color: #991b1b;
        }

        .status-live {
            background: #d1fae5;
            color: #065f46;
        }

        .status-upcoming {
            background: #dbeafe;
            color: #1e40af;
        }

        .status-draft {
            background: #fef3c7;
            color: #92400e;
        }

        .action-icons {
            display: flex;
            gap: 6px;
        }

        .action-icon {
            width: 34px;
            height: 34px;
            display: flex;
            align-items: center;
            justify-content: center;
            border-radius: 4px;
            cursor: pointer;
            transition: all 0.2s;
            font-size: 14px;
        }

        .action-icon:hover {
            transform: translateY(-2px);
        }

        .icon-view {
            background: #dbeafe;
            color: #1e40af;
        }

        .icon-view:hover {
            background: #1e40af;
            color: white;
        }

        .icon-print {
            background: #fef3c7;
            color: #92400e;
        }

        .icon-print:hover {
            background: #f59e0b;
            color: white;
        }

        .icon-email {
            background: #e0e7ff;
            color: #4338ca;
        }

        .icon-email:hover {
            background: #4338ca;
            color: white;
        }

        .icon-download {
            background: #d1fae5;
            color: #065f46;
        }

        .icon-download:hover {
            background: #10b981;
            color: white;
        }

        .no-data {
            text-align: center;
            padding: 50px 20px;
            color: #9ca3af;
            font-size: 16px;
        }

        .no-data i {
            font-size: 48px;
            margin-bottom: 15px;
            opacity: 0.5;
        }

        .content-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 15px;
            padding: 0 15px;
            flex-wrap: wrap;
            gap: 15px;
        }

        .entries-section {
            display: flex;
            align-items: center;
            gap: 8px;
            font-size: 14px;
        }

        .entries-section select {
            padding: 6px 10px;
            border: 1px solid #d1d5db;
            border-radius: 4px;
            font-size: 14px;
            background: white;
        }

        .search-container {
            display: flex;
            align-items: center;
            gap: 8px;
        }

        .search-box {
            position: relative;
        }

        .search-box input {
            padding: 8px 35px 8px 12px;
            border: 1px solid #d1d5db;
            border-radius: 4px;
            font-size: 14px;
            width: 250px;
        }

        .search-box input:focus {
            outline: none;
            border-color: #1e3a8a;
            box-shadow: 0 0 0 2px rgba(30, 58, 138, 0.1);
        }

        .search-box i {
            position: absolute;
            right: 10px;
            top: 50%;
            transform: translateY(-50%);
            color: #6b7280;
        }

        .info-section {
            padding: 0 15px;
            margin-bottom: 20px;
        }

        .entries-info {
            background: #f9fafb;
            border: 1px solid #e5e7eb;
            padding: 12px;
            border-radius: 4px;
            font-size: 14px;
            color: #374151;
            margin-bottom: 15px;
        }

        .content-area {
            background: #ffffff;
            border: 1px solid #e5e7eb;
            border-radius: 4px;
            padding: 20px;
            margin-bottom: 20px;
        }

        .content-message {
            line-height: 1.6;
        }

        .content-message p {
            margin-bottom: 15px;
            font-size: 14px;
            color: #374151;
        }

        .content-message p:last-child {
            margin-bottom: 0;
        }

        .highlight-text {
            background: linear-gradient(135deg, #10b981, #059669);
            color: white;
            padding: 15px 20px;
            border-radius: 8px;
            text-align: center;
            font-weight: 600;
            font-size: 15px;
            box-shadow: 0 4px 6px rgba(16, 185, 129, 0.2);
            border: 2px solid #059669;
        }

        .highlight-text a {
            color: #fef3cd;
            text-decoration: none;
            font-weight: 700;
            border-bottom: 2px solid #fef3cd;
            transition: all 0.3s ease;
        }

        .highlight-text a:hover {
            color: #fff;
            border-bottom-color: #fff;
            text-shadow: 0 0 8px rgba(255, 255, 255, 0.5);
        }

        .pagination-container {
            margin-top: 25px;
            padding: 20px 15px;
            background: #f9fafb;
            border-top: 1px solid #e5e7eb;
        }

        .pagination {
            display: flex;
            justify-content: space-between;
            align-items: center;
            flex-wrap: wrap;
            gap: 15px;
        }

        .entries-info-text {
            font-size: 14px;
            color: #6b7280;
        }

        .page-controls {
            display: flex;
            gap: 5px;
            align-items: center;
        }

        .page-btn {
            padding: 8px 12px;
            border: 1px solid #d1d5db;
            background: white;
            color: #1e3a8a;
            cursor: pointer;
            border-radius: 4px;
            transition: all 0.2s;
            font-size: 13px;
            font-weight: 600;
            text-decoration: none;
        }

        .page-btn:hover {
            background: #1e3a8a;
            color: white;
            border-color: #1e3a8a;
        }

        .page-btn.active {
            background: #1e3a8a;
            color: white;
            border-color: #1e3a8a;
        }

        .footer {
            background: #1f2937;
            color: #d1d5db;
            padding: 25px 0;
            margin-top: 40px;
        }

        .footer-content {
            display: flex;
            justify-content: space-between;
            align-items: center;
            flex-wrap: wrap;
            gap: 20px;
        }

        .footer-links {
            display: flex;
            flex-wrap: wrap;
            gap: 25px;
        }

        .footer-links a {
            color: #d1d5db;
            text-decoration: none;
            font-size: 14px;
            transition: color 0.2s;
        }

        .footer-links a:hover {
            color: white;
        }

        @media (max-width: 768px) {
            .header-content {
                flex-direction: column;
                text-align: center;
            }

            .nav-tabs {
                flex-direction: column;
            }

            .nav-tab {
                border-right: none;
                border-bottom: 1px solid #d1d5db;
            }

            .nav-tab:last-child {
                border-bottom: none;
            }

            .filter-grid {
                grid-template-columns: 1fr;
            }

            .date-range {
                grid-template-columns: 1fr;
            }

            .action-buttons {
                flex-direction: column;
            }

            .btn {
                width: 100%;
                justify-content: center;
            }

            table {
                font-size: 12px;
            }

            td, th {
                padding: 10px;
            }

            .action-icons {
                gap: 4px;
                flex-wrap: wrap;
            }

            .action-icon {
                width: 30px;
                height: 30px;
                font-size: 12px;
            }

            .content-header {
                flex-direction: column;
                align-items: stretch;
            }

            .search-box input {
                width: 100%;
            }
        }
    </style>
</head>
<body>
<header class="ireps-header">
    <div class="left-section">
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

    <div class="nav-container">
        <div class="container">
            <div class="nav-tabs">
                <div class="nav-tab ${activeTab == 'live' ? 'active' : ''}" onclick="switchTab('live')">
                    <i class="fas fa-circle"></i> Live Auction
                </div>
                <div class="nav-tab ${activeTab == 'forthcoming' ? 'active' : ''}" onclick="switchTab('forthcoming')">
                    <i class="fas fa-clock"></i> Forthcoming Auction
                </div>
                <div class="nav-tab ${activeTab == 'schedule' ? 'active' : ''}" onclick="switchTab('schedule')">
                    <i class="fas fa-calendar-check"></i> View Schedule
                </div>
            </div>
        </div>
    </div>

    <main class="main-content">
        <div class="container">
            <div id="successAlert" class="alert alert-success">
                <i class="fas fa-check-circle"></i>
                <span id="successMessage"></span>
            </div>
            <div id="errorAlert" class="alert alert-error">
                <i class="fas fa-exclamation-circle"></i>
                <span id="errorMessage"></span>
            </div>

            <!-- TAB 1: LIVE AUCTION -->
            <div id="liveTab" class="tab-content ${activeTab == 'live' ? 'active' : ''}">
                <div class="content-header">
                    <div class="entries-section">
                        <label for="liveEntriesSelect">Show</label>
                        <select id="liveEntriesSelect" name="entries">
                            <option value="10" selected>10</option>
                            <option value="25">25</option>
                            <option value="50">50</option>
                            <option value="100">100</option>
                        </select>
                        <span>entries</span>
                    </div>
                    
                    <div class="search-container">
                        <label for="liveSearchInput">Search:</label>
                        <div class="search-box">
                            <input type="text" id="liveSearchInput" placeholder="Search...">
                            <i class="fas fa-search"></i>
                        </div>
                    </div>
                </div>

                <div class="info-section">
                    <div class="entries-info">
                        Showing 1 to 1 of 1 entries
                    </div>

                    <div class="content-area">
                        <div class="content-message">
                            <p><strong>Bidders shall be able to view and print the lots and other details related to lots/auction to be put in the auctions or for a particular auction date. This can be done from the new button "-view published data for upcoming auctions", on their home page.</strong></p>
                            
                            <p>To View user manual for bidders for Lot Publishing Module, please 
                                <a href="#" class="link" onclick="openUserManual()"><strong>Click Here.</strong></a>
                            </p>
                            
                            <p>To view brief instructions to Bidders on migration to "Lot Publishing Module" please 
                                <a href="#" class="link" onclick="openMigrationGuide()"><strong>Click Here.</strong></a>
                            </p>
                            
                            <p class="highlight-text">
                                To view published data for upcoming auctions, please 
                                <a href="#" onclick="viewPublishedData()"><strong>Click Here..</strong></a>
                            </p>
                        </div>
                    </div>
                </div>

                <div class="pagination-container">
                    <div class="pagination">
                        <div class="entries-info-text">
                            Showing 1 to 1 of 1 entries
                        </div>
                    </div>
                </div>
            </div>

            <!-- TAB 2: FORTHCOMING AUCTION -->
            <div id="forthcomingTab" class="tab-content ${activeTab == 'forthcoming' ? 'active' : ''}">
                <div class="content-header">
                    <div class="entries-section">
                        <label for="forthcomingEntriesSelect">Show</label>
                        <select id="forthcomingEntriesSelect" name="entries">
                            <option value="10" selected>10</option>
                            <option value="25">25</option>
                            <option value="50">50</option>
                            <option value="100">100</option>
                        </select>
                        <span>entries</span>
                    </div>
                    
                    <div class="search-container">
                        <label for="forthcomingSearchInput">Search:</label>
                        <div class="search-box">
                            <input type="text" id="forthcomingSearchInput" placeholder="Search...">
                            <i class="fas fa-search"></i>
                        </div>
                    </div>
                </div>

                <div class="info-section">
                    <div class="entries-info">
                        Showing 1 to 1 of 1 entries
                    </div>

                    <div class="content-area">
                        <div class="content-message">
                            <p><strong>Bidders shall be able to view and print the lots and other details related to lots/auction to be put in the auctions or for a particular auction date. This can be done from the new button "-view published data for upcoming auctions", on their home page.</strong></p>
                            
                            <p>To View user manual for bidders for Lot Publishing Module, please 
                                <a href="#" class="link" onclick="openUserManual()"><strong>Click Here.</strong></a>
                            </p>
                            
                            <p>To view brief instructions to Bidders on migration to "Lot Publishing Module" please 
                                <a href="#" class="link" onclick="openMigrationGuide()"><strong>Click Here.</strong></a>
                            </p>
                            
                            <p class="highlight-text">
                                To view published data for upcoming auctions, please 
                                <a href="#" onclick="viewPublishedData()"><strong>Click Here..</strong></a>
                            </p>
                        </div>
                    </div>
                </div>

                <div class="pagination-container">
                    <div class="pagination">
                        <div class="entries-info-text">
                            Showing 1 to 1 of 1 entries
                        </div>
                    </div>
                </div>
            </div>

            <!-- TAB 3: VIEW SCHEDULE -->
            <div id="scheduleTab" class="tab-content ${activeTab == 'schedule' ? 'active' : ''}">
                <div class="filter-section">
                    <div class="section-title">
                        <i class="fas fa-filter"></i>
                        <span>Search & Filter Auctions</span>
                    </div>

                    <form id="filterForm">
                        <div class="filter-grid">
                            <div class="form-group">
                                <label for="orgType">Organization Type <span style="color: red;">*</span></label>
                                <select id="orgType" class="form-control">
                                    <option value="">-- Select Organization --</option>
                                    <option value="RAILWAY">Indian Railway</option>
                                    <option value="DMRC">DMRC</option>
                                    <option value="OTHERS">Others</option>
                                </select>
                            </div>

                            <div class="form-group">
                                <label for="accountId">Account / Railway Unit</label>
                                <select id="accountId" class="form-control">
                                    <option value="">-- Select Account --</option>
                                    <c:forEach items="${accountList}" var="account">
                                        <option value="<c:out value='${account.ACCOUNT_ID}'/>"><c:out value="${account.ACCOUNT_NAME}"/></option>
                                    </c:forEach>
                                </select>
                            </div>

                            <div class="form-group">
                                <label for="depotId">Depot</label>
                                <select id="depotId" class="form-control">
                                    <option value="">-- Select Depot --</option>
                                </select>
                            </div>

                            <div class="form-group">
                                <label for="catalogStatus">Auction Status</label>
                                <select id="catalogStatus" class="form-control">
                                    <option value="">-- All Status --</option>
                                    <option value="LIVE">Live</option>
                                    <option value="UNDER_DECISION">Under Decision</option>
                                    <option value="UPCOMING">Upcoming Auction</option>
                                </select>
                            </div>
                        </div>

                        <div class="form-group">
                            <label>Auction Schedule Date Range</label>
                            <div class="date-range">
                                <input type="date" id="fromDate" class="form-control" placeholder="From Date">
                                <input type="date" id="toDate" class="form-control" placeholder="To Date">
                            </div>
                        </div>

                        <div class="action-buttons">
                            <button type="submit" class="btn btn-primary">
                                <i class="fas fa-search"></i> Search
                            </button>
                            <button type="reset" class="btn btn-secondary" onclick="resetFilters()">
                                <i class="fas fa-redo-alt"></i> Reset
                            </button>
                            <button type="button" class="btn btn-success" onclick="window.location.href='/'">
                                <i class="fas fa-home"></i> Home
                            </button>
                            <button type="button" class="btn btn-warning" onclick="window.print()">
                                <i class="fas fa-print"></i> Print
                            </button>
                        </div>
                    </form>
                </div>

                <div id="loadingSpinner" class="loading">
                    <div class="spinner"></div>
                    <p>Loading auction schedules...</p>
                </div>

                <div class="table-wrapper">
                    <table id="resultsTable">
                        <thead>
                            <tr>
                                <th>Schedule No.</th>
                                <th>Railway Unit</th>
                                <th>Depot</th>
                                <th>Catalog Status</th>
                                <th>Auction Start</th>
                                <th>Auction End</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody id="tableBody">
                            <tr>
                                <td colspan="7" class="no-data">
                                    <i class="fas fa-inbox"></i>
                                    <div>Click Search button to view auction schedules</div>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>

                <div id="paginationContainer" class="pagination-container">
                    <div id="pagination" class="pagination"></div>
                </div>
            </div>
        </div>
    </main>

    <footer class="footer">
        <div class="container">
            <div class="footer-content">
                <div class="footer-links">
                    <a href="#">About IREPS</a>
                    <a href="#">Disclaimer</a>
                    <a href="#">Privacy Policy</a>
                    <a href="#">RTI</a>
                    <a href="#">Terms & Conditions</a>
                    <a href="#">Contact Us</a>
                </div>
                <div>
                    <strong>Developed by:</strong> CRIS (Centre for Railway Information Systems)
                </div>
            </div>
        </div>
    </footer>

    <script>
        const contextPath = '<c:out value="${pageContext.request.contextPath}"/>';
        let currentPage = 1;
        let totalPages = 1;

        document.addEventListener('DOMContentLoaded', function() {
            console.log('%c=== PAGE LOADED ===', 'color: green; font-weight: bold; font-size: 14px');
            console.log('Context Path:', contextPath);
            console.log('Active Tab:', '${activeTab}');
            
            loadInitialAccounts();
            setupEventListeners();
        });

        function switchTab(tabName) {
            console.log('%c>>> Switching to tab: ' + tabName, 'color: purple; font-weight: bold');
            
            document.querySelectorAll('.tab-content').forEach(tab => {
                tab.classList.remove('active');
            });
            
            document.querySelectorAll('.nav-tab').forEach(tab => {
                tab.classList.remove('active');
            });
            
            if (tabName === 'live') {
                document.getElementById('liveTab').classList.add('active');
                document.querySelectorAll('.nav-tab')[0].classList.add('active');
                window.history.pushState({}, '', contextPath + '/eps/Eauction/manage.do');
            } else if (tabName === 'forthcoming') {
                document.getElementById('forthcomingTab').classList.add('active');
                document.querySelectorAll('.nav-tab')[1].classList.add('active');
                window.history.pushState({}, '', contextPath + '/eps/Eauction/forthcoming.do');
            } else if (tabName === 'schedule') {
                document.getElementById('scheduleTab').classList.add('active');
                document.querySelectorAll('.nav-tab')[2].classList.add('active');
                window.history.pushState({}, '', contextPath + '/eps/Eauction/schedule.do');
            }
        }

        function setupEventListeners() {
            document.getElementById('orgType').addEventListener('change', onOrgTypeChange);
            document.getElementById('accountId').addEventListener('change', onAccountChange);
            document.getElementById('filterForm').addEventListener('submit', onFormSubmit);
            
            document.getElementById('liveSearchInput').addEventListener('keyup', function(e) {
                if (e.key === 'Enter') {
                    performSearch('live', this.value);
                }
            });
            
            document.getElementById('forthcomingSearchInput').addEventListener('keyup', function(e) {
                if (e.key === 'Enter') {
                    performSearch('forthcoming', this.value);
                }
            });
        }

        function loadInitialAccounts() {
            console.log('%c>>> Loading Initial Accounts', 'color: blue; font-weight: bold');
            fetch(contextPath + '/eps/Eauction/getAccounts')
                .then(response => response.json())
                .then(data => {
                    console.log('%c✓ Initial accounts loaded: ' + data.length, 'color: green');
                    populateAccountDropdown(data);
                })
                .catch(error => {
                    console.error('%c✗ Error loading accounts:', 'color: red', error);
                    showError('Failed to load accounts');
                });
        }

        function onOrgTypeChange() {
            const orgType = document.getElementById('orgType').value;
            console.log('%c\n>>> Organization Type Changed: "' + orgType + '"', 'color: blue; font-weight: bold; font-size: 13px');

            const url = contextPath + '/eps/Eauction/getAccounts?orgType=' + encodeURIComponent(orgType);
            console.log('Fetching URL:', url);

            fetch(url)
                .then(response => response.json())
                .then(data => {
                    console.log('%c✓ Accounts loaded for "' + orgType + '": ' + data.length, 'color: green; font-weight: bold');
                    populateAccountDropdown(data);
                    document.getElementById('depotId').innerHTML = '<option value="">-- Select Depot --</option>';
                })
                .catch(error => {
                    console.error('%c✗ Error loading accounts:', 'color: red', error);
                    showError('Failed to load accounts');
                });
        }

        function onAccountChange() {
            const accountId = document.getElementById('accountId').value;
            console.log('%c>>> Account Changed: ' + accountId, 'color: blue');

            if (!accountId) {
                document.getElementById('depotId').innerHTML = '<option value="">-- Select Depot --</option>';
                return;
            }

            const url = contextPath + '/eps/Eauction/getDepots?accountId=' + encodeURIComponent(accountId);

            fetch(url)
                .then(response => response.json())
                .then(data => {
                    console.log('%c✓ Depots loaded: ' + data.length, 'color: green');
                    populateDepotDropdown(data);
                })
                .catch(error => {
                    console.error('%c✗ Error loading depots:', 'color: red', error);
                    showError('Failed to load depots');
                });
        }

        function populateAccountDropdown(data) {
            const select = document.getElementById('accountId');
            select.innerHTML = '<option value="">-- Select Account --</option>';

            if (data && data.length > 0) {
                data.forEach(item => {
                    const option = document.createElement('option');
                    option.value = escapeHtml(item.ACCOUNT_ID);
                    option.textContent = item.ACCOUNT_NAME;
                    select.appendChild(option);
                });
                console.log('✓ Account dropdown populated with ' + data.length + ' items');
            }
        }

        function populateDepotDropdown(data) {
            const select = document.getElementById('depotId');
            select.innerHTML = '<option value="">-- Select Depot --</option>';

            if (data && data.length > 0) {
                data.forEach(item => {
                    const option = document.createElement('option');
                    option.value = escapeHtml(item.DEPOT_ID);
                    option.textContent = item.DEPOT_NAME;
                    select.appendChild(option);
                });
                console.log('✓ Depot dropdown populated with ' + data.length + ' items');
            }
        }

        function onFormSubmit(e) {
            e.preventDefault();
            currentPage = 1;
            searchAuctions();
        }

        function searchAuctions() {
            showLoading(true);
            clearAlerts();

            const params = new URLSearchParams({
                accountId: document.getElementById('accountId').value || '',
                depotId: document.getElementById('depotId').value || '',
                catalogStatus: document.getElementById('catalogStatus').value || '',
                fromDate: document.getElementById('fromDate').value || '',
                toDate: document.getElementById('toDate').value || '',
                page: currentPage,
                pageSize: 10
            });

            console.log('%c>>> Searching Auctions', 'color: purple; font-weight: bold');
            console.log('Search params:', Object.fromEntries(params));

            fetch(contextPath + '/eps/Eauction/searchSchedule', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded'
                },
                body: params
            })
            .then(response => response.json())
            .then(data => {
                console.log('✓ Search response:', data);
                showLoading(false);

                if (data.success) {
                    displayResults(data);
                    showSuccess('Found ' + data.totalCount + ' auction schedule(s)');
                } else {
                    showError(data.error || 'Search failed');
                    document.getElementById('tableBody').innerHTML = 
                        '<tr><td colspan="7" class="no-data"><i class="fas fa-exclamation-circle"></i><div>' + 
                        escapeHtml(data.error || 'No results found') + '</div></td></tr>';
                }
            })
            .catch(error => {
                console.error('✗ Search error:', error);
                showLoading(false);
                showError('Search failed: ' + error.message);
            });
        }

        // ⭐⭐⭐ CRITICAL FUNCTION: Display Results with 4 Action Buttons ⭐⭐⭐
        function displayResults(data) {
            const tbody = document.getElementById('tableBody');
            tbody.innerHTML = '';

            if (!data.results || data.results.length === 0) {
                tbody.innerHTML = '<tr><td colspan="7" class="no-data">' +
                    '<i class="fas fa-search"></i><div>No auction schedules found</div></td></tr>';
                document.getElementById('paginationContainer').style.display = 'none';
                return;
            }

            data.results.forEach(auction => {
                const row = document.createElement('tr');
                const statusClass = getStatusClass(auction.catalogStatusLabel);
                const statusLabel = auction.catalogStatusLabel || 'N/A';

                // Column 1: Schedule Number
                const tdSchedule = document.createElement('td');
                const strongSchedule = document.createElement('strong');
                strongSchedule.textContent = auction.scheduleNo || '';
                tdSchedule.appendChild(strongSchedule);

                // Column 2: Railway Unit
                const tdAccount = document.createElement('td');
                tdAccount.textContent = auction.accountName || '';

                // Column 3: Depot
                const tdDepot = document.createElement('td');
                tdDepot.textContent = auction.depotName || '';

                // Column 4: Status Badge
                const tdStatus = document.createElement('td');
                const spanStatus = document.createElement('span');
                spanStatus.className = 'status-badge ' + statusClass;
                spanStatus.innerHTML = '<i class="fas fa-circle"></i> ';
                const statusText = document.createTextNode(statusLabel);
                spanStatus.appendChild(statusText);
                tdStatus.appendChild(spanStatus);

                // Column 5: Auction Start
                const tdStart = document.createElement('td');
                tdStart.textContent = auction.auctionStartDatetime || '';

                // Column 6: Auction End
                const tdEnd = document.createElement('td');
                tdEnd.textContent = auction.auctionEndDatetime || 'N/A';

                // Column 7: ACTION BUTTONS (4 buttons)
                const tdActions = document.createElement('td');
                const actionDiv = document.createElement('div');
                actionDiv.className = 'action-icons';
                
                // ====== BUTTON 1: VIEW (Blue) - Uniform E-Sale Conditions PDF ======
                const viewIcon = document.createElement('div');
                viewIcon.className = 'action-icon icon-view';
                viewIcon.title = 'View Uniform E-Sale Conditions';
                viewIcon.innerHTML = '<i class="fas fa-eye"></i>';
                viewIcon.onclick = function() { 
                    viewUniformSalePDF(); 
                };
                
                // ====== BUTTON 2: PRINT (Yellow) ======
                const printIcon = document.createElement('div');
                printIcon.className = 'action-icon icon-print';
                printIcon.title = 'Print';
                printIcon.innerHTML = '<i class="fas fa-print"></i>';
                printIcon.onclick = function() { 
                    printAuction(auction.scheduleNo); 
                };
                
                // ====== BUTTON 3: EMAIL (Purple) ======
                const emailIcon = document.createElement('div');
                emailIcon.className = 'action-icon icon-email';
                emailIcon.title = 'Email';
                emailIcon.innerHTML = '<i class="fas fa-envelope"></i>';
                emailIcon.onclick = function() { 
                    emailAuction(auction.scheduleNo); 
                };
                
                // ====== BUTTON 4: DOWNLOAD (Green) - Catalog Specific PDF ======
                const downloadIcon = document.createElement('div');
                downloadIcon.className = 'action-icon icon-download';
                downloadIcon.title = 'Download Catalog PDF';
                downloadIcon.innerHTML = '<i class="fas fa-download"></i>';
                
                // Check if catalog PDF is available
                const catalogId = auction.catalogId;
                const catFilePath = auction.catFilePath;
                
                console.log('Row data - Schedule:', auction.scheduleNo, 'CatalogID:', catalogId, 'PDF:', catFilePath);
                
                if (catalogId && catalogId !== -5 && catalogId !== '-5' && catFilePath && catFilePath.trim() !== '') {
                    // PDF available - enable download
                    downloadIcon.onclick = function() { 
                        downloadCatalogPDF(catalogId, catFilePath, auction.scheduleNo); 
                    };
                } else {
                    // PDF not available - disable button
                    downloadIcon.style.opacity = '0.5';
                    downloadIcon.style.cursor = 'not-allowed';
                    downloadIcon.title = 'PDF not available';
                    downloadIcon.onclick = function() {
                        showError('Catalog PDF not available for this auction');
                    };
                }
                
                // Add all 4 buttons
                actionDiv.appendChild(viewIcon);
                actionDiv.appendChild(printIcon);
                actionDiv.appendChild(emailIcon);
                actionDiv.appendChild(downloadIcon);
                tdActions.appendChild(actionDiv);

                // Append all columns
                row.appendChild(tdSchedule);
                row.appendChild(tdAccount);
                row.appendChild(tdDepot);
                row.appendChild(tdStatus);
                row.appendChild(tdStart);
                row.appendChild(tdEnd);
                row.appendChild(tdActions);

                tbody.appendChild(row);
            });

            totalPages = data.totalPages || 1;
            document.getElementById('paginationContainer').style.display = totalPages > 1 ? 'block' : 'none';
            generatePagination();
        }

        // ================================================================
        // ⭐⭐⭐ ACTION BUTTON FUNCTIONS - 4 BUTTONS ⭐⭐⭐
        // ================================================================

        // BUTTON 1: VIEW - Static Uniform E-Sale Conditions PDF
        function viewUniformSalePDF() {
            console.log('%c>>> BUTTON 1: Opening Uniform E-Sale Conditions PDF', 'color: green; font-weight: bold; font-size: 14px');
            
            const uniformSalePdfUrl = 'https://trial.ireps.gov.in/ireps/upload/resources/Uniform_E_Sale_condition.pdf';
            
            console.log('Static PDF URL:', uniformSalePdfUrl);
            window.open(uniformSalePdfUrl, '_blank');
            showSuccess('Opening Uniform E-Sale Conditions PDF...');
        }

        // BUTTON 2: PRINT
        function printAuction(scheduleNo) {
            console.log('%c>>> BUTTON 2: Print Auction', 'color: orange; font-weight: bold', scheduleNo);
            window.print();
        }

        // BUTTON 3: EMAIL
        function emailAuction(scheduleNo) {
            console.log('%c>>> BUTTON 3: Email Auction', 'color: purple; font-weight: bold', scheduleNo);
            
            fetch(contextPath + '/eps/Eauction/emailAuction', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded'
                },
                body: 'scheduleNo=' + encodeURIComponent(scheduleNo)
            })
            .then(response => response.json())
            .then(data => {
                if (data.success) {
                    showSuccess('Email sent for auction: ' + scheduleNo);
                } else {
                    showError('Failed to send email');
                }
            })
            .catch(error => {
                console.error('Email error:', error);
                showError('Error: ' + error.message);
            });
        }

        // BUTTON 4: DOWNLOAD - Catalog Specific PDF (Database se)
        function downloadCatalogPDF(catalogId, catFilePath, scheduleNo) {
            console.log('%c>>> BUTTON 4: Download Catalog PDF', 'color: blue; font-weight: bold; font-size: 14px');
            console.log('Catalog ID:', catalogId);
            console.log('File Path:', catFilePath);
            console.log('Schedule No:', scheduleNo);
            
            // Validate catalog ID
            if (!catalogId || catalogId === -5 || catalogId === '-5') {
                showError('Invalid catalog ID');
                console.warn('⚠ Invalid catalog ID:', catalogId);
                return;
            }
            
            // If we have the file path, construct full URL
            if (catFilePath && catFilePath.trim() !== '') {
                const baseUrl = 'https://trial.ireps.gov.in';
                let fullPdfUrl;
                
                // Check if path is already complete URL
                if (catFilePath.startsWith('http://') || catFilePath.startsWith('https://')) {
                    fullPdfUrl = catFilePath;
                } else if (catFilePath.startsWith('/')) {
                    // Relative path with leading slash
                    fullPdfUrl = baseUrl + catFilePath;
                } else {
                    // Relative path without slash
                    fullPdfUrl = baseUrl + '/' + catFilePath;
                }
                
                console.log('%c✓ Opening Catalog PDF:', 'color: green; font-weight: bold', fullPdfUrl);
                window.open(fullPdfUrl, '_blank');
                showSuccess('Opening catalog PDF for ' + scheduleNo + '...');
                return;
            }
            
            // Fallback: If path not in data, fetch from server
            console.log('⚠ PDF path not in data, fetching from server...');
            
            fetch(contextPath + '/eps/Eauction/getCatalogPDF?catalogId=' + catalogId)
                .then(response => response.json())
                .then(data => {
                    console.log('Server response:', data);
                    
                    if (data.success && data.pdfUrl) {
                        console.log('%c✓ PDF URL from server:', 'color: green', data.pdfUrl);
                        window.open(data.pdfUrl, '_blank');
                        showSuccess('Opening catalog PDF...');
                    } else {
                        showError(data.error || 'PDF not found');
                        console.error('✗ PDF not found for catalog:', catalogId);
                    }
                })
                .catch(error => {
                    console.error('✗ Error fetching PDF:', error);
                    showError('Failed to load PDF: ' + error.message);
                });
        }

        // ================================================================
        // HELPER FUNCTIONS
        // ================================================================

        function getStatusClass(status) {
            if (!status) return 'status-draft';
            const statusStr = String(status).toLowerCase();
            if (statusStr.includes('closed') || statusStr === '2') return 'status-closed';
            if (statusStr.includes('live') || statusStr === '1') return 'status-live';
            if (statusStr.includes('upcoming') || statusStr === '0') return 'status-upcoming';
            return 'status-draft';
        }

        function generatePagination() {
            const pagination = document.getElementById('pagination');
            pagination.innerHTML = '';

            if (totalPages <= 1) return;

            if (currentPage > 1) {
                const prevBtn = document.createElement('button');
                prevBtn.className = 'page-btn';
                prevBtn.textContent = '< Previous';
                prevBtn.onclick = function(e) {
                    e.preventDefault();
                    currentPage--;
                    searchAuctions();
                };
                pagination.appendChild(prevBtn);
            }

            for (let i = 1; i <= totalPages; i++) {
                const button = document.createElement('button');
                button.className = 'page-btn' + (i === currentPage ? ' active' : '');
                button.textContent = i;
                button.onclick = function(e) {
                    e.preventDefault();
                    currentPage = i;
                    searchAuctions();
                };
                pagination.appendChild(button);
            }

            if (currentPage < totalPages) {
                const nextBtn = document.createElement('button');
                nextBtn.className = 'page-btn';
                nextBtn.textContent = 'Next >';
                nextBtn.onclick = function(e) {
                    e.preventDefault();
                    currentPage++;
                    searchAuctions();
                };
                pagination.appendChild(nextBtn);
            }
        }

        function resetFilters() {
            document.getElementById('filterForm').reset();
            document.getElementById('depotId').innerHTML = '<option value="">-- Select Depot --</option>';
            document.getElementById('tableBody').innerHTML = 
                '<tr><td colspan="7" class="no-data"><i class="fas fa-inbox"></i><div>Click Search to view auction schedules</div></td></tr>';
            document.getElementById('pagination').innerHTML = '';
            clearAlerts();
            currentPage = 1;
            console.log('✓ Filters reset');
        }

        function performSearch(tabType, query) {
            console.log('Searching in ' + tabType + ' tab for:', query);
            showSuccess('Search functionality for ' + tabType + ' tab will be implemented');
        }

        function openUserManual() {
            console.log('Opening user manual...');
            showSuccess('User manual will open in a new window');
        }
        
        function openMigrationGuide() {
            console.log('Opening migration guide...');
            showSuccess('Migration guide will open in a new window');
        }
        
        function viewPublishedData() {
            console.log('Viewing published data...');
            showSuccess('Published data viewer will open');
        }

        function showLoading(show) {
            const spinner = document.getElementById('loadingSpinner');
            if (show) {
                spinner.classList.add('active');
            } else {
                spinner.classList.remove('active');
            }
        }

        function showSuccess(message) {
            const alert = document.getElementById('successAlert');
            document.getElementById('successMessage').textContent = message;
            alert.classList.add('active');
            setTimeout(function() { alert.classList.remove('active'); }, 4000);
        }

        function showError(message) {
            const alert = document.getElementById('errorAlert');
            document.getElementById('errorMessage').textContent = message;
            alert.classList.add('active');
            setTimeout(function() { alert.classList.remove('active'); }, 5000);
        }

        function clearAlerts() {
            document.getElementById('successAlert').classList.remove('active');
            document.getElementById('errorAlert').classList.remove('active');
        }

        function escapeHtml(text) {
            if (!text) return '';
            const map = {
                '&': '&amp;',
                '<': '&lt;',
                '>': '&gt;',
                '"': '&quot;',
                "'": '&#039;'
            };
            return String(text).replace(/[&<>"']/g, function(m) { return map[m]; });
        }
    </script>
</body>
</html>