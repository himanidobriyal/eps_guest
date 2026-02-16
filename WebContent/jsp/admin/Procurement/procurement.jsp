<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>



<!DOCTYPE html>

<html>

<head>

 <meta charset="UTF-8">

 <title>Procurement Projections - IREPS</title>

 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">

 <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">

 <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

 <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/accessibility/accessibility.css">

<script src="${pageContext.request.contextPath}/assets/accessibility/accessibility.js" defer></script>	

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



 /* MAIN CONTAINER */

 .main-container {

 flex: 1;

 max-width: 100%;

 margin: 0;

 padding: 0;

 overflow-y: auto;

}



 .search-card {

 background: rgba(255, 255, 255, 0.98);

 backdrop-filter: blur(15px);

 border-radius: 20px;

 box-shadow: 0 20px 60px rgba(0, 0, 0, 0.1);

 overflow: visible;

 max-width: 1400px;

 width: 100%;

 margin: 20px auto;

 display: flex;

 flex-direction: column;

 }



 /* NEW: Search Header like Item Master */

 .search-header {

 background: white;

 color: #2c5aa0;

 text-align: center;

 position: relative;

 border-bottom: 3px solid #2c5aa0;

 }



 .search-header h2 {

 font-size: 28px;

 position: relative;

 z-index: 1;

 letter-spacing: 0.5px;

 margin: 0;

 color: #2c5aa0;

 }



 /* NEW: Status Bar like Item Master */

 .status-bar {

 display: flex;

 justify-content: space-between;

 align-items: center;

 padding: 15px 30px;

 background: linear-gradient(90deg, #f0f7ff 0%, #ffffff 50%, #f0fff4 100%);

 border-bottom: 1px solid #d1e3f8;

 }



 .status-left {

 display: flex;

 align-items: center;

 gap: 12px;

 font-weight: 700;

 color: #0b253f;

 font-size: 17px;

 letter-spacing: 0.8px;

 font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;

 }



 .status-left i {

 font-size: 22px;

 color: #2c5aa0;

 }



 .status-right {

 font-weight: 600;

 color: #2d3436;

 font-size: 16px;

 font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;

 letter-spacing: 0.5px;

 }



 .status-published {

 color: #22c55e;

 font-weight: 700;

 text-transform: uppercase;

 letter-spacing: 0.8px;

 margin-left: 6px;

 font-size: 17px;

 }



 /* TABS STYLING */

 .search-tabs {

 display: flex;

 background: #f8f9fa;

 border-bottom: 1px solid #e9ecef;

 overflow-x: auto;

 gap: 8px;

 padding: 12px;

 border-radius: 0;

 }



 .search-tab {

 padding: 10px 16px;

 background: #e9ecef;

 border: 2px solid #dee2e6;

 cursor: pointer;

 white-space: nowrap;

 font-weight: 600;

 font-size: 13px;

 transition: all 0.3s ease;

 border-radius: 10px;

 color: #495057;

 box-shadow: 0 3px 6px rgba(0, 0, 0, 0.15);

 text-transform: uppercase;

 letter-spacing: 0.3px;

 flex-shrink: 0;

 text-decoration: none;

 }



 .search-tab.active {

 background: linear-gradient(45deg, #2c5aa0, #1a4480);

 color: white;

 border: 2px solid #1a4480;

 box-shadow: 0 6px 12px rgba(44, 90, 160, 0.4);

 transform: translateY(-2px);

 font-weight: 700;

 }



 .search-tab:hover {

 background: #dee2e6;

 transform: translateY(-2px);

 box-shadow: 0 6px 12px rgba(0, 0, 0, 0.2);

 border: 2px solid #adb5bd;

 }



 .tab-content {

 display: none;

 }



 .tab-content.active {

 display: block;

 }



 .search-content {

 padding: 20px;

 }



 .search-info {

 color: #1565c0;

 padding: 4px 0;

 margin-bottom: 8px;

 font-size: 14px;

 line-height: 1.5;

 }



 /* FORM GRID */

 .form-grid {

 display: grid;

 grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));

 gap: 16px;

 margin-bottom: 16px;

 }



 .form-group {

 display: flex;

 flex-direction: column;

 }



 .form-group.full-width {

 grid-column: 1 / -1;

 }



 .form-label {

 font-weight: 600;

 color: #2d3436;

 margin-bottom: 6px;

 font-size: 14px;

 font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;

 }



 .required-asterisk {

 color: #e17055;

 }



 .form-select,

 .form-control {

 padding: 10px 14px;

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



 .form-select {

 appearance: none;

 -webkit-appearance: none;

 -moz-appearance: none;

 background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='12' height='12' viewBox='0 0 12 12'%3E%3Cpath fill='%23333' d='M10.293 3.293L6 7.586 1.707 3.293A1 1 0 00.293 4.707l5 5a1 1 0 001.414 0l5-5a1 1 0 10-1.414-1.414z'/%3E%3C/svg%3E");

 background-repeat: no-repeat;

 background-position: right 12px center;

 background-size: 12px;

 padding-right: 40px;

 cursor: pointer;

 }



 .form-select:focus,

 .form-control:focus {

 outline: none;

 border-color: #74b9ff;

 box-shadow: 0 0 0 3px rgba(116, 185, 255, 0.1);

 }



 .projection-group {

 display: flex;

 align-items: center;

 gap: 10px;

 }



 .projection-group select {

 flex: 1;

 }



 .projection-group .years-label {

 font-size: 14px;

 font-weight: 500;

 color: #495057;

 white-space: nowrap;

 }



 /* ACTION BUTTONS */

 .action-buttons {

 display: flex;

 justify-content: center;

 gap: 16px;

 margin-top: 16px;

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



 .btn-primary {

 background: linear-gradient(45deg, #74b9ff, #0984e3);

 color: white;

 }



 .btn-primary:hover {

 transform: translateY(-2px);

 box-shadow: 0 8px 25px rgba(116, 185, 255, 0.3);

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



 /* RESULTS SECTION */

 .results-section {

 padding: 20px;

 background: white;

 max-width: 1400px;

 margin: 15px auto 0 auto;

 }



 .results-header {

 background: linear-gradient(135deg, #2c5aa0 0%, #1a4480 50%, #0f3460 100%);

 color: white;

 padding: 12px 18px;

 border-radius: 12px;

 margin-bottom: 15px;

 box-shadow: 0 4px 15px rgba(44, 90, 160, 0.3);

 display: flex;

 justify-content: space-between;

 align-items: center;

 }



 .results-header h3 {

 font-size: 22px;

 font-weight: 700;

 text-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);

 letter-spacing: 0.5px;

 margin: 0;

 }



 .badge {

 background: #4299e1;

 color: white;

 padding: 5px 12px;

 border-radius: 20px;

 font-size: 14px;

 font-weight: 600;

 }



 /* NEW: Pagination Controls like Item Master */

 .pagination-controls {

 display: flex;

 justify-content: space-between;

 align-items: center;

 margin-bottom: 15px;

 padding: 12px 16px;

 background: linear-gradient(135deg, #f8fbff 0%, #e8f2ff 100%);

 border-radius: 15px;

 border: 2px solid rgba(42, 82, 152, 0.1);

 box-shadow: 0 5px 15px rgba(42, 82, 152, 0.1);

 }



 .results-info {

 display: flex;

 align-items: center;

 gap: 12px;

 }



 .records-per-page {

 display: flex;

 align-items: center;

 gap: 8px;

 font-weight: 600;

 color: #1e3c72;

 }



 .records-per-page select {

 padding: 7px 11px;

 border: 2px solid #2a5298;

 border-radius: 8px;

 background: white;

 color: #1e3c72;

 font-weight: 600;

 cursor: pointer;

 font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;

 }



 .pagination-nav {

 display: flex;

 align-items: center;

 gap: 10px;

 }



 .page-info {

 font-weight: 600;

 color: #1e3c72;

 padding: 7px 13px;

 background: rgba(255, 255, 255, 0.7);

 border-radius: 15px;

 border: 2px solid rgba(42, 82, 152, 0.2);

 font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;

 }



 .pagination-btn {

 background: linear-gradient(135deg, #2a5298 0%, #1e3c72 100%);

 color: white;

 border: none;

 padding: 9px 14px;

 border-radius: 10px;

 cursor: pointer;

 font-weight: 600;

 transition: all 0.3s ease;

 display: flex;

 align-items: center;

 gap: 5px;

 box-shadow: 0 3px 10px rgba(42, 82, 152, 0.3);

 font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;

 }



 .pagination-btn:hover:not(:disabled) {

 transform: translateY(-2px);

 box-shadow: 0 5px 15px rgba(42, 82, 152, 0.4);

 }



 .pagination-btn:disabled {

 background: #ccc;

 cursor: not-allowed;

 box-shadow: none;

 }



 /* TABLE STYLING */

 .table-responsive {

 border-radius: 12px;

 overflow: hidden;

 box-shadow: 0 8px 25px rgba(0, 0, 0, 0.1);

 }



 .modern-table {

 width: 100%;

 border-collapse: collapse;

 background: white;

 margin: 0;

 }



 .modern-table thead {

 background: linear-gradient(135deg, #2c5aa0 0%, #1a4480 100%);

 }



 .modern-table th {

 padding: 14px 10px;

 color: white;

 font-weight: 600;

 font-size: 14px;

 text-align: center;

 border: none;

 text-shadow: 0 1px 2px rgba(0, 0, 0, 0.1);

 letter-spacing: 0.3px;

 }



 .modern-table tbody tr {

 background: white;

 transition: all 0.3s ease;

 }



 .modern-table tbody tr:nth-child(even) {

 background: #f8f9fa;

 }



 .modern-table tbody tr:hover {

 background: linear-gradient(45deg, #e3f2fd, #f0f8ff);

 transform: translateY(-1px);

 box-shadow: 0 4px 12px rgba(44, 90, 160, 0.15);

 }



 .modern-table td {

 padding: 12px 10px;

 border-bottom: 1px solid #e9ecef;

 font-size: 13px;

 color: #2d3436;

 text-align: left;

 vertical-align: middle;

 }



 .modern-table td:first-child {

 font-weight: 600;

 }



 /* DISCLAIMER */

 .disclaimer {

 margin: 15px 0;

 padding: 16px;

 font-size: 13px;

 line-height: 1.6;

 text-align: justify;

 background: linear-gradient(135deg, #fffbeb 0%, #fef3c7 100%);

 border-left: 4px solid #f6ad55;

 border-radius: 8px;

 color: #92400e;

 box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);

 }



 .no-data {

 padding: 60px 30px;

 background: linear-gradient(135deg, #f8fafc 0%, #edf2f7 100%);

 border: 1px solid #e2e8f0;

 border-radius: 12px;

 text-align: center;

 color: #718096;

 margin: 20px 0;

 }



 /* DOWNLOAD CARDS */

 .link-list {

 display: grid;

 grid-template-columns: repeat(auto-fit, minmax(350px, 1fr));

 gap: 16px;

 padding: 24px;

 background: white;

 }



 .download-card {

 display: flex;

 align-items: center;

 gap: 12px;

 padding: 16px;

 background: linear-gradient(135deg, #f8f9fa 0%, #e3f2fd 100%);

 border: 2px solid #dee2e6;

 border-radius: 12px;

 text-decoration: none;

 color: #2d3436;

 transition: all 0.3s ease;

 box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);

 }



 .download-card:hover {

 transform: translateY(-2px);

 box-shadow: 0 6px 20px rgba(44, 90, 160, 0.2);

 border-color: #74b9ff;

 }



 .download-icon {

 font-size: 40px;

 }



 .download-content {

 flex: 1;

 }



 .download-title {

 font-size: 16px;

 font-weight: 600;

 color: #2c5aa0;

 margin-bottom: 4px;

 }



 .download-subtitle {

 font-size: 13px;

 color: #718096;

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



 @media (max-width: 1024px) {

 .form-grid {

 grid-template-columns: repeat(2, 1fr);

 }

 }



 @media (max-width: 768px) {

 .form-grid {

 grid-template-columns: 1fr;

 }



 .modern-table th,

 .modern-table td {

 padding: 8px 6px;

 font-size: 12px;

 }



 .pagination-controls {

 flex-direction: column;

 gap: 12px;

 }

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




<div class="main-container">

 <div class="search-card">

 <!-- NEW: Header like Item Master -->

 <div class="search-header">

 <h2>Procurement Projection</h2>

 </div>



 <div class="search-tabs">

 <div class="search-tab active" data-tab="stock">Stock Items</div>

 <div class="search-tab" data-tab="track">Track Items</div>

 <div class="search-tab" data-tab="misc">Other Miscellaneous</div>

 </div>



 <div id="stock" class="tab-content active">

 <div class="search-content">

 <div class="search-info">

 Enter procurement projection details to generate the report

 </div>



 <form action="${pageContext.request.contextPath}/eps/procurement/projection.do" method="post" id="stockForm">

  <div class="form-grid">

 <div class="form-group">

 <label class="form-label">

 Organization 

 <span class="required-asterisk">*</span>

 </label>

 <select name="organization" class="form-select">

 <option>Indian Railway</option>

 </select>

 </div>



 <div class="form-group">

 <label class="form-label">Zone</label>

 <select id="zone" name="zone" class="form-select">

 <option value="">--Select Zone--</option>

 <c:forEach var="zoneObj" items="${zones}">

 <option value="${zoneObj.ouCode}"

 <c:if test="${zoneObj.ouCode == param.zone || zoneObj.ouCode == zone}">

 selected

 </c:if>>

 ${zoneObj.ouName}

 </option>

 </c:forEach>

 </select>

 </div>



 <div class="form-group">

 <label class="form-label">PL Number Start with</label>

 <input type="text" id="plNo" name="plNo" class="form-control" value="${not empty param.plNo ? param.plNo : plNo}" />

 </div>



 <div class="form-group">

 <label class="form-label">Projection For</label>

 <div class="projection-group">

 <select name="projection" class="form-select">

 <option>1</option>

 <option>2</option>

 <option>3</option>

 </select>

 <span class="years-label">Years</span>

 </div>

 </div>



 <div class="form-group full-width">

 <label class="form-label">Description</label>

 <input type="text" id="description" name="description" class="form-control" style="max-width: 400px;" value="${description}"/>

 </div>

 </div>



 <div class="action-buttons">

 <button type="submit" class="btn btn-primary">Submit</button>

 <button type="button" class="btn btn-secondary" onclick="resetForm()">Close</button>

 </div>

 </form>

 </div>

 </div>



 <div id="track" class="tab-content">

 <div class="link-list">

 <a href="files/Estimated.pdf" target="_blank" class="download-card" onclick="handleDownload(this)">

 <div class="download-icon">📄</div>

 <div class="download-content">

 <div class="download-title">Estimated requirement for New Rails</div>

 <div class="download-subtitle">PDF Document • Click to download</div>

 </div>

 </a>

 

 <a href="files/Estimated_Requirement.pdf" target="_blank" class="download-card" onclick="handleDownload(this)">

 <div class="download-icon">🚂</div>

 <div class="download-content">

 <div class="download-title">Estimated Requirement for Track Machines</div>

 <div class="download-subtitle">PDF Document • Click to download</div>

 </div>

 </a>

 </div>

 </div>



 <div id="misc" class="tab-content">

 <div class="link-list">

 <a href="files/NAIR.pdf" target="_blank" class="download-card">

 <div class="download-icon">📋</div>

 <div class="download-content">

 <div class="download-title">NAIR</div>

 <div class="download-subtitle">PDF Document • Click to download</div>

 </div>

 </a>

 <a href="files/Bed.pdf" target="_blank" class="download-card">

 <div class="download-icon">🛏️</div>

 <div class="download-content">

 <div class="download-title">Bed Rolls</div>

 <div class="download-subtitle">PDF Document • Click to download</div>

 </div>

 </a>

 </div>

 </div>

 </div>



 <c:if test="${not empty summary}">

 <div class="results-section">

 <div class="disclaimer">

 <strong>Disclaimer:</strong>

 Procurement Projection Report is the projected requirement of stock items required by 

 selected Railway Unit(s). Items required on regular basis by Railways are classified as 

 stock items. Actual procurement may vary and is dependent on many parameters including 

 production, technical innovation, repair and maintenance requirement. 

 <br/><br/>

 The report is system generated and may reflect data errors, if any. Ministry of Railways, 

 Railway Board, any of the Indian Railways or Railway Units under the administrative control 

 of Ministry of Railways shall not be responsible for any loss or damage to anybody using the information.

 </div>



 <div class="results-header">

 <h3>Search Results</h3>

 <span class="badge" id="totalRecords">${fn:length(summary)} Records Found</span>

 </div>



 <!-- NEW: Pagination Controls like Item Master -->

 <div class="pagination-controls" id="paginationControls">

 <div class="results-info">

 <div class="records-per-page">

 <label for="recordsPerPage">Show:</label>

 <select id="recordsPerPage">

 <option value="5" selected>5 per page</option>

 <option value="10">10 per page</option>

 <option value="25">25 per page</option>

 <option value="50">50 per page</option>

 </select>

 </div>

 </div>

 <div class="pagination-nav">

 <div class="page-info" id="pageInfo">Page 1 of 1</div>

 <button class="pagination-btn" id="prevPage" disabled>

 <i class="bi bi-chevron-left"></i> Previous

 </button>

 <button class="pagination-btn" id="nextPage" disabled>

 Next <i class="bi bi-chevron-right"></i>

 </button>

 </div>

 </div>



 <div class="table-responsive">

 <table class="modern-table">

 <thead>

 <tr>

 <th>#</th>

 <th>PL Number</th>

 <th>Item Description</th>

 <th>Unit</th>

 <th>Projected Procurement Quantity</th>

 <th>Projected Procurement Value</th>

 </tr>

 </thead>

 <tbody id="procurementTableBody">

 <c:forEach var="row" items="${summary}" varStatus="loop">

 <tr class="data-row">

 <td>${loop.index + 1}</td>

 <td>${row.pl_no}</td>

 <td>${row.sdes}</td>

 <td>${row.nlu}</td>

 <td>${row.tot_aac}</td>

 <td>${row.aac_value}</td>

 </tr>

 </c:forEach>

 </tbody>

 </table>

 </div>

 </div>

 </c:if>



 <c:if test="${empty summary && not empty param.plNo && not empty param.zone && not empty param.description}">

 <div class="results-section">

 <div class="no-data">

 <h5>No Data Found</h5>

 <p>No data found for the given PL No, Zone, and Description.</p>

 </div>

 </div>

 </c:if>

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



	document.querySelectorAll('.sidebar a')

	.forEach(link => link.classList.remove('active-option'));

	el.classList.add('active-option');



	window.location.href = ctx + '/jsp/admin/home/login.jsp?redirect=' + option;

}



function openSidebar() { document.getElementById('mySidebar').style.width = '250px'; }

function closeSidebar() { document.getElementById('mySidebar').style.width = '0'; }

 

// Tab switching

document.querySelectorAll(".search-tab").forEach(tab => {

 tab.addEventListener("click", () => {

 document.querySelectorAll(".search-tab").forEach(t => t.classList.remove("active"));

 document.querySelectorAll(".tab-content").forEach(c => c.classList.remove("active"));



 tab.classList.add("active");

 document.getElementById(tab.dataset.tab).classList.add("active");

 });

});



function handleDownload(element) {

 element.classList.add('downloading');

 setTimeout(() => {

 element.classList.remove('downloading');

 }, 2000);

}



function validateForm() {

 let plNo = document.getElementById("plNo").value.trim();

 let zone = document.getElementById("zone").value.trim();

 let description = document.getElementById("description").value.trim();



 if (plNo === "" || zone === "" || description === "") {

 alert("Please fill all required fields before submitting.");

 return false;

 }

 return true;

}



window.resetForm = function() {

 document.getElementById("stockForm").reset();

 

 const resultSection = document.querySelector(".results-section");

 if (resultSection) {

 resultSection.style.display = "none";

 }

}



// Language translation

const translations = {

 en: {

 selectLanguage: "Select Your Language",

 mainTitle: "Government eMarketplace",

 subTitle: "Indian Railways E-Procurement System",

 organization: "Organization",

 zone: "Zone",

 plNumber: "PL Number Start with",

 description: "Description",

 projectionFor: "Projection For",

 submit: "Submit",

 close: "Close",

 years: "Years"

 },

 hi: {

 selectLanguage: "अपनी भाषा चुनें",

 mainTitle: "सरकारी ई-मार्केटप्लेस",

 subTitle: "भारतीय रेलवे ई-प्रोक्योरमेंट सिस्टम",

 organization: "संगठन",

 zone: "क्षेत्र",

 plNumber: "पीएल नंबर से प्रारंभ",

 description: "विवरण",

 projectionFor: "प्रोजेक्शन के लिए",

 submit: "जमा करें",

 close: "बंद करें",

 years: "साल"

 }

};



function changeLanguage(lang) {

 const t = translations[lang];

 document.querySelector('label[for="language"]').textContent = t.selectLanguage;

 document.querySelector(".main-title").textContent = t.mainTitle;

 document.querySelector(".sub-title").textContent = t.subTitle;

 document.querySelector(".years-label").textContent = t.years;

 document.querySelector('button.btn-primary').textContent = t.submit;

 document.querySelector('button.btn-secondary').textContent = t.close;

}



document.getElementById("language").addEventListener("change", function() {

 changeLanguage(this.value);

});



// NEW: Pagination functionality like Item Master

let currentPage = 1;

let recordsPerPage = 5;

let allRows = [];



document.addEventListener('DOMContentLoaded', function() {

 const tableBody = document.getElementById('procurementTableBody');

 

 if (tableBody) {

 allRows = Array.from(document.querySelectorAll('.data-row'));

 

 if (allRows.length > 0) {

 setupPagination();

 displayPage(1);

 }

 }



 document.getElementById('recordsPerPage')?.addEventListener('change', function() {

 recordsPerPage = parseInt(this.value);

 currentPage = 1;

 displayPage(currentPage);

 });



 document.getElementById('prevPage')?.addEventListener('click', function() {

 if (currentPage > 1) {

 currentPage--;

 displayPage(currentPage);

 }

 });



 document.getElementById('nextPage')?.addEventListener('click', function() {

 const totalPages = Math.ceil(allRows.length / recordsPerPage);

 if (currentPage < totalPages) {

 currentPage++;

 displayPage(currentPage);

 }

 });

});



function setupPagination() {

 const totalRecords = allRows.length;

 const totalPages = Math.ceil(totalRecords / recordsPerPage);

 

 document.getElementById('totalRecords').textContent = totalRecords + ' Records Found';

 updatePaginationInfo(totalPages);

}



function displayPage(page) {

 const tableBody = document.getElementById('procurementTableBody');

 const startIndex = (page - 1) * recordsPerPage;

 const endIndex = startIndex + recordsPerPage;

 

 allRows.forEach((row, index) => {

 if (index >= startIndex && index < endIndex) {

 row.style.display = '';

 const firstCell = row.querySelector('td:first-child');

 if (firstCell) {

 firstCell.textContent = index + 1;

 }

 } else {

 row.style.display = 'none';

 }

 });

 

 const totalPages = Math.ceil(allRows.length / recordsPerPage);

 updatePaginationInfo(totalPages);

}



function updatePaginationInfo(totalPages) {

 document.getElementById('pageInfo').textContent = `Page ${currentPage} of ${totalPages}`;

 

 document.getElementById('prevPage').disabled = currentPage === 1;

 document.getElementById('nextPage').disabled = currentPage === totalPages;

}

</script>
<script 
    src="https://translation-plugin.bhashini.co.in/v3/website_translation_utility.js"
    language-icon-color="#ffffff">
</script>
<script src="${pageContext.request.contextPath}/assets/bhashini/bhashini-init.js"></script>
</body>

</html>