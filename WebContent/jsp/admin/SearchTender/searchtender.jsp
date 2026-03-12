<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>



<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>






<!DOCTYPE html>







<html lang="en">




   



<head>



	<meta charset="UTF-8" />



	<meta name="viewport" content="width=device-width, initial-scale=1" />



	<title>Government E-Procurement System</title>



	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    

<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<!-- DataTables -->
<link rel="stylesheet"
      href="https://cdn.datatables.net/1.13.6/css/jquery.dataTables.min.css">
<script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>

<!-- Buttons Extension -->
<link rel="stylesheet"
      href="https://cdn.datatables.net/buttons/2.4.2/css/buttons.dataTables.min.css">
<script src="https://cdn.datatables.net/buttons/2.4.2/js/dataTables.buttons.min.js"></script>
<script src="https://cdn.datatables.net/buttons/2.4.2/js/buttons.html5.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.10.1/jszip.min.js"></script>

    
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/accessibility/accessibility.css">
	
	<script src="${pageContext.request.contextPath}/assets/accessibility/accessibility.js" defer></script>	



	<style>



	* {



	margin: 0;



	padding: 0;



	box-sizing: border-box;



	}







	html z{



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







	.search-header {



	background: linear-gradient(135deg, #2c5aa0 0%, #1a4480 50%, #0f3460 100%);



	color: white;



	padding: 20px;



	text-align: center;



	position: relative;



	box-shadow: 0 4px 15px rgba(44, 90, 160, 0.3);



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



 padding: 25px 25px 10px 25px;



}







	/* Results Section Styling */



	.results-section {

background: white;
    color: #1a4480;
    padding: 5px 14px;
    border-radius: 30px;
    font-weight: 700;

 /* padding: 25px;



 background: white;



 display: flex;



 flex-direction: column; */



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
    background: #003b73;
}

.tender-table th {
    font-weight: 600;
    text-transform: uppercase;
    font-size: 12px;
    letter-spacing: 0.6px;
}
.tender-table tbody tr:hover {
    background: #eef5ff;
    transform: none;
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







	/* .tender-table .status-cell {
	background: #e8f5e9;
    color: #2e7d32;
    padding: 6px 12px;
    border-radius: 20px;
    font-size: 12px;
    font-weight: 600;



	/* background: #fff3cd !important;



	color: #856404;



	font-weight: 600;



	border-radius: 6px;



	margin: 2px;



	padding: 6px 8px !important;



	font-size: 12px; */



	} */
.tender-table .status-cell {
      background: #f8f9fa;           /* light neutral background */
    color: #1a1a1a;
    padding: 6px 16px;
    border-radius: 25px;
    font-size: 12px;
    font-weight: 600;
    border: 2px solid #1a4480;     /* wider, stronger border */
    display: inline-block;
    min-width: 120px;
    text-align: center;
    transition: 0.3s ease;
}
.tender-table .status-cell:hover {
    box-shadow: 0 4px 10px rgba(0,0,0,0.15);
    transform: translateY(-2px);
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







	.action-buttons {



 display: flex;



 justify-content: center;



 gap: 20px;



 margin-top: 20px;



 margin-bottom: 10px;



}







	.btn {



	padding: 15px 40px;



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
 background: linear-gradient(45deg, #1a4480, #2c5aa0);
    color: white;
    border: none;
    padding: 12px 28px;
    border-radius: 30px;
    font-size: 15px;
    font-weight: 600;
    cursor: pointer;
    display: flex;
    align-items: center;
    gap: 10px;
    transition: 0.3s ease;
    box-shadow: 0 4px 12px rgba(0,0,0,0.2);



	}







	.btn-primary:hover {



	transform: translateY(-3px);



	box-shadow: 0 8px 25px rgba(116, 185, 255, 0.3);



	}







	.btn-secondary {
   background: #f1f3f4;
    color: #424242;
    border: 2px solid #cfd8dc;
    padding: 12px 28px;
    border-radius: 30px;
    font-size: 15px;
    font-weight: 600;
    cursor: pointer;
    display: flex;
    align-items: center;
    gap: 10px;
    transition: 0.3s ease;

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
.results-header {
    display: flex;
    font-weight: 500;
    align-items: center;
    padding: 14px 20px;
    margin-bottom: 15px;
    background: linear-gradient(135deg, #1a4480, #2c5aa0);
    border-radius: 10px;
    color: white;
    box-shadow: 0 6px 18px rgba(0, 0, 0, 0.15);
}
.top-section {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 10px;
}

/* .results-title {
    font-size: 18px;
    font-weight: 600;
    letter-spacing: 0.5px;
}

.results-right {
    display: flex;
    align-items: center;
    gap: 10px;
}

.results-count {
    background: #ffffff;
    color: #1a4480;
    font-weight: 700;
    font-size: 18px;
    padding: 6px 14px;
    border-radius: 30px;
    min-width: 45px;
    text-align: center;
    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.15);
}

.results-label {
    font-size: 14px;
    opacity: 0.9;
}


 */
/*  .status-cell {
    background: #e6f4ea !important;
    color: #0b6b2f;
    font-weight: 600;
    padding: 6px 12px !important;
    border-radius: 20px;
    font-size: 12px;
} */

.status-cell {

    
    text-align: center;
    font-weight: 600;
    padding: 7px 18px;
    border-radius: 30px;
    text-align: center;
    min-width: 140px;
    font-size: 12px;
    display: inline-block;
    letter-spacing: 0.4px;
    transition: all 0.25s ease;
    box-shadow: 0 2px 6px rgba(0,0,0,0.08);
    position: relative;
padding-left: 26px;
}

/* 🟢 Tender Box Open */
.status-open {
    background: linear-gradient(135deg, #e8f5e9, #c8e6c9);
    color: #1b5e20;
}

/* 🟣 PO Placed */
.status-po {
    background: linear-gradient(135deg, #f3e5f5, #e1bee7);
    color: #6a1b9a;
    border: none;
}

/* 🔴 Cancelled */
.status-cancelled {
    background: linear-gradient(135deg, #fdecea, #f8cdd1);
    color: #b71c1c;
}

/* 🟢 Published */
.status-published {
    background: linear-gradient(135deg, #e3f2fd, #bbdefb);
    color: #0d47a1;
}

/* ⚪ Others */
.status-other {
    background: #f1f3f4;
    color: #424242;
}

/* Hover effect */
.status-cell:hover {
    transform: translateY(-2px);
    box-shadow: 0 6px 14px rgba(0,0,0,0.15);
}
.status-cell::before {
    content: "";
    width: 8px;
    height: 8px;
    border-radius: 50%;
    position: absolute;
    left: 10px;
    top: 50%;
    transform: translateY(-50%);
}

.status-open::before { background: #2e7d32; }
.status-po::before { background: #8e24aa; }
.status-cancelled::before { background: #c62828; }
.status-published::before { background: #1565c0; }
.status-other::before { background: #757575; }

.tender-table .action-links a {
    background: #f1f5f9;
    border: 1px solid #d0d7de;
    color: #003b73;
}

.tender-table .action-links a:hover {
    background: #003b73;
    color: white;
}
.results-count {
    animation: popIn 0.4s ease;
}

@keyframes popIn {
    0% { transform: scale(0.8); opacity: 0; }
    100% { transform: scale(1); opacity: 1; }
}
.export-btn {
    background: linear-gradient(45deg, #1a7f37, #2da44e) !important;
    color: white !important;
    border-radius: 30px !important;
    padding: 8px 18px !important;
    border: none !important;
    font-weight: 600 !important;
    font-size: 14px !important;
    box-shadow: 0 4px 12px rgba(0,0,0,0.15);
}

.export-btn:hover {
    transform: translateY(-2px);
    box-shadow: 0 6px 18px rgba(0,0,0,0.2);
}
.results-toolbar {
    display: flex;
    justify-content: flex-end;
    justify-content: center;
    padding: 10px 20px;
    background: #f9fafc;
    border-bottom: 1px solid #e2e8f0;
}

.btn-print {
    background: linear-gradient(45deg, #4caf50, #2e7d32);
    color: white;
    border: none;
    padding: 8px 18px;
    border-radius: 30px;
    font-size: 14px;
    font-weight: 600;
    cursor: pointer;
    transition: 0.3s;
}

.btn-print:hover {
    transform: translateY(-2px);
    box-shadow: 0 6px 14px rgba(0,0,0,0.2);
}
.action-links {
    display: flex;
    gap: 8px;
    justify-content: center;
}

.action-btn {
    width: 35px;
    height: 35px;
    display: flex;
    align-items: center;
    justify-content: center;
    border-radius: 8px;
    font-size: 16px;
    color: white;
    transition: 0.3s;
}

.view-btn {
    background: #1976d2;
}

.query-btn {
    background: #ff9800;
}

.action-btn:hover {
    transform: scale(1.1);
    box-shadow: 0 4px 10px rgba(0,0,0,0.3);
}
.results-header-modern {
    display: flex;
    
    align-items: center;
    background: #1a4480;
    color: white;
      gap: 12px;    
    padding: 12px 20px;
    border-radius: 10px;
    font-weight: 600;
}

.results-count-modern {

    background: white;
    color: #1a4480;
    padding: 5px 14px;
    border-radius: 30px;
    font-weight: 700;
}
.results-left {
    display: flex;
    align-items: center;
    gap: 12px;
}
.btn-print-header {
    background: #43a047;
    color: white;
    border: none;
    padding: 6px 16px;
    border-radius: 20px;
    font-size: 13px;
    font-weight: 600;
    cursor: pointer;
    display: flex;
    align-items: center;
    gap: 8px;
    transition: 0.3s ease;
}

.btn-print-header:hover {
    background: #2e7d32;
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



	<div class="search-tabs">



	<a href="${pageContext.request.contextPath}/eps/searchtender/searchtender.do?tab=closed"



	class="search-tab ${activeTab=='closed' ? 'active' : ''}">



	Active Tenders Closing Today



	</a>







	<a href="${pageContext.request.contextPath}/eps/searchtender/searchtender.do?tab=allActive"



	class="search-tab ${activeTab=='allActive' ? 'active' : ''}">



	All Active Tenders



	</a>







	<a href="${pageContext.request.contextPath}/eps/searchtender/searchtender.do?tab=closingToday"



	class="search-tab ${activeTab=='closingToday' ? 'active' : ''}">



	Recently Closed Tenders



	</a>







	<a href="${pageContext.request.contextPath}/eps/searchtender/searchtender.do?tab=custom"



	class="search-tab ${activeTab=='custom' ? 'active' : ''}">



	Custom Search



	</a>







	<a href="${pageContext.request.contextPath}/eps/searchtender/searchtender.do?tab=liveERA"



	class="search-tab ${activeTab=='liveERA' ? 'active' : ''}">






	Live & Upcoming e-RA



	</a>







	<a href="${pageContext.request.contextPath}/eps/searchtender/searchtender.do?tab=closedERA"



	class="search-tab ${activeTab=='closedERA' ? 'active' : ''}">



	Closed e-RA



	</a>



	</div>



	<!-- Custom Search Form -->



	<c:if test="${activeTab=='custom'}">



	<form id="customSearchForm" method="POST" 



 action="${pageContext.request.contextPath}/eps/searchtender/customSearch">
    <div class="search-content">



	<div class="search-info">



	Please choose one or more option for search, view & Downloading E-Tender Notices and



	Click 'Show results' to view details of E-tenders



	</div>
	<!-- 🔹 CRITERIA + METHOD ROW -->
<div class="search-criteria-options criteria-method-row">

  <!-- SEARCH CRITERIA -->
  <div class="search-criteria-section">
    <div class="section-label">Search Criteria</div>

    <div class="criteria-options">
      <div class="criteria-option">
        <input type="radio" name="searchType" id="tenderNo" value="tenderNo" 
               onclick="handleSearchCriteriaChange('tenderNo')" <c:if test="${searchType == 'tenderNo'}">checked</c:if>  />
        <label for="tenderNo">Tender Number</label>
      </div>

      <div class="criteria-option">
        <input type="radio" name="searchType" id="tenderTitle" value="tenderTitle"
               onclick="handleSearchCriteriaChange('tenderTitle')"  <c:if test="${searchType == 'tenderTitle'}">checked</c:if> />
        <label for="tenderTitle">Tender Title</label>
      </div>

      <div class="criteria-option">
        <input type="radio" name="searchType" id="itemDesc" value="itemDesc"
               onclick="handleSearchCriteriaChange('itemDesc')" <c:if test="${searchType == 'itemDesc'}">checked</c:if> />
        <label for="itemDesc">Item Description</label>
      </div>
    </div>
  </div>

  <!-- SEARCH METHOD (HIDDEN INITIALLY) -->
  <div class="search-criteria-section" id="searchMethodWrapper" style="display:none;">
    <div class="section-label">Search Method</div>

    <div class="criteria-options">

      <div class="criteria-option" id="method-startsWith">
        <input type="radio" name="searchMethod" id="startsWith" value="startsWith"   <c:if test="${searchMethod == 'startsWith'}">checked</c:if> />
        <label for="startsWith">Starting with</label>
      </div>

      <div class="criteria-option" id="method-containing">
        <input type="radio" name="searchMethod" id="containing" value="containing" <c:if test="${searchMethod == 'containing'}">checked</c:if> />
        <label for="containing">Containing</label>
      </div>

      <!-- kept but never shown -->
      <div class="criteria-option" id="method-endsWith" style="display:none;">
        <input type="radio" name="searchMethod" id="endsWith" />
        <label for="endsWith">Ending with</label>
      </div>

    </div>
  </div>

</div>
	















	<div class="search-input-and-note">



	<div class="search-input-section">



	<div class="section-label">Search For</div>



	<div class="form-group">



	<input type="text" name="searchText" placeholder="Enter tender number..." value="${searchText != null ? searchText : ''}" />



	</div>



	</div>







	<div class="search-note">



	<div class="info-icon">i</div>



	<div>Please enter minimum first 3 characters of Tender Number or PL NO (these are



	case sensitive) or any 3 consecutive characters of Tender title or item



	description.</div>



	</div>



	</div>







	<div class="form-grid">

    
     

	<c:set var="selectedOrgValue" value="${selectedOrg != null ? selectedOrg : ''}" />
    <div class="form-group">
    <label>Organization</label>
    <select id="orgSelect" class="form-control" name="orgCode">
	<option value="">-- Select Organization --</option> 
	<option value="ALL">All</option>



	



	<c:forEach items="${organizations}" var="org">
	<!--  <option value="${org.intCode}">${org.value}</option>-->
	<option value="${org.intCode}"
    <c:if test="${org.intCode == selectedOrg}">selected</c:if>>
    ${org.value}
    </option>



	<!--<option value="${org.intCode}" <c:if test="${org.intCode == selectedOrgValue}">selected="selected"</c:if>>



	${org.value}



	</option>  -->



	</c:forEach>



	</select>



	</div>
	

	<div class="form-group">



	<label>Work Area <span class="required">*</span></label>



	<select id="workArea" class="form-control" name="workArea" onchange="loadUnits()">
	<option value="">-- Select WorkArea --</option>



	<option value="-1">All</option>



	<!-- <option value="WT">Works</option>-->
	<option value="WT"
    <c:if test="${workArea == 'WT'}">selected</c:if>>
    Works
   </option>
   <option value="PT"
    <c:if test="${workArea == 'PT'}">selected</c:if>>
    Goods & Services
   </option>
   <option value="LT"
    <c:if test="${workArea == 'LT'}">selected</c:if>>
    Earning / Leasing
   </option>
  



	<!-- <option value="PT">Goods & Services</option>
	 -->


	<!--  <option value="LT">Earning / Leasing</option>-->



	</select>



	</div>







	<div class="form-group">



	<label>PU</label>



	<select id="puSelect" class="form-control" name="puCode">



	<option value="">-- Select Zone --</option>



	<c:forEach items="${pus}" var="pu">
	<option value="${pu.intCode}"  <c:if test="${pu.intCode == puCode}">selected</c:if>>${pu.value}</option>
	</c:forEach>



	</select>



	</div>







	<div class="form-group">



	<label>Department <span class="required">*</span></label>
	<select id="deptSelect" class="form-control" name="deptCode">
	<option value="">All</option>

	<c:forEach items="${departments}" var="dept"> 
    
	<option value="${dept.intCode}" <c:if test="${dept.intCode == deptCode}">selected</c:if>>${dept.value}</option>
	</c:forEach>

	</select>

	</div>
	</div>



	<button type="button" id="advancedToggle" class="btn-advanced">

	<span class="filter-icon">

	<svg width="14" height="14" viewBox="0 0 24 24" fill="#2196F3">

	<path d="M4.25 5.61C6.27 8.2 10 13 10 13v6c0 .55.45 1 1 1h2c.55 0 1-.45 1-1v-6s3.72-4.8 5.74-7.39c.51-.66.04-1.61-.79-1.61H5.04c-.83 0-1.3.95-.79 1.61z" />

	</svg>



	</span>

	<span id="toggleText">Show Advanced Filters</span>

	<span class="arrow-icon"></span>

	</button>

	<div class="advanced-filters" id="advancedFilters" style="display: none;">

	<div class="form-grid">

	<div class="form-group">

	<label>Unit</label>

	<select id="unitDropdown" class="form-control">

	<option value="">All</option>

	</select>

	</div>







	<div class="form-group">

	<label>Tender Type:</label>

	<select name="tenderType">
	<option value="-1"
    <c:if test="${tenderType == '-1'}">selected</c:if>>
    All
</option>

<option value="1"
    <c:if test="${tenderType == '1'}">selected</c:if>>
    Limited
</option>

<option value="2"
    <c:if test="${tenderType == '2'}">selected</c:if>>
    Open
</option>
	

	<!--  <option value="-1">All</option>

	<option value="1">Limited</option>

	<option value="2">Open</option>-->
	<option value="3">Special Limited</option>

	<option value="5">Single</option>

	</select>



	</div>







	<div class="form-group">

	<label>Tender Status:</label>

	<select name="tenderStatus">
	<option value="-1"
    <c:if test="${tenderStatus == '-1'}">selected</c:if>>
    All
</option>
	
	<option value="1"
    <c:if test="${tenderStatus == '1'}">selected</c:if>>
    Published
</option>
	<option value="2"
    <c:if test="${tenderStatus == '2'}">selected</c:if>>
    Tender Box Open
</option>
	<option value="3"
    <c:if test="${tenderStatus == '3'}">selected</c:if>>
    Under Evaluation
</option>
	<option value="4"
    <c:if test="${tenderStatus == '4'}">selected</c:if>>
    PO Placed
</option>
	<option value="5"
    <c:if test="${tenderStatus == '5'}">selected</c:if>>
    Cancelled
</option>
<option value="20"
    <c:if test="${tenderStatus == '20'}">selected</c:if>>
    Tabulation Pending
</option>
<option value="7"
    <c:if test="${tenderStatus == '7'}">selected</c:if>>
    Dropped
</option>
<option value="8"
    <c:if test="${tenderStatus == '8'}">selected</c:if>>
    Tender Box Opened-Tabulation Pending
</option>
<option value="9"
    <c:if test="${tenderStatus == '9'}">selected</c:if>>
    Re-tendered
</option>
	

	<!--<option value="-1">All</option>

	<option value="1">Published</option>
	

	<option value="2">Tender Box Open</option>

	<option value="3">Under Evaluation</option>

	<option value="4">PO Placed</option>

	<option value="5">Cancelled</option>

	<option value="7">Dropped</option>

	<option value="8">Tender Box Opened-Tabulation Pending</option>

	<option value="9">Retendered</option>

	<option value="20">Tabulation Pending</option>-->

	</select>



	</div>







	<div class="form-group">

	<label>Bidding System</label>

	<select name="biddingType">

	<option value="-1">All</option>
	<option value="0"
    <c:if test="${biddingType == '0'}">selected</c:if>>
    Single Packet
</option>
<option value="1"
    <c:if test="${biddingType == '1'}">selected</c:if>>
    Two Packet
</option>


	<!-- <option value="0">Single Packet</option>

	<option value="1">Two Packet</option>-->

	</select>

	</div>

	</div>

	</div>







	<div class="date-section">

	<div class="section-label">Select Date Range</div>

	<div class="date-section-content">
	<div class="date-options-row">

	<div class="date-option">

	<input type="radio" name="dateRange" id="custom"  value="custom"
       <c:if test="${dateRange == 'custom'}">checked</c:if> checked />

	<label for="custom">Custom Date Range</label>

	</div>

	<div class="date-option">

	<input type="radio" name="dateRange" id="last3" value="last3"
       <c:if test="${dateRange == 'last3'}">checked</c:if> />

	<label for="last3">Last 3 months</label>

	</div>



	<div class="date-option">



	<input type="radio" name="dateRange" id="next3" value="next3"
       <c:if test="${dateRange == 'next3'}">checked</c:if>/>
	<label for="next3">Next 3 months</label>



	</div>



	<div class="date-option">
	<input type="radio" name="dateRange" id="next6" value="next6"
       <c:if test="${dateRange == 'next6'}">checked</c:if>/>
	<label for="next6">Next 6 months</label>



	</div>



	<div class="date-option">



	<input type="radio" name="dateRange" id="last6" value="last6"
       <c:if test="${dateRange == 'last6'}">checked</c:if>/>



	<label for="last6">Last 6 months</label>



	</div>



	</div>







	<div class="custom-date-section" id="customDateSection" style="display: block;">



	<div class="date-inputs-row">



	<div class="date-input-group">



	<label>From:</label>



	<input id="customStartDate" type="date" name="fromDate" value="${empty fromDate ? '' : fromDate}" />







	</div>



	<div class="date-input-group">



	<label>To:</label>



	<input id="customEndDate" type="date" name="toDate" value="${empty toDate ? '' : toDate}" />



	</div>



	<div class="date-type-group">



	<select id="tenderDateType" name="tenderDateType">



	<option value="TENDER_OPENING_DATE">Tender Closing Date</option>



	<option value="TENDER_PUBLISHING_DATE">Tender Opening Date</option>



	</select>



	</div>







	<div class="quick-range-option">



	<input type="checkbox" id="quickRange" />



	<label for="quickRange">Range Selector</label>







	<div class="quick-range-controls" id="quickRangeControls">



	<div class="date-input-group">



	<select id="customRangeDirection">



	<option value="previous">Previous</option>



	<option value="next">Next</option>



	</select>



	</div>



	<div class="date-input-group">



	<input type="number" id="customRangeNumber" value="1" min="1" max="365" />



	</div>



	<div class="date-input-group">



	<select id="customRangeUnit">



	<option value="days">Day(s)</option>



	<option value="months">Month(s)</option>



	<option value="years">Year(s)</option>



	</select>



	</div>



	<div class="date-input-group">



	<button type="button" id="customRangeApply">Apply</button>



	</div>



	</div>



	</div>



	</div>







	<div class="date-warning">



	


	</div>



	</div>



	</div>



	</div>






    <div id="searchValidationError" style="color:red; margin-bottom:10px; display:none;"></div>

	<div class="action-buttons">



	<button type="submit" id="showResultsBtn" class="btn btn-primary">  <i class="fa-solid fa-magnifying-glass"></i>Show Results</button>
	



	<button type="reset" id="resetBtn" class="btn btn-secondary"> <i class="fa-solid fa-rotate-left"></i>Reset</button>



	</div>



	</div>



	</form>



	</c:if>



	



	<c:if test="${activeTab=='custom'}">



	<div class="results-section">



	<c:choose>



	<c:when test="${not empty tenders}">
 <%--  <h3 style="margin:15px 0;">
    Tender Search Results : 
    <span style="color:blue; font-weight:bold;">
        ${tenders.size()}
    </span>
    Total Tenders Found
</h3>
 --%>
<div class="results-header-modern">

    <div class="results-left">
        <span class="results-title">Tender Search Results</span>
        <span class="results-count-modern">
            ${tenders.size()}
        </span>
    </div>

    <button onclick="printResults()" class="btn-print-header">
        <i class="fa-solid fa-print"></i>
        Print Results
    </button>

</div>
  

  </div>

 
	<table class="tender-table" id="tableTender">



	<thead>
	<tr>
	<th>Dept./Rly. Unit</th>
	<th>Tender No</th>
	<th>Tender Title</th>
	<th>Status</th>
	<th>Work Area</th>
	<th>Due Date/Time</th>
	<th>Due Days</th>
	<th>Actions</th>
	</tr>
	</thead>



	<tbody>
	<c:forEach var="t" items="${tenders}">
	<tr>
	<td>RAILWAY BOARD-STORES/RLY. BOARD</td>
	<td class="tender-no">${t.tenderNo}</td>
	<td class="tender-title">${t.tenderTitle}</td>
	<td class="status-cell">${t.status}</td>
	<td>${t.workArea}</td>
	<td>${t.dueDate}</td>
	<td>${t.dueDays}</td>

<td class="action-links">



 <%-- <a href="viewTender?tenderNo=${t.tenderNo}" 

 title="View Tender" 

 class="icon-btn">

 <svg width="20" height="20" viewBox="0 0 24 24" fill="none">

 <path d="M6 2H14L20 8V22H6V2Z" stroke="#003B73" stroke-width="2"/>

 <path d="M14 2V8H20" stroke="#003B73" stroke-width="2"/>

 </svg>

</a>





 <!-- Modified “Login for Tender” link to open popup -->

 <a href="javascript:void(0)"

 title="Login for Tender"

 class="open-popup"

 data-tno="${t.tenderNo}"

 data-title="${t.tenderTitle}"

 data-dept="RAILWAY BOARD-STORES/RLY. BOARD"

 data-date="${t.dueDate}"

 onclick="openQueryPopup(this)">

 <!-- SVG KEY ICON -->

 <!-- DARK KEY ICON -->

 <svg width="20" height="20" viewBox="0 0 24 24" fill="none">

 <circle cx="15" cy="9" r="6" stroke="#003B73" stroke-width="2"/>

 <path d="M9 20V16L13 12" stroke="#003B73" stroke-width="2"/>

 <circle cx="15" cy="9" r="2" fill="#003B73"/>

 </svg>

</a> --%>

<!-- View Button -->
    <a href="${pageContext.request.contextPath}/eps/searchtender/viewTender?tenderNo=${t.tenderNo}"
       class="action-btn view-btn"
       title="View Tender">
        <i class="fa-solid fa-file-lines"></i>
    </a>

    <!-- Query Button -->
    <a href="javascript:void(0)"
       class="action-btn query-btn open-popup"
       data-tno="${t.tenderNo}"
       data-title="${t.tenderTitle}"
       data-dept="RAILWAY BOARD-STORES/RLY. BOARD"
       data-date="${t.dueDate}"
       onclick="openQueryPopup(this)"
       title="Query & Response">
        <i class="fa-solid fa-key"></i>
    </a>



 <!-- (Removed the separate ❓ icon) -->



</td>



	</tr>

	</c:forEach>

	</tbody>

	</table>

	</c:when>

	</c:choose>
	</div>

	</c:if>

	

	<!-- Popup Overlay -->

<div id="queryPopup" class="popup-overlay">

 <div class="popup-box">

 <span class="close-btn" onclick="closeQueryPopup()">&times;</span>



 <h3>Query And Response</h3>



 <div class="popup-content">

 <p><strong>Tender No:</strong> <span id="p_tno"></span></p>

 <p><strong>Dept/Rly:</strong> <span id="p_dept"></span></p>

 <p><strong>Closing Date/Time:</strong> <span id="p_date"></span></p>

 <p><strong>Tender Title:</strong> <span id="p_title"></span></p>



 <p style="margin-top:20px; font-weight:bold; text-align:center;">

 No Queries / Clarifications available for this tender

 </p>

 </div>

 </div>

</div>





	<!-- Tender List Results for Other Tabs -->



	<c:if test="${activeTab!='custom'}">



	<div class="results-section">



	<c:choose>



	<%-- <c:when test="${not empty tenders}"> --%>

<c:when test="${not empty tenders}">
<div class="results-left">
    <div class="results-header">
        Tender Search Results:
        <span style="color:white;">
            ${tenders.size()}
        </span>
    </div>
     <button onclick="printResults()" class="btn-print">
          <i class="fa-solid fa-print"></i> Print Results
      </button>
    </div>
    
    <div class="results-toolbar">
     
  </div>

	<table class="tender-table">



	<thead>



	<tr>



	<th>Dept./Rly. Unit</th>



	<th>Tender No</th>



	<th>Tender Title</th>



	<th>Status</th>



	<th>Work Area</th>



	<th>Due Date/Time</th>



	<th>Due Days</th>



	<th>Actions</th>



	</tr>



	</thead>



	<tbody>



	<c:forEach var="t" items="${tenders}">



	<tr>



	<td>RAILWAY BOARD-STORES/RLY. BOARD</td>



	<td class="tender-no">${t.tenderNo}</td>



	<td class="tender-title">${t.tenderTitle}</td>



	<td class="status-cell">${t.status}</td>



	<td>${t.workArea}</td>



	<td>${t.dueDate}</td>



	<td>${t.dueDays}</td>

<td class="action-links">



 <%-- <a href="viewTender?tenderNo=${t.tenderNo}" 

 title="View Tender" 

 class="icon-btn">

 <svg width="20" height="20" viewBox="0 0 24 24" fill="none">

 <path d="M6 2H14L20 8V22H6V2Z" stroke="#003B73" stroke-width="2"/>

 <path d="M14 2V8H20" stroke="#003B73" stroke-width="2"/>

 </svg>

</a>





 <!-- Modified “Login for Tender” link to open popup -->

 <a href="javascript:void(0)"

 title="Login for Tender"

 class="open-popup"

 data-tno="${t.tenderNo}"

 data-title="${t.tenderTitle}"

 data-dept="RAILWAY BOARD-STORES/RLY. BOARD"

 data-date="${t.dueDate}"

 onclick="openQueryPopup(this)">

 <!-- SVG KEY ICON -->

 <!-- DARK KEY ICON -->

 <svg width="20" height="20" viewBox="0 0 24 24" fill="none">

 <circle cx="15" cy="9" r="6" stroke="#003B73" stroke-width="2"/>

 <path d="M9 20V16L13 12" stroke="#003B73" stroke-width="2"/>

 <circle cx="15" cy="9" r="2" fill="#003B73"/>

 </svg>

</a>
 --%>
<!-- View -->
    <a href="${pageContext.request.contextPath}/eps/searchtender/viewTender?tenderNo=${t.tenderNo}"
       class="action-btn view-btn"
       title="View Tender">
        <i class="fa-solid fa-file-lines"></i>
    </a>

    <!-- Query -->
    <a href="javascript:void(0)"
       class="action-btn query-btn"
       data-tno="${t.tenderNo}"
       data-title="${t.tenderTitle}"
       data-dept="RAILWAY BOARD-STORES/RLY. BOARD"
       data-date="${t.dueDate}"
       onclick="openQueryPopup(this)"
       title="Query & Response">
        <i class="fa-solid fa-key"></i>
    </a>

 <!-- (Removed the separate ❓ icon) -->



</td>







	</tr>



	</c:forEach>



	</tbody>



	</table>



	</c:when>



	<c:otherwise>



 <div class="no-results">



 <div class="no-results-icon">📋</div>



 <h3>No Tenders Found</h3>



 <p>We couldn't find any tenders matching your criteria. Please try different filters or check back later.</p>



 </div>



</c:otherwise>



	</c:choose>



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



	<!--  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>-->



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

/* 	function printResults() {

	    var printContent = document.querySelector(".tender-table").outerHTML;

	    var newWindow = window.open('', '', 'height=700,width=900');

	    newWindow.document.write('<html><head><title>Print</title>');
	    newWindow.document.write('<link rel="stylesheet" href="YOUR_CSS_PATH">');
	    newWindow.document.write('</head><body>');
	    newWindow.document.write(printContent);
	    newWindow.document.write('</body></html>');

	    newWindow.document.close();
	    newWindow.print();
	} */

	 function printResults() {
	    window.print();
	} 
	/* function triggerPrint() {
	    table.button('.buttons-print').trigger();
	} */


	function openSidebar() { document.getElementById('mySidebar').style.width = '250px'; }



	function closeSidebar() { document.getElementById('mySidebar').style.width = '0'; }



	



	document.getElementById("customSearchForm")?.addEventListener("submit", function() {



	console.log("✅ FORM SUBMIT EVENT FIRED");



	});



	// Search criteria placeholder updates
	document.querySelectorAll('input[name="searchType"]').forEach(radio => {

	radio.addEventListener('change', function () {

	const searchInput = document.querySelector('.search-input-section input');

	if (this.id === 'tenderNo') searchInput.placeholder = 'Enter tender number...';

	else if (this.id === 'tenderTitle') searchInput.placeholder = 'Enter tender title...';

	else if (this.id === 'itemDesc') searchInput.placeholder = 'Enter item description...';
     });

	});







	// Search method placeholder updates

	document.querySelectorAll('input[name="searchMethod"]').forEach(radio => {

	radio.addEventListener('change', function () {

	const searchInput = document.querySelector('.search-input-section input');

	if (!searchInput) return;

	let base = searchInput.placeholder.replace(/Enter (beginning of|any part of|ending of) /i, 'Enter ');

	if (this.id === 'startsWith') searchInput.placeholder = base.replace('Enter', 'Enter beginning of');

	else if (this.id === 'containing') searchInput.placeholder = base.replace('Enter', 'Enter any part of');

	else if (this.id === 'endsWith') searchInput.placeholder = base.replace('Enter', 'Enter ending of');

	});

	});







	// Date functions



	function formatDateYMD(date) {



	let yyyy = date.getFullYear();



	let mm = date.getMonth() + 1;



	let dd = date.getDate();



	if (mm < 10) mm = '0' + mm;



	if (dd < 10) dd = '0' + dd;



	return `${yyyy}-${mm}-${dd}`;



	}







	function initializeDates() {



	const today = new Date();



	const customStartDate = document.getElementById('customStartDate');



	const customEndDate = document.getElementById('customEndDate');



	if (customStartDate && customEndDate) {



	customStartDate.value = formatDateYMD(today);



	customEndDate.value = formatDateYMD(today);



	}



	}







	// Initialize dates when page loads



	/*document.addEventListener('DOMContentLoaded', function () {



	initializeDates();







	const searchInput = document.querySelector('.search-input-section .form-group input');



	if (searchInput) {



	searchInput.focus();



	}



	});*/
	document.addEventListener('DOMContentLoaded', function () {

	    const start = document.getElementById("customStartDate");
	    const end = document.getElementById("customEndDate");

	    // ✅ Only set today's date if no value is coming from backend
	    if (start && end) {
	        if (!start.value && !end.value) {
	            initializeDates();
	        }
	    }

	    const searchInput = document.querySelector('.search-input-section .form-group input');

	    if (searchInput) {
	        searchInput.focus();
	    }

	});








	// Date range toggle



	const dateRangeRadios = document.querySelectorAll('input[name="dateRange"]');



	const customDateSection = document.getElementById('customDateSection');







	dateRangeRadios.forEach(radio => {



	radio.addEventListener('change', function () {



	if (this.id === 'custom') {



	customDateSection.style.display = 'block';



	initializeDates();



	} else {



	customDateSection.style.display = 'none';



	}



	});



	});



	document.addEventListener("DOMContentLoaded", function () {



	const start = document.getElementById("customStartDate");

	const end = document.getElementById("customEndDate");

	const customSection = document.getElementById("customDateSection");



	const radios = document.querySelectorAll("input[name='dateRange']");



	radios.forEach(radio => {

	radio.addEventListener("change", () => {

	let today = new Date();

	let startDate, endDate;



	switch (radio.id) {



	case "custom":

	customSection.style.display = "block";

	start.value = "";

	end.value = "";

	return;



	case "last3":

	endDate = today;

	startDate = new Date();

	startDate.setMonth(startDate.getMonth() - 3);

	break;



	case "next3":

	startDate = today;

	endDate = new Date();

	endDate.setMonth(endDate.getMonth() + 3);

	break;



	case "last6":

	endDate = today;

	startDate = new Date();

	startDate.setMonth(startDate.getMonth() - 6);

	break;



	case "next6":

	startDate = today;

	endDate = new Date();

	endDate.setMonth(endDate.getMonth() + 6);

	break;

	}



	// Auto-fill the inputs with yyyy-mm-dd format

	start.value = startDate.toISOString().split("T")[0];

	end.value = endDate.toISOString().split("T")[0];



	// Custom date section visible (optional)

	customSection.style.display = "block";

	});

	});



	});





	// Quick Range Toggle



	const quickRangeRadio = document.getElementById('quickRange');



	const quickRangeControls = document.getElementById('quickRangeControls');







	if (quickRangeRadio && quickRangeControls) {



	quickRangeRadio.addEventListener('change', function () {



	if (this.checked) {



	quickRangeControls.style.display = 'flex';



	} else {



	quickRangeControls.style.display = 'none';



	}



	});



	}







	// Quick Range Apply Button



	const applyBtn = document.getElementById('customRangeApply');



	if (applyBtn) {



	applyBtn.addEventListener('click', function () {



	const direction = document.getElementById('customRangeDirection').value;



	const number = parseInt(document.getElementById('customRangeNumber').value);



	const unit = document.getElementById('customRangeUnit').value;







	const today = new Date();



	let startDate, endDate;







	if (direction === 'previous') {



	endDate = new Date(today);



	startDate = new Date(today);







	if (unit === 'days') {



	startDate.setDate(startDate.getDate() - number);



	} else if (unit === 'months') {



	startDate.setMonth(startDate.getMonth() - number);



	} else if (unit === 'years') {



	startDate.setFullYear(startDate.getFullYear() - number);



	}



	} else {



	startDate = new Date(today);



	endDate = new Date(today);







	if (unit === 'days') {



	endDate.setDate(endDate.getDate() + number);



	} else if (unit === 'months') {



	endDate.setMonth(endDate.getMonth() + number);



	} else if (unit === 'years') {



	endDate.setFullYear(endDate.getFullYear() + number);



	}



	}







	document.getElementById('customStartDate').value = formatDateYMD(startDate);



	document.getElementById('customEndDate').value = formatDateYMD(endDate);







	quickRangeControls.style.display = 'none';



	quickRangeRadio.checked = false;







	alert(`Date range set: ${direction} ${number} ${unit}`);



	});



	}







	// Advanced filters toggle



	const advancedToggle = document.getElementById('advancedToggle');



	const advancedFilters = document.getElementById('advancedFilters');



	const toggleText = document.getElementById('toggleText');







	if (advancedToggle && advancedFilters && toggleText) {



	advancedToggle.addEventListener('click', function () {



	if (advancedFilters.style.display === 'none' || advancedFilters.style.display === '') {



	advancedFilters.style.display = 'block';



	toggleText.textContent = 'Hide Advanced Filters';



	advancedToggle.classList.add('open');



	} else {



	advancedFilters.style.display = 'none';



	toggleText.textContent = 'Show Advanced Filters';



	advancedToggle.classList.remove('open');



	}



	});



	}







	// Show Results button



	const showResultsBtn = document.querySelector('.btn-primary');



	if (showResultsBtn) {



	showResultsBtn.addEventListener('click', function (e) {



	



	



	});



	}







	// Reset button functionality



	const resetBtn = document.getElementById('resetBtn');



	if (resetBtn) {



	resetBtn.addEventListener('click', function () {



	// Reset search input



	const searchInput = document.querySelector('.search-input-section input');



	if (searchInput) searchInput.value = '';







	// Reset search criteria to default



	const tenderNoRadio = document.getElementById('tenderNo');



	const startsWithRadio = document.getElementById('startsWith');



	if (tenderNoRadio) tenderNoRadio.checked = true;



	if (startsWithRadio) startsWithRadio.checked = true;


	// Reset all select dropdowns to first option
	document.querySelectorAll('select').forEach(select => {

	select.selectedIndex = 0;

	});

	// Reset date range to custom (default)
	const customRadio = document.getElementById('custom');



	if (customRadio) customRadio.checked = true;

	// Reset tender date type dropdown



	const tenderDateType = document.getElementById('tenderDateType');

	if (tenderDateType) tenderDateType.value = 'closing';

	// Reset dates to today



	initializeDates();

	// Show custom date section by default

	if (customDateSection) customDateSection.style.display = 'block';


	// Hide advanced filters if shown

	if (advancedFilters && advancedFilters.style.display === 'block') {
	advancedFilters.style.display = 'none';
	if (toggleText) toggleText.textContent = 'Show Advanced Filters';

	if (advancedToggle) advancedToggle.classList.remove('open');
	}

	// Hide quick range controls if shown

	if (quickRangeControls && quickRangeControls.style.display === 'flex') {

	quickRangeControls.style.display = 'none';

	if (quickRangeRadio) quickRangeRadio.checked = false;

	}

	alert('Form has been reset to default values');

	});
	}







	// always pick app context path (e.g. /EPSGuest)

	var baseUrl = "${pageContext.request.contextPath}";

	// When organization changes → load PUs and Departments
	$("#orgSelect").change(function () {

    let orgCode = $(this).val();
    if (!orgCode) return;

    let selectedPU = "${puCode}";
    let selectedDept = "${deptCode}";

    // --- Load PUs ---
    $.getJSON(baseUrl + "/eps/searchtender/getPUs", { orgCode: orgCode }, function (data) {
    	

        let puDropdown = $("#puSelect");
        puDropdown.empty().append('<option value="">-- Select PU --</option>');

        $.each(data, function (i, pu) {

            let selected = (pu.intCode == selectedPU) ? "selected" : "";

            puDropdown.append(
                '<option value="' + pu.intCode + '" ' + selected + '>' +
                pu.value +
                '</option>'
            );
        });

    });

    // --- Load Departments ---
    $.getJSON(baseUrl + "/eps/searchtender/getDepartments", { orgCode: orgCode }, function (data) {

        let deptDropdown = $("#deptSelect");
        deptDropdown.empty().append('<option value="">-- Select Department --</option>');

        $.each(data, function (i, dept) {

            let selected = (dept.intCode == selectedDept) ? "selected" : "";

            deptDropdown.append(
                '<option value="' + dept.intCode + '" ' + selected + '>' +
                dept.value +
                '</option>'
            );
        });

    });

});

	
	
	/*$("#orgSelect").change(function () {
	let orgCode = $(this).val();
	if (!orgCode) return;


	// -- Load PUs ---

	$.getJSON(baseUrl + "/eps/searchtender/getPUs", { orgCode: orgCode }, function (data) {

	let puDropdown = $("#puSelect");

	puDropdown.empty().append('<option value="">-- Select PU --</option>');
	let selectedPU = "${puCode}";
	$.each(data, function (i, pu) {
		let selected = (pu.intCode == selectedPU) ? "selected" : "";
	puDropdown.append('<option value="' + pu.intCode + '">' + pu.value + '</option>');

	});

	});


	// --- Load Departments ---
	$.getJSON(baseUrl + "/eps/searchtender/getDepartments", { orgCode: orgCode }, function (data) {

	let deptDropdown = $("#deptSelect");

	deptDropdown.empty().append('<option value="">-- Select Department --</option>');
	let selectedDept = "${deptCode}";
	$.each(data, function (i, dept) {
		let selected = (dept.intCode == selectedDept) ? "selected" : "";
	deptDropdown.append('<option value="' + dept.intCode + '">' + dept.value + '</option>');
	});

	});

	});*/







	// When work area changes → load Units
	function loadUnits() {

	let workArea = $("#workArea").val();

	let orgCode = $("#orgSelect").val();

	if (!orgCode) return;







	$.getJSON(baseUrl + "/eps/searchtender/getUnits", { workArea: workArea, orgCode: orgCode }, function (data) {

	let unitDropdown = $("#unitDropdown");

	unitDropdown.empty().append('<option value="">-- Select Unit --</option>');
	
	$.each(data, function (i, unit) {

	unitDropdown.append('<option value="' + unit.intCode + '">' + unit.value + '</option>');



	});

	});

	}
	function openQueryPopup(tenderNo) {



	// Static content only for now
	document.getElementById("queryPopup").style.display = "flex";

	}



	function closeQueryPopup() {

	document.getElementById("queryPopup").style.display = "none";

	}
	function handleSearchCriteriaChange(criteriaId) {

		  const wrapper = document.getElementById("searchMethodWrapper");
		  const startsWith = document.getElementById("method-startsWith");
		  const containing = document.getElementById("method-containing");

		  if (!wrapper || !startsWith || !containing) return;

		  // 🔥 show Search Method ONLY after click
		  wrapper.style.display = "block";

		  // hide all first
		  startsWith.style.display = "none";
		  containing.style.display = "none";

		  // reset radio
		  document.querySelectorAll("input[name='searchMethod']").forEach(r => {
		    r.checked = false;
		  });

		  // RULES
		  if (criteriaId === "tenderNo") {
		    startsWith.style.display = "flex";
		    document.getElementById("startsWith").checked = true;
		  } 
		  else {
		    startsWith.style.display = "flex";
		    containing.style.display = "flex";
		    document.getElementById("startsWith").checked = true;
		  }
		  // Placeholder update
		  const input = document.querySelector("input[name='searchText']");
		  if (criteriaId === "tenderNo") input.placeholder = "Enter tender number...";
		  else if (criteriaId === "tenderTitle") input.placeholder = "Enter tender title...";
		  else input.placeholder = "Enter item description...";
		}
	// 🔥 Restore Search Criteria UI on page reload
	document.addEventListener("DOMContentLoaded", function () {

	    const selectedSearchType = document.querySelector("input[name='searchType']:checked");

	    if (selectedSearchType) {
	        handleSearchCriteriaChange(selectedSearchType.value);
	    }

	});



	function openQueryPopup(el) {

	// get values from clicked link

	const tno = el.getAttribute("data-tno");
	const title = el.getAttribute("data-title");
	const dept = el.getAttribute("data-dept");
	const date = el.getAttribute("data-date");



	// set to popup

	document.getElementById("p_tno").textContent = tno;
	document.getElementById("p_title").textContent = title;
	document.getElementById("p_dept").textContent = dept;
	document.getElementById("p_date").textContent = date;



	// show popup

	document.getElementById("queryPopup").style.display = "flex";

	}



	function closeQueryPopup() {

	document.getElementById("queryPopup").style.display = "none";

	}

	
	
	

	</script>

<script >

 src="https://translation-plugin.bhashini.co.in/v3/website_translation_utility.js"

 language-icon-color="#ffffff">

</script>



<script src="${pageContext.request.contextPath}/assets/bhashini/bhashini-init.js"></script>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>


<script >
let table;

$(document).ready(function () {

    if ($('#tableTender').length) {

        table = $('#tableTender').DataTable({
            paging: true,
            searching: true,
            ordering: true,
            info: true,
            pageLength: 5,
            lengthChange: true,
            dom: 'Bfrtip',
            buttons: [
                {
                    extend: 'excelHtml5',
                    text: 'Export to Excel',
                    title: 'Tender_Search_Results',
                    className: 'export-btn',
                    exportOptions: {
                        columns: ':not(:last-child)'
                    }
                }
            ]
        });

        // ✅ Apply status styling initially
        applyStatusStyles();

        // ✅ Reapply after every DataTables redraw
       if (typeof table !== "undefined") {
        table.on('draw', function () {
            applyStatusStyles();
        });
    }
    }

});

function applyStatusStyles() {

    $(".status-cell").each(function () {

        let text = $(this).text().trim();

        $(this).removeClass(
            "status-published status-cancelled status-open status-po status-other"
        );

        if (text === "Published") {
            $(this).addClass("status-published");
        } 
        else if (text === "Cancelled") {
            $(this).addClass("status-cancelled");
        } 
        else if (text === "Tender Box Open") {
            $(this).addClass("status-open");
        }
        else if (text === "PO Placed") {
            $(this).addClass("status-po");
        }
        else {
            $(this).addClass("status-other");
        }

    });
}
</script>
<script>
document.addEventListener("DOMContentLoaded", function () {

    const form = document.getElementById("customSearchForm");
    if (!form) return;

    form.addEventListener("submit", function (e) {

        let errorDiv = document.getElementById("searchValidationError");
        errorDiv.style.display = "none";
        errorDiv.innerText = "";

        let hasError = false;
        let atLeastOneFilterUsed = false;

        // =========================
        // 1️⃣ TEXT VALIDATION
        // =========================
        let selectedSearchType = document.querySelector('input[name="searchType"]:checked');
        let searchTextInput = document.querySelector('input[name="searchText"]');
        let searchText = searchTextInput.value.trim();

        searchTextInput.style.border = "";

        if (selectedSearchType && searchText.length >= 3) {
            atLeastOneFilterUsed = true;
        }

        if (selectedSearchType && searchText.length > 0 && searchText.length < 3) {
            hasError = true;
            errorDiv.innerText = "Please enter at least 3 characters in search box.";
            searchTextInput.style.border = "1px solid red";
        }

        // =========================
        // 2️⃣ DROPDOWN VALIDATION
        // =========================
        let org = document.getElementById("orgSelect").value;
        let workArea = document.getElementById("workArea").value;
        let pu = document.getElementById("puSelect").value;
        let dept = document.getElementById("deptSelect").value;

        let tenderType = document.querySelector('select[name="tenderType"]').value;
        let tenderStatus = document.querySelector('select[name="tenderStatus"]').value;
        let biddingType = document.querySelector('select[name="biddingType"]').value;

        if (
            org !== "" ||
            workArea !== "" ||
            pu !== "" ||
            dept !== "" ||
            tenderType !== "-1" ||
            tenderStatus !== "-1" ||
            biddingType !== "-1"
        ) {
            atLeastOneFilterUsed = true;
        }

        // =========================
        // 3️⃣ DATE VALIDATION
        // =========================
        let selectedDateRange = document.querySelector('input[name="dateRange"]:checked');
        let fromInput = document.getElementById("customStartDate");
        let toInput = document.getElementById("customEndDate");

        fromInput.style.border = "";
        toInput.style.border = "";

        if (selectedDateRange) {

            if (selectedDateRange.id === "custom") {

                let fromDate = fromInput.value;
                let toDate = toInput.value;

                if (fromDate !== "" && toDate !== "") {
                    atLeastOneFilterUsed = true;
                }

                if (fromDate === "" || toDate === "") {
                    hasError = true;
                    errorDiv.innerText = "Both From Date and To Date are required.";
                    fromInput.style.border = "1px solid red";
                    toInput.style.border = "1px solid red";
                } else {

                    let from = new Date(fromDate);
                    let to = new Date(toDate);

                    if (from > to) {
                        hasError = true;
                        errorDiv.innerText = "From Date cannot be greater than To Date.";
                        fromInput.style.border = "1px solid red";
                        toInput.style.border = "1px solid red";
                    }

                    let diffDays = Math.ceil((to - from) / (1000 * 60 * 60 * 24));

                    if (!hasError && diffDays > 365) {
                        hasError = true;
                        errorDiv.innerText = "Date range should be within one year.";
                        fromInput.style.border = "1px solid red";
                        toInput.style.border = "1px solid red";
                    }
                }

            } else {
                // predefined range selected
                atLeastOneFilterUsed = true;
            }
        }

        // =========================
        // 4️⃣ FINAL MASTER CHECK
        // =========================
        if (!hasError && !atLeastOneFilterUsed) {
            hasError = true;
            errorDiv.innerText = "Please apply at least one valid search filter before clicking Show Results.";
        }

        if (hasError) {
            e.preventDefault();
            errorDiv.style.display = "block";
        }

    });

});

</script>




<script>
document.addEventListener("DOMContentLoaded", function() {

    let dateRangeRadios = document.querySelectorAll('input[name="dateRange"]');
    let fromInput = document.getElementById("customStartDate");
    let toInput = document.getElementById("customEndDate");
    let customDateSection = document.getElementById("customDateSection");

    function handleDateRangeChange() {

        let selected = document.querySelector('input[name="dateRange"]:checked');

        if (!selected) return;

        if (selected.id === "custom") {
            // ✅ show date inputs
        	fromInput.readOnly = false;
            toInput.readOnly = false;
            customDateSection.style.opacity = "1";
        } else {
            // ❌ hide date inputs
            fromInput.readOnly = true;
            toInput.readOnly = true;
            customDateSection.style.opacity = "0.5";


            
        }
    }

    // Attach change listener to all radio buttons
    dateRangeRadios.forEach(function(radio) {
        radio.addEventListener("change", handleDateRangeChange);
    });

    // Run once on page load
    handleDateRangeChange();
   /* $(document).ready(function () {

        let selectedOrg = $("#orgSelect").val();

        if (selectedOrg && selectedOrg !== "") {
            $("#orgSelect").trigger("change");
        }

    });*/


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






<%-- <%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>



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







	html z{



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







	.search-header {



	background: linear-gradient(135deg, #2c5aa0 0%, #1a4480 50%, #0f3460 100%);



	color: white;



	padding: 20px;



	text-align: center;



	position: relative;



	box-shadow: 0 4px 15px rgba(44, 90, 160, 0.3);



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



 padding: 25px 25px 10px 25px;



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
    background: #003b73;
}

.tender-table th {
    font-weight: 600;
    text-transform: uppercase;
    font-size: 12px;
    letter-spacing: 0.6px;
}
.tender-table tbody tr:hover {
    background: #eef5ff;
    transform: none;
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







	.action-buttons {



 display: flex;



 justify-content: center;



 gap: 20px;



 margin-top: 20px;



 margin-bottom: 10px;



}







	.btn {



	padding: 15px 40px;



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
.results-header {
    display: flex;
    font-weight: 500;
    align-items: center;
    padding: 14px 20px;
    margin-bottom: 15px;
    background: linear-gradient(135deg, #1a4480, #2c5aa0);
    border-radius: 10px;
    color: white;
    box-shadow: 0 6px 18px rgba(0, 0, 0, 0.15);
}

results-title {
    font-size: 18px;
    font-weight: 600;
    letter-spacing: 0.5px;
}

.results-right {
    display: flex;
    align-items: center;
    gap: 10px;
}

.results-count {
    background: #ffffff;
    color: #1a4480;
    font-weight: 700;
    font-size: 18px;
    padding: 6px 14px;
    border-radius: 30px;
    min-width: 45px;
    text-align: center;
    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.15);
}

.results-label {
    font-size: 14px;
    opacity: 0.9;
}


 */
 .status-cell {
    background: #e6f4ea !important;
    color: #0b6b2f;
    font-weight: 600;
    padding: 6px 12px !important;
    border-radius: 20px;
    font-size: 12px;
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



	<div class="search-tabs">



	<a href="${pageContext.request.contextPath}/eps/searchtender/searchtender.do?tab=closed"



	class="search-tab ${activeTab=='closed' ? 'active' : ''}">



	Active Tenders Closing Today



	</a>







	<a href="${pageContext.request.contextPath}/eps/searchtender/searchtender.do?tab=allActive"



	class="search-tab ${activeTab=='allActive' ? 'active' : ''}">



	All Active Tenders



	</a>







	<a href="${pageContext.request.contextPath}/eps/searchtender/searchtender.do?tab=closingToday"



	class="search-tab ${activeTab=='closingToday' ? 'active' : ''}">



	Recently Closed Tenders



	</a>







	<a href="${pageContext.request.contextPath}/eps/searchtender/searchtender.do?tab=custom"



	class="search-tab ${activeTab=='custom' ? 'active' : ''}">



	Custom Search



	</a>







	<a href="${pageContext.request.contextPath}/eps/searchtender/searchtender.do?tab=liveERA"



	class="search-tab ${activeTab=='liveERA' ? 'active' : ''}">






	Live & Upcoming e-RA



	</a>







	<a href="${pageContext.request.contextPath}/eps/searchtender/searchtender.do?tab=closedERA"



	class="search-tab ${activeTab=='closedERA' ? 'active' : ''}">



	Closed e-RA



	</a>



	</div>



	<!-- Custom Search Form -->



	<c:if test="${activeTab=='custom'}">
<c:if test="${activeTab=='custom' or not empty tenders}">


	<form id="customSearchForm" method="POST" 



 action="${pageContext.request.contextPath}/eps/searchtender/customSearch">
    <div class="search-content">



	<div class="search-info">



	Please choose one or more option for search, view and Downloading E-Tender Notices and



	Click 'Show results' to view details of E-tenders



	</div>
	<!-- 🔹 CRITERIA + METHOD ROW -->
<div class="search-criteria-options criteria-method-row">

  <!-- SEARCH CRITERIA -->
  <div class="search-criteria-section">
    <div class="section-label">Search Criteria</div>

    <div class="criteria-options">
      <div class="criteria-option">
        <input type="radio" name="searchType" id="tenderNo" value="tenderNo" 
               onclick="handleSearchCriteriaChange('tenderNo')" <c:if test="${searchType == 'tenderNo'}">checked</c:if>  />
        <label for="tenderNo">Tender Number</label>
      </div>

      <div class="criteria-option">
        <input type="radio" name="searchType" id="tenderTitle" value="tenderTitle"
               onclick="handleSearchCriteriaChange('tenderTitle')"  <c:if test="${searchType == 'tenderTitle'}">checked</c:if> />
        <label for="tenderTitle">Tender Title</label>
      </div>

      <div class="criteria-option">
        <input type="radio" name="searchType" id="itemDesc" value="itemDesc"
               onclick="handleSearchCriteriaChange('itemDesc')" <c:if test="${searchType == 'itemDesc'}">checked</c:if> />
        <label for="itemDesc">Item Description</label>
      </div>
    </div>
  </div>

  <!-- SEARCH METHOD (HIDDEN INITIALLY) -->
  <div class="search-criteria-section" id="searchMethodWrapper" style="display:none;">
    <div class="section-label">Search Method</div>

    <div class="criteria-options">

      <div class="criteria-option" id="method-startsWith">
        <input type="radio" name="searchMethod" id="startsWith" value="startsWith"   <c:if test="${searchMethod == 'startsWith'}">checked</c:if> />
        <label for="startsWith">Starting with</label>
      </div>

      <div class="criteria-option" id="method-containing">
        <input type="radio" name="searchMethod" id="containing" value="containing" <c:if test="${searchMethod == 'containing'}">checked</c:if> />
        <label for="containing">Containing</label>
      </div>

      <!-- kept but never shown -->
      <div class="criteria-option" id="method-endsWith" style="display:none;">
        <input type="radio" name="searchMethod" id="endsWith" />
        <label for="endsWith">Ending with</label>
      </div>

    </div>
  </div>

</div>
	















	<div class="search-input-and-note">



	<div class="search-input-section">



	<div class="section-label">Search For</div>



	<div class="form-group">



	<input type="text" name="searchText" placeholder="Enter tender number..." value="${searchText != null ? searchText : ''}" />



	</div>



	</div>







	<div class="search-note">



	<div class="info-icon">i</div>



	<div>Please enter minimum first 3 characters of Tender Number or PL NO (these are



	case sensitive) or any 3 consecutive characters of Tender title or item



	description.</div>



	</div>



	</div>







	<div class="form-grid">

    
     

	<c:set var="selectedOrgValue" value="${selectedOrg != null ? selectedOrg : ''}" />
    <div class="form-group">
    <label>Organization</label>
    <select id="orgSelect" class="form-control" name="orgCode">
	<option value="">-- Select Organization --</option>
	<option value="ALL">All</option>



	



	<c:forEach items="${organizations}" var="org">
	<!--  <option value="${org.intCode}">${org.value}</option>-->
	<option value="${org.intCode}"
    <c:if test="${org.intCode == selectedOrg}">selected</c:if>>
    ${org.value}
    </option>



	<!--<option value="${org.intCode}" <c:if test="${org.intCode == selectedOrgValue}">selected="selected"</c:if>>



	${org.value}



	</option>  -->



	</c:forEach>



	</select>



	</div>
	

	<div class="form-group">



	<label>Work Area <span class="required">*</span></label>



	<select id="workArea" class="form-control" name="workArea" onchange="loadUnits()">
	<option value="">-- Select WorkArea --</option>



	<option value="-1">All</option>



	<!-- <option value="WT">Works</option>-->
	<option value="WT"
    <c:if test="${workArea == 'WT'}">selected</c:if>>
    Works
   </option>
   <option value="PT"
    <c:if test="${workArea == 'PT'}">selected</c:if>>
    Goods & Services
   </option>
   <option value="LT"
    <c:if test="${workArea == 'LT'}">selected</c:if>>
    Earning / Leasing
   </option>
  



	<!-- <option value="PT">Goods & Services</option>
	 -->


	<!--  <option value="LT">Earning / Leasing</option>-->



	</select>



	</div>







	<div class="form-group">



	<label>PU</label>



	<select id="puSelect" class="form-control" name="puCode">



	<option value="">-- Select Zone --</option>



	<c:forEach items="${pus}" var="pu">
	<option value="${pu.intCode}"  <c:if test="${pu.intCode == puCode}">selected</c:if>>${pu.value}</option>
	</c:forEach>



	</select>



	</div>







	<div class="form-group">



	<label>Department <span class="required">*</span></label>
	<select id="deptSelect" class="form-control" name="deptCode">
	<option value="">All</option>

	<c:forEach items="${departments}" var="dept"> 
    
	<option value="${dept.intCode}" <c:if test="${dept.intCode == deptCode}">selected</c:if>>${dept.value}</option>
	</c:forEach>

	</select>

	</div>
	</div>



	<button type="button" id="advancedToggle" class="btn-advanced">

	<span class="filter-icon">

	<svg width="14" height="14" viewBox="0 0 24 24" fill="#2196F3">

	<path d="M4.25 5.61C6.27 8.2 10 13 10 13v6c0 .55.45 1 1 1h2c.55 0 1-.45 1-1v-6s3.72-4.8 5.74-7.39c.51-.66.04-1.61-.79-1.61H5.04c-.83 0-1.3.95-.79 1.61z" />

	</svg>



	</span>

	<span id="toggleText">Show Advanced Filters</span>

	<span class="arrow-icon"></span>

	</button>

	<div class="advanced-filters" id="advancedFilters" style="display: none;">

	<div class="form-grid">

	<div class="form-group">

	<label>Unit</label>

	<select id="unitDropdown" class="form-control">

	<option value="">All</option>

	</select>

	</div>







	<div class="form-group">

	<label>Tender Type:</label>

	<select name="tenderType">
	<option value="-1"
    <c:if test="${tenderType == '-1'}">selected</c:if>>
    All
</option>

<option value="1"
    <c:if test="${tenderType == '1'}">selected</c:if>>
    Limited
</option>

<option value="2"
    <c:if test="${tenderType == '2'}">selected</c:if>>
    Open
</option>
	

	<!--  <option value="-1">All</option>

	<option value="1">Limited</option>

	<option value="2">Open</option>-->
	<option value="3">Special Limited</option>

	<option value="5">Single</option>

	</select>



	</div>







	<div class="form-group">

	<label>Tender Status:</label>

	<select name="tenderStatus">
	<option value="-1"
    <c:if test="${tenderStatus == '-1'}">selected</c:if>>
    All
</option>
	
	<option value="1"
    <c:if test="${tenderStatus == '1'}">selected</c:if>>
    Published
</option>
	<option value="2"
    <c:if test="${tenderStatus == '2'}">selected</c:if>>
    Tender Box Open
</option>
	<option value="3"
    <c:if test="${tenderStatus == '3'}">selected</c:if>>
    Under Evaluation
</option>
	<option value="4"
    <c:if test="${tenderStatus == '4'}">selected</c:if>>
    PO Placed
</option>
	<option value="5"
    <c:if test="${tenderStatus == '5'}">selected</c:if>>
    Cancelled
</option>
<option value="20"
    <c:if test="${tenderStatus == '20'}">selected</c:if>>
    Tabulation Pending
</option>
<option value="7"
    <c:if test="${tenderStatus == '7'}">selected</c:if>>
    Dropped
</option>
<option value="8"
    <c:if test="${tenderStatus == '8'}">selected</c:if>>
    Tender Box Opened-Tabulation Pending
</option>
<option value="9"
    <c:if test="${tenderStatus == '9'}">selected</c:if>>
    Re-tendered
</option>
	

	<!--<option value="-1">All</option>

	<option value="1">Published</option>
	

	<option value="2">Tender Box Open</option>

	<option value="3">Under Evaluation</option>

	<option value="4">PO Placed</option>

	<option value="5">Cancelled</option>

	<option value="7">Dropped</option>

	<option value="8">Tender Box Opened-Tabulation Pending</option>

	<option value="9">Retendered</option>

	<option value="20">Tabulation Pending</option>-->

	</select>



	</div>







	<div class="form-group">

	<label>Bidding System</label>

	<select name="biddingType">

	<option value="-1">All</option>
	<option value="0"
    <c:if test="${biddingType == '0'}">selected</c:if>>
    Single Packet
</option>
<option value="1"
    <c:if test="${biddingType == '1'}">selected</c:if>>
    Two Packet
</option>


	<!-- <option value="0">Single Packet</option>

	<option value="1">Two Packet</option>-->

	</select>

	</div>

	</div>

	</div>







	<div class="date-section">

	<div class="section-label">Select Date Range</div>

	<div class="date-section-content">
	<div class="date-options-row">

	<div class="date-option">

	<input type="radio" name="dateRange" id="custom"  value="custom"
       <c:if test="${dateRange == 'custom'}">checked</c:if> checked />

	<label for="custom">Custom Date Range</label>

	</div>

	<div class="date-option">

	<input type="radio" name="dateRange" id="last3" value="last3"
       <c:if test="${dateRange == 'last3'}">checked</c:if> />

	<label for="last3">Last 3 months</label>

	</div>



	<div class="date-option">



	<input type="radio" name="dateRange" id="next3" value="next3"
       <c:if test="${dateRange == 'next3'}">checked</c:if>/>
	<label for="next3">Next 3 months</label>



	</div>



	<div class="date-option">
	<input type="radio" name="dateRange" id="next6" value="next6"
       <c:if test="${dateRange == 'next6'}">checked</c:if>/>
	<label for="next6">Next 6 months</label>



	</div>



	<div class="date-option">



	<input type="radio" name="dateRange" id="last6" value="last6"
       <c:if test="${dateRange == 'last6'}">checked</c:if>/>



	<label for="last6">Last 6 months</label>



	</div>



	</div>







	<div class="custom-date-section" id="customDateSection" style="display: block;">



	<div class="date-inputs-row">



	<div class="date-input-group">



	<label>From:</label>



	<input id="customStartDate" type="date" name="fromDate" value="${empty fromDate ? '' : fromDate}" />







	</div>



	<div class="date-input-group">



	<label>To:</label>



	<input id="customEndDate" type="date" name="toDate" value="${empty toDate ? '' : toDate}" />



	</div>



	<div class="date-type-group">



	<select id="tenderDateType" name="tenderDateType">



	<option value="TENDER_OPENING_DATE">Tender Closing Date</option>



	<option value="TENDER_PUBLISHING_DATE">Tender Opening Date</option>



	</select>



	</div>







	<div class="quick-range-option">



	<input type="checkbox" id="quickRange" />



	<label for="quickRange">Range Selector</label>







	<div class="quick-range-controls" id="quickRangeControls">



	<div class="date-input-group">



	<select id="customRangeDirection">



	<option value="previous">Previous</option>



	<option value="next">Next</option>



	</select>



	</div>



	<div class="date-input-group">



	<input type="number" id="customRangeNumber" value="1" min="1" max="365" />



	</div>



	<div class="date-input-group">



	<select id="customRangeUnit">



	<option value="days">Day(s)</option>



	<option value="months">Month(s)</option>



	<option value="years">Year(s)</option>



	</select>



	</div>



	<div class="date-input-group">



	<button type="button" id="customRangeApply">Apply</button>



	</div>



	</div>



	</div>



	</div>







	<div class="date-warning">



	


	</div>



	</div>



	</div>



	</div>






    <div id="searchValidationError" style="color:red; margin-bottom:10px; display:none;"></div>

	<div class="action-buttons">



	<button type="submit" id="showResultsBtn" class="btn btn-primary">Show Results</button>
	



	<button type="reset" id="resetBtn" class="btn btn-secondary">Reset</button>



	</div>



	</div>



	</form>



	</c:if>



	



	<c:if test="${activeTab=='custom'}">
	<c:if test="${activeTab=='custom' or not empty tenders}">



	<div class="results-section">



	<c:choose>



	<c:when test="${not empty tenders}">
  <h3 style="margin:15px 0;">
    Tender Search Results : 
    <span style="color:blue; font-weight:bold;">
        ${tenders.size()}
    </span>
    Total Tenders Found
</h3>

<div class="custom-length-menu">
    Show 
    <span class="length-btn active" data-length="5">5</span> |
    <span class="length-btn" data-length="10">10</span> |
    <span class="length-btn" data-length="20">20</span> |
    <span class="length-btn" data-length="50">50</span>
    entries
</div>

  



	<table class="tender-table" id="tableTender">



	<thead>
	<tr>
	<th>Dept./Rly. Unit</th>
	<th>Tender No</th>
	<th>Tender Title</th>
	<th>Status</th>
	<th>Work Area</th>
	<th>Due Date/Time</th>
	<th>Due Days</th>
	<th>Actions</th>
	</tr>
	</thead>



	<tbody>
	<c:forEach var="t" items="${tenders}">
	<tr>
	<td>RAILWAY BOARD-STORES/RLY. BOARD</td>
	<td class="tender-no">${t.tenderNo}</td>
	<td class="tender-title">${t.tenderTitle}</td>
	<td class="status-cell">${t.status}</td>
	<td>${t.workArea}</td>
	<td>${t.dueDate}</td>
	<td>${t.dueDays}</td>

<td class="action-links">



 <a href="viewTender?tenderNo=${t.tenderNo}" 

 title="View Tender" 

 class="icon-btn">

 <svg width="20" height="20" viewBox="0 0 24 24" fill="none">

 <path d="M6 2H14L20 8V22H6V2Z" stroke="#003B73" stroke-width="2"/>

 <path d="M14 2V8H20" stroke="#003B73" stroke-width="2"/>

 </svg>

</a>





 <!-- Modified “Login for Tender” link to open popup -->

 <a href="javascript:void(0)"

 title="Login for Tender"

 class="open-popup"

 data-tno="${t.tenderNo}"

 data-title="${t.tenderTitle}"

 data-dept="RAILWAY BOARD-STORES/RLY. BOARD"

 data-date="${t.dueDate}"

 onclick="openQueryPopup(this)">

 <!-- SVG KEY ICON -->

 <!-- DARK KEY ICON -->

 <svg width="20" height="20" viewBox="0 0 24 24" fill="none">

 <circle cx="15" cy="9" r="6" stroke="#003B73" stroke-width="2"/>

 <path d="M9 20V16L13 12" stroke="#003B73" stroke-width="2"/>

 <circle cx="15" cy="9" r="2" fill="#003B73"/>

 </svg>

</a>



 <!-- (Removed the separate ❓ icon) -->



</td>



	</tr>

	</c:forEach>

	</tbody>

	</table>

	</c:when>

	</c:choose>
	</div>

	</c:if>

	

	<!-- Popup Overlay -->

<div id="queryPopup" class="popup-overlay">

 <div class="popup-box">

 <span class="close-btn" onclick="closeQueryPopup()">&times;</span>



 <h3>Query And Response</h3>



 <div class="popup-content">

 <p><strong>Tender No:</strong> <span id="p_tno"></span></p>

 <p><strong>Dept/Rly:</strong> <span id="p_dept"></span></p>

 <p><strong>Closing Date/Time:</strong> <span id="p_date"></span></p>

 <p><strong>Tender Title:</strong> <span id="p_title"></span></p>



 <p style="margin-top:20px; font-weight:bold; text-align:center;">

 No Queries / Clarifications available for this tender

 </p>

 </div>

 </div>

</div>





	<!-- Tender List Results for Other Tabs -->



	<c:if test="${activeTab!='custom'}">



	<div class="results-section">



	<c:choose>



	<c:when test="${not empty tenders}">

<c:when test="${not empty tenders}">
    <div class="results-header">
        Tender Search Results:
        <span style="color:white;">
            ${tenders.size()}
        </span>
    </div>
    
    

	<table class="tender-table">



	<thead>



	<tr>



	<th>Dept./Rly. Unit</th>



	<th>Tender No</th>



	<th>Tender Title</th>



	<th>Status</th>



	<th>Work Area</th>



	<th>Due Date/Time</th>



	<th>Due Days</th>



	<th>Actions</th>



	</tr>



	</thead>



	<tbody>



	<c:forEach var="t" items="${tenders}">



	<tr>



	<td>RAILWAY BOARD-STORES/RLY. BOARD</td>



	<td class="tender-no">${t.tenderNo}</td>



	<td class="tender-title">${t.tenderTitle}</td>



	<td class="status-cell">${t.status}</td>



	<td>${t.workArea}</td>



	<td>${t.dueDate}</td>



	<td>${t.dueDays}</td>

<td class="action-links">



 <a href="viewTender?tenderNo=${t.tenderNo}" 

 title="View Tender" 

 class="icon-btn">

 <svg width="20" height="20" viewBox="0 0 24 24" fill="none">

 <path d="M6 2H14L20 8V22H6V2Z" stroke="#003B73" stroke-width="2"/>

 <path d="M14 2V8H20" stroke="#003B73" stroke-width="2"/>

 </svg>

</a>





 <!-- Modified “Login for Tender” link to open popup -->

 <a href="javascript:void(0)"

 title="Login for Tender"

 class="open-popup"

 data-tno="${t.tenderNo}"

 data-title="${t.tenderTitle}"

 data-dept="RAILWAY BOARD-STORES/RLY. BOARD"

 data-date="${t.dueDate}"

 onclick="openQueryPopup(this)">

 <!-- SVG KEY ICON -->

 <!-- DARK KEY ICON -->

 <svg width="20" height="20" viewBox="0 0 24 24" fill="none">

 <circle cx="15" cy="9" r="6" stroke="#003B73" stroke-width="2"/>

 <path d="M9 20V16L13 12" stroke="#003B73" stroke-width="2"/>

 <circle cx="15" cy="9" r="2" fill="#003B73"/>

 </svg>

</a>



 <!-- (Removed the separate ❓ icon) -->



</td>







	</tr>



	</c:forEach>



	</tbody>



	</table>



	</c:when>



	<c:otherwise>



 <div class="no-results">



 <div class="no-results-icon">📋</div>



 <h3>No Tenders Found</h3>



 <p>We couldn't find any tenders matching your criteria. Please try different filters or check back later.</p>



 </div>



</c:otherwise>



	</c:choose>



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



	//<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>



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



	



	document.getElementById("customSearchForm")?.addEventListener("submit", function() {



	console.log("✅ FORM SUBMIT EVENT FIRED");



	});



	// Search criteria placeholder updates
	document.querySelectorAll('input[name="searchType"]').forEach(radio => {

	radio.addEventListener('change', function () {

	const searchInput = document.querySelector('.search-input-section input');

	if (this.id === 'tenderNo') searchInput.placeholder = 'Enter tender number...';

	else if (this.id === 'tenderTitle') searchInput.placeholder = 'Enter tender title...';

	else if (this.id === 'itemDesc') searchInput.placeholder = 'Enter item description...';
     });

	});







	// Search method placeholder updates

	document.querySelectorAll('input[name="searchMethod"]').forEach(radio => {

	radio.addEventListener('change', function () {

	const searchInput = document.querySelector('.search-input-section input');

	if (!searchInput) return;

	let base = searchInput.placeholder.replace(/Enter (beginning of|any part of|ending of) /i, 'Enter ');

	if (this.id === 'startsWith') searchInput.placeholder = base.replace('Enter', 'Enter beginning of');

	else if (this.id === 'containing') searchInput.placeholder = base.replace('Enter', 'Enter any part of');

	else if (this.id === 'endsWith') searchInput.placeholder = base.replace('Enter', 'Enter ending of');

	});

	});







	// Date functions



	function formatDateYMD(date) {



	let yyyy = date.getFullYear();



	let mm = date.getMonth() + 1;



	let dd = date.getDate();



	if (mm < 10) mm = '0' + mm;



	if (dd < 10) dd = '0' + dd;



	return `${yyyy}-${mm}-${dd}`;



	}







	function initializeDates() {



	const today = new Date();



	const customStartDate = document.getElementById('customStartDate');



	const customEndDate = document.getElementById('customEndDate');



	if (customStartDate && customEndDate) {



	customStartDate.value = formatDateYMD(today);



	customEndDate.value = formatDateYMD(today);



	}



	}







	// Initialize dates when page loads



	/*document.addEventListener('DOMContentLoaded', function () {



	initializeDates();







	const searchInput = document.querySelector('.search-input-section .form-group input');



	if (searchInput) {



	searchInput.focus();



	}



	});*/
	document.addEventListener('DOMContentLoaded', function () {

	    const start = document.getElementById("customStartDate");
	    const end = document.getElementById("customEndDate");

	    // ✅ Only set today's date if no value is coming from backend
	    if (start && end) {
	        if (!start.value && !end.value) {
	            initializeDates();
	        }
	    }

	    const searchInput = document.querySelector('.search-input-section .form-group input');

	    if (searchInput) {
	        searchInput.focus();
	    }

	});








	// Date range toggle



	const dateRangeRadios = document.querySelectorAll('input[name="dateRange"]');



	const customDateSection = document.getElementById('customDateSection');







	dateRangeRadios.forEach(radio => {



	radio.addEventListener('change', function () {



	if (this.id === 'custom') {



	customDateSection.style.display = 'block';



	initializeDates();



	} else {



	customDateSection.style.display = 'none';



	}



	});



	});



	document.addEventListener("DOMContentLoaded", function () {



	const start = document.getElementById("customStartDate");

	const end = document.getElementById("customEndDate");

	const customSection = document.getElementById("customDateSection");



	const radios = document.querySelectorAll("input[name='dateRange']");



	radios.forEach(radio => {

	radio.addEventListener("change", () => {

	let today = new Date();

	let startDate, endDate;



	switch (radio.id) {



	case "custom":

	customSection.style.display = "block";

	start.value = "";

	end.value = "";

	return;



	case "last3":

	endDate = today;

	startDate = new Date();

	startDate.setMonth(startDate.getMonth() - 3);

	break;



	case "next3":

	startDate = today;

	endDate = new Date();

	endDate.setMonth(endDate.getMonth() + 3);

	break;



	case "last6":

	endDate = today;

	startDate = new Date();

	startDate.setMonth(startDate.getMonth() - 6);

	break;



	case "next6":

	startDate = today;

	endDate = new Date();

	endDate.setMonth(endDate.getMonth() + 6);

	break;

	}



	// Auto-fill the inputs with yyyy-mm-dd format

	start.value = startDate.toISOString().split("T")[0];

	end.value = endDate.toISOString().split("T")[0];



	// Custom date section visible (optional)

	customSection.style.display = "block";

	});

	});



	});





	// Quick Range Toggle



	const quickRangeRadio = document.getElementById('quickRange');



	const quickRangeControls = document.getElementById('quickRangeControls');







	if (quickRangeRadio && quickRangeControls) {



	quickRangeRadio.addEventListener('change', function () {



	if (this.checked) {



	quickRangeControls.style.display = 'flex';



	} else {



	quickRangeControls.style.display = 'none';



	}



	});



	}







	// Quick Range Apply Button



	const applyBtn = document.getElementById('customRangeApply');



	if (applyBtn) {



	applyBtn.addEventListener('click', function () {



	const direction = document.getElementById('customRangeDirection').value;



	const number = parseInt(document.getElementById('customRangeNumber').value);



	const unit = document.getElementById('customRangeUnit').value;







	const today = new Date();



	let startDate, endDate;







	if (direction === 'previous') {



	endDate = new Date(today);



	startDate = new Date(today);







	if (unit === 'days') {



	startDate.setDate(startDate.getDate() - number);



	} else if (unit === 'months') {



	startDate.setMonth(startDate.getMonth() - number);



	} else if (unit === 'years') {



	startDate.setFullYear(startDate.getFullYear() - number);



	}



	} else {



	startDate = new Date(today);



	endDate = new Date(today);







	if (unit === 'days') {



	endDate.setDate(endDate.getDate() + number);



	} else if (unit === 'months') {



	endDate.setMonth(endDate.getMonth() + number);



	} else if (unit === 'years') {



	endDate.setFullYear(endDate.getFullYear() + number);



	}



	}







	document.getElementById('customStartDate').value = formatDateYMD(startDate);



	document.getElementById('customEndDate').value = formatDateYMD(endDate);







	quickRangeControls.style.display = 'none';



	quickRangeRadio.checked = false;







	alert(`Date range set: ${direction} ${number} ${unit}`);



	});



	}







	// Advanced filters toggle



	const advancedToggle = document.getElementById('advancedToggle');



	const advancedFilters = document.getElementById('advancedFilters');



	const toggleText = document.getElementById('toggleText');







	if (advancedToggle && advancedFilters && toggleText) {



	advancedToggle.addEventListener('click', function () {



	if (advancedFilters.style.display === 'none' || advancedFilters.style.display === '') {



	advancedFilters.style.display = 'block';



	toggleText.textContent = 'Hide Advanced Filters';



	advancedToggle.classList.add('open');



	} else {



	advancedFilters.style.display = 'none';



	toggleText.textContent = 'Show Advanced Filters';



	advancedToggle.classList.remove('open');



	}



	});



	}







	// Show Results button



	const showResultsBtn = document.querySelector('.btn-primary');



	if (showResultsBtn) {



	showResultsBtn.addEventListener('click', function (e) {



	



	



	});



	}







	// Reset button functionality



	const resetBtn = document.getElementById('resetBtn');



	if (resetBtn) {



	resetBtn.addEventListener('click', function () {



	// Reset search input



	const searchInput = document.querySelector('.search-input-section input');



	if (searchInput) searchInput.value = '';







	// Reset search criteria to default



	const tenderNoRadio = document.getElementById('tenderNo');



	const startsWithRadio = document.getElementById('startsWith');



	if (tenderNoRadio) tenderNoRadio.checked = true;



	if (startsWithRadio) startsWithRadio.checked = true;


	// Reset all select dropdowns to first option
	document.querySelectorAll('select').forEach(select => {

	select.selectedIndex = 0;

	});

	// Reset date range to custom (default)
	const customRadio = document.getElementById('custom');



	if (customRadio) customRadio.checked = true;

	// Reset tender date type dropdown



	const tenderDateType = document.getElementById('tenderDateType');

	if (tenderDateType) tenderDateType.value = 'closing';

	// Reset dates to today



	initializeDates();

	// Show custom date section by default

	if (customDateSection) customDateSection.style.display = 'block';


	// Hide advanced filters if shown

	if (advancedFilters && advancedFilters.style.display === 'block') {
	advancedFilters.style.display = 'none';
	if (toggleText) toggleText.textContent = 'Show Advanced Filters';

	if (advancedToggle) advancedToggle.classList.remove('open');
	}

	// Hide quick range controls if shown

	if (quickRangeControls && quickRangeControls.style.display === 'flex') {

	quickRangeControls.style.display = 'none';

	if (quickRangeRadio) quickRangeRadio.checked = false;

	}

	alert('Form has been reset to default values');

	});
	}







	// always pick app context path (e.g. /EPSGuest)

	var baseUrl = "${pageContext.request.contextPath}";

	// When organization changes → load PUs and Departments
	$("#orgSelect").change(function () {

    let orgCode = $(this).val();
    if (!orgCode) return;

    let selectedPU = "${puCode}";
    let selectedDept = "${deptCode}";

    // --- Load PUs ---
    $.getJSON(baseUrl + "/eps/searchtender/getPUs", { orgCode: orgCode }, function (data) {
    	

        let puDropdown = $("#puSelect");
        puDropdown.empty().append('<option value="">-- Select PU --</option>');

        $.each(data, function (i, pu) {

            let selected = (pu.intCode == selectedPU) ? "selected" : "";

            puDropdown.append(
                '<option value="' + pu.intCode + '" ' + selected + '>' +
                pu.value +
                '</option>'
            );
        });

    });

    // --- Load Departments ---
    $.getJSON(baseUrl + "/eps/searchtender/getDepartments", { orgCode: orgCode }, function (data) {

        let deptDropdown = $("#deptSelect");
        deptDropdown.empty().append('<option value="">-- Select Department --</option>');

        $.each(data, function (i, dept) {

            let selected = (dept.intCode == selectedDept) ? "selected" : "";

            deptDropdown.append(
                '<option value="' + dept.intCode + '" ' + selected + '>' +
                dept.value +
                '</option>'
            );
        });

    });

});

	
	
	/*$("#orgSelect").change(function () {
	let orgCode = $(this).val();
	if (!orgCode) return;


	// -- Load PUs ---

	$.getJSON(baseUrl + "/eps/searchtender/getPUs", { orgCode: orgCode }, function (data) {

	let puDropdown = $("#puSelect");

	puDropdown.empty().append('<option value="">-- Select PU --</option>');
	let selectedPU = "${puCode}";
	$.each(data, function (i, pu) {
		let selected = (pu.intCode == selectedPU) ? "selected" : "";
	puDropdown.append('<option value="' + pu.intCode + '">' + pu.value + '</option>');

	});

	});


	// --- Load Departments ---
	$.getJSON(baseUrl + "/eps/searchtender/getDepartments", { orgCode: orgCode }, function (data) {

	let deptDropdown = $("#deptSelect");

	deptDropdown.empty().append('<option value="">-- Select Department --</option>');
	let selectedDept = "${deptCode}";
	$.each(data, function (i, dept) {
		let selected = (dept.intCode == selectedDept) ? "selected" : "";
	deptDropdown.append('<option value="' + dept.intCode + '">' + dept.value + '</option>');
	});

	});

	});*/







	// When work area changes → load Units
	function loadUnits() {

	let workArea = $("#workArea").val();

	let orgCode = $("#orgSelect").val();

	if (!orgCode) return;







	$.getJSON(baseUrl + "/eps/searchtender/getUnits", { workArea: workArea, orgCode: orgCode }, function (data) {

	let unitDropdown = $("#unitDropdown");

	unitDropdown.empty().append('<option value="">-- Select Unit --</option>');
	
	$.each(data, function (i, unit) {

	unitDropdown.append('<option value="' + unit.intCode + '">' + unit.value + '</option>');



	});

	});

	}
	function openQueryPopup(tenderNo) {



	// Static content only for now
	document.getElementById("queryPopup").style.display = "flex";

	}



	function closeQueryPopup() {

	document.getElementById("queryPopup").style.display = "none";

	}
	function handleSearchCriteriaChange(criteriaId) {

		  const wrapper = document.getElementById("searchMethodWrapper");
		  const startsWith = document.getElementById("method-startsWith");
		  const containing = document.getElementById("method-containing");

		  if (!wrapper || !startsWith || !containing) return;

		  // 🔥 show Search Method ONLY after click
		  wrapper.style.display = "block";

		  // hide all first
		  startsWith.style.display = "none";
		  containing.style.display = "none";

		  // reset radio
		  document.querySelectorAll("input[name='searchMethod']").forEach(r => {
		    r.checked = false;
		  });

		  // RULES
		  if (criteriaId === "tenderNo") {
		    startsWith.style.display = "flex";
		    document.getElementById("startsWith").checked = true;
		  } 
		  else {
		    startsWith.style.display = "flex";
		    containing.style.display = "flex";
		    document.getElementById("startsWith").checked = true;
		  }
		  // Placeholder update
		  const input = document.querySelector("input[name='searchText']");
		  if (criteriaId === "tenderNo") input.placeholder = "Enter tender number...";
		  else if (criteriaId === "tenderTitle") input.placeholder = "Enter tender title...";
		  else input.placeholder = "Enter item description...";
		}
	// 🔥 Restore Search Criteria UI on page reload
	document.addEventListener("DOMContentLoaded", function () {

	    const selectedSearchType = document.querySelector("input[name='searchType']:checked");

	    if (selectedSearchType) {
	        handleSearchCriteriaChange(selectedSearchType.value);
	    }

	});



	function openQueryPopup(el) {

	// get values from clicked link

	const tno = el.getAttribute("data-tno");
	const title = el.getAttribute("data-title");
	const dept = el.getAttribute("data-dept");
	const date = el.getAttribute("data-date");



	// set to popup

	document.getElementById("p_tno").textContent = tno;
	document.getElementById("p_title").textContent = title;
	document.getElementById("p_dept").textContent = dept;
	document.getElementById("p_date").textContent = date;



	// show popup

	document.getElementById("queryPopup").style.display = "flex";

	}



	function closeQueryPopup() {

	document.getElementById("queryPopup").style.display = "none";

	}

	
	
	

	</script>

<!-- <script >

 src="https://translation-plugin.bhashini.co.in/v3/website_translation_utility.js"

 language-icon-color="#ffffff">

</script>
 -->


<script src="${pageContext.request.contextPath}/assets/bhashini/bhashini-init.js"></script>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>
<script>   

/* $(document).ready(function () {
	var table = $('#tableTender').DataTable({
	    paging: true,
	    searching: true,
	    ordering: true,
	    info: true,
	    pageLength: 5,
	    lengthChange: false   // 🔥 Hide dropdown
	}); */
	
	
	$(document).ready(function () {

	    if ($('#tableTender').length) {

	        var table = $('#tableTender').DataTable({
	            paging: true,
	            searching: true,
	            ordering: true,
	            info: true,
	            pageLength: 5,
	            lengthChange: false
	        });

	        document.querySelectorAll(".length-btn").forEach(btn => {

	            btn.addEventListener("click", function() {

	                let length = this.getAttribute("data-length");

	                table.page.len(length).draw();

	                document.querySelectorAll(".length-btn").forEach(b => {
	                    b.classList.remove("active");
	                });

	                this.classList.add("active");
	            });

	        });
	    }

	});
	// Handle length button clicks
	document.querySelectorAll(".length-btn").forEach(btn => {

	    btn.addEventListener("click", function() {

	        let length = this.getAttribute("data-length");

	        table.page.len(length).draw();

	        // Remove active class from all
	        document.querySelectorAll(".length-btn").forEach(b => {
	            b.classList.remove("active");
	        });

	        // Add active class to clicked one
	        this.classList.add("active");
	    });

	});

    
});
</script>

<script>
document.addEventListener("DOMContentLoaded", function () {

    const form = document.getElementById("customSearchForm");
    if (!form) return;

    form.addEventListener("submit", function (e) {

        let errorDiv = document.getElementById("searchValidationError");
        errorDiv.style.display = "none";
        errorDiv.innerText = "";

        let hasError = false;
        let atLeastOneFilterUsed = false;

        // =========================
        // 1️⃣ TEXT VALIDATION
        // =========================
        let selectedSearchType = document.querySelector('input[name="searchType"]:checked');
        let searchTextInput = document.querySelector('input[name="searchText"]');
        let searchText = searchTextInput.value.trim();

        searchTextInput.style.border = "";

        if (selectedSearchType && searchText.length >= 3) {
            atLeastOneFilterUsed = true;
        }

        if (selectedSearchType && searchText.length > 0 && searchText.length < 3) {
            hasError = true;
            errorDiv.innerText = "Please enter at least 3 characters in search box.";
            searchTextInput.style.border = "1px solid red";
        }

        // =========================
        // 2️⃣ DROPDOWN VALIDATION
        // =========================
        let org = document.getElementById("orgSelect").value;
        let workArea = document.getElementById("workArea").value;
        let pu = document.getElementById("puSelect").value;
        let dept = document.getElementById("deptSelect").value;

        let tenderType = document.querySelector('select[name="tenderType"]').value;
        let tenderStatus = document.querySelector('select[name="tenderStatus"]').value;
        let biddingType = document.querySelector('select[name="biddingType"]').value;

        if (
            org !== "" ||
            workArea !== "" ||
            pu !== "" ||
            dept !== "" ||
            tenderType !== "-1" ||
            tenderStatus !== "-1" ||
            biddingType !== "-1"
        ) {
            atLeastOneFilterUsed = true;
        }

        // =========================
        // 3️⃣ DATE VALIDATION
        // =========================
        let selectedDateRange = document.querySelector('input[name="dateRange"]:checked');
        let fromInput = document.getElementById("customStartDate");
        let toInput = document.getElementById("customEndDate");

        fromInput.style.border = "";
        toInput.style.border = "";

        if (selectedDateRange) {

            if (selectedDateRange.id === "custom") {

                let fromDate = fromInput.value;
                let toDate = toInput.value;

                if (fromDate !== "" && toDate !== "") {
                    atLeastOneFilterUsed = true;
                }

                if (fromDate === "" || toDate === "") {
                    hasError = true;
                    errorDiv.innerText = "Both From Date and To Date are required.";
                    fromInput.style.border = "1px solid red";
                    toInput.style.border = "1px solid red";
                } else {

                    let from = new Date(fromDate);
                    let to = new Date(toDate);

                    if (from > to) {
                        hasError = true;
                        errorDiv.innerText = "From Date cannot be greater than To Date.";
                        fromInput.style.border = "1px solid red";
                        toInput.style.border = "1px solid red";
                    }

                    let diffDays = Math.ceil((to - from) / (1000 * 60 * 60 * 24));

                    if (!hasError && diffDays > 365) {
                        hasError = true;
                        errorDiv.innerText = "Date range should be within one year.";
                        fromInput.style.border = "1px solid red";
                        toInput.style.border = "1px solid red";
                    }
                }

            } else {
                // predefined range selected
                atLeastOneFilterUsed = true;
            }
        }

        // =========================
        // 4️⃣ FINAL MASTER CHECK
        // =========================
        if (!hasError && !atLeastOneFilterUsed) {
            hasError = true;
            errorDiv.innerText = "Please apply at least one valid search filter before clicking Show Results.";
        }

        if (hasError) {
            e.preventDefault();
            errorDiv.style.display = "block";
        }

    });

});

</script>




<script>
document.addEventListener("DOMContentLoaded", function() {

    let dateRangeRadios = document.querySelectorAll('input[name="dateRange"]');
    let fromInput = document.getElementById("customStartDate");
    let toInput = document.getElementById("customEndDate");
    let customDateSection = document.getElementById("customDateSection");

    function handleDateRangeChange() {

        let selected = document.querySelector('input[name="dateRange"]:checked');

        if (!selected) return;

        if (selected.id === "custom") {
            // ✅ show date inputs
        	fromInput.readOnly = false;
            toInput.readOnly = false;
            customDateSection.style.opacity = "1";
        } else {
            // ❌ hide date inputs
            fromInput.readOnly = true;
            toInput.readOnly = true;
            customDateSection.style.opacity = "0.5";


            
        }
    }

    // Attach change listener to all radio buttons
    dateRangeRadios.forEach(function(radio) {
        radio.addEventListener("change", handleDateRangeChange);
    });

    // Run once on page load
    handleDateRangeChange();
   /* $(document).ready(function () {

        let selectedOrg = $("#orgSelect").val();

        if (selectedOrg && selectedOrg !== "") {
            $("#orgSelect").trigger("change");
        }

    });*/


});
</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script 
    src="https://translation-plugin.bhashini.co.in/v3/website_translation_utility.js"
    language-icon-color="#ffffff">
</script>
<script src="${pageContext.request.contextPath}/assets/bhashini/bhashini-init.js"></script>



</body>







</html> --%>