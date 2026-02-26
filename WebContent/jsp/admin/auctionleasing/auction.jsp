<%@ page language="java" contentType="text/html; charset=UTF-8"

	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>



<!DOCTYPE html>

<html lang="en">

<head>
<!-- jQuery FIRST -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<!-- Bootstrap -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

<!-- DataTables CSS -->
<link rel="stylesheet"
href="https://cdn.datatables.net/1.13.6/css/dataTables.bootstrap5.min.css">

<!-- DataTables JS -->
<script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.13.6/js/dataTables.bootstrap5.min.js"></script>



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

	margin: 20px auto 10px auto;

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

	

	.search-header h2 {

	font-size: 28px;

	position: relative;

	z-index: 1;

	letter-spacing: 0.5px;

	margin: 0;

	color: #2c5aa0;

	}

	

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

	font-size: 22px;

	font-weight: 700;

	text-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);

	letter-spacing: 0.5px;

	margin: 0;

	color: white;

	}

	

	.results-header .total-count {

	font-size: 18px;

	font-weight: 600;

	color: white;

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
.input-error {
    border: 2px solid #dc3545 !important;
    background-color: #fff5f5 !important;
}
.btn-primary {
    background: linear-gradient(135deg, #142850, #0f3057);
    color: white;
    border: none;
}

.btn-primary:hover {
    background: linear-gradient(135deg, #0f3057, #091f3c);
    transform: translateY(-2px);
    box-shadow: 0 6px 18px rgba(15, 48, 87, 0.4);
}

.btn-secondary {
    background: #343a40;
    color: white;
    border: none;
}

.btn-secondary:hover {
    background: #23272b;
    transform: translateY(-2px);
    box-shadow: 0 4px 12px rgba(0,0,0,0.3);
}
.nav-tab {
    padding: 10px 22px;
    border-radius: 25px;
    background: #d6dce5;
    color: #142850;
    font-weight: 700;
    border: 2px solid #142850;
    transition: all 0.3s ease;
}

.nav-tab:hover {
    background: #142850;
    color: #ffffff;
    transform: translateY(-2px);
    box-shadow: 0 5px 12px rgba(20, 40, 80, 0.4);
}

.nav-tab.active {
    background: linear-gradient(135deg, #142850, #0f3057);
    color: white;
    border-color: #0f3057;
    box-shadow: 0 6px 18px rgba(15, 48, 87, 0.5);
}
#searchErrorBox {
    display: none;
    color: #b02a37;
    background: #fdecea;
    border: 1px solid #dc3545;
    padding: 10px 14px;
    border-radius: 8px;
    margin-bottom: 12px;
    font-weight: 600;
    font-size: 14px;
}
.dataTables_wrapper .dataTables_paginate .paginate_button.current {
    background: #142850 !important;
    color: white !important;
    border-radius: 6px;
}

.dataTables_wrapper .dataTables_filter input {
    border-radius: 8px;
    border: 1px solid #ccc;
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

	
			<!-- ⭐ REQUIRED for BHASHINI PLUGIN -->
    <div class="bhashini-plugin-container"></div>
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
        <br><small class="dev-note">(Under Development)</small>
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
      
<input type="hidden" name="searchClicked" value="true"/>
	

		

	<div class="search-content">

	<div class="search-info">

	Search and view E-Auction details by selecting Organization, Zone, Unit, and other criteria

	</div>

	

	<div class="form-grid">

	<div class="form-group">

	<label>Organization</label> 

	<select id="organisationDropdown" name="orgCode" class="form-select">

	<option value="">-- All Organisations --</option>
	

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

	<option value="">-- All Zone --</option>

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

	<option value="">-- All Unit --</option>

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

	<option value="">-- All Category --</option>

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

	<%@ page import="java.time.LocalDate" %>

<input type="date" class="form-control" name="fromDate" value="<%= request.getParameter("fromDate") != null ? request.getParameter("fromDate") : LocalDate.now() %>">
	

	</div>

	<div class="date-group">

	<label>To</label> 

	<input type="date" class="form-control" name="toDate" value="<%= request.getParameter("toDate") != null ? request.getParameter("toDate") : "" %>">
	

	</div>

	</div>

	</div>
	<div id="searchErrorBox" 
     style="display:none; color:#dc3545; 
            background:#ffe6e6; 
            border:1px solid #dc3545; 
            padding:8px 12px; 
            border-radius:8px; 
            margin-bottom:10px; 
            font-weight:600;">
</div>
	



	<div class="action-buttons">

	<button type="submit" class="btn btn-primary" id="searchBtn">
    <i class="bi bi-search"></i> Search
</button>

<button type="button" class="btn btn-secondary" id="resetBtn">
    <i class="bi bi-arrow-clockwise"></i> Reset
</button>
	

	</div>

	</div>

	</form>

	</div>



	<c:if test="${not empty auctions}">

	<div class="results-section" id="resultsDiv">

	<div class="container-fluid" style="max-width: 1400px;">

	<div class="results-header">

	<h3>Search Results</h3>

	<span class="total-count" id="totalRecords">Total: ${fn:length(auctions)}</span>

	</div>


<!--  
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

	</div>-->



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

	<tbody id="auctionTableBody">

	<c:forEach var="auction" items="${auctions}" varStatus="status">

	<tr class="auction-row">

	<td>${status.index + 1}</td>

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

	</tbody>

	</table>

	</div>

	</div>

	</div>

	</c:if>

	

	<c:if test="${param.searchClicked == 'true' and empty auctions}">
	

	<div class="results-section">

	<div class="no-data">

	<h5>No Data Found</h5>

	<p>No auctions found matching your criteria.</p>

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



<!--  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>-->

<!-- <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>  -->



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



$(document).ready(function() {

	// Tab functionality

	const searchForm = document.querySelector('.search-form');

	const activeTab = document.querySelector('.nav-tab.active');
	if ($('#auction-table').length) {

	    $('#auction-table').DataTable({
	        pageLength: 10,
	        lengthMenu: [5, 10, 25, 50],
	        ordering: true,
	        searching: true,
	        info: true,
	        responsive: true,
	        language: {
	            emptyTable: "No auctions found matching your criteria."
	        },
	        columnDefs: [
	            { orderable: false, targets: 9 } // Disable sorting on Actions column
	        ]
	    });

	}




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



	orgDropdown.addEventListener("change", function() {

	const orgCode = this.value;

	if (orgCode) {

	fetch("${pageContext.request.contextPath}/eps/auction/zones/" + orgCode)

	.then(response => response.json())

	.then(data => {

	zoneDropdown.innerHTML = "<option value=''>-- All Zone --</option>";

	unitDropdown.innerHTML = "<option value=''>-- All Unit --</option>";

	data.forEach(zone => {

	zoneDropdown.innerHTML += "<option value='" + zone.intCode + "'>" + zone.value + "</option>";

	});

	});

	} else {

	zoneDropdown.innerHTML = "<option value=''>-- All Zone --</option>";

	unitDropdown.innerHTML = "<option value=''>-- All Unit --</option>";

	}

	});



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
	
	
	// ===============================
	// ENTERPRISE SEARCH VALIDATION
	// ===============================
$('#searchBtn').on('click', function (e) {

    e.preventDefault();

    $('#searchErrorBox').hide().text('');
    $('.form-control, .form-select').removeClass('input-error');

    let org = $('#organisationDropdown').val().trim();
    let zone = $('#zoneDropdown').val().trim();
    let unit = $('#unitDropdown').val().trim();
    let category = $('#categoryDropdown').val().trim();
    let catalogInput = $('input[name="catalogNo"]');
    let catalog = catalogInput.val().trim();
    let fromDate = $('input[name="fromDate"]').val();
    let toDate = $('input[name="toDate"]').val();

    catalogInput.val(catalog);

    // 🔒 At least one criteria
    if (!org && !zone && !unit && !category && !catalog && !fromDate && !toDate) {
        showError("Please select at least one search criterion.");
        $('#organisationDropdown').focus();
        return false;
    }

    // 🔒 Catalogue format
    if (catalog) {
        const regex = /^[A-Za-z0-9-]{3,30}$/;
        if (!regex.test(catalog)) {
            showError("Catalogue No must be 3-30 characters and contain only letters, numbers or hyphen (-).");
            catalogInput.addClass('input-error').focus();
            return false;
        }
    }

    // 🔒 Date validation
    if (fromDate && toDate && fromDate > toDate) {
        showError("From Date cannot be greater than To Date.");
        $('input[name="fromDate"]').addClass('input-error');
        $('input[name="toDate"]').addClass('input-error');
        return false;
    }

    this.disabled = true;
    this.form.submit();
});
$('input, select').on('input change', function () {
    $(this).removeClass('input-error');
    $('#searchErrorBox').fadeOut();
});


function showError(message) {
    $('#searchErrorBox')
        .text(message)
        .fadeIn();
}

function highlightAllFields() {
    $('.form-control, .form-select').addClass('input-error');
}


$('.form-control, .form-select').on('input change', function () {
    $(this).removeClass('input-error');
    $('#searchErrorBox').fadeOut();
});






	// CLIENT-SIDE PAGINATION (Like Item Master & Procurement)

	let currentPage = 1;

	let recordsPerPage = 5;

	let allRows = [];



	const tableBody = document.getElementById('auctionTableBody');

	

	if (tableBody) {

	allRows = Array.from(document.querySelectorAll('.auction-row'));

	

	if (allRows.length > 0) {

	//setupPagination();

	//displayPage(1);

	}

	}
	
	$('#resetBtn').on('click', function () {
	    const auctionType = ('${auctionType}'.toLowerCase() || 'live');
	    window.location.href = window.location.pathname + '?type=' + auctionType;
	});




	$('#recordsPerPage').on('change', function() {

	recordsPerPage = parseInt($(this).val());

	currentPage = 1;

	displayPage(currentPage);

	});



	$('#prevPage').on('click', function() {

	if (currentPage > 1) {

	currentPage--;

	displayPage(currentPage);

	}

	});



	$('#nextPage').on('click', function() {

	const totalPages = Math.ceil(allRows.length / recordsPerPage);

	if (currentPage < totalPages) {

	currentPage++;

	displayPage(currentPage);

	}

	});



	function setupPagination() {

	const totalRecords = allRows.length;

	const totalPages = Math.ceil(totalRecords / recordsPerPage);

	

	$('#totalRecords').text('Total: ' + totalRecords);

	updatePaginationInfo(totalPages);

	}



	function displayPage(page) {

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

	$('#pageInfo').text('Page ' + currentPage + ' of ' + totalPages);

	

	$('#prevPage').prop('disabled', currentPage === 1);

	$('#nextPage').prop('disabled', currentPage === totalPages);

	}



	$('.btn-secondary').on('click', function(e) {

	e.preventDefault();

	const auctionType = ('${auctionType}'.toLowerCase() || 'live');

	window.location.href = window.location.pathname + '?type=' + auctionType;

	});

});

</script>
<script src="${pageContext.request.contextPath}/assets/accessibility/accessibility.js" ></script>
		
<script 
    src="https://translation-plugin.bhashini.co.in/v3/website_translation_utility.js"
    language-icon-color="#ffffff">
</script>
<script src="${pageContext.request.contextPath}/assets/bhashini/bhashini-init.js"></script>
</body>

</html>