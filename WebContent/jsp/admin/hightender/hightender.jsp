<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>High Value Tender Search - IREPS</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/accessibility/accessibility.css">
<script src="${pageContext.request.contextPath}/assets/accessibility/accessibility.js" defer></script>	
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
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

.form-grid {
	display: grid;
	grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
	gap: 16px;
	margin-bottom: 12px;
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

.section-label {
	font-size: 14px;
	font-weight: 600;
	color: #495057;
	margin-left: 20px;
	position: relative;
	z-index: 2;
	background: #f8f9fa;
	padding: 0 8px;
	display: inline-block;
	font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
	transform: translateY(10px);
}

.report-type-section {
	background: white;
	padding: 16px 12px 12px 12px;
	border-radius: 12px;
	border: 1px solid #dee2e6;
	box-shadow: 0 2px 8px rgba(0, 0, 0, 0.05);
	margin-top: -5px;
	margin-bottom: 16px;
}

.report-type-display {
	background: #f8f9fa;
	border: 1px solid #e9ecef;
	border-radius: 8px;
	padding: 7px 10px;
	display: flex;
	align-items: center;
	gap: 10px;
	transition: all 0.3s ease;
}

.report-type-display input[type="radio"] {
	-webkit-appearance: none;
	appearance: none;
	width: 18px;
	height: 18px;
	min-width: 18px;
	min-height: 18px;
	border: 2px solid #74b9ff;
	border-radius: 50%;
	cursor: pointer;
	position: relative;
	background-color: #fff;
	margin: 0;
	flex-shrink: 0;
}

.report-type-display input[type="radio"]:checked {
	background-color: #000;
	border-color: #000;
}

.report-type-display input[type="radio"]:checked::after {
	content: '';
	position: absolute;
	top: 50%;
	left: 50%;
	width: 4px;
	height: 8px;
	border: solid white;
	border-width: 0 2px 2px 0;
	transform: translate(-50%, -50%) rotate(45deg);
}

.report-type-display label {
	font-size: 14px;
	font-weight: 500;
	color: #2d3436;
	cursor: pointer;
	margin: 0;
	font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
}

.report-for-container {
	background: white;
	padding: 16px 12px 8px 12px;
	border-radius: 12px;
	border: 1px solid #dee2e6;
	box-shadow: 0 2px 8px rgba(0, 0, 0, 0.05);
	margin-top: -5px;
	margin-bottom: 16px;
}

.work-area-section {
	background: #f8f9fa;
	border: 1px solid #e9ecef;
	border-radius: 8px;
	padding: 12px;
	margin-bottom: 0;
}

.radio-group {
	display: flex;
	flex-direction: row;
	gap: 16px;
	flex-wrap: wrap;
}

.radio-option {
	display: flex;
	align-items: center;
	gap: 10px;
	padding: 7px 10px;
	border-radius: 8px;
	transition: all 0.3s ease;
	background: #f8f9fa;
	border: 1px solid #e9ecef;
	white-space: nowrap;
	flex-shrink: 0;
}

.radio-option:hover {
	background: #e9ecef;
	transform: translateY(-1px);
	box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
}

.radio-option input[type="radio"] {
	-webkit-appearance: none;
	-moz-appearance: none;
	appearance: none;
	width: 18px !important;
	height: 18px !important;
	min-width: 18px !important;
	min-height: 18px !important;
	border: 2px solid #74b9ff !important;
	border-radius: 50% !important;
	cursor: pointer;
	position: relative;
	background-color: #fff !important;
	margin: 0 !important;
	padding: 0 !important;
	flex-shrink: 0;
	outline: none;
}

.radio-option input[type="radio"]:checked {
	background-color: #000 !important;
	border-color: #000 !important;
}

.radio-option input[type="radio"]:checked::after {
	content: '';
	position: absolute;
	top: 50%;
	left: 50%;
	width: 4px;
	height: 8px;
	border: solid white;
	border-width: 0 2px 2px 0;
	transform: translate(-50%, -50%) rotate(45deg);
	display: block;
}

.radio-option label {
	font-size: 14px;
	font-weight: 500;
	color: #2d3436;
	cursor: pointer;
	margin: 0;
	font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
}

.date-range-section {
	display: grid;
	grid-template-columns: 1fr auto 1fr;
	gap: 12px;
	align-items: center;
}

.date-separator {
	font-weight: 600;
	color: #2d3436;
	text-align: center;
	font-size: 14px;
	background: #f8f9fa;
	padding: 7px 10px;
	border-radius: 6px;
}

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

.tender-table .tender-no {
	font-weight: 700;
	color: #1a4480;
	font-size: 14px;
}

.tender-table .tender-title {
	text-align: left;
	max-width: 300px;
	word-wrap: break-word;
	line-height: 1.4;
}

.no-results {
	text-align: center;
	padding: 30px;
	color: #666;
	font-size: 16px;
	background: #f8f9fa;
	border-radius: 12px;
	border: 2px dashed #dee2e6;
}

.footer {
position: sticky;
    bottom: 0;
    z-index: 999;
    background-color: #05173c;
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
}

.footer img {
    height: 50px;
    vertical-align: middle;
}

.footer-text {
    margin-left: 10px;
}

@media (max-width: 768px) {
	.form-grid {
		grid-template-columns: 1fr;
	}

	.date-range-section {
		grid-template-columns: 1fr;
	}

	.date-separator {
		display: none;
	}

	.radio-group {
		flex-direction: column;
	}

	.tender-table {
		font-size: 12px;
	}

	.tender-table th,
	.tender-table td {
		padding: 8px 6px;
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
<div class="main-container">
	<div class="search-card">
		<div class="search-header">
			<h3><i class="bi bi-currency-rupee me-2"></i>High Value Tenders (Above 100 Cr)</h3>
		</div>

		<div class="search-content">
			<form:form action="${pageContext.request.contextPath}/eps/hightender/searchTenders"
					   method="post"
					   modelAttribute="searchCriteria"
					   id="searchForm">

				<!-- Report Type Section -->
				<div class="section-label">Report Type</div>
				<div class="report-type-section">
					<div class="report-type-display">
						<input type="radio" name="reportType" id="zoneUnitWise" value="zoneUnitWise" checked />
						<label for="zoneUnitWise">Zone-Unit Wise</label>
					</div>
				</div>

				<!-- Report For Section -->
				<div class="section-label">Report For</div>
				<div class="report-for-container">
					<div class="form-grid">
						<div class="form-group">
							<label>Organization <span class="required">*</span></label>
							<form:select path="organization" class="form-control" id="organization" onchange="loadZones()">
								<form:option value="-1">Select</form:option>
								<form:options items="${orgList}" itemValue="intCode" itemLabel="value" />
							</form:select>
						</div>

						<div class="form-group">
							<label>Zone</label>
							<select id="zone" name="zone" class="form-control">
								<option value="-1">All Zones</option>
							</select>
						</div>

						<div class="form-group">
							<label>Department</label>
							<form:select path="department" class="form-control" id="department">
								<form:option value="-1">All Department</form:option>
							</form:select>
						</div>

						<div class="form-group">
							<label>Unit</label>
							<form:select path="unit" class="form-control" id="unit">
								<form:option value="-1">All</form:option>
							</form:select>
						</div>
					</div>

					<div class="form-grid">
						<div class="form-group">
							<label>Work Area</label>
							<div class="work-area-section">
								<div class="radio-group">
									<div class="radio-option">
										<form:radiobutton path="workArea" value="PT" id="goods" />
										<label for="goods">Goods & Services</label>
									</div>
									<div class="radio-option">
										<form:radiobutton path="workArea" value="WT" id="works" />
										<label for="works">Works</label>
									</div>
									<div class="radio-option">
										<form:radiobutton path="workArea" value="LT" id="earning" />
										<label for="earning">Earning & Leasing</label>
									</div>
								</div>
							</div>
						</div>

						<div class="form-group">
							<label>Publish Date Range</label>
							<div class="date-range-section">
								<form:input path="fromDate" type="date" class="form-control" value="2025-04-01" />
								<div class="date-separator">To</div>
								<form:input path="toDate" type="date" class="form-control" id="toDate" />
							</div>
						</div>
					</div>
				</div>

				<div class="action-buttons">
					<button type="submit" class="btn btn-primary">Search Tenders</button>
					<button type="button" class="btn btn-secondary" onclick="resetForm()">Close</button>
				</div>
			</form:form>
		</div>

		<!-- Results Section -->
		<c:if test="${not empty tenderResults}">
			<div class="results-section">
				<div class="results-header">
					<h3>Search Results</h3>
					<span class="total-count" id="totalCount">Total: ${resultCount}</span>
				</div>

				<!-- Pagination Controls -->
				<div class="pagination-controls" id="paginationControls">
					<div class="results-info">
						<div class="records-per-page">
							<label for="recordsPerPage">Show:</label>
							<select id="recordsPerPage">
								<option value="5">5 per page</option>
								<option value="10" selected>10 per page</option>
								<option value="25">25 per page</option>
								<option value="50">50 per page</option>
								<option value="100">100 per page</option>
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

				<table class="tender-table">
					<thead>
						<tr>
							<th style="width:50px;">#</th>
							<th style="width:100px;">Zone</th>
							<th style="width:150px;">Rly Dept</th>
							<th style="width:150px;">Unit</th>
							<th style="width:180px;">Tender No</th>
							<th style="width:150px;">Closing Date</th>
							<th style="width:400px;">Tender Description</th>
							<th style="width:120px;">Tender Type</th>
						</tr>
					</thead>
					<tbody id="tenderTableBody">
						<!-- Data will be populated by JavaScript -->
					</tbody>
				</table>
			</div>
		</c:if>

		<c:if test="${empty tenderResults and not empty searched}">
			<div class="results-section">
				<div class="no-results">
					<p>No tenders found matching your search criteria. Please adjust your filters and try again.</p>
				</div>
			</div>
		</c:if>
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
function logoutNow() {
    alert("Logout Successful");

    // ✅ JSP context path use karte hue redirect
    const ctx = "<%= request.getContextPath() %>";
    window.location.href = ctx + "/logonBody.jsp";
}
// Global pagination variables
let allTenders = [];
let currentPage = 1;
let recordsPerPage = 10;
let totalPages = 1;

// Store tender data from server
<c:if test="${not empty tenderResults}">
allTenders = [
	<c:forEach var="tender" items="${tenderResults}" varStatus="status">
	{
		zone: "${tender.zone}",
		dept: "${tender.dept}",
		deptName: "${tender.deptName}",
		tenderNumber: "${tender.tenderNumber}",
		tenderOpeningDate: "${tender.tenderOpeningDate}",
		tenderDescription: "${tender.tenderDescription}",
		tenderType: "${tender.tenderType}"
	}<c:if test="${!status.last}">,</c:if>
	</c:forEach>
];
</c:if>

$(document).ready(function() {
	// Initialize pagination if we have results
	if (allTenders.length > 0) {
		updatePaginationInfo();
		displayCurrentPageData();
	}

	// Records per page change handler
	$("#recordsPerPage").change(function() {
		recordsPerPage = parseInt($(this).val());
		currentPage = 1;
		updatePaginationInfo();
		displayCurrentPageData();
	});

	// Previous button click
	$("#prevPage").click(function() {
		if (currentPage > 1) {
			currentPage--;
			updatePaginationInfo();
			displayCurrentPageData();
		}
	});

	// Next button click
	$("#nextPage").click(function() {
		if (currentPage < totalPages) {
			currentPage++;
			updatePaginationInfo();
			displayCurrentPageData();
		}
	});

	// Helper: Reset dropdowns
	function resetDropdowns() {
		$("#zone").html("<option value='-1'>Select Zone</option>");
		$("#department").html("<option value='-1'>Select Department</option>");
		$("#unit").html("<option value='-1'>All Units</option>");
	}

	// Pagination Functions
	function updatePaginationInfo() {
		const totalRecords = allTenders.length;
		totalPages = Math.ceil(totalRecords / recordsPerPage);
		
		$("#totalCount").text("Total: " + totalRecords);
		$("#pageInfo").text("Page " + currentPage + " of " + totalPages);
		
		$("#prevPage").prop("disabled", currentPage <= 1);
		$("#nextPage").prop("disabled", currentPage >= totalPages);
	}

	function displayCurrentPageData() {
		const startIndex = (currentPage - 1) * recordsPerPage;
		const endIndex = Math.min(startIndex + recordsPerPage, allTenders.length);
		const currentPageData = allTenders.slice(startIndex, endIndex);

		let rows = "";
		if (currentPageData.length > 0) {
			$.each(currentPageData, function(index, tender) {
				const globalIndex = startIndex + index + 1;
				rows += '<tr>' +
					'<td>' + globalIndex + '</td>' +
					'<td>' + tender.zone + '</td>' +
					'<td>' + tender.dept + '</td>' +
					'<td>' + tender.deptName + '</td>' +
					'<td class="tender-no"><a href="#" class="tender-link">' + tender.tenderNumber + '</a></td>' +
					'<td>' + tender.tenderOpeningDate + '</td>' +
					'<td class="tender-title">' + tender.tenderDescription + '</td>' +
					'<td>' + tender.tenderType + '</td>' +
					'</tr>';
			});
		} else {
			rows = '<tr><td colspan="8" class="no-results">No records found</td></tr>';
		}
		
		$("#tenderTableBody").html(rows);
	}

	// Load Zones via AJAX
	function loadZones(orgCode, selectedZone) {
		return $.ajax({
			url: "<c:url value='/eps/hightender/getZones'/>",
			type: "GET",
			data: { orgCode: orgCode },
			success: function(data) {
				var zoneDropdown = $("#zone");
				zoneDropdown.empty().append("<option value='-1'>All Zone</option>");
				$.each(data, function(i, zone) {
					zoneDropdown.append("<option value='" + zone.zoneCode + "'>" + zone.zoneName + "</option>");
				});
				
				if (selectedZone && selectedZone !== "-1") {
					zoneDropdown.val(selectedZone);
				}
			},
			error: function(err) {
				console.error("Error loading zones:", err);
			}
		});
	}

	// Load Departments via AJAX
	function loadDepartments(orgCode, zoneCode, selectedDept) {
		return $.ajax({
			url: "<c:url value='/eps/hightender/getDepartments'/>",
			type: "GET",
			data: { orgCode: orgCode, zoneCode: zoneCode },
			success: function(data) {
				var deptDropdown = $("#department");
				deptDropdown.empty().append("<option value='-1'>All Department</option>");
				$.each(data, function(i, dept) {
					deptDropdown.append("<option value='" + dept.deptCode + "'>" + dept.deptName + "</option>");
				});
				
				if (selectedDept && selectedDept !== "-1") {
					deptDropdown.val(selectedDept);
				}
			},
			error: function(err) {
				console.error("Error loading departments:", err);
			}
		});
	}

	// Load Units via AJAX
	function loadUnits(zoneCode, deptCode, selectedUnit) {
		return $.ajax({
			url: "<c:url value='/eps/hightender/getUnits'/>",
			type: "GET",
			data: { zoneCode: zoneCode, deptCode: deptCode },
			success: function(data) {
				var unitDropdown = $("#unit");
				unitDropdown.empty().append("<option value='-1'>All</option>");
				$.each(data, function(i, unit) {
					unitDropdown.append("<option value='" + unit.unitCode + "'>" + unit.unitName + "</option>");
				});
				
				if (selectedUnit && selectedUnit !== "-1") {
					unitDropdown.val(selectedUnit);
				}
			},
			error: function(err) {
				console.error("Error loading units:", err);
			}
		});
	}

	// Organization change
	$("#organization").change(function() {
		var orgCode = $(this).val();
		if (orgCode === "-1") {
			resetDropdowns();
			return;
		}
		loadZones(orgCode);
		$("#department").html("<option value='-1'>Select Department</option>");
		$("#unit").html("<option value='-1'>All Units</option>");
	});

	// Zone change
	$("#zone").change(function() {
		var orgCode = $("#organization").val();
		var zoneCode = $(this).val();
		
		if (!orgCode || orgCode === "-1" || zoneCode === "-1") {
			$("#department").html("<option value='-1'>Select Department</option>");
			$("#unit").html("<option value='-1'>All Units</option>");
			return;
		}

		loadDepartments(orgCode, zoneCode);
		$("#unit").html("<option value='-1'>All Units</option>");
	});

	// Department change
	$("#department").change(function() {
		var zoneCode = $("#zone").val();
		var deptCode = $(this).val();

		if (!zoneCode || zoneCode === "-1" || !deptCode || deptCode === "-1") {
			$("#unit").html("<option value='-1'>All Units</option>");
			return;
		}

		loadUnits(zoneCode, deptCode);
	});

	// Restore selected values on page load
	var selectedOrg = "${searchCriteria.organization}";
	var selectedZone = "${searchCriteria.zone}";
	var selectedDept = "${searchCriteria.department}";
	var selectedUnit = "${searchCriteria.unit}";
	var selectedWorkArea = "${searchCriteria.workArea}";

	if (selectedOrg && selectedOrg !== "-1") {
		$("#organization").val(selectedOrg);
		
		if (selectedZone && selectedZone !== "-1") {
			loadZones(selectedOrg, selectedZone).done(function() {
				
				if (selectedDept && selectedDept !== "-1") {
					loadDepartments(selectedOrg, selectedZone, selectedDept).done(function() {
						
						if (selectedUnit && selectedUnit !== "-1") {
							loadUnits(selectedZone, selectedDept, selectedUnit);
						}
					});
				}
			});
		}
	}

	if (selectedWorkArea) {
		$("input[name='workArea'][value='" + selectedWorkArea + "']").prop('checked', true);
	}

	// Sticky To Date
	const toDateInput = document.getElementById("toDate");
	if (!toDateInput.value) {
		const today = new Date().toISOString().split('T')[0];
		toDateInput.value = today;
	}

	// Form validation
	$("#searchForm").submit(function(e) {
		if ($("#organization").val() === "-1") {
			alert("Please select an Organization before searching.");
			$("#organization").focus();
			e.preventDefault();
			return false;
		}
	});

	// Reset Form
	window.resetForm = function() {
		$("#searchForm")[0].reset();
		resetDropdowns();
		$("input[name='workArea']").prop('checked', false);
	};

	// Prevent form resubmission on refresh
	if (window.history.replaceState) {
		window.history.replaceState(null, null, window.location.href);
	}
});
</script>

</body>
</html>