<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Government eMarketplace - Indian Railways E-Procurement System</title>
    
    <!-- Scripts & Styles -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
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

        html, body {
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
            border-radius: 18px;
            box-shadow: 0 15px 50px rgba(0, 0, 0, 0.1);
            overflow: visible;
            max-width: 1400px;
            width: 100%;
            margin: 0 auto 15px auto;
        }

        .search-header {
    background: white;
    color: #2c5aa0;
    text-align: center;
    position: relative;
    border-bottom: 3px solid #2c5aa0;
    padding: 10px 0;
}
        .search-header h3 {
            font-size: 24px;
          
            text-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
            letter-spacing: 0.5px;
            margin: 0;
            flex: 1;
            text-align: center;
        }

        

        .search-content {
            padding: 20px;
        }

        .search-info {
            color: #1565c0;
            padding: 4px 0;
            margin-bottom: 8px;
            font-size: 13px;
            line-height: 1.4;
        }

        /* Form Grid */
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

        .form-group > label {
            font-weight: 600;
            color: #2d3436;
            margin-bottom: 6px;
            font-size: 13px;
        }

        .form-control {
            padding: 10px 14px;
            border: 2px solid #ddd;
            border-radius: 8px;
            font-size: 13px;
            font-weight: 500;
            transition: all 0.3s ease;
            background: white;
            color: #2d3436;
            min-height: 42px;
        }

        .form-control:focus {
            outline: none;
            border-color: #74b9ff;
            box-shadow: 0 0 0 3px rgba(116, 185, 255, 0.1);
        }

        .form-control::placeholder {
            color: #95a5a6;
            opacity: 0.8;
            font-style: italic;
            font-size: 12px;
        }

        /* Date Inputs */
        .date-inputs {
            display: grid;
            grid-template-columns: 1fr auto 1fr;
            gap: 12px;
            align-items: end;
        }

        .date-separator {
            font-weight: 600;
            color: #2d3436;
            text-align: center;
            margin-bottom: 8px;
        }

        .date-input-container {
            position: relative;
        }

        .date-input-container .calendar-icon {
            position: absolute;
            right: 12px;
            top: 50%;
            transform: translateY(-50%);
            width: 18px;
            height: 18px;
            fill: #95a5a6;
            pointer-events: none;
        }

        /* Value Range Section */
        .value-section {
            display: flex;
            flex-direction: column;
            gap: 8px;
        }

        .value-controls {
            display: flex;
            gap: 12px;
            align-items: start;
        }

        .value-input-wrapper {
            flex: 0 0 120px;
            display: flex;
            flex-direction: column;
        }

        .value-input-wrapper label {
            display: block;
            font-weight: 600;
            color: #2d3436;
            margin-bottom: 6px;
            font-size: 13px;
        }

        .value-separator {
            font-weight: 600;
            color: #2d3436;
            text-align: center;
            margin-top: 28px;
            flex: 0 0 auto;
        }

        /* Dual Range Slider */
        .range-container {
            flex: 1;
            display: flex;
            flex-direction: column;
            justify-content: flex-start;
            padding-top: 28px;
        }

        .dual-range-slider {
            position: relative;
            width: 100%;
            height: 6px;
            margin: 8px 0;
        }

        .slider-track {
            position: absolute;
            width: 100%;
            height: 6px;
            background: linear-gradient(135deg, #e1e8ed 0%, #f0f8ff 100%);
            border-radius: 4px;
            box-shadow: 0 1px 3px rgba(0,0,0,0.1);
        }

        .slider-range {
            position: absolute;
            height: 6px;
            background: linear-gradient(45deg, #74b9ff, #0984e3);
            border-radius: 4px;
            box-shadow: 0 1px 4px rgba(116, 185, 255, 0.3);
        }

        .slider-thumb {
            position: absolute;
            width: 18px;
            height: 18px;
            background: linear-gradient(45deg, #74b9ff, #0984e3);
            border-radius: 50%;
            border: 2px solid white;
            cursor: pointer;
            top: -6px;
            box-shadow: 0 2px 6px rgba(116, 185, 255, 0.4);
            transition: all 0.3s ease;
            z-index: 10;
        }

        .slider-thumb:hover {
            transform: scale(1.2);
        }

        .slider-thumb.active {
            transform: scale(1.3);
            box-shadow: 0 3px 10px rgba(116, 185, 255, 0.6);
        }

        .range-display {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-top: 6px;
            font-size: 11px;
            color: #2d3436;
            font-weight: 600;
        }

        .range-value {
            background: linear-gradient(45deg, #74b9ff, #0984e3);
            color: white;
            padding: 3px 8px;
            border-radius: 10px;
            font-size: 10px;
            font-weight: 600;
            box-shadow: 0 1px 4px rgba(116, 185, 255, 0.3);
        }

        /* Verification Section */
        .verification-section {
            background: white;
            padding: 12px;
            border-radius: 10px;
            border: 1px solid #dee2e6;
            box-shadow: 0 2px 6px rgba(0, 0, 0, 0.05);
            margin: 16px 0;
            display: flex;
            align-items: center;
            gap: 12px;
            flex-wrap: wrap;
        }

        .verification-section label {
            font-size: 13px;
            font-weight: 600;
            color: #2d3436;
            white-space: nowrap;
            margin: 0;
        }

        .verification-code {
            padding: 6px 14px;
            background: #f0f4f8;
            border: 2px solid #ddd;
            border-radius: 6px;
            font-weight: bold;
            font-size: 15px;
            letter-spacing: 2px;
            color: #1e3c72;
            min-width: 90px;
            text-align: center;
        }

        .refresh-btn {
            background: linear-gradient(45deg, #74b9ff, #0984e3);
            border: none;
            color: white;
            cursor: pointer;
            font-size: 15px;
            padding: 6px 10px;
            border-radius: 6px;
            transition: all 0.3s ease;
            height: 34px;
            display: flex;
            align-items: center;
            justify-content: center;
            box-shadow: 0 2px 4px rgba(116, 185, 255, 0.3);
        }

        .refresh-btn:hover {
            transform: translateY(-1px);
            box-shadow: 0 3px 10px rgba(116, 185, 255, 0.4);
        }
        
        .refresh-btn svg {
            width: 18px;
            height: 18px;
            fill: white;
        }

        .verification-input {
            padding: 6px 14px;
            font-size: 13px;
            border: 2px solid #ddd;
            border-radius: 6px;
            width: 170px;
            outline: none;
            min-height: 34px;
        }

        .verification-input:focus {
            border-color: #74b9ff;
            box-shadow: 0 0 0 3px rgba(116, 185, 255, 0.1);
        }

        /* Action Buttons */
        .action-buttons {
            display: flex;
            justify-content: center;
            gap: 18px;
            margin-top: 16px;
        }

        .btn {
            padding: 12px 36px;
            border: none;
            border-radius: 50px;
            font-size: 15px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
        }

        .btn-primary {
            background: linear-gradient(45deg, #74b9ff, #0984e3);
            color: white;
        }

        .btn-primary:hover {
            transform: translateY(-2px);
            box-shadow: 0 6px 20px rgba(116, 185, 255, 0.3);
        }

        .btn-primary:disabled {
            background: #ccc;
            cursor: not-allowed;
            transform: none;
        }

        /* Results Section */
        .results-section {
            padding: 20px;
            background: white;
        }

        .results-header {
            background: linear-gradient(135deg, #2c5aa0 0%, #1a4480 50%, #0f3460 100%);
            color: white;
            padding: 12px 18px;
            border-radius: 10px;
            margin-bottom: 16px;
            box-shadow: 0 4px 12px rgba(44, 90, 160, 0.3);
        }

        .results-header h3 {
            font-size: 20px;
            font-weight: 700;
            text-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
            letter-spacing: 0.5px;
            margin: 0;
        }

        /* Table Styling */
        .tender-table {
            width: 100%;
            border-collapse: collapse;
            background: white;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 6px 20px rgba(0, 0, 0, 0.1);
        }

        .tender-table thead {
            background: linear-gradient(135deg, #2c5aa0 0%, #1a4480 100%);
        }

        .tender-table th {
            padding: 14px 10px;
            color: white;
            font-weight: 600;
            font-size: 13px;
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
            box-shadow: 0 3px 10px rgba(44, 90, 160, 0.15);
        }

        .tender-table td {
            padding: 12px 10px;
            border-bottom: 1px solid #e9ecef;
            font-size: 12px;
            color: #2d3436;
            text-align: center;
            vertical-align: middle;
        }

        /* Pagination */
        #pagination {
            margin-top: 16px;
            text-align: center;
        }

        #pagination button {
            margin: 2px;
            padding: 6px 12px;
            border: 2px solid #74b9ff;
            background: white;
            cursor: pointer;
            border-radius: 6px;
            transition: all 0.3s ease;
            font-weight: 600;
            color: #2d3436;
            font-size: 13px;
        }

        #pagination button:hover {
            background: #e3f2fd;
            transform: translateY(-1px);
        }

        #pagination button.active {
            background: linear-gradient(45deg, #74b9ff, #0984e3);
            color: white;
            border-color: #0984e3;
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

        /* jQuery UI Autocomplete Styling */
        .ui-autocomplete {
            max-height: 200px;
            overflow-y: auto;
            overflow-x: hidden;
            border: 2px solid #74b9ff;
            border-radius: 6px;
            box-shadow: 0 4px 12px rgba(116, 185, 255, 0.3);
        }

        .ui-menu-item {
            padding: 8px 12px;
            font-size: 13px;
            cursor: pointer;
        }

        .ui-menu-item:hover {
            background: linear-gradient(45deg, #e3f2fd, #f0f8ff);
        }

        /* Responsive */
        @media (max-width: 768px) {
            .form-grid {
                grid-template-columns: 1fr;
            }
            
            .date-inputs,
            .value-controls {
                grid-template-columns: 1fr;
                flex-direction: column;
            }
            
            .date-separator,
            .value-separator {
                display: none;
            }
            
            .value-input-wrapper {
                flex: 1;
            }
            
            .range-container {
                width: 100%;
                padding-top: 0;
            }
            
            .verification-section {
                flex-direction: column;
                align-items: stretch;
            }
            
            .verification-input {
                width: 100%;
            }
            
            .tender-table th,
            .tender-table td {
                padding: 8px 6px;
                font-size: 11px;
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
                <h3><i class="bi bi-search me-2"></i>Search Purchase Order</h3>
                
            </div>

            <div class="search-content">
                <div class="search-info">
                    Please fill in the search criteria below to find purchase orders
                </div>

                <div class="form-grid">
                    <div class="form-group">
                        <label for="railway">Railway / PU</label>
                        <select id="railway" name="railway" class="form-control">
                            <option value="all">All</option>
                        </select>
                    </div>

                    <div class="form-group">
                        <label for="supplierName">Supplier Name</label>
                        <input type="text" id="supplierName" name="supplierName" class="form-control" placeholder="Enter minimum 2 characters" autocomplete="off">
                    </div>
                </div>

                <div class="form-grid">
                    <div class="form-group">
                        <label for="plNumber">PL Number</label>
                        <input type="text" id="plNumber" name="plNumber" class="form-control" placeholder="Enter PL Number">
                    </div>
                  
                    <div class="form-group">
                        <label>Value (In Lacs of Rs)</label>
                        <div class="value-section">
                            <div class="value-controls">
                                <div class="value-input-wrapper">
                                    <label for="valueFrom">From</label>
                                    <input type="number" id="valueFrom" name="valueFrom" class="form-control" value="5" min="0" max="99999">
                                </div>
                                <div class="value-separator">-</div>
                                <div class="value-input-wrapper">
                                    <label for="valueTo">To</label>
                                    <input type="number" id="valueTo" name="valueTo" class="form-control" value="99999" min="0" max="99999">
                                </div>
                                <div class="range-container">
                                    <div class="dual-range-slider" id="dual-range-slider">
                                        <div class="slider-track"></div>
                                        <div class="slider-range" id="slider-range"></div>
                                        <div class="slider-thumb" id="thumb-from" data-thumb="from"></div>
                                        <div class="slider-thumb" id="thumb-to" data-thumb="to"></div>
                                    </div>
                                    <div class="range-display">
                                        <span>From: <span class="range-value" id="from-display">5</span></span>
                                        <span>To: <span class="range-value" id="to-display">99999</span></span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="form-grid">
                    <div class="form-group">
                        <label>PO Date</label>
                        <div class="date-inputs">
                            <div>
                                <label for="fromDate">From</label>
                                <div class="date-input-container">
                                    <input type="date" id="fromDate" name="fromDate" class="form-control">
                                    
                                </div>
                            </div>
                            <div class="date-separator">-</div>
                            <div>
                                <label for="toDate">To</label>
                                <div class="date-input-container">
                                    <input type="date" id="toDate" name="toDate" class="form-control">
                                    
                                </div>
                            </div>
                        </div>
                    </div>
                  
                    <div class="form-group">
                        <label>Verification</label>
                        <div class="verification-section">
                            <label>Code:</label>
                            <div class="verification-code" id="verification-code">${verificationCode}</div>
                            <button type="button" class="refresh-btn" id="refresh-btn" title="Refresh Code">
                                <svg viewBox="0 0 24 24">
                                    <path d="M17.65,6.35C16.2,4.9 14.21,4 12,4A8,8 0 0,0 4,12A8,8 0 0,0 12,20C15.73,20 18.84,17.45 19.73,14H17.65C16.83,16.33 14.61,18 12,18A6,6 0 0,1 6,12A6,6 0 0,1 12,6C13.66,6 15.14,6.69 16.22,7.78L13,11H20V4L17.65,6.35Z"/>
                                </svg>
                            </button>
                            <input type="text" placeholder="Enter Code" class="verification-input" id="verification-input">
                        </div>
                    </div>
                </div>

                <div class="action-buttons">
                    <button type="button" class="btn btn-primary" id="search-btn">
                        <i class="bi bi-search"></i> Show Results
                    </button>
                </div>
            </div>

            <!-- Results Section -->
            <div class="results-section" id="results" style="display:none;">
                <div class="results-header">
                    <h3>Search Results</h3>
                </div>

                <table class="tender-table" id="results-table">
                    <thead>
                        <tr>
                            <th>Sr.</th>
                            <th>Supplier</th>
                            <th>PO Value</th>
                            <th>Item Description</th>
                            <th>PO Sl</th>
                            <th>Consignee</th>
                            <th>PO Qty/Unit</th>
                            <th>T.U.R.</th>
                            <th>Dely Dt</th>
                        </tr>
                    </thead>
                    <tbody></tbody>
                </table>
                <div id="pagination"></div>
            </div>
        </div>
    </div>

    <footer class="footer">
        <img src="${pageContext.request.contextPath}/assets/images/stqc.png" alt="STQC">
        <img src="${pageContext.request.contextPath}/assets/images/cris.png" alt="CRS">
        <div class="footer-text">
            Centre For Railway Information Systems, Designed, Developed and Hosted by CRIS &nbsp;
            <strong>Version 7.1.0</strong>
        </div>
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
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
        
        // Dual Range Slider Implementation
        class DualRangeSlider {
            constructor(containerId, min = 0, max = 99999, fromValue = 5, toValue = 99999) {
                this.container = document.getElementById(containerId);
                this.min = min;
                this.max = max;
                this.fromValue = fromValue;
                this.toValue = toValue;
                
                this.thumbFrom = document.getElementById('thumb-from');
                this.thumbTo = document.getElementById('thumb-to');
                this.range = document.getElementById('slider-range');
                this.fromInput = document.getElementById('valueFrom');
                this.toInput = document.getElementById('valueTo');
                
                this.isDragging = false;
                this.activeThumb = null;
                
                this.init();
            }
            
            init() {
                this.updateSlider();
                this.bindEvents();
            }
            
            bindEvents() {
                // Mouse events for thumbs
                this.thumbFrom.addEventListener('mousedown', (e) => this.startDrag(e, 'from'));
                this.thumbTo.addEventListener('mousedown', (e) => this.startDrag(e, 'to'));
                
                // Global mouse events
                document.addEventListener('mousemove', (e) => this.drag(e));
                document.addEventListener('mouseup', () => this.stopDrag());
                
                // Touch events for mobile
                this.thumbFrom.addEventListener('touchstart', (e) => this.startDrag(e, 'from'));
                this.thumbTo.addEventListener('touchstart', (e) => this.startDrag(e, 'to'));
                document.addEventListener('touchmove', (e) => this.drag(e));
                document.addEventListener('touchend', () => this.stopDrag());
                
                // Input field events
                this.fromInput.addEventListener('input', (e) => this.updateFromInput(e));
                this.toInput.addEventListener('input', (e) => this.updateToInput(e));
                
                // Click on track to move nearest thumb
                this.container.addEventListener('click', (e) => this.trackClick(e));
            }
            
            startDrag(e, thumb) {
                e.preventDefault();
                this.isDragging = true;
                this.activeThumb = thumb;
                
                if (thumb === 'from') {
                    this.thumbFrom.classList.add('active');
                } else {
                    this.thumbTo.classList.add('active');
                }
            }
            
            drag(e) {
                if (!this.isDragging || !this.activeThumb) return;
                e.preventDefault();
                
                const rect = this.container.getBoundingClientRect();
                const clientX = e.type.includes('touch') ? e.touches[0].clientX : e.clientX;
                const percent = Math.max(0, Math.min(1, (clientX - rect.left) / rect.width));
                const value = Math.round(this.min + percent * (this.max - this.min));
                
                if (this.activeThumb === 'from') {
                    this.fromValue = Math.min(value, this.toValue);
                    this.fromInput.value = this.fromValue;
                } else {
                    this.toValue = Math.max(value, this.fromValue);
                    this.toInput.value = this.toValue;
                }
                
                this.updateSlider();
                this.updateDisplay();
            }
            
            stopDrag() {
                this.isDragging = false;
                this.activeThumb = null;
                this.thumbFrom.classList.remove('active');
                this.thumbTo.classList.remove('active');
            }
            
            trackClick(e) {
                if (this.isDragging) return;
                const rect = this.container.getBoundingClientRect();
                const percent = (e.clientX - rect.left) / rect.width;
                const value = Math.round(this.min + percent * (this.max - this.min));
                
                // Determine which thumb is closer
                const distanceToFrom = Math.abs(value - this.fromValue);
                const distanceToTo = Math.abs(value - this.toValue);
                
                if (distanceToFrom < distanceToTo) {
                    this.fromValue = Math.min(value, this.toValue);
                    this.fromInput.value = this.fromValue;
                } else {
                    this.toValue = Math.max(value, this.fromValue);
                    this.toInput.value = this.toValue;
                }
                
                this.updateSlider();
                this.updateDisplay();
            }
            
            updateFromInput(e) {
                const value = Math.max(this.min, Math.min(parseInt(e.target.value) || 0, this.toValue));
                this.fromValue = value;
                e.target.value = value;
                this.updateSlider();
                this.updateDisplay();
            }
            
            updateToInput(e) {
                const value = Math.min(this.max, Math.max(parseInt(e.target.value) || this.max, this.fromValue));
                this.toValue = value;
                e.target.value = value;
                this.updateSlider();
                this.updateDisplay();
            }
            
            updateSlider() {
                const fromPercent = ((this.fromValue - this.min) / (this.max - this.min)) * 100;
                const toPercent = ((this.toValue - this.min) / (this.max - this.min)) * 100;
                
                this.thumbFrom.style.left = fromPercent + '%';
                this.thumbTo.style.left = toPercent + '%';
                
                this.range.style.left = fromPercent + '%';
                this.range.style.width = (toPercent - fromPercent) + '%';
            }
            
            updateDisplay() {
                document.getElementById('from-display').textContent = this.fromValue;
                document.getElementById('to-display').textContent = this.toValue;
            }
        }

        $(document).ready(function() {
            // Initialize the dual range slider
            let dualSlider = new DualRangeSlider('dual-range-slider', 0, 99999, 5, 99999);

            // Load Railways dynamically (keeping original backend functionality)
            $.getJSON("${pageContext.request.contextPath}/eps/spo/getRailways.do", function(data) {
                $("#railway").append('<option value="all">All</option>');
                $.each(data, function(i, item) {
                    $("#railway").append('<option value="'+ item.INT_CODE +'">'+ item.VALUE +'</option>');
                });
            });

            // Supplier autocomplete
            $("#supplierName").autocomplete({
                source: function(request, response) {
                    $.ajax({
                        url: "${pageContext.request.contextPath}/eps/spo/getAccounts/" + request.term.toUpperCase(),
                        type: "GET",
                        success: function(data) {
                            response($.map(data, function(item) {
                                return {
                                    label: item.ACCOUNT_NAME,
                                    value: item.ACCOUNT_NAME,
                                    id: item.ACCOUNT_ID
                                };
                            }));
                        }
                    });
                },
                minLength: 2
            });

            // Auto convert supplier name to uppercase
            $("#supplierName").on('input', function() {
                this.value = this.value.toUpperCase();
            });

            // Refresh verification code
            $("#refresh-btn").click(function() {
                $.getJSON("${pageContext.request.contextPath}/eps/spo/refreshCode.do", function(data) {
                    const codeElement = $("#verification-code");
                    codeElement.css('transform', 'scale(0.8)');
                    codeElement.css('transition', 'all 0.2s ease');
                    setTimeout(() => {
                        codeElement.text(data.code);
                        codeElement.css('transform', 'scale(1)');
                    }, 200);
                    $("#verification-input").val('');
                });
            });

            // Pagination helpers
            var pageSize = 10;
            var currentPage = 1;
            var currentData = [];

            function renderTablePage(page) {
                var tbody = $("#results-table tbody");
                tbody.empty();
                var start = (page - 1) * pageSize;
                var end = start + pageSize;
                var paginatedData = currentData.slice(start, end);

                $.each(paginatedData, function(i, po) {
                    tbody.append(
                        "<tr>" +
                            "<td>" + (start + i + 1) + "</td>" +
                            "<td>" + (po.supplierName || '') + "</td>" +
                            "<td>" + (po.poValue || '') + "</td>" +
                            "<td><b>" + (po.plNo || '') + "</b>: " + (po.des || '') + "</td>" +
                            "<td>" + (po.poSr || '') + "</td>" +
                            "<td>" + (po.cname || '') + "</td>" +
                            "<td>" + (po.poQtyStr || '') + "</td>" +                            
                            "<td>" + (po.tur || '') + "</td>" +
                            "<td>" + (po.dpdtStr || '') + "</td>" +
                        "</tr>"
                    );
                });
            }

            function renderPagination() {
                var totalPages = Math.ceil(currentData.length / pageSize);
                var pagination = $("#pagination");
                pagination.empty();

                for (let i = 1; i <= totalPages; i++) {
                    var btn = $("<button>").text(i);
                    if (i === currentPage) btn.addClass("active");
                    btn.click(function() {
                        currentPage = i;
                        renderTablePage(currentPage);
                        renderPagination();
                    });
                    pagination.append(btn);
                }
            }

            // Search button with pagination
            $("#search-btn").click(function() {
                const btn = $(this);
                const originalText = btn.text();
                btn.text('Searching...');
                btn.prop('disabled', true);
                
                $.ajax({
                    url: "${pageContext.request.contextPath}/eps/spo/searchPurchaseOrders.do",
                    method: "POST",
                    data: {
                        railway: $("#railway").val(),
                        supplierName: $("#supplierName").val(),
                        plNumber: $("#plNumber").val(),
                        fromDate: $("#fromDate").val(),
                        toDate: $("#toDate").val(),
                        valueFrom: $("#valueFrom").val(),
                        valueTo: $("#valueTo").val(),
                        verificationCode: $("#verification-input").val()
                    },
                    success: function(response) {
                        btn.text(originalText);
                        btn.prop('disabled', false);
                        
                        if(response.error) {
                            alert(response.error);
                            return;
                        }
                        $("#results").show();
                        currentData = response.results || [];
                        currentPage = 1;
                        renderTablePage(currentPage);
                        renderPagination();
                    },
                    error: function() {
                        btn.text(originalText);
                        btn.prop('disabled', false);
                        alert("Error occurred during search.");
                    }
                });
            });
                        
            // Logout Button Functionality
            $("#logout-btn").click(function(e) {
                e.preventDefault();
                if (confirm('Are you sure you want to log out?')) {
                    window.history.back();
                }
            });

            // Prevent text selection while dragging
            document.addEventListener('selectstart', function(e) {
                if (dualSlider && dualSlider.isDragging) {
                    e.preventDefault();
                }
            });
        });
    </script>
    <script 
    src="https://translation-plugin.bhashini.co.in/v3/website_translation_utility.js"
    language-icon-color="#ffffff">
</script>
<script src="${pageContext.request.contextPath}/assets/bhashini/bhashini-init.js"></script>
</body>
</html>