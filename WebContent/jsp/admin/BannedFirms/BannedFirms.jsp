<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>IREPS - List of Firms</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
	
	.search-header h2 {
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
	
	.form-grid {
	    display: grid;
	    grid-template-columns: 300px;
	    gap: 16px;
	    margin-bottom: 16px;
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
	
	.form-select {
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
	
	.form-select:focus {
	    outline: none;
	    border-color: #74b9ff;
	    box-shadow: 0 0 0 3px rgba(116, 185, 255, 0.1);
	}
	
	.results-section {
	   padding: 20px;
	    background: white;
	    max-width: 1400px;
	    margin: 0 auto 0 auto;
	    
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
	
	.results-header .total-count {
	    font-size: 18px;
	    font-weight: 600;
	}
	
	.table-responsive {
	    border-radius: 12px;
	    overflow: hidden;
	    box-shadow: 0 8px 25px rgba(0, 0, 0, 0.1);
	    margin-bottom: 30px;
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
	
	.view-link {
	    color: #2563eb;
	    font-weight: 600;
	    text-decoration: none;
	    transition: color 0.3s ease;
	}
	
	.view-link:hover {
	    color: #1e40af;
	    text-decoration: underline;
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
	
	@media (max-width: 768px) {
	    .form-grid {
	        grid-template-columns: 1fr;
	    }
	    
	    .modern-table th,
	    .modern-table td {
	        padding: 8px 6px;
	        font-size: 12px;
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


<!-- Header -->
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
				<label for="language">Select Your Language</label>
						<!-- ⭐ REQUIRED for BHASHINI PLUGIN -->
    <div class="bhashini-plugin-container"></div>
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
			<a href="javascript:void(0)" onclick="selectOption('SPO', this)">
			Search Purchase Orders
			<br><small class="dev-note">(Under Development)</small>
			</a>
			<a href="javascript:void(0)" onclick="selectOption('Eauction', this)">
			E-Auction System
			<br><small class="dev-note">(Under Development)</small>
			</a>
			<a href="javascript:void(0)" onclick="selectOption('LearningCenter', this)">Learning Center</a>
			<a href="javascript:void(0)" onclick="selectOption('BannedFirms', this)">Banned Firms</a>
			<a href="javascript:void(0)" onclick="selectOption('Helpdesk', this)">Helpdesk</a>
			<a href="javascript:void(0)" onclick="selectOption('BannedFirms', this)"></a>
			<a href="javascript:void(0)" onclick="selectOption('Bidder', this)">New Bidder(E-Auction Sale)</a>
			<a href="javascript:void(0)" onclick="selectOption('DepartmentCreation', this)">
    Department Creation
</a>
		</div>

<div class="main-container">
    <div class="search-card">
        <div class="search-header">
            <h2><i class="bi bi-ban"></i> List of Firms with Whom Business Dealings Have Been Suspended</h2>
        </div>

        <div class="search-content">
            <div class="search-info">
                View list of firms with suspended or banned business dealings with Indian Railways
            </div>

            <form method="get" action="${pageContext.request.contextPath}/eps/BannedFirms/seen.do" id="filterForm">
                <div class="form-grid">
                    <div class="form-group">
                        <label for="typeSelect">Filter Type</label>
                        <select class="form-select" id="typeSelect" name="type" onchange="document.getElementById('filterForm').submit()">
                            <option value="all" ${empty selectedType || selectedType == 'all' ? 'selected' : ''}>All</option>
                            <option value="banned" ${selectedType == 'banned' ? 'selected' : ''}>Banned</option>
                            <option value="suspended" ${selectedType == 'suspended' ? 'selected' : ''}>Suspended</option>
                        </select>
                    </div>
                </div>
            </form>
        </div>
    </div>

    <div class="results-section">
        <div class="container-fluid" style="max-width: 1400px;">
            <div class="results-header">
                <h3>Banned/Suspended Firms List</h3>
                <span class="total-count">Total: <c:out value="${banListResult.size()}" default="0"/></span>
            </div>

            <div class="table-responsive">
                <table class="modern-table">
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>Letter No.</th>
                            <th>Date</th>
                            <th>Name & Address of Firm</th>
                            <th>Banned Upto</th>
                            <th>Remarks</th>
                            <th>Action</th>
                            <th>View Letter</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="firm" items="${banListResult}" varStatus="loop">
                            <tr>
                                <td style="font-weight: 600;">${loop.index + 1}</td>
                                <td>${firm.letNo}</td>
                                <td>${firm.letDate}</td>
                                <td style="text-align: left;">
                                    <strong>${firm.vname}</strong><br>
                                    <small style="color: #64748b;">${firm.vaddress}</small>
                                </td>
                                <td>${firm.banUpto}</td>
                                <td>${firm.remarks}</td>
                                <td>${firm.subj}</td>
                                <td>
                                    
                                </td>
                            </tr>
                        </c:forEach>
                        <c:if test="${empty banListResult}">
                            <tr>
                                <td colspan="8" style="text-align: center; padding: 30px; color: #64748b;">
                                    <i class="bi bi-inbox" style="font-size: 48px; display: block; margin-bottom: 10px;"></i>
                                    No records found
                                </td>
                            </tr>
                        </c:if>
                    </tbody>
                </table>
            </div>
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
s</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script 
    src="https://translation-plugin.bhashini.co.in/v3/website_translation_utility.js"
    language-icon-color="#ffffff">
</script>
<script src="${pageContext.request.contextPath}/assets/bhashini/bhashini-init.js"></script>
</body>
</html>