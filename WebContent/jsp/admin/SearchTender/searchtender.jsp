<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>

<html lang="en">

<head>
	<meta charset="UTF-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1" />
	<title>Government E-Procurement System</title>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
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
    margin: 0;  /* 12px 0px se change karo */
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
			overflow-x: auto;
			gap: 8px;
			padding: 15px;
		}

		.search-tab {
			padding: 12px 18px;
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
			padding: 25px;
		}

		/* Results Section Styling */
		.results-section {
			padding: 25px;
			background: white;
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
			width: 100%;
			border-collapse: collapse;
			background: white;
			border-radius: 12px;
			overflow: hidden;
			box-shadow: 0 8px 25px rgba(0, 0, 0, 0.1);
			margin-top: 0;
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
		.no-results {
			text-align: center;
			padding: 40px;
			color: #666;
			font-size: 16px;
			background: #f8f9fa;
			border-radius: 12px;
			border: 2px dashed #dee2e6;
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

					<div class="search-criteria-options">
						<div class="search-criteria-section">
							<div class="section-label">Search Criteria</div>
							<div class="criteria-options">
								<div class="criteria-option">
									<input type="radio" name="searchType" id="tenderNo" checked />
									<label for="tenderNo">Tender Number</label>
								</div>
								<div class="criteria-option">
									<input type="radio" name="searchType" id="tenderTitle" />
									<label for="tenderTitle">Tender Title</label>
								</div>
								<div class="criteria-option">
									<input type="radio" name="searchType" id="itemDesc" />
									<label for="itemDesc">Item Description</label>
								</div>
							</div>
						</div>

						<div class="search-criteria-section">
							<div class="section-label">Search Method</div>
							<div class="criteria-options">
								<div class="criteria-option">
									<input type="radio" name="searchMethod" id="startsWith" checked />
									<label for="startsWith">Starting with</label>
								</div>
								<div class="criteria-option">
									<input type="radio" name="searchMethod" id="containing" />
									<label for="containing">Containing</label>
								</div>
								<div class="criteria-option">
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
								<input type="text" name="searchText" placeholder="Enter tender number..." />
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
								<c:forEach items="${organizations}" var="org">
									<option value="${org.intCode}" <c:if test="${org.intCode == selectedOrgValue}">selected="selected"</c:if>>
										${org.value}
									</option>
								</c:forEach>
							</select>
						</div>

						<div class="form-group">
							<label>Work Area <span class="required">*</span></label>
							<select id="workArea" class="form-control" name="workArea" onchange="loadUnits()">
								<option value="-1">All</option>
								<option value="WT">Works</option>
								<option value="PT">Goods & Services</option>
								<option value="LT">Earning / Leasing</option>
							</select>
						</div>

						<div class="form-group">
							<label>PU</label>
							<select id="puSelect" class="form-control" name="puCode">
								<option value="">-- Select PU --</option>
								<c:forEach items="${pus}" var="pu">
									<option value="${pu.intCode}">${pu.value}</option>
								</c:forEach>
							</select>
						</div>

						<div class="form-group">
							<label>Department <span class="required">*</span></label>
							<select id="deptSelect" class="form-control" name="deptCode">
								<option value="">All</option>
								<c:forEach items="${departments}" var="dept">
									<option value="${dept.intCode}">${dept.value}</option>
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
									<option value="">--Select--</option>
									<option value="-1">All</option>
									<option value="1">Limited</option>
									<option value="2">Open</option>
									<option value="3">Special Limited</option>
									<option value="5">Single</option>
								</select>
							</div>

							<div class="form-group">
								<label>Tender Status:</label>
								<select name="tenderStatus">
									<option value="-1">All</option>
									<option value="1">Published</option>
									<option value="2">Tender Box Open</option>
									<option value="3">Under Evaluation</option>
									<option value="4">PO Placed</option>
									<option value="5">Cancelled</option>
									<option value="7">Dropped</option>
									<option value="8">Tender Box Opened-Tabulation Pending</option>
									<option value="9">Retendered</option>
									<option value="20">Tabulation Pending</option>
								</select>
							</div>

							<div class="form-group">
								<label>Bidding System</label>
								<select name="biddingType">
									<option value="">--Select--</option>
									<option value="-1">All</option>
									<option value="0">Single Packet</option>
									<option value="1">Two Packet</option>
								</select>
							</div>
						</div>
					</div>

					<div class="date-section">
						<div class="section-label">Select Date Range</div>
						<div class="date-section-content">
							<div class="date-options-row">
								<div class="date-option">
									<input type="radio" name="dateRange" id="custom" checked />
									<label for="custom">Custom Date Range</label>
								</div>
								<div class="date-option">
									<input type="radio" name="dateRange" id="last3" />
									<label for="last3">Last 3 months</label>
								</div>
								<div class="date-option">
									<input type="radio" name="dateRange" id="next3" />
									<label for="next3">Next 3 months</label>
								</div>
								<div class="date-option">
									<input type="radio" name="dateRange" id="next6" />
									<label for="next6">Next 6 months</label>
								</div>
								<div class="date-option">
									<input type="radio" name="dateRange" id="last6" />
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
									*Date range should be within one year
								</div>
							</div>
						</div>
					</div>

					<div class="action-buttons">
						<button type="submit" class="btn btn-primary">Show Results</button>
						<button type="reset" id="resetBtn" class="btn btn-secondary">Reset</button>
					</div>
				</div>
				</form>
			</c:if>
			
	<c:if test="${activeTab=='custom'}">
				<div class="results-section">
					<c:choose>
						<c:when test="${not empty tenders}">
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
												<a href="viewTender?tenderNo=${t.tenderNo}" title="View Tender">📄</a>
												<a href="loginForTender?tenderNo=${t.tenderNo}" title="Login for Tender">🔑</a>
											</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</c:when>
						<c:otherwise>
							<div class="no-results">
								<p>No tenders found for the selected criteria. Please try with different filters or check back later.</p>
							</div>
						</c:otherwise>
					</c:choose>
				</div>
			</c:if>
			<!-- Tender List Results for Other Tabs -->
			<c:if test="${activeTab!='custom'}">
				<div class="results-section">
					<c:choose>
						<c:when test="${not empty tenders}">
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
												<a href="viewTender?tenderNo=${t.tenderNo}" title="View Tender">📄</a>
												<a href="loginForTender?tenderNo=${t.tenderNo}" title="Login for Tender">🔑</a>
											</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</c:when>
						<c:otherwise>
							<div class="no-results">
								<p>No tenders found for the selected criteria. Please try with different filters or check back later.</p>
							</div>
						</c:otherwise>
					</c:choose>
				</div>
			</c:if>
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
	<script>
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
		document.addEventListener('DOMContentLoaded', function () {
			initializeDates();

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

			// --- Load PUs ---
			$.getJSON(baseUrl + "/eps/searchtender/getPUs", { orgCode: orgCode }, function (data) {
				let puDropdown = $("#puSelect");
				puDropdown.empty().append('<option value="">-- Select PU --</option>');
				$.each(data, function (i, pu) {
					puDropdown.append('<option value="' + pu.intCode + '">' + pu.value + '</option>');
				});
			});

			// --- Load Departments ---
			$.getJSON(baseUrl + "/eps/searchtender/getDepartments", { orgCode: orgCode }, function (data) {
				let deptDropdown = $("#deptSelect");
				deptDropdown.empty().append('<option value="">-- Select Department --</option>');
				$.each(data, function (i, dept) {
					deptDropdown.append('<option value="' + dept.intCode + '">' + dept.value + '</option>');
				});
			});
		});

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
	</script>
</body>

</html>