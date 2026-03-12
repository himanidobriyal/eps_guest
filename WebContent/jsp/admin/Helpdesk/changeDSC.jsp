<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>



<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>






<!DOCTYPE html>







<html lang="en">




   



<head>



	<meta charset="UTF-8" />



	<meta name="viewport" content="width=device-width, initial-scale=1" />



	<title>Government E-Procurement System</title>



	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    

<link rel="stylesheet"
      href="https://cdn.datatables.net/1.13.6/css/jquery.dataTables.min.css">


    
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/accessibility/accessibility.css">
	
	<script src="${pageContext.request.contextPath}/assets/accessibility/accessibility.js" defer></script>	



	<style>



	* {



	margin: 0;



	padding: 0;



	box-sizing: border-box;



	}
* ===== CARD ===== */
.main-container {
    padding:50px 30px;
}

.card {
    max-width:900px;
    margin:0 auto;
    background:white;
    border-radius:15px;
    box-shadow:0 15px 40px rgba(0,0,0,0.1);
    overflow:hidden;
}

.card-header {
    background:linear-gradient(135deg,#2c5aa0,#1a4480);
    color:white;
    padding:18px;
    font-size:20px;
    font-weight:600;
}

.card-body {
    padding:40px;
}

.form-group {
    display:flex;
    flex-direction:column;
    max-width:400px;
}

.form-group label {
    font-weight:600;
    margin-bottom:8px;
}

.form-group input {
    padding:12px;
    border:2px solid #ddd;
    border-radius:8px;
    font-size:14px;
}

.form-group input:focus {
    border-color:#74b9ff;
    outline:none;
}

.error-text {
    color:red;
    font-size:12px;
    margin-top:5px;
}

.input-error {
    border:2px solid red !important;
}

/* BUTTON */
.btn {
    padding:10px 30px;
    background:linear-gradient(45deg,#74b9ff,#0984e3);
    border:none;
    border-radius:8px;
    color:white;
    font-weight:600;
    cursor:pointer;
    margin-top:20px;
}

.btn:hover {
    box-shadow:0 8px 20px rgba(116,185,255,0.4);
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
	transition: background-color 0.3s ease;
	}

	.left-section {
	display: flex;
	align-items: center;
	gap: 10px;
	height: 50px;
	}

	.center-section {
	text-align: center;
	flex: 1;
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
	align-items: center;
	font-size: 16px;
	color: white;
	margin-right: 20px;
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



.icon-row {
 display: flex;
 gap: 10px; /* ✅ spacing between home & logout */
 position: relative;
 top: 40px; /* ✅ jahan aapka home icon placed hai */
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


.home-icon:hover,
.logout-icon:hover {

 background-color: #0056b3;

}







	.nav-bar {



	margin-top: 2px;



	background-color: #07222E;



	padding: 10px 20px;



	margin-bottom: 15px;



	}







	.nav-bar .nav-content {



	max-width: 1400px;



	margin: 0 auto;



	padding: 0 20px;



	}







	.nav-home {



	color: white;



	text-decoration: none;



	font-size: 20px;



	display: flex;



	align-items: center;



	gap: 8px;



	transition: all 0.3s ease;



	padding: 8px 12px;



	border-radius: 6px;



	}







	.nav-home:hover {



	background: rgba(255, 255, 255, 0.1);



	transform: translateY(-1px);



	}







	.home-icon {



	width: 20px;



	height: 20px;



	fill: currentColor;



	}







	.main-container {



 flex: 1;



 max-width: 100%;



 margin: 0; /* 12px 0px se change karo */



 padding: 0;



 overflow-y: auto;



}



	







	.search-card {



	background: rgba(255, 255, 255, 0.98);



	backdrop-filter: blur(15px);



	border-radius: 20px;



	box-shadow: 0 20px 60px rgba(0, 0, 0, 0.1);



	overflow: hidden;



	max-width: 1600px;



	width: 100%;



	margin: 0 auto;



	flex: 1;



	display: flex;



	flex-direction: column;



	padding-bottom: 0;



	}







	
	.search-header h3 {



	font-size: 26px;



	font-weight: 700;



	position: relative;



	z-index: 1;



	text-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);



	letter-spacing: 0.5px;



	}







	.search-tabs {



 display: flex;



 background: #f8f9fa;



 border-bottom: 1px solid #e9ecef;



 padding: 15px;



 gap: 0;



 justify-content: space-between;



}







	.search-tab {



 flex: 1;



 padding: 12px 8px;



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



 text-decoration: none;



 text-align: center;



 margin: 0 5px;



}







	.search-tab.active,



.search-tab[data-tab="custom"] {



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







	.search-content {



 padding:30px;



}







	/* Results Section Styling */



	.results-section {



 padding: 25px;



 background: white;



 display: flex;



 flex-direction: column;



}



	.results-header {



	background: linear-gradient(135deg, #2c5aa0 0%, #1a4480 50%, #0f3460 100%);



	color: white;



	padding: 15px 20px;



	border-radius: 12px;



	margin-bottom: 20px;



	box-shadow: 0 4px 15px rgba(44, 90, 160, 0.3);



	}







	.results-header h3 {



	font-size: 22px;



	font-weight: 700;



	text-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);



	letter-spacing: 0.5px;



	margin: 0;



	}







	/* Enhanced Table Styling */
.tender-table {
    overflow: visible !important;
    width: 100%;
    border-collapse: collapse;
    background: white;
    box-shadow: 0 8px 25px rgba(0, 0, 0, 0.1);
}
.dataTables_length {
    margin-bottom: 15px;
    font-size: 14px;
}

.dataTables_filter input {
    padding: 6px 10px;
    border-radius: 6px;
    border: 1px solid #ccc;
    margin-left: 8px;
}



/* DataTables wrapper handles radius */
.dataTables_wrapper {
    border-radius: 12px;
    overflow: hidden;
    margin-top: 0px;
}
	.tender-table thead {



	background: linear-gradient(135deg, #2c5aa0 0%, #1a4480 100%);



	}







	.tender-table th {



	padding: 16px 12px;



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





#tableTender {
    width: 100% !important;
    display: table !important;
}
/* DataTables search + pagination fix */
.dataTables_filter {
    margin-bottom: 15px;
}

.dataTables_filter input {
    padding: 6px 10px;
    border-radius: 6px;
    border: 1px solid #ccc;
}

.dataTables_length {
    margin-bottom: 15px;
}

.dataTables_paginate {
    margin-top: 15px;
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



	padding: 14px 12px;



	border-bottom: 1px solid #e9ecef;



	font-size: 13px;



	color: #2d3436;



	text-align: center;



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







	.tender-table .status-cell {



	background: #fff3cd !important;



	color: #856404;



	font-weight: 600;



	border-radius: 6px;



	margin: 2px;



	padding: 6px 8px !important;



	font-size: 12px;



	}







	.tender-table .action-links {



	display: flex;



	justify-content: center;



	gap: 8px;



	}







	.tender-table .action-links a {



	display: inline-block;



	padding: 6px 8px;



	background: linear-gradient(45deg, #74b9ff, #0984e3);



	color: white;



	text-decoration: none;



	border-radius: 6px;



	font-size: 16px;



	transition: all 0.3s ease;



	box-shadow: 0 2px 6px rgba(116, 185, 255, 0.3);



	}







	.tender-table .action-links a:hover {



	transform: translateY(-1px);



	box-shadow: 0 4px 12px rgba(116, 185, 255, 0.4);



	}
	/* 🔥 Force DataTables dropdown to render properly */
.dataTables_length select {
    min-width: 70px !important;
    padding: 6px 35px 6px 12px !important;
    font-size: 14px !important;
    border-radius: 6px !important;
    border: 1px solid #aaa !important;

    /* Fix arrow overlap */
    appearance: auto !important;
    -webkit-appearance: menulist !important;
    -moz-appearance: menulist !important;

    background-color: white !important;
}
	.dataTables_length label {
    display: flex !important;
    align-items: center !important;
    gap: 10px !important;
}
	







	/* Info Section */



	.info-section {



	background: linear-gradient(135deg, #e3f2fd 0%, #f0f8ff 100%);



	border: 2px solid #74b9ff;



	border-radius: 12px;



	padding: 15px;



	margin-bottom: 20px;



	box-shadow: 0 4px 12px rgba(116, 185, 255, 0.15);



	}







	.info-section .info-text {



	color: #1565c0;



	font-size: 14px;



	line-height: 1.6;



	margin: 0;



	font-weight: 500;



	}







	/* No Results Message */



	/* Enhanced No Results Message - Professional Full Page Design */



/* Enhanced No Results Message - Clean & Simple */



.no-results {



 flex: 1;



 display: flex;



 flex-direction: column;



 align-items: center;



 justify-content: center;



 text-align: center;



 padding: 80px 50px;



 background: linear-gradient(135deg, #f8f9fa 0%, #e9ecef 50%, #f8f9fa 100%);



 border-radius: 20px;



 border: 3px dashed #cbd5e0;



 margin: 25px;



 min-height: 400px;



 box-shadow: 0 15px 40px rgba(0, 0, 0, 0.08);



 position: relative;



 overflow: hidden;



}







.no-results::before {



 content: '';



 position: absolute;



 top: -50%;



 left: -50%;



 width: 200%;



 height: 200%;



 background: radial-gradient(circle, rgba(44, 90, 160, 0.03) 0%, transparent 70%);



 animation: pulse 4s ease-in-out infinite;



}







@keyframes pulse {



 0%, 100% { transform: scale(1); opacity: 0.5; }



 50% { transform: scale(1.1); opacity: 0.8; }



}







.no-results-icon {



 font-size: 90px;



 color: #adb5bd;



 margin-bottom: 30px;



 animation: float 3s ease-in-out infinite;



 position: relative;



 z-index: 1;



}







@keyframes float {



 0%, 100% { transform: translateY(0px); }



 50% { transform: translateY(-12px); }



}







.no-results h3 {



 font-size: 28px;



 color: #2c5aa0;



 font-weight: 700;



 margin-bottom: 20px;



 position: relative;



 z-index: 1;



}







.no-results p {



 color: #6c757d;



 font-size: 17px;



 line-height: 1.6;



 max-width: 600px;



 margin: 0 auto;



 position: relative;



 z-index: 1;



}



	.search-info {



	color: #1565c0;



	padding: 5px 0;



	margin-bottom: 10px;



	font-size: 14px;



	line-height: 1.5;



	}







	.search-criteria-options {



	display: grid;



	grid-template-columns: 1fr 1fr;



	gap: 20px;



	margin-bottom: 5px;



	}







	.search-criteria-section {



	display: flex;



	flex-direction: column;



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







	.criteria-options {



	display: flex;



	flex-direction: row;



	gap: 20px;



	background: white;



	padding: 20px 15px 15px 15px;



	border-radius: 12px;



	border: 1px solid #dee2e6;



	box-shadow: 0 2px 8px rgba(0, 0, 0, 0.05);



	flex-wrap: wrap;



	margin-top: -5px;



	}







	.criteria-option {



	background: #f8f9fa;



	border: 1px solid #e9ecef;



	border-radius: 8px;



	padding: 8px 12px;



	cursor: pointer;



	display: flex;



	align-items: center;



	gap: 10px;



	transition: all 0.3s ease;



	flex: 0 0 auto;



	user-select: none;



	}







	.criteria-option:hover {



	background: #e9ecef;



	transform: translateY(-1px);



	box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);



	}







	.criteria-option input[type="radio"],



	.date-option input[type="radio"] {



	appearance: none;



	width: 18px;



	height: 18px;



	border: 2px solid #74b9ff;



	border-radius: 50%;



	margin: 0;



	background: white;



	position: relative;



	cursor: pointer;



	transition: all 0.3s ease;



	}







	.criteria-option input[type="radio"]:checked,



	.date-option input[type="radio"]:checked {



	background: #000000;



	border-color: #000000;



	}







	.criteria-option input[type="radio"]:checked::after,



	.date-option input[type="radio"]:checked::after {



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







	.criteria-option label {



	font-size: 14px;



	font-weight: 500;



	color: #2d3436;



	cursor: pointer;



	margin: 0;



	font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;



	}







	.search-input-and-note {



	display: grid;



	grid-template-columns: 1fr 1fr;



	gap: 20px;



	margin-bottom: 5px;



	}







	.search-input-section {



	display: flex;



	flex-direction: column;



	gap: 5px;



	}







	.search-input-section .form-group {



	background: white;



	padding: 15px;



	border-radius: 12px;



	border: 1px solid #dee2e6;



	box-shadow: 0 2px 8px rgba(0, 0, 0, 0.05);



	margin-top: -5px;



	}







	.search-input-section .form-group input {



	background: linear-gradient(135deg, #f8f9fa 0%, #e3f2fd 50%, #f0f8ff 100%);



	border: 2px solid #74b9ff;



	box-shadow: 0 2px 8px rgba(116, 185, 255, 0.15);



	font-weight: 600;



	}







	.form-grid {



	display: grid;



	grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));



	gap: 20px;



	margin-bottom: 5px;



	}







	.form-group {



	display: flex;



	flex-direction: column;



	}







	.form-group label {



	font-weight: 600;



	color: #2d3436;



	margin-bottom: 8px;



	font-size: 14px;



	font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;



	}







	.required {



	color: #e17055;



	}







	.form-group select,



	.form-group input,



	.search-criteria select,



	.search-criteria input,



	.date-range select,



	.date-range input[type="date"] {



	padding: 12px 16px;



	border: 2px solid #ddd;



	border-radius: 10px;



	font-size: 14px;



	font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;



	font-weight: 500;



	transition: all 0.3s ease;



	background: white;



	color: #2d3436;



	min-height: 46px;



	}







	.form-group select:focus,



	.form-group input:focus {



	outline: none;



	border-color: #74b9ff;



	box-shadow: 0 0 0 3px rgba(116, 185, 255, 0.1);



	}







	.search-note {



	color: #8b7355;



	padding: 8px 0;



	font-size: 12px;



	margin-bottom: 0px;



	display: flex;



	align-items: center;



	justify-content: center;



	gap: 8px;



	margin-top: 0px;



	text-align: left;



	}







	.info-icon {



	background: #f6d55c;



	color: #5d5016;



	width: 18px;



	height: 18px;



	border-radius: 50%;



	display: flex;



	align-items: center;



	justify-content: center;



	font-size: 11px;



	font-weight: bold;



	flex-shrink: 0;



	margin-top: 2px;



	}







	.date-section {



	position: relative;



	border-radius: 15px;



	padding: 15px 0;



	background: #f8f9fa;



	margin-top: 1px;



	}







	.date-section-content {



	border: 2px solid #e9ecef;



	border-radius: 15px;



	padding: 15px;



	background: white;



	margin-top: -5px;



	}







	.date-options-row {



	display: flex;



	flex-direction: row;



	gap: 15px;



	flex-wrap: wrap;



	justify-content: flex-start;



	align-items: center;



	margin-bottom: 10px;



	}







	.date-option {



	display: flex;



	align-items: center;



	gap: 10px;



	padding: 8px 12px;



	border-radius: 8px;



	transition: all 0.3s ease;



	background: #f8f9fa;



	border: 1px solid #e9ecef;



	white-space: nowrap;



	flex-shrink: 0;



	}







	.date-option:hover {



	background: #e9ecef;



	transform: translateY(-1px);



	box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);



	}







	.date-option label {



	font-size: 14px;



	font-weight: 500;



	color: #2d3436;



	cursor: pointer;



	margin: 0;



	font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;



	}







	.custom-date-section {



	padding: 15px;



	background: white;



	border-radius: 12px;



	border: 1px solid #dee2e6;



	box-shadow: 0 2px 8px rgba(0, 0, 0, 0.05);



	}







	.date-inputs-row {



	display: flex;



	gap: 20px;



	align-items: center;



	margin-bottom: 10px;



	flex-wrap: wrap;



	}







	.date-input-group {



	display: flex;



	flex-direction: row;



	gap: 8px;



	align-items: center;



	}







	.date-input-group label {



	font-size: 14px;



	font-weight: 600;



	color: #2d3436;



	white-space: nowrap;



	margin: 0;



	}







	.date-input-group input[type="date"] {



	padding: 8px 12px;



	border: 2px solid #ddd;



	border-radius: 8px;



	font-size: 14px;



	min-height: 38px;



	width: 150px;



	}







	.date-type-group {



	display: flex;



	flex-direction: row;



	gap: 8px;



	align-items: center;



	}







	.date-type-group select {



	padding: 8px 12px;



	border: 2px solid #ddd;



	border-radius: 8px;



	font-size: 14px;



	min-height: 38px;



	min-width: 200px;



	}







	.quick-range-option {



	display: flex;



	align-items: center;



	gap: 10px;



	}







	.quick-range-controls {



	display: none;



	flex-wrap: nowrap;



	gap: 10px;



	margin-left: 10px;



	}







	.quick-range-controls .date-input-group select,



	.quick-range-controls .date-input-group input,



	.quick-range-controls .date-input-group button {



	min-width: 100px;



	padding: 6px 10px;



	border: 2px solid #ddd;



	border-radius: 6px;



	font-size: 13px;



	min-height: 32px;



	margin: 0;



	}







	#customRangeNumber {



	width: 70px;



	text-align: center;



	min-width: 70px;



	}







	#customRangeApply {



	background: linear-gradient(45deg, #74b9ff, #0984e3);



	color: white;



	border: none;



	cursor: pointer;



	transition: all 0.3s ease;



	min-width: 80px;



	padding: 6px 12px;



	border-radius: 15px;



	}







	#customRangeApply:hover {



	box-shadow: 0 4px 15px rgba(116, 185, 255, 0.3);



	transform: translateY(-1px);



	}







	.date-warning {



	color: #e17055;



	font-size: 12px;



	font-style: italic;



	margin-top: 8px;



	padding: 6px 8px;



	font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;



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



	border: 1px solid #ddd;



	}







	.btn-secondary:hover {



	background: #f5f5f5;



	transform: translateY(-2px);



	box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);



	color: #333;



	}







	.advanced-filter-toggle {



	margin: 20px 0;



	text-align: left;



	}







	.btn-advanced {



	background: none;



	color: #2196F3;



	font-weight: 500;



	padding: 8px 0;



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







	input[type="checkbox"] {



	-webkit-appearance: none;



	appearance: none;



	width: 18px;



	height: 18px;



	border: 2px solid #000;



	border-radius: 3px;



	cursor: pointer;



	position: relative;



	background-color: #fff;



	}







	input[type="checkbox"]:checked {



	background-color: #000;



	}







	input[type="checkbox"]:checked::before {



	content: "";



	position: absolute;



	left: 4px;



	top: 0px;



	width: 5px;



	height: 10px;



	border: solid #fff;



	border-width: 0 2px 2px 0;



	transform: rotate(45deg);



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
	background: #05173c !important; /* Dark blue */
 background-image: none !important;
 margin-top:260px;   /* increase gap */


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



	.search-criteria-options,



	.search-input-and-note {



	grid-template-columns: 1fr;



	}







	.date-inputs-row {



	flex-direction: column;



	align-items: stretch;



	}







	.date-input-group input[type="date"],



	.date-type-group select {



	width: 100%;



	}







	.tender-table {

	font-size: 12px;

	}

	.tender-table th,
	.tender-table td {
	padding: 8px 6px;
	}







	.action-links {
	flex-direction: column;

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

/* Dimmed background */

.popup-overlay {
 position: fixed;
 top: 0;
 left: 0;
 width: 100%;
 height: 100%;
 background: rgba(0, 0, 0, 0.35);
 display: none;
 justify-content: center;
 align-items: center;
 z-index: 5000;
 backdrop-filter: blur(2px);

}



/* Popup container */

.popup-box {
 background: #ffffff;
 width: 60%;
 max-width: 850px;
 padding: 25px 30px;
 border-radius: 12px;
 /* IREPS style elevation */
 box-shadow: 0 8px 20px rgba(0, 0, 0, 0.25);
 animation: popupFade 0.25s ease-in-out;
 position: relative;

}



/* Header */

.popup-box h3 {
 margin-top: 0;
 margin-bottom: 18px;
 font-size: 22px;
 font-weight: 600;
 color: #003b73; /* IREPS dark blue */
 border-left: 4px solid #0078ff;
 padding-left: 10px;

}



/* Close button */

.close-btn {

 position: absolute;

 right: 18px;

 top: 14px;

 font-size: 30px;

 cursor: pointer;

 color: #777;

 font-weight: bold;

 transition: 0.2s;

}

.close-btn:hover {

 color: #000;

}



/* Content text */

.popup-content p {

 margin: 8px 0;

 font-size: 15px;

}



/* Highlighted labels */

.popup-content strong {

 color: #003b73;

}



/* Animation */

@keyframes popupFade {

 from {

 opacity: 0;

 transform: translateY(-15px);

 }

 to {

 opacity: 1;

 transform: translateY(0);

 }

}

.custom-length-menu {
    margin-bottom: 10px;
}

.length-btn {
    cursor: pointer;
    padding: 4px 8px;
    color: #2196F3;
    font-weight: 500;
}

.length-btn:hover {
    text-decoration: underline;
}

.length-btn.active {
    font-weight: bold;
    color: #000;
}
/* Remove gap between custom length menu and table */
.custom-length-menu {
    margin-bottom: 5px;   /* reduce space */
}

/* Remove extra DataTable wrapper spacing */
.dataTables_wrapper .dataTables_length {
    margin-bottom: 5px !important;
    float: left;
}

.dataTables_wrapper {
    margin-top: 0px !important;
}


.dataTables_wrapper .dataTables_filter {
    float: right;
}

/* Make length & search stay on same line */
.dataTables_wrapper .dataTables_length {
    float: left;
    margin-bottom: 10px;
}

.dataTables_wrapper .dataTables_filter {
    float: right;
    margin-bottom: 10px;
}

/* Clear float properly */
.dataTables_wrapper::after {
    content: "";
    display: block;
    clear: both;
}
/* Compact Search Inputs Like SearchTender */
.search-criteria-box {
    background: #f8f9fa;
    border: 1px solid #dcdcdc;
    border-radius: 10px;
    padding: 20px;
}

.search-criteria-box label {
    font-weight: 600;
    font-size: 14px;
}

.search-criteria-box input {
    padding: 6px 10px !important;
    min-height: auto !important;
    height: 34px;
    border-radius: 6px;
    border: 1px solid #aaa;
    width: 250px;
}

.action-buttons {
    display: flex;
    justify-content: center;
    gap: 20px;
    margin-top: 25px;
}
.btn {
    padding: 8px 28px;
    border-radius: 6px;
    font-size: 14px;
    font-weight: 500;
    border: none;
    cursor: pointer;
    transition: 0.25s ease;
}

.btn-search {
    background: linear-gradient(45deg,#2c5aa0,#1a4480);
    color: white;
}

.btn-search:hover {
    transform: translateY(-1px);
    box-shadow: 0 4px 12px rgba(44,90,160,0.3);
}

.btn-cancel {
    background: #e0e0e0;
    color: #333;
}

.btn-cancel:hover {
    background: #d5d5d5;
}
.no-record {
    display: none; /* hidden by default */
    margin-top: 25px;
    padding: 25px;
    text-align: center;
    border-radius: 8px;
    background: #f8f9fa;
    border: 1px dashed #b0bec5;
    color: #555;
    font-size: 15px;
}

.no-record i {
    font-size: 40px;
    color: #90a4ae;
    margin-bottom: 10px;
    display: block;
}

/* ===== Search Criteria Layout Fix ===== */

.form-row {
    display: flex;
    gap: 40px;
    align-items: flex-start;
    margin-top: 15px;
}

fieldset {
    border: 1px solid #cfd8dc;
    border-radius: 8px;
    padding: 20px;
    background: #f8f9fa;
}

legend {
    font-weight: 600;
    font-size: 14px;
    padding: 0 10px;
    color: #2c5aa0;
}

.form-group input {
    width: 260px !important;
    height: 36px !important;
    padding: 6px 10px !important;
    border-radius: 6px !important;
    border: 1px solid #aaa !important;
    min-height: auto !important;
}

.error-text {
    font-size: 12px;
    color: red;
    margin-top: 4px;
}
.search-header {
    background: #2c5aa0;
    color: white;
    padding: 12px;
    text-align: center;
    font-size: 20px;
    font-weight: 600;
}

.input-error {
    border: 1px solid red !important;
    background: #fff5f5;
}

.error-text {
    font-size: 12px;
    color: red;
    margin-top: 4px;
}

.action-buttons {
    display:flex;
    justify-content:center;
    gap:20px;
    margin-top:30px;
}

.btn {
    padding:12px 35px;
    border:none;
    border-radius:50px;
    font-size:15px;
    cursor:pointer;
    font-weight:600;
}

.btn-primary {
    background:linear-gradient(45deg,#74b9ff,#0984e3);
    color:white;
}

.btn-secondary {
    background:white;
    border:1px solid #ccc;
}
.error-box {
    background: #ffe6e6;
    border: 1px solid #ff4d4d;
    color: #b30000;
    padding: 12px 15px;
    border-radius: 6px;
    margin-bottom: 15px;
    font-size: 14px;
}

.error-box ul {
    margin: 0;
    padding-left: 18px;
}

.input-error {
    border: 1px solid red !important;
    background: #fff5f5 !important;
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
<div class="card">

<div class="card-header">
DSC Update
</div>

<div class="card-body">

<form id="dscForm" method="post" action="#">

<div class="form-group">
<label>Email ID <span style="color:red">*</span></label>
<input type="email" id="emailId" name="emailId" placeholder="Enter your registered Email ID">
<div id="emailError" class="error-text"></div>
</div>

<button type="submit" class="btn">Update DSC</button>

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

function openSidebar(){ document.getElementById("mySidebar").style.width="250px"; }
function closeSidebar(){ document.getElementById("mySidebar").style.width="0"; }

document.getElementById("dscForm").addEventListener("submit", function(e){

    let email = document.getElementById("emailId");
    let errorDiv = document.getElementById("emailError");

    errorDiv.innerText="";
    email.classList.remove("input-error");

    let value = email.value.trim();

    let emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

    if(value === ""){
        errorDiv.innerText="Email ID is required.";
        email.classList.add("input-error");
        e.preventDefault();
    }
    else if(!emailRegex.test(value)){
        errorDiv.innerText="Enter valid Email ID.";
        email.classList.add("input-error");
        e.preventDefault();
    }

});

</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script 
    src="https://translation-plugin.bhashini.co.in/v3/website_translation_utility.js"
    language-icon-color="#ffffff">
</script>
<script src="${pageContext.request.contextPath}/assets/bhashini/bhashini-init.js"></script>
</body>







</html>