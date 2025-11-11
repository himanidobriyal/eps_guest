<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="en">
<head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/accessibility/accessibility.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Government eMarketplace - Indian Railways E-Procurement System</title>
<style>
	* {
		margin: 0;
		padding: 0;
		box-sizing: border-box;
	}
	
	html {
		height: 100%;
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

	/* Main Container */
	.main-container {
	    flex: 1;
	    max-width: 100%;
	    margin: 0;  /* 12px 0px se change karo */
	    padding: 0;
	    overflow-y: auto;
	}
	
	/* Search Card */
	.search-card {
		background: rgba(255, 255, 255, 0.98);
		backdrop-filter: blur(15px);
		border-radius: 20px;
		box-shadow: 0 20px 60px rgba(0, 0, 0, 0.1);
		overflow: visible;
		max-width: 1400px;
		width: 100%;
		margin: 0 auto 10px auto;
		display: flex;
		flex-direction: column;
	}
	
	.search-header {
	    background: white;
	    color: #2c5aa0;
	    text-align: center;
	    position: relative;
	    border-bottom: 3px solid #2c5aa0;
	    padding: 10px 0;
	}
	
	.search-header h2 {
		font-size: 26px;
		position: relative;
		z-index: 1;
		text-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
		letter-spacing: 0.5px;
		margin: 0;
		color: #2c5aa0;
	}
	
	/* Navigation Tabs */
	.nav-tabs-container {
		background: #f8f9fa;
		padding: 12px 25px;
		border-bottom: 2px solid #e9ecef;
	}
	
	.nav-tabs {
		display: flex;
		gap: 10px;
		justify-content: flex-start;
		flex-wrap: wrap;
	}
	
	.nav-tab {
		padding: 10px 20px;
		border: 2px solid #dee2e6;
		border-radius: 20px;
		background: white;
		color: #495057;
		text-decoration: none;
		font-size: 14px;
		font-weight: 600;
		transition: all 0.3s ease;
		cursor: pointer;
		white-space: nowrap;
		display: inline-block;
		flex-shrink: 0;
		text-align: center;
		min-width: 180px;
		font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
	}
	
	.nav-tab:hover {
		border-color: #007bff;
		background: #e3f2fd;
		color: #007bff;
		transform: translateY(-1px);
		text-decoration: none;
	}
	
	.nav-tab.active {
		background: #007bff;
		color: white;
		border-color: #007bff;
		box-shadow: 0 4px 8px rgba(0, 123, 255, 0.3);
	}
	
	/* Search Content */
	.search-content {
		padding: 15px 25px;
	}
	
	.search-info {
		color: #1565c0;
		padding: 5px 0;
		margin-bottom: 8px;
		font-size: 14px;
		line-height: 1.5;
	}
	
	.form-grid {
		display: grid;
		grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
		gap: 12px;
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
	
	/* Catalogue + Date Row */
	.catalogue-date-row {
		grid-column: 1/-1;
		display: grid;
		grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
		gap: 12px;
		margin-top: 0px;
		transition: all 0.3s ease;
	}
	
	.catalogue-group, .date-group {
		display: flex;
		flex-direction: column;
		width: 100%;
		min-width: 0;
	}
	
	.date-group {
		transition: opacity 0.3s ease, transform 0.3s ease;
	}
	
	.date-group input[type="date"] {
		padding: 10px 14px;
		border-radius: 10px;
		border: 2px solid #ddd;
		font-size: 14px;
		font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
		font-weight: 500;
		transition: border 0.2s ease, box-shadow 0.2s ease;
		width: 100%;
		min-height: 42px;
	}
	
	.date-group input[type="date"]:focus {
		border-color: #74b9ff;
		box-shadow: 0 0 0 3px rgba(116, 185, 255, 0.1);
		outline: none;
	}
	
	/* Hide dates for Live Auction */
	.hide-dates .date-group {
		display: none;
	}
	
	.hide-dates .catalogue-date-row {
		display: flex;
		justify-content: center;
		align-items: center;
	}
	
	.hide-dates .catalogue-group {
		width: 30%;
		min-width: 250px;
		max-width: 400px;
	}
	
	/* Action Buttons */
	.action-buttons {
		display: flex;
		justify-content: center;
		gap: 15px;
		margin-top: 12px;
	}
	
	.btn {
		padding: 10px 30px;
		border: none;
		border-radius: 50px;
		font-size: 15px;
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
	
	/* Results Section */
	.results-section {
		padding: 15px 25px 30px 25px;
		background: white;
		max-width: 1400px;
		margin: 0 auto;
		flex: 1 0 auto;
	}
	
	.results-header {
		background: linear-gradient(135deg, #2c5aa0 0%, #1a4480 50%, #0f3460 100%);
		color: white;
		padding: 12px 20px;
		border-radius: 12px;
		margin-bottom: 12px;
		box-shadow: 0 4px 15px rgba(44, 90, 160, 0.3);
		display: flex;
		justify-content: space-between;
		align-items: center;
	}
	
	.results-header h3 {
		font-size: 20px;
		font-weight: 700;
		text-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
		letter-spacing: 0.5px;
		margin: 0;
		color: white;
	}
	
	.results-header .total-count {
		font-size: 16px;
		font-weight: 600;
		color: white;
	}
	
	/* Pagination Controls */
	.pagination-controls {
		display: flex;
		justify-content: space-between;
		align-items: center;
		margin-bottom: 12px;
		padding: 10px 18px;
		background: linear-gradient(135deg, #f8fbff 0%, #e8f2ff 100%);
		border-radius: 12px;
		border: 2px solid rgba(42, 82, 152, 0.1);
		box-shadow: 0 4px 12px rgba(42, 82, 152, 0.1);
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
		padding: 6px 10px;
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
		gap: 8px;
	}
	
	.page-info {
		font-weight: 600;
		color: #1e3c72;
		padding: 6px 12px;
		background: rgba(255, 255, 255, 0.7);
		border-radius: 12px;
		border: 2px solid rgba(42, 82, 152, 0.2);
		font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
	}
	
	.pagination-btn {
		background: linear-gradient(135deg, #2a5298 0%, #1e3c72 100%);
		color: white;
		border: none;
		padding: 8px 12px;
		border-radius: 8px;
		cursor: pointer;
		font-weight: 600;
		transition: all 0.3s ease;
		display: flex;
		align-items: center;
		gap: 4px;
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
	
	/* Table Styling */
	.table-responsive {
		border-radius: 12px;
		overflow: hidden;
		box-shadow: 0 6px 20px rgba(0, 0, 0, 0.1);
		margin-bottom: 0;
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
		font-size: 13px;
		text-align: left;
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
		text-align: center;
		vertical-align: middle;
	}
	
	.modern-table td:first-child {
		font-weight: 600;
	}
	
	/* Action Icons - FIXED */
	.action-icons {
		display: flex;
		justify-content: center;
		align-items: center;
		gap: 8px;
		white-space: nowrap;
	}
	
	.action-icon {
		display: inline-flex;
		align-items: center;
		justify-content: center;
		width: 32px;
		height: 32px;
		background-color: transparent;
		border: 1px solid;
		border-radius: 6px;
		text-decoration: none;
		transition: all 0.3s cubic-bezier(0.25, 0.8, 0.25, 1);
		overflow: hidden;
		position: relative;
		z-index: 1;
		cursor: pointer;
	}
	
	.action-icon i {
		position: relative;
		z-index: 2;
		transition: transform 0.3s ease;
	}
	
	.action-icon:hover i {
		transform: scale(1.1);
	}
	
	.action-icon::before {
		content: '';
		position: absolute;
		top: 0;
		left: 0;
		width: 100%;
		height: 100%;
		transform: scaleX(0);
		transform-origin: left;
		transition: transform 0.3s cubic-bezier(0.25, 0.8, 0.25, 1);
		z-index: 1;
	}
	
	.action-icon:hover::before {
		transform: scaleX(1);
	}
	
	/* Catalogue Icon - Yellow/Warning */
	.action-icon.catalogue-icon {
		border-color: #ffc107;
	}
	
	.action-icon.catalogue-icon::before {
		background-color: #ffc107;
	}
	
	.action-icon.catalogue-icon:hover {
		border-color: #ffc107;
		box-shadow: 0 4px 8px rgba(255, 193, 7, 0.3);
	}
	
	/* Corrigendum Icon - Red/Danger */
	.action-icon.corrigendum-icon {
		border-color: #dc3545;
	}
	
	.action-icon.corrigendum-icon::before {
		background-color: #dc3545;
	}
	
	.action-icon.corrigendum-icon:hover {
		border-color: #dc3545;
		box-shadow: 0 4px 8px rgba(220, 53, 69, 0.3);
	}
	
	/* Taxes Icon - Green/Success */
	.action-icon.taxes-icon {
		border-color: #28a745;
	}
	
	.action-icon.taxes-icon::before {
		background-color: #28a745;
	}
	
	.action-icon.taxes-icon:hover {
		border-color: #28a745;
		box-shadow: 0 4px 8px rgba(40, 167, 69, 0.3);
	}
	
	.action-icon:hover i {
		color: white !important;
	}
	
	/* Modal Styling */
	.modal {
		position: fixed;
		top: 0;
		left: 0;
		width: 100%;
		height: 100%;
		background-color: rgba(0, 0, 0, 0.4);
		display: flex;
		justify-content: center;
		align-items: center;
		overflow: auto;
		z-index: 9999;
	}
	
	.modal-content {
		background: #fff;
		width: 85%;
		max-width: 1200px;
		max-height: 90vh;
		padding: 30px;
		border-radius: 12px;
		box-shadow: 0 8px 25px rgba(0, 0, 0, 0.4);
		overflow: auto;
	}
	
	.close {
		float: right;
		font-size: 28px;
		cursor: pointer;
		color: #444;
		transition: color 0.3s ease;
	}
	
	.close:hover {
		color: red;
	}
	
	/* Footer */
	.footer {
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
		width: auto;
		vertical-align: middle;
		object-fit: contain;
	}
	
	.footer-text {
		margin-left: 10px;
	}
	
	/* Responsive */
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
		
		.nav-tabs {
			flex-direction: column;
			gap: 8px;
		}
		
		.nav-tab {
			width: 100%;
		}
	}
	</style>
</head>
<body>

<!-- Header -->
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

<!-- Main Content -->
<div class="main-container">
	<div class="search-card">
		<div class="search-header">
			<h2>E-Auctions Leasing</h2>
		</div>
		
		<div class="nav-tabs-container">
			<div class="nav-tabs">
				<a href="?type=live"
					class="nav-tab ${auctionType == 'Live' ? 'active' : ''}"
					data-tab="live"> Live E-Auctions Leasing </a> 
				<a href="?type=upcoming"
					class="nav-tab ${auctionType == 'Upcoming' ? 'active' : ''}"
					data-tab="upcoming"> Upcoming E-Auctions Leasing </a> 
				<a href="?type=closed"
					class="nav-tab ${auctionType == 'Closed' ? 'active' : ''}"
					data-tab="closed"> Closed E-Auctions Leasing </a>
			</div>
		</div>

		<form method="get"
			action="${pageContext.request.contextPath}/eps/auction/show.do"
			class="search-form ${auctionType == 'Live' ? 'hide-dates' : ''}">
			
			<div class="search-content">
				<div class="search-info">
					Search and view E-Auction details by selecting Organization, Zone, Unit, and other criteria
				</div>
				
				<div class="form-grid">
					<div class="form-group">
						<label>Organization</label> 
						<select id="organisationDropdown" name="orgCode" class="form-select">
							<option value="">-- Select Organisation --</option>
							<c:forEach var="org" items="${organisations}">
								<option value="${org.orgCode}"
									<c:if test="${org.orgCode == selectedOrgCode}">selected</c:if>>
									${org.ouName}</option>
							</c:forEach>
						</select>
					</div>
					
					<div class="form-group">
						<label>Zone</label> 
						<select id="zoneDropdown" name="zoneCode" class="form-select">
							<option value="">-- Select Zone --</option>
							<c:forEach var="zone" items="${zones}">
								<option value="${zone.intCode}"
									<c:if test="${zone.intCode == selectedZoneCode}">selected</c:if>>
									${zone.value}</option>
							</c:forEach>
						</select>
					</div>
					
					<div class="form-group">
						<label>Unit</label> 
						<select id="unitDropdown" name="unitCode" class="form-select">
							<option value="">-- Select Unit --</option>
							<c:forEach var="unit" items="${units}">
								<option value="${unit.intCode}"
									<c:if test="${unit.intCode == selectedUnitCode}">selected</c:if>>
									${unit.value}</option>
							</c:forEach>
						</select>
					</div>
					
					<div class="form-group">
						<label>Category</label> 
						<select id="categoryDropdown" name="categoryId" class="form-select">
							<option value="">-- Select Category --</option>
							<c:forEach var="cat" items="${categories}">
								<option value="${cat.categoryId}"
									<c:if test="${cat.categoryId == selectedCategoryId}">selected</c:if>>
									${cat.categoryName}</option>
							</c:forEach>
						</select>
					</div>
					
					<input type="hidden" name="type" value="${auctionType.toLowerCase()}" />

					<div class="catalogue-date-row">
						<div class="catalogue-group">
							<label>Catalogue No.</label> 
							<input type="text" class="form-control" name="catalogNo"
								placeholder="Enter catalogue number">
						</div>
						<div class="date-group">
							<label>Auction Date From</label> 
							<input type="date" class="form-control" name="fromDate" value="2025-01-01">
						</div>
						<div class="date-group">
							<label>To</label> 
							<input type="date" class="form-control" name="toDate" value="2025-12-31">
						</div>
					</div>
				</div>

				<div class="action-buttons">
					<button type="submit" class="btn btn-primary">Search</button>
					<button type="reset" class="btn btn-secondary">Reset</button>
				</div>
			</div>
		</form>
	</div>

	<!-- Results Section -->
	<div class="results-section" id="resultsDiv">
		<div class="container-fluid" style="max-width: 1400px;">
			<div class="results-header">
				<h3>Search Results</h3>
				<span class="total-count">Total: ${fn:length(auctions)}</span>
			</div>

			<!-- Pagination Controls -->
			<div class="pagination-controls" id="paginationControls">
				<div class="results-info">
					<div class="records-per-page">
						<label for="recordsPerPage">Show:</label>
						<select id="recordsPerPage">
							<option value="5" ${pageSize == 5 ? 'selected' : ''}>5 per page</option>
							<option value="10" ${pageSize == 10 ? 'selected' : ''}>10 per page</option>
							<option value="25" ${pageSize == 25 ? 'selected' : ''}>25 per page</option>
							<option value="50" ${pageSize == 50 ? 'selected' : ''}>50 per page</option>
						</select>
					</div>
				</div>
				<div class="pagination-nav">
					<div class="page-info" id="pageInfo">Page <span id="currentPageDisplay">${currentPage}</span> of <span id="totalPagesDisplay">${totalPages}</span></div>
					<button class="pagination-btn" id="prevPage" ${currentPage <= 1 ? 'disabled' : ''}>
						<i class="bi bi-chevron-left"></i> Previous
					</button>
					<button class="pagination-btn" id="nextPage" ${currentPage >= totalPages ? 'disabled' : ''}>
						Next <i class="bi bi-chevron-right"></i>
					</button>
				</div>
			</div>

			<div class="table-responsive" id="tableWrapper">
				<table id="auction-table" class="modern-table">
					<thead>
						<tr>
							<th>S.No</th>
							<th>Zone</th>
							<th>Unit</th>
							<th>Catalogue No</th>
							<th>Type</th>
							<th>Category</th>
							<th>Technical Bid Due</th>
							<th>Auction Start</th>
							<th>Auction End</th>
							<th>Actions</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="auction" items="${auctions}" varStatus="status">
							<tr class="auction-row">
								<td>${status.index + 1 + (currentPage - 1) * pageSize}</td>
								<td>${auction.orgZoneName}</td>
								<td>${auction.deptName}</td>
								<td>${auction.catalogNo}</td>
								<td>${auction.biddingSystem}</td>
								<td>${auction.categName}</td>
								<td>${auction.techBidCloseTime}</td>
								<td>${auction.auctionStartDate}</td>
								<td>${auction.auctionEndDate}</td>
								<td class="action-icons">
									<a href="${pageContext.request.contextPath}/eps/auction/details?catalogId=${auction.catalogId}" 
										class="action-icon catalogue-icon" 
										target="_blank"
										title="View Catalogue"> 
										<i class="bi bi-file-earmark-text-fill text-warning" style="font-size: 1.4rem;"></i>
									</a> 
									<a href="${pageContext.request.contextPath}/eps/auction/corrigendum?scheduleId=${auction.scheduleId}" 
										class="action-icon corrigendum-icon" 
										target="_blank"
										title="View Corrigendum"> 
										<i class="bi bi-pencil-square text-danger" style="font-size: 1.4rem;"></i>
									</a> 
									<a href="${pageContext.request.contextPath}/eps/auction/taxes?catalogId=${auction.catalogId}" 
										class="action-icon taxes-icon" 
										target="_blank"
										title="Applicable Taxes"> 
										<i class="bi bi-info-circle-fill text-success" style="font-size: 1.4rem;"></i>
									</a>
								</td>
							</tr>
						</c:forEach>
						<c:if test="${empty auctions}">
							<tr>
								<td colspan="10" class="text-center">No Records Found</td>
							</tr>
						</c:if>
					</tbody>
				</table>
			</div>
		</div>
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

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

<script>
$(document).ready(function() {
	// Tab functionality
	const searchForm = document.querySelector('.search-form');
	const activeTab = document.querySelector('.nav-tab.active');

	if (activeTab && activeTab.getAttribute('data-tab') === 'live') {
		searchForm.classList.add('hide-dates');
	} else {
		searchForm.classList.remove('hide-dates');
	}

	document.querySelectorAll('.nav-tab').forEach(tab => {
		tab.addEventListener('click', function() {
			const tabType = this.getAttribute('data-tab');
			if (tabType === 'live') {
				searchForm.classList.add('hide-dates');
			} else {
				searchForm.classList.remove('hide-dates');
			}
		});
	});

	// Dropdown functionality
	const orgDropdown = document.getElementById("organisationDropdown");
	const zoneDropdown = document.getElementById("zoneDropdown");
	const unitDropdown = document.getElementById("unitDropdown");

	const selectedOrgCode = "${selectedOrgCode}";
	const selectedZoneCode = "${selectedZoneCode}";
	const selectedUnitCode = "${selectedUnitCode}";
	const selectedCategoryId = "${selectedCategoryId}";

	if (selectedOrgCode) {
		orgDropdown.value = selectedOrgCode;
	}
	if (selectedZoneCode) {
		zoneDropdown.value = selectedZoneCode;
	}
	if (selectedUnitCode) {
		unitDropdown.value = selectedUnitCode;
	}
	if (selectedCategoryId) {
		document.getElementById("categoryDropdown").value = selectedCategoryId;
	}

	// Load Zones on Organisation change
	orgDropdown.addEventListener("change", function() {
		const orgCode = this.value;
		if (orgCode) {
			fetch("${pageContext.request.contextPath}/eps/auction/zones/" + orgCode)
				.then(response => response.json())
				.then(data => {
					zoneDropdown.innerHTML = "<option value=''>-- Select Zone --</option>";
					unitDropdown.innerHTML = "<option value=''>-- Select Unit --</option>";
					data.forEach(zone => {
						zoneDropdown.innerHTML += "<option value='" + zone.intCode + "'>" + zone.value + "</option>";
					});
				});
		} else {
			zoneDropdown.innerHTML = "<option value=''>-- Select Zone --</option>";
			unitDropdown.innerHTML = "<option value=''>-- Select Unit --</option>";
		}
	});

	// Load Units on Zone change
	zoneDropdown.addEventListener("change", function() {
		const orgCode = orgDropdown.value;
		const zoneCode = this.value;

		if (orgCode && zoneCode) {
			fetch("${pageContext.request.contextPath}/eps/auction/units/" + orgCode + "/" + zoneCode)
				.then(response => response.json())
				.then(data => {
					unitDropdown.innerHTML = "<option value=''>-- Select Unit --</option>";
					data.forEach(unit => {
						unitDropdown.innerHTML += "<option value='" + unit.intCode + "'>" + unit.value + "</option>";
					});
				});
		} else {
			unitDropdown.innerHTML = "<option value=''>-- Select Unit --</option>";
		}
	});

	// Pagination functionality
	let currentPage = parseInt("${currentPage}") || 1;
	let totalPages = parseInt("${totalPages}") || 1;
	const pageSize = parseInt("${pageSize}") || 5;
	
	$('#recordsPerPage').val(pageSize);
	
	function updatePageDisplay() {
		$('#currentPageDisplay').text(currentPage);
		$('#totalPagesDisplay').text(totalPages);
		
		if (currentPage <= 1) {
			$('#prevPage').prop('disabled', true);
		} else {
			$('#prevPage').prop('disabled', false);
		}
		
		if (currentPage >= totalPages) {
			$('#nextPage').prop('disabled', true);
		} else {
			$('#nextPage').prop('disabled', false);
		}
	}
	
	updatePageDisplay();
	
	$('#prevPage').on('click', function() {
		if (currentPage > 1) {
			const url = updateQueryStringParameter(window.location.href, 'page', currentPage - 1);
			window.location.href = url;
		}
	});

	$('#nextPage').on('click', function() {
		if (currentPage < totalPages) {
			const url = updateQueryStringParameter(window.location.href, 'page', currentPage + 1);
			window.location.href = url;
		}
	});

	$('#recordsPerPage').on('change', function() {
		const newPageSize = $(this).val();
		let url = updateQueryStringParameter(window.location.href, 'pageSize', newPageSize);
		url = updateQueryStringParameter(url, 'page', '1');
		window.location.href = url;
	});

	function updateQueryStringParameter(uri, key, value) {
		const re = new RegExp("([?&])" + key + "=.*?(&|$)", "i");
		const separator = uri.indexOf('?') !== -1 ? "&" : "?";
		if (uri.match(re)) {
			return uri.replace(re, '$1' + key + "=" + value + '$2');
		} else {
			return uri + separator + key + "=" + value;
		}
	}

	$('.btn-secondary').on('click', function(e) {
		e.preventDefault();
		const auctionType = ('${auctionType}'.toLowerCase() || 'live');
		window.location.href = window.location.pathname + '?type=' + auctionType;
	});
});
</script>
</body>
</html>