<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Government eMarketplace - Indian Railways E-Procurement System</title>

<!-- Bootstrap & Icons -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
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

.main-container {
    flex: 1;
    max-width: 100%;
    margin: 0;  /* 12px 0px se change karo */
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
	margin: 0 auto 20px auto;
}

.search-header {
    background: white;
    color: #2c5aa0;
    text-align: center;
    position: relative;
    border-bottom: 3px solid #2c5aa0;
}

.search-header h3 {
	font-size: 28px;
	position: relative;
	z-index: 1;
	letter-spacing: 0.5px;
	margin: 0;
	color: #2c5aa0;
	padding: 20px;
}

.search-content {
	padding: 20px;
}

.search-info {
	color: #1565c0;
	padding: 4px 0;
	margin-bottom: 15px;
	font-size: 14px;
	line-height: 1.5;
}

/* Form Grid */
.form-grid {
	display: grid;
	grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
	gap: 16px;
	margin-bottom: 8px;
}

.form-group {
	display: flex;
	flex-direction: column;
}

.form-group label {
	font-weight: 600;
	color: #2d3436;
	margin-bottom: 6px;
	font-size: 14px;
	font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
}

.required {
	color: #e17055;
}

.form-group select,
.form-group input {
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

.form-group select {
	appearance: none;
	-webkit-appearance: none;
	-moz-appearance: none;
	cursor: pointer;
	background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='12' height='12' viewBox='0 0 12 12'%3E%3Cpath fill='%23333' d='M10.293 3.293L6 7.586 1.707 3.293A1 1 0 00.293 4.707l5 5a1 1 0 001.414 0l5-5a1 1 0 10-1.414-1.414z'/%3E%3C/svg%3E");
	background-repeat: no-repeat;
	background-position: right 12px center;
	background-size: 12px;
	padding-right: 40px;
}

.form-group select:focus,
.form-group input:focus {
	outline: none;
	border-color: #74b9ff;
	box-shadow: 0 0 0 3px rgba(116, 185, 255, 0.1);
}

.form-group select:disabled {
	background-color: #f8f9fa;
	color: #6c757d;
	cursor: not-allowed;
	opacity: 0.7;
}

.error-message {
	color: #e17055;
	font-size: 12px;
	margin-top: 4px;
	display: none;
	font-style: italic;
}

.form-group.error select,
.form-group.error input {
	border-color: #e17055;
}

/* More Filters Section */
.advanced-filter-toggle {
	margin: 16px 0;
	text-align: left;
}

.btn-advanced {
	background: none;
	color: #2196F3;
	font-weight: 500;
	padding: 6px 0;
	border: none;
	cursor: pointer;
	font-size: 14px;
	display: flex;
	align-items: center;
	gap: 8px;
	transition: all 0.2s ease;
}

.btn-advanced:hover {
	color: #1976D2;
}

.btn-advanced .arrow-icon::before {
	content: "";
	border: solid #2196F3;
	border-width: 0 2px 2px 0;
	display: inline-block;
	padding: 3px;
	transform: rotate(45deg);
	transition: transform 0.3s ease;
}

.btn-advanced.open .arrow-icon::before {
	transform: rotate(-135deg);
}

.advanced-filters {
	display: none;
	margin-top: 12px;
}

/* Verification Section */
.verification-section {
	background: white;
	padding: 12px;
	border-radius: 12px;
	border: 1px solid #dee2e6;
	box-shadow: 0 2px 8px rgba(0, 0, 0, 0.05);
	margin: 12px 0;
	display: flex;
	align-items: flex-start;
	gap: 12px;
	flex-wrap: wrap;
	width: 50%;
}

.verification-section label {
	font-size: 14px;
	font-weight: 600;
	color: #2d3436;
	white-space: nowrap;
	margin: 0;
}

.verification-code {
	padding: 8px 16px;
	background: #f0f4f8;
	border: 2px solid #ddd;
	border-radius: 8px;
	font-weight: bold;
	font-size: 16px;
	letter-spacing: 2px;
	color: #1e3c72;
	min-width: 100px;
	text-align: center;
}

.refresh-btn {
	background: linear-gradient(45deg, #74b9ff, #0984e3);
	border: none;
	color: white;
	cursor: pointer;
	font-size: 16px;
	padding: 8px 12px;
	border-radius: 8px;
	transition: all 0.3s ease;
	height: 38px;
	display: flex;
	align-items: center;
	justify-content: center;
	box-shadow: 0 2px 6px rgba(116, 185, 255, 0.3);
}

.refresh-btn:hover {
	transform: translateY(-1px);
	box-shadow: 0 4px 12px rgba(116, 185, 255, 0.4);
}

.verification-section .form-control {
	padding: 8px 16px;
	font-size: 14px;
	border: 2px solid #ddd;
	border-radius: 8px;
	width: 180px;
	outline: none;
	min-height: 38px;
}

.verification-section .form-control:focus {
	border-color: #74b9ff;
	box-shadow: 0 0 0 3px rgba(116, 185, 255, 0.1);
}

.captcha-status {
	font-size: 14px;
	font-weight: 600;
	white-space: nowrap;
}

.captcha-error {
	color: #e17055;
}

.captcha-success {
	color: #00b894;
}

.captcha-validating {
	color: #f59e0b;
}

/* Action Buttons */
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

.btn-primary:disabled {
	background: #ccc;
	cursor: not-allowed;
	transform: none;
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

/* Results Section */
.results-section {
	padding: 20px;
	background: white;
	max-width: 1400px;
	margin: 15px auto 30px auto;
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

.total-count {
	font-size: 18px;
	font-weight: 600;
}

/* Pagination Controls */
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

/* Enhanced Table Styling */
.tender-table {
	width: 100%;
	border-collapse: collapse;
	background: white;
	border-radius: 12px;
	overflow: hidden;
	box-shadow: 0 8px 25px rgba(0, 0, 0, 0.1);
	margin-bottom: 30px;
}

.tender-table thead {
	background: linear-gradient(135deg, #2c5aa0 0%, #1a4480 100%);
}

.tender-table th {
	padding: 14px 10px;
	color: white;
	font-weight: 600;
	font-size: 14px;
	text-align: center;
	border: none;
	text-shadow: 0 1px 2px rgba(0, 0, 0, 0.1);
	letter-spacing: 0.3px;
}

.tender-table tbody tr {
	background: white;
	transition: all 0.3s ease;
}

.tender-table tbody tr:nth-child(even) {
	background: #f8f9fa;
}

.tender-table tbody tr:hover {
	background: linear-gradient(45deg, #e3f2fd, #f0f8ff);
	transform: translateY(-1px);
	box-shadow: 0 4px 12px rgba(44, 90, 160, 0.15);
}

.tender-table td {
	padding: 12px 10px;
	border-bottom: 1px solid #e9ecef;
	font-size: 13px;
	color: #2d3436;
	text-align: left;
	vertical-align: middle;
}

.download-btn {
	display: inline-flex;
	align-items: center;
	justify-content: center;
	padding: 6px 8px;
	background: linear-gradient(45deg, #74b9ff, #0984e3);
	color: white;
	text-decoration: none;
	border-radius: 6px;
	transition: all 0.3s ease;
	box-shadow: 0 2px 6px rgba(116, 185, 255, 0.3);
}

.download-btn:hover {
	transform: translateY(-1px);
	box-shadow: 0 4px 12px rgba(116, 185, 255, 0.4);
	color: white;
}

.download-icon {
	width: 18px;
	height: 18px;
	transition: transform 0.2s ease;
}

.no-data {
	padding: 30px !important;
	font-style: italic;
	color: #666;
	text-align: center;
	background: #f8f9fa;
	border-radius: 12px;
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
	background: #05173c !important;   /* Dark blue */
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

/* Responsive adjustments */
@media (max-width: 768px) {
	.form-grid {
		grid-template-columns: 1fr;
	}
	
	.verification-section {
		flex-direction: column;
		align-items: stretch;
		width: 100%;
	}
	
	.verification-section .form-control {
		width: 100%;
	}
	
	.tender-table th,
	.tender-table td {
		padding: 8px 6px;
		font-size: 12px;
	}
	
	.action-buttons {
		flex-direction: column;
	}
	
	.btn {
		width: 100%;
	}

	.pagination-controls {
		flex-direction: column;
		gap: 12px;
	}
	
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
		font-size: 22px;
	}
	
	.right-section {
		align-items: center;
		margin-right: 0;
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
			<div class="search-header">
				<h3><i class="bi bi-file-earmark-text me-2"></i>View IREPS Documents</h3>
			</div>

			<div class="search-content">
				<div class="search-info">
					Please select the required fields and click 'Filter' to view IREPS documents
				</div>

				<!-- Mandatory Fields -->
				<div class="form-grid">
					<div class="form-group">
						<label for="organisation">Organization <span class="required">*</span></label>
						<select id="organisation" name="organisation" class="form-control" required>
							<option value="">Select</option>
							<c:forEach var="org" items="${organisations}">
								<option value="${org.orgCode}">${org.ouName}</option>
							</c:forEach>
						</select>
						<span class="error-message" id="organisationError">Please select an organization</span>
					</div>

					<div class="form-group">
						<label for="zone">Zone <span class="required">*</span></label>
						<select id="zone" name="zone" class="form-control" required>
							<option value="">Select</option>
						</select>
						<span class="error-message" id="zoneError">Please select a zone</span>
					</div>

					<div class="form-group">
						<label for="department">Department <span class="required">*</span></label>
						<select id="department" name="department" class="form-control" required>
							<option value="">Select</option>
						</select>
						<span class="error-message" id="departmentError">Please select a department</span>
					</div>

					<div class="form-group">
						<label for="adminUnitDropdown">Admin Unit <span class="required">*</span></label>
						<select id="adminUnitDropdown" name="adminUnit" class="form-control" required>
							<option value="">All</option>
						</select>
						<span class="error-message" id="adminUnitError">Please select an admin unit</span>
					</div>
				</div>

				<!-- More Filters Toggle -->
				<div class="advanced-filter-toggle">
					<button type="button" id="advancedToggle" class="btn-advanced">
						<span class="filter-icon">
							<svg width="14" height="14" viewBox="0 0 24 24" fill="#2196F3">
								<path d="M4.25 5.61C6.27 8.2 10 13 10 13v6c0 .55.45 1 1 1h2c.55 0 1-.45 1-1v-6s3.72-4.8 5.74-7.39c.51-.66.04-1.61-.79-1.61H5.04c-.83 0-1.3.95-.79 1.61z" />
							</svg>
						</span>
						<span id="toggleText">Show More Filters</span>
						<span class="arrow-icon"></span>
					</button>
				</div>

				<!-- Optional Filters -->
				<div class="advanced-filters" id="advancedFilters">
					<div class="form-grid">
						<div class="form-group">
							<label for="scopeType">Scope Type</label>
							<input type="text" id="scopeType" name="scopeType" class="form-control" value="Public" readonly style="background: #e9ecef; cursor: not-allowed;" />
						</div>
						
						<div class="form-group">
							<label for="documentStatus">Document Status</label>
							<select id="documentStatus" name="documentStatus" class="form-control">
								<option value="">All Status</option>
								<option value="LIVE">Live</option>
								<option value="ARCHIVED">Archived</option>
							</select>
						</div>
						
						<div class="form-group">
							<label for="documentType">Document Type</label>
							<select id="documentType" name="documentType" class="form-control">
								<option value="ALL">All Types</option>
								<option value="General Instructions">General Instructions</option>
								<option value="User Manuals/Guidelines">User Manuals/Guidelines</option>
								<option value="Tender Conditions">Tender Conditions</option>
								<option value="Contract Conditions">Contract Conditions</option>
								<option value="Others">Others</option>
							</select>
						</div>
					</div>
				</div>

				<!-- Verification Section -->
				<div class="verification-section">
					<label>Verification Code:</label>
					<div class="verification-code" id="captchaDisplay">134251</div>
					<button type="button" class="refresh-btn" onclick="refreshCaptcha()" title="Refresh Captcha">
						<i class="bi bi-arrow-clockwise"></i>
					</button>
					<div style="display: flex; align-items: flex-start; gap: 12px; flex: 1;">
						<div style="position: relative; flex: 0 0 180px;">
							<input type="text" id="captchaInput" name="captchaInput" class="form-control" 
								   placeholder="Enter Code" maxlength="6" required>
						</div>
						<div id="captchaStatus" class="captcha-status"></div>
					</div>
				</div>

				<!-- Action Buttons -->
				<div class="action-buttons">
					<button type="button" id="filterBtn" class="btn btn-primary">
						<i class="bi bi-search"></i> Filter
					</button>
					<button class="btn btn-secondary" type="reset" id="btn-reset">
						<i class="bi bi-arrow-clockwise"></i> Reset
					</button>
				</div>
			</div>

			<!-- Results Section -->
			<div class="results-section" id="resultsSection" style="display: none;">
				<div class="results-header">
					<h3>Search Results</h3>
					<span class="total-count" id="totalRecords">Total: 0</span>
				</div>

				<!-- Pagination Controls -->
				<div class="pagination-controls" id="paginationControls">
					<div class="results-info">
						<div class="records-per-page">
							<label for="recordsPerPage">Show:</label>
							<select id="recordsPerPage">
								<option value="2">2 per page</option>
								<option value="5">5 per page</option>
								<option value="10" selected>10 per page</option>
								<option value="25">25 per page</option>
								<option value="50">50 per page</option>
							</select>
						</div>
					</div>
					<div class="pagination-nav">
						<div class="page-info" id="pageInfo">Page 1 of 1</div>
						<button class="pagination-btn" id="prevBtn" disabled>
							<i class="bi bi-chevron-left"></i> Previous
						</button>
						<button class="pagination-btn" id="nextBtn" disabled>
							Next <i class="bi bi-chevron-right"></i>
						</button>
					</div>
				</div>

				<table class="tender-table">
					<thead>
						<tr>
							<th>#</th>
							<th>Doc Description</th>
							<th>Version</th>
							<th>Document Type</th>
							<th>Upload On</th>
							<th>File Size (KB)</th>
							<th>Action</th>
						</tr>
					</thead>
					<tbody id="tableBody">
						<!-- Dynamic Data -->
					</tbody>
				</table>
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

	    	document.querySelectorAll('.sidebar a')
	    		.forEach(link => link.classList.remove('active-option'));
	    	el.classList.add('active-option');

	    	// Redirect to dummy login instead of direct function
	    	window.location.href = ctx + '/jsp/admin/home/login.jsp?redirect=' + option;

	    }

	    function openSidebar() { document.getElementById('mySidebar').style.width = '250px'; }
	    function closeSidebar() { document.getElementById('mySidebar').style.width = '0'; }
	      
		// Global variables for pagination and captcha
		let currentCaptcha = '134251';
		let captchaValidated = false;
		let allDocuments = [];
		let currentPage = 1;
		let recordsPerPage = 10;
		let totalRecords = 0;
		let totalPages = 0;

		// CAPTCHA FUNCTIONS
		function refreshCaptcha() {
			const codes = ['134251', '892736', '456789', '123456', '987654', '246810'];
			currentCaptcha = codes[Math.floor(Math.random() * codes.length)];
			document.getElementById('captchaDisplay').textContent = currentCaptcha;
			document.getElementById('captchaInput').value = '';
			document.getElementById('captchaStatus').innerHTML = '';
			captchaValidated = false;
		}

		$('#captchaInput').on('input', function() {
			var captchaValue = $(this).val().trim().toUpperCase();
			var displayedCaptcha = $('#captchaDisplay').text().trim().toUpperCase();

			if (captchaValue.length >= 4) {
				$('#captchaStatus').html('<i class="bi bi-hourglass-split"></i> Validating...')
					.removeClass('captcha-error captcha-success').addClass('captcha-validating');

				setTimeout(function() {
					if (captchaValue === displayedCaptcha) {
						$('#captchaStatus').html('<i class="bi bi-check-circle-fill"></i> Valid')
							.removeClass('captcha-error captcha-validating').addClass('captcha-success');
						$('#captchaInput').css('border-color', '#00b894');
						captchaValidated = true;
					} else {
						$('#captchaStatus').html('<i class="bi bi-x-circle-fill"></i> Invalid')
							.removeClass('captcha-success captcha-validating').addClass('captcha-error');
						$('#captchaInput').css('border-color', '#e17055');
						captchaValidated = false;
					}
				}, 800);
			} else {
				$('#captchaStatus').html('');
				$('#captchaInput').css('border-color', '#ddd');
				captchaValidated = false;
			}
		});

		// PAGINATION FUNCTIONS
		function updatePaginationInfo() {
			totalPages = Math.ceil(totalRecords / recordsPerPage);
			$('#totalRecords').text('Total: ' + totalRecords);
			$('#pageInfo').text('Page ' + currentPage + ' of ' + totalPages);
			$('#prevBtn').prop('disabled', currentPage <= 1);
			$('#nextBtn').prop('disabled', currentPage >= totalPages);
			
			if (totalRecords > 0) {
				$('#paginationControls').show();
				$('#resultsSection').show();
			} else {
				$('#paginationControls').hide();
			}
		}

		function displayCurrentPageData() {
			const startIndex = (currentPage - 1) * recordsPerPage;
			const endIndex = Math.min(startIndex + recordsPerPage, totalRecords);
			const currentPageData = allDocuments.slice(startIndex, endIndex);

			$('#tableBody').empty();

			if (currentPageData.length > 0) {
				$.each(currentPageData, function(index, doc) {
					const globalIndex = startIndex + index + 1;
					let row = '<tr>'
						+ '<td>' + globalIndex + '</td>'
						+ '<td>' + (doc.FILE_DESCRIPTION || '-') + '</td>'
						+ '<td>' + (doc.VERSION_NO || '-') + '</td>'
						+ '<td>' + (doc.DOC_TYPE_VAL || '-') + '</td>'
						+ '<td>' + (doc.UPLOAD_TIME || '-') + '</td>'
						+ '<td>' + (doc.FILE_SIZE || '-') + '</td>'
						+ '<td><a href="download/' + doc.DOCUMENT_ID + '" class="download-btn" title="Download Document">'
						+ '<svg class="download-icon" viewBox="0 0 24 24" fill="currentColor">'
						+ '<path d="M12 16L7 11h3V3h4v8h3l-5 5z"/>'
						+ '<path d="M20 18H4v-7H2v7c0 1.1.9 2 2 2h16c1.1 0 2-.9 2-2v-7h-2v7z"/>'
						+ '</svg>'
						+ '</a></td>'
						+ '</tr>';
					$('#tableBody').append(row);
				});
			} else {
				$('#tableBody').append('<tr><td colspan="7" class="no-data">No Records Found</td></tr>');
			}
		}

		// PAGINATION EVENT HANDLERS
		$('#prevBtn').click(function() {
			if (currentPage > 1) {
				currentPage--;
				updatePaginationInfo();
				displayCurrentPageData();
			}
		});

		$('#nextBtn').click(function() {
			if (currentPage < totalPages) {
				currentPage++;
				updatePaginationInfo();
				displayCurrentPageData();
			}
		});
		
		$('#recordsPerPage').change(function() {
			recordsPerPage = parseInt($(this).val());
			currentPage = 1;
			updatePaginationInfo();
			displayCurrentPageData();
		});

		// FORM VALIDATION FUNCTION
		function validateForm() {
			var isValid = true;
			$('.form-group').removeClass('error');
			$('.error-message').hide();

			if (!$('#organisation').val()) {
				$('#organisation').closest('.form-group').addClass('error');
				$('#organisationError').show();
				isValid = false;
			}

			if (!$('#zone').val()) {
				$('#zone').closest('.form-group').addClass('error');
				$('#zoneError').show();
				isValid = false;
			}

			if (!$('#department').val()) {
				$('#department').closest('.form-group').addClass('error');
				$('#departmentError').show();
				isValid = false;
			}

			if (!$('#captchaInput').val()) {
				$('#captchaInput').css('border-color', '#e17055');
				isValid = false;
			} else if (!captchaValidated) {
				$('#captchaInput').css('border-color', '#e17055');
				$('#captchaStatus').html('<i class="bi bi-x-circle-fill"></i> Invalid captcha')
					.removeClass('captcha-success captcha-validating').addClass('captcha-error');
				isValid = false;
			}

			return isValid;
		}

		// FILTER BUTTON CLICK
		$('#filterBtn').click(function(e) {
			e.preventDefault();
			
			if (!validateForm()) {
				alert('Please fill all required fields and enter a valid captcha before filtering.');
				return;
			}

			if (!captchaValidated) {
				alert('Please wait for captcha validation to complete.');
				return;
			}

			submitForm();
		});

		function submitForm() {
			console.log('Form is valid, proceeding with search...');
			$('#filterBtn').prop('disabled', true).html('<i class="bi bi-hourglass-split"></i> Loading...');

			let organisation = $('#organisation').val();
			let zone = $('#zone').val();
			let department = $('#department').val();
			let adminUnit = $('#adminUnitDropdown').val();
			let scopeType = $('#scopeType').val();
			let documentType = $('#documentType').val();
			let documentStatus = $('#documentStatus').val();

			let requestData = {
				organisation: organisation,
				zone: zone,
				department: department,
				scopeType: scopeType,
				documentType: documentType,
				documentStatus: documentStatus
			};
			
			if (adminUnit && adminUnit !== "") {
				requestData.adminUnit = adminUnit;
			} else {
				requestData.adminUnit = "ALL";
			}

			console.log('Request data:', requestData);

			$.ajax({
				url: '${pageContext.request.contextPath}/eps/viewireps/filterDocuments',
				type: 'POST',
				data: requestData,
				success: function(data) {
					console.log('Response received:', data);
					allDocuments = data;
					totalRecords = data.length;
					currentPage = 1;
					
					updatePaginationInfo();
					displayCurrentPageData();
					
					$('#filterBtn').prop('disabled', false).html('<i class="bi bi-search"></i> Filter');
				},
				error: function(xhr, status, error) {
					console.error('Error filtering documents:', error);
					allDocuments = [];
					totalRecords = 0;
					currentPage = 1;
					$('#tableBody').empty();
					$('#tableBody').append('<tr><td colspan="7" class="no-data" style="color: #e17055;">Error loading documents. Please try again.</td></tr>');
					$('#paginationControls').hide();
					$('#resultsSection').show();
					$('#filterBtn').prop('disabled', false).html('<i class="bi bi-search"></i> Filter');
				}
			});
		}

		// RESET BUTTON LOGIC 
		$('#btn-reset').click(function(e) {
			e.preventDefault();
			$('#organisation').val('');
			$('#zone').empty().append('<option value="">Select</option>');
			$('#department').empty().append('<option value="">Select</option>');
			$('#adminUnitDropdown').empty().append('<option value="">All</option>');
			refreshCaptcha();
			$('.form-group').removeClass('error');
			$('.error-message').hide();
			$('#captchaInput').css('border-color', '#ddd');
			$('#captchaStatus').html('');
			captchaValidated = false;
			allDocuments = [];
			totalRecords = 0;
			currentPage = 1;
			$('#paginationControls').hide();
			$('#resultsSection').hide();
			$('#tableBody').empty();
			
			$('#documentStatus').val('');
			$('#documentType').val('ALL');
			if ($('#advancedFilters').is(':visible')) {
				$('#advancedToggle').click();
			}
		});

		// ORGANISATION DROPDOWN
		$(document).ready(function() {
			$('#organisation').change(function() {
				var orgCode = $(this).val();
				var orgName = $(this).find('option:selected').text();
				
				console.log('Selected org:', {code: orgCode, name: orgName});
				
				$('#zone').empty().append('<option value="">Select</option>');
				$('#department').empty().append('<option value="">Select</option>');
				$('#adminUnitDropdown').empty().append('<option value="">All</option>');
				
				if (orgCode && orgCode !== "") {
					$('#zone').html('<option value="">Loading zones...</option>');
					
					$.ajax({
						url: '${pageContext.request.contextPath}/eps/viewireps/getZones/' + encodeURIComponent(orgCode),
						type: 'GET',
						dataType: 'json',
						timeout: 10000,
						success: function(data) {
							console.log('Zones data received:', data);
							
							var $zoneDropdown = $('#zone');
							$zoneDropdown.empty();
							$zoneDropdown.append($('<option>').attr('value', '').text('Select'));
							
							if (data && Array.isArray(data) && data.length > 0) {
								$.each(data, function(index, zone) {
									if (zone && zone.orgZone && zone.ouName) {
										var $option = $('<option>')
											.attr('value', zone.orgZone)
											.text(zone.ouName);
										$zoneDropdown.append($option);
									}
								});
								console.log('Zone options added:', $('#zone option').length);
							} else {
								$zoneDropdown.append($('<option>').attr('value', '').text('No zones available'));
							}
						},
						error: function(xhr, status, error) {
							console.error('Zone loading error:', {status: status, error: error});
							$('#zone').empty()
								.append('<option value="">Error loading zones</option>');
						}
					});
				}
			});
		});
		
		// ZONE DROPDOWN 
		$('#zone').change(function() {
			let orgCode = $('#organisation').val();
			let orgZone = $(this).val();
			let zoneName = $(this).find('option:selected').text();
			
			console.log('Selected zone:', {code: orgZone, name: zoneName, orgCode: orgCode});
			
			$('#department').empty().append('<option value="">Select</option>');
			$('#adminUnitDropdown').empty().append('<option value="">All</option>');
			
			if (orgCode && orgZone && orgCode !== "" && orgZone !== "") {
				$('#department').html('<option value="">Loading departments...</option>');
				
				$.ajax({
					url: '${pageContext.request.contextPath}/eps/viewireps/getDepartments/' + 
						 encodeURIComponent(orgCode) + '/' + encodeURIComponent(orgZone),
					type: 'GET',
					dataType: 'json',
					timeout: 10000,
					success: function(data) {
						console.log('Departments data received:', data);
						
						let $deptDropdown = $('#department');
						$deptDropdown.empty();
						$deptDropdown.append($('<option>').attr('value', '').text('Select'));
						
						if (data && Array.isArray(data) && data.length > 0) {
							$.each(data, function(i, dept) {
								if (dept && dept.orgSubunitDept && dept.subUnitDeptName) {
									var $option = $('<option>')
										.attr('value', dept.orgSubunitDept)
										.text(dept.subUnitDeptName);
									$deptDropdown.append($option);
								}
							});
							console.log('Department options added:', $('#department option').length);
						} else {
							$deptDropdown.append($('<option>').attr('value', '').text('No departments available'));
						}
					},
					error: function(xhr, status, error) {
						console.error('Department loading error:', {status: status, error: error});
						$('#department').empty()
							.append('<option value="">Error loading departments</option>');
					}
				});
			}
		});

		// ADMIN UNIT DROPDOWN
		function loadAdminUnits(orgCode, orgZone, subDept) {
			$('#adminUnitDropdown').empty().append('<option value="">All</option>');
			
			if (orgCode && orgZone && subDept && orgCode !== "" && orgZone !== "" && subDept !== "") {
				$('#adminUnitDropdown').html('<option value="">Loading admin units...</option>');
				
				$.ajax({
					url: '${pageContext.request.contextPath}/eps/viewireps/getAdminUnits/' + 
						 encodeURIComponent(orgCode) + '/' + encodeURIComponent(orgZone) + '/' + encodeURIComponent(subDept),
					type: 'GET',
					dataType: 'json',
					timeout: 10000,
					success: function(data) {
						console.log('Admin units data received:', data);
						
						let $dropdown = $('#adminUnitDropdown');
						$dropdown.empty();
						$dropdown.append($('<option>').attr('value', '').text('All'));
						
						if (data && Array.isArray(data) && data.length > 0) {
							$.each(data, function(index, item) {
								if (item && item.code && item.name) {
									var $option = $('<option>')
										.attr('value', item.code)
										.text(item.name);
									$dropdown.append($option);
								}
							});
							console.log('Admin unit options added:', $('#adminUnitDropdown option').length);
						} else {
							$dropdown.append($('<option>').attr('value', '').text('No admin units available'));
						}
					},
					error: function(xhr, status, error) {
						console.error("Admin units loading error:", {status: status, error: error});
						$('#adminUnitDropdown').empty()
							.append('<option value="">Error loading admin units</option>');
					}
				});
			}
		}

		$('#department').change(function() {
			let orgCode = $('#organisation').val();
			let orgZone = $('#zone').val();
			let subDept = $(this).val();
			let deptName = $(this).find('option:selected').text();
			
			console.log('Selected department:', {code: subDept, name: deptName});
			
			loadAdminUnits(orgCode, orgZone, subDept);
		});

		// Advanced filters toggle
		const advancedToggle = document.getElementById('advancedToggle');
		const advancedFilters = document.getElementById('advancedFilters');
		const toggleText = document.getElementById('toggleText');

		if (advancedToggle && advancedFilters && toggleText) {
			advancedToggle.addEventListener('click', function () {
				if (advancedFilters.style.display === 'none' || advancedFilters.style.display === '') {
					advancedFilters.style.display = 'block';
					toggleText.textContent = 'Hide More Filters';
					advancedToggle.classList.add('open');
				} else {
					advancedFilters.style.display = 'none';
					toggleText.textContent = 'Show More Filters';
					advancedToggle.classList.remove('open');
				}
			});
		}

		// Initialize page
		$(document).ready(function() {
			refreshCaptcha();
			$('#resultsSection').hide();

			$('select, input').on('focus', function() {
				$(this).css('transform', 'scale(1.02)');
			}).on('blur', function() {
				$(this).css('transform', 'scale(1)');
			});

			$(document).on('mouseenter', '.download-btn', function() {
				$(this).find('.download-icon').css('transform', 'scale(1.1)');
			});

			$(document).on('mouseleave', '.download-btn', function() {
				$(this).find('.download-icon').css('transform', 'scale(1)');
			});

			console.log('IREPS Document View Form initialized');
		});
	</script>
	<script 
    src="https://translation-plugin.bhashini.co.in/v3/website_translation_utility.js"
    language-icon-color="#ffffff">
</script>
<script src="${pageContext.request.contextPath}/assets/bhashini/bhashini-init.js"></script>
</body>
</html>