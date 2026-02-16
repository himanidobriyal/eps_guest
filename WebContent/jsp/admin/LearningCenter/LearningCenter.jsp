<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>IREPS - Learning Center</title>
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
    font-size: 24px; 
    font-weight: bold;
}

.right-section {
    display: flex;
    flex-direction: column;
    align-items: flex-end;
    font-size: 14px; 
    color: white;
    margin-right: 20px;
    gap: 5px; 
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
    padding: 4px 8px; 
    border-radius: 4px;
    font-size: 14px; 
    appearance: none;
    cursor: pointer;
}

.lang-container {
    display: flex;
    align-items: center;
    gap: 5px; 
}

.icon-row {
    display: flex;
    gap: 8px; 
    position: relative;
    top: 20px; 
}

.home-icon,
.logout-icon {
    font-size: 20px; 
    color: white;
    background-color: #00008B;
    padding: 4px 8px;
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

/* ----------------------------------
 * BODY/CONTENT STYLES (COMPACTED VERTICALLY - WIDTH RESTORED)
 * ---------------------------------- */

.main-container {
    flex: 1;
    max-width: 100%;
    margin: 0;
    padding: 0;
    overflow-y: auto;
    background: #f4f7f9; 
}

.learning-card {
    margin: 0 auto; 
    background: transparent;
    max-width: 1200px; 
    width: 100%;
    padding: 0 20px;
}

.learning-header {
    background: white;
    text-align: center;
    border-bottom: 3px solid #2c5aa0;
    margin-top: 15px; 
    max-width: 1200px; 
    margin-left: auto;
    margin-right: auto;
    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.05); 
}

.learning-header h2 {
    font-size: 24px; 
    color: #0b253f; 
    padding: 12px; 
    margin: 0;
}

.stats-bar {
    display: flex;
    justify-content: space-around;
    padding: 6px 10px;
    background: #f8fafc;
    border-bottom: 1px solid #e2e8f0;
    max-width: 1200px;
    margin: 0 auto;
}


.stat-item {
    text-align: center;
}

.stat-number {
    font-size: 20px; 
    font-weight: 700;
    color: #1e40af; 
}

.stat-label {
    color:  #475569;
    font-size: 12px; 
    font-weight: 500;
    margin-top: 2px;
}

.search-section {
    padding: 15px; 
    background: white;
    border-bottom: 1px solid #e0e8f0;
    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.05); 
    max-width: 1200px; 
    margin-left: auto;
    margin-right: auto;
}

.search-bar {
    max-width: 600px; 
    margin: 0 auto;
    position: relative;
}

.search-bar input {
    width: 100%;
    padding: 12px 18px; 
    border: 1px solid #cbd5e1; 
    border-radius: 6px; 
    font-size: 15px; 
    background: #ffffff;
}

.content-section {
    padding: 10px 0; 
    background: #f4f7f9;
    max-width: 1200px; 
    margin: 0 auto;
    display: block; 
}

/* Accordion Item Styles */
.category-card {
    background: white;
    border-radius: 6px; 
    margin-bottom: 8px; 
    box-shadow: 0 1px 5px rgba(0, 0, 0, 0.08); 
    overflow: hidden;
    border: 1px solid #e9ecef; 
}

.category-header {
    display: flex;
    align-items: center;
    justify-content: space-between; 
    padding: 12px 15px; 
    cursor: pointer;
    background: #ffffff;
    border-left: 4px solid transparent; 
    transition: background 0.3s, border-left-color 0.3s;
}

.category-card.active .category-header {
    border-left-color: #2c5aa0; 
    background: #f0f4f8;
}

.category-header:hover {
    background: #f9f9f9;
}

.category-info {
    display: flex;
    align-items: center;
    gap: 10px; 
}

.category-icon {
    width: 35px; 
    height: 35px;
    background-color: #2c5aa0;
    border-radius: 4px; 
    display: flex;
    align-items: center;
    justify-content: center;
    color: white;
    font-size: 1rem; 
    flex-shrink: 0;
}

.category-title {
    font-size: 1.1rem; 
    font-weight: 600;
    color: #0b253f;
    margin: 0;
}

.toggle-icon {
    font-size: 0.9rem; 
    color: #2c5aa0;
    transition: transform 0.3s ease;
}

/* Collapsible Content Styles */
.item-list-container {
    max-height: 0;
    overflow: hidden;
    transition: max-height 0.3s ease-out; 
    padding: 0 15px; 
}

.category-card.active .item-list-container {
    max-height: 1000px; 
    transition: max-height 0.5s ease-in;
    padding: 5px 15px 10px 15px; 
    border-top: 1px solid #e9ecef;
}

.item-list {
    list-style: none;
    padding: 0;
    margin: 0;
}

.item-list li {
    margin-bottom: 2px; 
    border-bottom: 1px solid #eee;
}

.item-list li:last-child {
    border-bottom: none;
}

.item-form {
    margin: 0;
    width: 100%;
}

.item-link {
    display: flex;
    align-items: center; 
    padding: 10px 6px; 
    background: transparent; 
    color: #111827;
    border: none;
    width: 100%;
    text-align: left;
    cursor: pointer;
    font-family: inherit;
    font-size: 15px; 
    font-weight: 500;
    padding: 11px 8px;
    transition: all 0.2s ease;
}

.item-link:hover {
    background: #f7f7f7;
    color: #2c5aa0;
    padding-left: 10px; 
}

.item-number {
    min-width: 28px; 
    height: 28px;
    background:linear-gradient(135deg, #2c5aa0, #1e3a8a) ;
    border-radius: 5px;
    display: flex;
    align-items: center;
    justify-content: center;
    font-weight: 600;
    color: #ffffff;
    margin-right: 8px; 
    font-size: 13px; 
    flex-shrink: 0;
    box-shadow: 0 2px 4px rgba(0,0,0,0.15);
    border-radius: 50%;
}

.item-text {
    flex: 1;
    line-height: 1.4; 
}

.item-icon {
    margin-left: auto;
    color: #999;
    font-size: 0.8rem; 
    flex-shrink: 0;
}

/* ----------------------------------
 * BADGE STYLES (HIGHLIGHTED)
 * ---------------------------------- */

.badge-new, .badge-railway {
    font-size: 10px; /* Slightly increased font size */
    padding: 2px 7px; /* Increased padding for better visibility */
    border-radius: 4px;
    margin-left: 6px;
    font-weight: 700; /* Bolder */
    text-transform: uppercase;
}

.badge-railway {
    background: #17a2b8;
    color: white;
}

/* --- NEW HIGHLIGHTED STYLE --- */
.badge-new {
    background: #ff4500; /* Vibrant Red-Orange */
    color: white;
    box-shadow: 0 0 8px rgba(255, 69, 0, 0.7); /* Glowing effect */
    animation: pulse 1.5s infinite; /* Pulse animation */
}

@keyframes pulse {
    0% { transform: scale(1); opacity: 1; }
    50% { transform: scale(1.05); opacity: 0.9; }
    100% { transform: scale(1); opacity: 1; }
}
/* ----------------------------------
 * FOOTER STYLES 
 * ---------------------------------- */

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

/* ----------------------------------
 * MEDIA QUERIES
 * ---------------------------------- */
@media (max-width: 768px) {
    .category-header {
        padding: 10px 14px; 
    }
    .category-title {
        font-size: 1.05rem;
    }
    .category-icon {
        width: 30px;
        height: 30px;
        font-size: 0.9rem;
    }
    .item-link {
        padding: 5px 5px;
        font-size: 13px;
    }
    .ireps-header {
        flex-direction: column;
        gap: 10px;
        padding: 10px;
    }
    .center-section {
        transform: translateX(0);
    }
    .stats-bar {
        flex-direction: column;
        gap: 8px;
        display: flex;
        justify-content: space-around;
        padding: 12px 20px;
        background: #f8fafc;
        border-bottom: 1px solid #e2e8f0;
        max-width: 1200px;
        margin: 0 auto;
    }
    .footer {
        flex-direction: column;
        padding: 8px 10px;
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
.search-error {
    color: #dc3545;
    font-size: 13px;
    margin-top: 5px;
    display: none;
}

.input-invalid {
    border: 1px solid #dc3545 !important;
    box-shadow: 0 0 5px rgba(220, 53, 69, 0.3);
}


.manual-count {
    background: linear-gradient(135deg, #2c5aa0, #1e3a8a);
    box-shadow: 0 2px 6px rgba(0,0,0,0.15);
    display: inline-block;
    background-color: #2c5aa0;
    color: #fff;
    font-size: 12px;
    font-weight: 600;
    padding: 3px 8px;
    border-radius: 20px;
    margin-left: 8px;
    min-width: 28px;
    text-align: center;
    transition: all 0.3s ease;
}

/* Slight hover effect */
.category-header:hover .manual-count {
    background-color: #1e3a8a;
}

.no-results {
    display: none;
    text-align: center;
    padding: 40px 20px;
    color: #6c757d;
}

.no-results i {
    font-size: 32px;
    margin-bottom: 10px;
    color: #2c5aa0;
}

.no-results p {
    font-size: 16px;
    font-weight: 500;
}
.highlight {
    background-color: #ffe066;
    padding: 1px 3px;
    border-radius: 3px;
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
    <div class="learning-card">
        <div class="learning-header">
        
            <h2>IREPS Learning Center</h2>
        </div>
        <div class="search-section">
            <div class="search-bar">
                <input type="text" id="searchInput" placeholder="Search for manuals, guides, or documentation...">
                <div id="searchError" class="search-error"></div>
            </div>
        </div>

        <div class="stats-bar">
            <div class="stat-item">
                <div class="stat-number">50+</div>
                <div class="stat-label">User Manuals</div>
            </div>
            <div class="stat-item">
                <div class="stat-number">10</div>
                <div class="stat-label">Categories</div>
            </div>
            <div class="stat-item">
                <div class="stat-number">24/7</div>
                <div class="stat-label">Access</div>
            </div>
        </div>

        

        <div class="content-section">
        <div id="noResultsMessage" class="no-results">
        <i class="fas fa-search"></i>
        <p>No manuals found matching your search.</p>
    </div>
            <div class="category-card" data-category-id="general">
                <div class="category-header">
                    <div class="category-info">
                        <div class="category-icon">
                            <i class="fas fa-book"></i>
                        </div>
                        <h2 class="category-title">General <span class="manual-count"></span></h2>
                    </div>
                    <i class="fas fa-chevron-down toggle-icon"></i>
                </div>
                <div class="item-list-container">
                    <ul class="item-list">
                        <li>
                            <form method="get" class="item-form" onsubmit="window.open('https://www.ireps.gov.in/html/helpdesk/undefinedireps.html', '_blank'); return false;">
                                <button type="submit" class="item-link">
                                    <span class="item-number">1</span>
                                    <span class="item-text">Trial Site</span>
                                    <i class="fas fa-external-link-alt item-icon"></i>
                                </button>
                            </form>
                        </li>
                        <li>
                            <form method="get" class="item-form" onsubmit="window.open('https://www.ireps.gov.in/ireps/upload/resources/SecurityAspectofeTokens.pdf', '_blank'); return false;">
                                <button type="submit" class="item-link">
                                    <span class="item-number">2</span>
                                    <span class="item-text">Security Aspects for use of E-tokens</span>
                                    <i class="fas fa-external-link-alt item-icon"></i>
                                </button>
                            </form>
                        </li>
                        <li>
                            <form method="get" class="item-form" onsubmit="window.open('https://www.ireps.gov.in/ireps/upload/resources/PublicKeyExportProcess.pdf', '_blank'); return false;">
                                <button type="submit" class="item-link">
                                    <span class="item-number">3</span>
                                    <span class="item-text">Procedure for Public Key Export from E-token</span>
                                    <i class="fas fa-external-link-alt item-icon"></i>
                                </button>
                            </form>
                        </li>
                        <li>
                            <form method="get" class="item-form" onsubmit="window.open('https://www.ireps.gov.in/ireps/upload/resources/List-Of-Special-Characters.pdf', '_blank'); return false;">
                                <button type="submit" class="item-link">
                                    <span class="item-number">4</span>
                                    <span class="item-text">List of Special Characters Not Allowed as Input / Upload</span>
                                    <i class="fas fa-external-link-alt item-icon"></i>
                                </button>
                            </form>
                        </li>
                        <li>
                            <form method="get" class="item-form" onsubmit="window.open('https://www.ireps.gov.in/ireps/upload/resources/Getting_Your_System_Ready_for_IREPS_Application_Version_2.0.pdf', '_blank'); return false;">
                                <button type="submit" class="item-link">
                                    <span class="item-number">5</span>
                                    <span class="item-text">Getting Your System Ready for IREPS Application Version 2.0</span>
                                    <i class="fas fa-external-link-alt item-icon"></i>
                                </button>
                            </form>
                        </li>
                        <li>
                            <form method="get" class="item-form" onsubmit="window.open('https://www.ireps.gov.in/ireps/upload/resources/SecrityTipsIREPS.pdf', '_blank'); return false;">
                                <button type="submit" class="item-link">
                                    <span class="item-number">6</span>
                                    <span class="item-text">IREPS Security Tips</span>
                                    <i class="fas fa-external-link-alt item-icon"></i>
                                </button>
                            </form>
                        </li>
                        <li>
                            <form method="get" class="item-form" onsubmit="window.open('https://www.ireps.gov.in/ireps/upload/resources/Guidelines_for_Procurement_and_Management_of_DEC_Version_2.0.pdf', '_blank'); return false;">
                                <button type="submit" class="item-link">
                                    <span class="item-number">7</span>
                                    <span class="item-text">Guidelines for Procurement, Use and Management of Encryption Certificate Version 2.0 <span class="badge-railway">for Railway Users</span></span>
                                    <i class="fas fa-external-link-alt item-icon"></i>
                                </button>
                            </form>
                        </li>
                        <li>
                            <form method="get" class="item-form" onsubmit="window.open('https://www.ireps.gov.in/ireps/upload/resources/Procedure_for_Mapping_Party_Codes_&_Viewing_Bills.pdf', '_blank'); return false;">
                                <button type="submit" class="item-link">
                                    <span class="item-number">8</span>
                                    <span class="item-text">Procedure for Mapping Party Codes & Viewing Status of Bills</span>
                                    <i class="fas fa-external-link-alt item-icon"></i>
                                </button>
                            </form>
                        </li>
                        <li>
                            <form method="get" class="item-form" onsubmit="window.open('https://www.ireps.gov.in/ireps/upload/resources/User_Manual_for_Contractors-Suppliers_for_Online_Bill_Tracking_Version_1.0.pdf', '_blank'); return false;">
                                <button type="submit" class="item-link">
                                    <span class="item-number">9</span>
                                    <span class="item-text">User Manual for Contractors / Suppliers for Online Bill Tracking Version 1.0</span>
                                    <i class="fas fa-external-link-alt item-icon"></i>
                                </button>
                            </form>
                        </li>
                        <li>
                            <form method="get" class="item-form" onsubmit="window.open('https://www.ireps.gov.in/ireps/upload/resources/User_Manual_for_Registration_of_New_Vendors_&_Contractors_Version_1.0.pdf', '_blank'); return false;">
                                <button type="submit" class="item-link">
                                    <span class="item-number">10</span>
                                    <span class="item-text">User Manual for Registration of New Vendors & Contractors Version 1.0</span>
                                    <i class="fas fa-external-link-alt item-icon"></i>
                                </button>
                            </form>
                        </li>
                        <li>
                            <form method="get" class="item-form" onsubmit="window.open('https://www.ireps.gov.in/ireps/upload/resources/User_Manual_for_Creation-Change_of_Primary_User_(Vendors).pdf', '_blank'); return false;">
                                <button type="submit" class="item-link">
                                    <span class="item-number">11</span>
                                    <span class="item-text">User Manual for Creation / Change of Primary User (Vendors)</span>
                                    <i class="fas fa-external-link-alt item-icon"></i>
                                </button>
                            </form>
                        </li>
                    </ul>
                </div>
            </div>

            <div class="category-card" data-category-id="new-imms">
                <div class="category-header">
                    <div class="category-info">
                        <div class="category-icon">
                            <i class="fas fa-warehouse"></i>
                        </div>
                        <h2 class="category-title">New IMMS (UDM) <span class="badge-new">NEW</span> <span class="manual-count"></span></h2>
                    </div>
                    <i class="fas fa-chevron-down toggle-icon"></i>
                </div>
                <div class="item-list-container">
                    <ul class="item-list">
                        <li>
                            <form method="get" class="item-form" onsubmit="window.open('https://www.ireps.gov.in/ireps/upload/resources/Manual_for_User_Depot_Module.pdf', '_blank'); return false;">
                                <button type="submit" class="item-link">
                                    <span class="item-number">1</span>
                                    <span class="item-text">User Manual for User Depot Module (UDM)</span>
                                    <i class="fas fa-external-link-alt item-icon"></i>
                                </button>
                            </form>
                        </li>
                        <li>
                            <form method="get" class="item-form" onsubmit="window.open('https://www.ireps.gov.in/ireps/upload/resources/Ready-Reckoner_UDM.pdf', '_blank'); return false;">
                                <button type="submit" class="item-link">
                                    <span class="item-number">2</span>
                                    <span class="item-text">Ready Reckoner for User Depot Module (UDM)</span>
                                    <i class="fas fa-external-link-alt item-icon"></i>
                                </button>
                            </form>
                        </li>
                        <li>
                            <form method="get" class="item-form" onsubmit="window.open('https://www.ireps.gov.in/ireps/upload/resources/UDM_HMISIntegration.pdf', '_blank'); return false;">
                                <button type="submit" class="item-link">
                                    <span class="item-number">3</span>
                                    <span class="item-text">UDM-HMIS Integration Functionality</span>
                                    <i class="fas fa-external-link-alt item-icon"></i>
                                </button>
                            </form>
                        </li>
                        <li>
                            <form method="get" class="item-form" onsubmit="window.open('https://www.ireps.gov.in/ireps/upload/resources/User_Manual_for_new_Release_Order_System_Sleeper_Distribution_for_Engineering_Users.pdf', '_blank'); return false;">
                                <button type="submit" class="item-link">
                                    <span class="item-number">4</span>
                                    <span class="item-text">User Manual for new Release Order System <span class="badge-railway">Sleeper Distribution for Engineering Users</span></span>
                                    <i class="fas fa-external-link-alt item-icon"></i>
                                </button>
                            </form>
                        </li>
                        <li>
                            <form method="get" class="item-form" onsubmit="window.open('https://www.ireps.gov.in/ireps/upload/resources/UserManual_SupplementaryWarranty.pdf', '_blank'); return false;">
                                <button type="submit" class="item-link">
                                    <span class="item-number">5</span>
                                    <span class="item-text">User Manual for Supplementary Warranty</span>
                                    <i class="fas fa-external-link-alt item-icon"></i>
                                </button>
                            </form>
                        </li>
                        <li>
                            <form method="get" class="item-form" onsubmit="window.open('https://www.ireps.gov.in/ireps/upload/resources/UserManual_FieldLotModule_UDM.pdf', '_blank'); return false;">
                                <button type="submit" class="item-link">
                                    <span class="item-number">6</span>
                                    <span class="item-text">User Manual for Field Lot</span>
                                    <i class="fas fa-external-link-alt item-icon"></i>
                                </button>
                            </form>
                        </li>
                    </ul>
                </div>
            </div>

            <div class="category-card" data-category-id="e-tender-goods">
                <div class="category-header">
                    <div class="category-info">
                        <div class="category-icon">
                            <i class="fas fa-shopping-cart"></i>
                        </div>
                        <h2 class="category-title">E-Tender (Goods & Services) <span class="manual-count"></span></h2>
                    </div>
                    <i class="fas fa-chevron-down toggle-icon"></i>
                </div>
                <div class="item-list-container">
                    <ul class="item-list">
                        <li>
                            <form method="get" class="item-form" onsubmit="window.open('https://www.ireps.gov.in/ireps/upload/resources/User_Manual_for_Vendors_(Goods&Services)_Version_1.0.pdf', '_blank'); return false;">
                                <button type="submit" class="item-link">
                                    <span class="item-number">1</span>
                                    <span class="item-text">User Manual for Vendors (Goods & Services) Version 1.0</span>
                                    <i class="fas fa-external-link-alt item-icon"></i>
                                </button>
                            </form>
                        </li>
                        <li>
                            <form method="get" class="item-form" onsubmit="window.open('https://www.ireps.gov.in/ireps/upload/resources/Compatibility_View_Settings.pdf', '_blank'); return false;">
                                <button type="submit" class="item-link">
                                    <span class="item-number">2</span>
                                    <span class="item-text">How to Turn Off Compatibility View Settings</span>
                                    <i class="fas fa-external-link-alt item-icon"></i>
                                </button>
                            </form>
                        </li>
                        <li>
                            <form method="get" class="item-form" onsubmit="window.open('https://www.ireps.gov.in/ireps/upload/resources/User_Manual_for_Vendors_on_Post_Contract_Activities_(Version-2.0).pdf', '_blank'); return false;">
                                <button type="submit" class="item-link">
                                    <span class="item-number">3</span>
                                    <span class="item-text">User Manual for Vendors on Post Contract Activities (Version-2.0)</span>
                                    <i class="fas fa-external-link-alt item-icon"></i>
                                </button>
                            </form>
                        </li>
                        <li>
                            <form method="get" class="item-form" onsubmit="window.open('https://www.ireps.gov.in/ireps/upload/resources/User_Manual_for_Vendors_%20for_Reverse_Auction_(Goods_&_Services_Module)_Version_2.pdf', '_blank'); return false;">
                                <button type="submit" class="item-link">
                                    <span class="item-number">4</span>
                                    <span class="item-text">User Manual for Vendors – Reverse Auction (Goods & Services Module) Version 2</span>
                                    <i class="fas fa-external-link-alt item-icon"></i>
                                </button>
                            </form>
                        </li>
                        <li>
                            <form method="get" class="item-form" onsubmit="window.open('https://www.ireps.gov.in/ireps/upload/resources/User_Manual_for_Supplementary_Bills_(Vendors)_Version_2.0.pdf', '_blank'); return false;">
                                <button type="submit" class="item-link">
                                    <span class="item-number">5</span>
                                    <span class="item-text">User Manual for On-Line Submission of Supplementary Bills by Vendors (Version-2.0)</span>
                                    <i class="fas fa-external-link-alt item-icon"></i>
                                </button>
                            </form>
                        </li>
                        <li>
                            <form method="get" class="item-form" onsubmit="window.open('https://www.ireps.gov.in/ireps/upload/resources/User_Manual_for_On-Line_Submission_of_Bills_having_Multiple_GST_Invoices.pdf', '_blank'); return false;">
                                <button type="submit" class="item-link">
                                    <span class="item-number">6</span>
                                    <span class="item-text">User Manual for On-Line Submission of Bills having Multiple GST Invoices</span>
                                    <i class="fas fa-external-link-alt item-icon"></i>
                                </button>
                            </form>
                        </li>
                        <li>
                            <form method="get" class="item-form" onsubmit="window.open('https://www.ireps.gov.in/ireps/upload/resources/User_Manual_for_Vendors_-_Third_Party_Inspection_System_Version_1.0.pdf', '_blank'); return false;">
                                <button type="submit" class="item-link">
                                    <span class="item-number">7</span>
                                    <span class="item-text">User Manual for Vendors – Third Party Inspection System Version 1.0</span>
                                    <i class="fas fa-external-link-alt item-icon"></i>
                                </button>
                            </form>
                        </li>
                        <li>
                            <form method="get" class="item-form" onsubmit="window.open('https://www.ireps.gov.in/ireps/upload/resources/VG_for_Vendors.mp4', '_blank'); return false;">
                                <button type="submit" class="item-link">
                                    <span class="item-number">8</span>
                                    <span class="item-text">Video Guide for Vendors – Third Party Inspection System Version 1.0</span>
                                    <i class="fas fa-external-link-alt item-icon"></i>
                                </button>
                            </form>
                        </li>
                    </ul>
                </div>
            </div>

            <div class="category-card" data-category-id="e-tender-works">
                <div class="category-header">
                    <div class="category-info">
                        <div class="category-icon">
                            <i class="fas fa-hard-hat"></i>
                        </div>
                        <h2 class="category-title">E-Tender (Works) <span class="manual-count"></span></h2>
                    </div>
                    <i class="fas fa-chevron-down toggle-icon"></i>
                </div>
                <div class="item-list-container">
                    <ul class="item-list">
                        <li>
                            <form method="get" class="item-form" onsubmit="window.open('https://www.ireps.gov.in/ireps/upload/resources/User_Manual_for_Contractors.pdf', '_blank'); return false;">
                                <button type="submit" class="item-link">
                                    <span class="item-number">1</span>
                                    <span class="item-text">User Manual for Contractors (Works) Version 1.0</span>
                                    <i class="fas fa-external-link-alt item-icon"></i>
                                </button>
                            </form>
                        </li>
                        <li>
                            <form method="get" class="item-form" onsubmit="window.open('https://www.ireps.gov.in/ireps/upload/resources/Contractor_Guide_for_Online_Payment.pdf', '_blank'); return false;">
                                <button type="submit" class="item-link">
                                    <span class="item-number">2</span>
                                    <span class="item-text">Contractor's Guide for Online Payment</span>
                                    <i class="fas fa-external-link-alt item-icon"></i>
                                </button>
                            </form>
                        </li>
                        <li>
                            <form method="get" class="item-form" onsubmit="window.open('https://www.ireps.gov.in/ireps/upload/resources/User_Manual_for_Department_Admins_Version_1.0.pdf', '_blank'); return false;">
                                <button type="submit" class="item-link">
                                    <span class="item-number">3</span>
                                    <span class="item-text">User Manual for Department Admins (Version 1.0) <span class="badge-railway">for Railway Users</span></span>
                                    <i class="fas fa-external-link-alt item-icon"></i>
                                </button>
                            </form>
                        </li>
                        <li>
                            <form method="get" class="item-form" onsubmit="window.open('https://www.ireps.gov.in/ireps/upload/resources/CM_SOR_NS_Item_DIR.pdf', '_blank'); return false;">
                                <button type="submit" class="item-link">
                                    <span class="item-number">4</span>
                                    <span class="item-text">Creation & Management of SOR & NS Item Directories <span class="badge-railway">for Railway Users</span></span>
                                    <i class="fas fa-external-link-alt item-icon"></i>
                                </button>
                            </form>
                        </li>
                        <li>
                            <form method="get" class="item-form" onsubmit="window.open('https://www.ireps.gov.in/ireps/upload/resources/User_Manual_for_Contractors-For_Two_Stage_Reverse_Auction_(Works_Module)_Version_2.0.pdf', '_blank'); return false;">
                                <button type="submit" class="item-link">
                                    <span class="item-number">5</span>
                                    <span class="item-text">User Manual for Contractors – Two Stage Reverse Auction (Works Module) Version 2.0</span>
                                    <i class="fas fa-external-link-alt item-icon"></i>
                                </button>
                            </form>
                        </li>
                    </ul>
                </div>
            </div>

            <div class="category-card" data-category-id="e-tender-leasing">
                <div class="category-header">
                    <div class="category-info">
                        <div class="category-icon">
                            <i class="fas fa-chart-line"></i>
                        </div>
                        <h2 class="category-title">E-Tender (Earning / Leasing) <span class="manual-count"></span></h2>
                    </div>
                    <i class="fas fa-chevron-down toggle-icon"></i>
                </div>
                <div class="item-list-container">
                    <ul class="item-list">
                        <li>
                            <form method="get" class="item-form" onsubmit="window.open('https://www.ireps.gov.in/ireps/upload/resources/User_Manual_for_Contractors_(Earning-Leasing)_Version_1.0.pdf', '_blank'); return false;">
                                <button type="submit" class="item-link">
                                    <span class="item-number">1</span>
                                    <span class="item-text">User Manual for Contractors (Earning / Leasing) Version 1.0</span>
                                    <i class="fas fa-external-link-alt item-icon"></i>
                                </button>
                            </form>
                        </li>
                    </ul>
                </div>
            </div>

            <div class="category-card" data-category-id="e-auction-leasing">
                <div class="category-header">
                    <div class="category-info">
                        <div class="category-icon">
                            <i class="fas fa-gavel"></i>
                        </div>
                        <h2 class="category-title">E-Auction Leasing <span class="manual-count"></span></h2>
                    </div>
                    <i class="fas fa-chevron-down toggle-icon"></i>
                </div>
                <div class="item-list-container">
                    <ul class="item-list">
                        <li>
                            <form method="get" class="item-form" onsubmit="window.open('https://www.ireps.gov.in/ireps/upload/resources/User%20Manual%20for%20Contractors%20for%20E-Auction%20for%20Earning-Leasing%20Contracts%20Version%201.0.pdf', '_blank'); return false;">
                                <button type="submit" class="item-link">
                                    <span class="item-number">1</span>
                                    <span class="item-text">User Manual for Contractors for E-Auction Leasing Module Version 1.0</span>
                                    <i class="fas fa-external-link-alt item-icon"></i>
                                </button>
                            </form>
                        </li>
                        <li>
                            <form method="get" class="item-form" onsubmit="window.open('https://www.ireps.gov.in/ireps/upload/resources/User_Manual_for_Bidders_for_E-Auction_for_Earning-Leasing_Contracts_Version_1.0.pdf', '_blank'); return false;">
                                <button type="submit" class="item-link">
                                    <span class="item-number">2</span>
                                    <span class="item-text">User Manual for Bidders for E-Auction Leasing Module Version 1.0</span>
                                    <i class="fas fa-external-link-alt item-icon"></i>
                                </button>
                            </form>
                        </li>
                    </ul>
                </div>
            </div>

            <div class="category-card" data-category-id="e-auction-scrap">
                <div class="category-header">
                    <div class="category-info">
                        <div class="category-icon">
                            <i class="fas fa-dumpster"></i>
                        </div>
                        <h2 class="category-title">E-Auction Scrap <span class="manual-count"></span></h2>
                    </div>
                    <i class="fas fa-chevron-down toggle-icon"></i>
                </div>
                <div class="item-list-container">
                    <ul class="item-list">
                        <li>
                            <form method="get" class="item-form" onsubmit="window.open('https://www.ireps.gov.in/ireps/upload/resources/Bidder_manual.pdf', '_blank'); return false;">
                                <button type="submit" class="item-link">
                                    <span class="item-number">1</span>
                                    <span class="item-text">Bidder User Manual</span>
                                    <i class="fas fa-external-link-alt item-icon"></i>
                                </button>
                            </form>
                        </li>
                        <li>
                            <form method="get" class="item-form" onsubmit="window.open('https://www.ireps.gov.in/ireps/upload/resources/SBICorporateGuide.pdf', '_blank'); return false;">
                                <button type="submit" class="item-link">
                                    <span class="item-number">2</span>
                                    <span class="item-text">Guide For SBI Corporate Account User</span>
                                    <i class="fas fa-external-link-alt item-icon"></i>
                                </button>
                            </form>
                        </li>
                        <li>
                            <form method="get" class="item-form" onsubmit="window.open('https://www.ireps.gov.in/ireps/upload/resources/E-auction_bsvinvoice.pdf', '_blank'); return false;">
                                <button type="submit" class="item-link">
                                    <span class="item-number">3</span>
                                    <span class="item-text">User Manual of Balance Sale Value & Invoice Generation</span>
                                    <i class="fas fa-external-link-alt item-icon"></i>
                                </button>
                            </form>
                        </li>
                        <li>
                            <form method="get" class="item-form" onsubmit="window.open('https://www.ireps.gov.in/ireps/upload/resources/BidderManual_LotPublishing.pdf', '_blank'); return false;">
                                <button type="submit" class="item-link">
                                    <span class="item-number">4</span>
                                    <span class="item-text">User Manual for Bidders on Lot Publishing Module</span>
                                    <i class="fas fa-external-link-alt item-icon"></i>
                                </button>
                            </form>
                        </li>
                    </ul>
                </div>
            </div>

            <div class="category-card" data-category-id="imms">
                <div class="category-header">
                    <div class="category-info">
                        <div class="category-icon">
                            <i class="fas fa-boxes"></i>
                        </div>
                        <h2 class="category-title">iMMS <span class="manual-count"></span></h2>
                    </div>
                    <i class="fas fa-chevron-down toggle-icon"></i>
                </div>
                <div class="item-list-container">
                    <ul class="item-list">
                        <li>
                            <form method="get" class="item-form" onsubmit="window.open('https://www.ireps.gov.in/ireps/upload/resources/iMMS_HQ_Manual.pdf', '_blank'); return false;">
                                <button type="submit" class="item-link">
                                    <span class="item-number">1</span>
                                    <span class="item-text">User Manual for HQ users (HQ Module)</span>
                                    <i class="fas fa-external-link-alt item-icon"></i>
                                </button>
                            </form>
                        </li>
                        <li>
                            <form method="get" class="item-form" onsubmit="window.open('https://www.ireps.gov.in/ireps/upload/resources/iMMS_Depot_Manual.pdf', '_blank'); return false;">
                                <button type="submit" class="item-link">
                                    <span class="item-number">2</span>
                                    <span class="item-text">User Manual for Depot users (Depot Module)</span>
                                    <i class="fas fa-external-link-alt item-icon"></i>
                                </button>
                            </form>
                        </li>
                        <li>
                            <form method="get" class="item-form" onsubmit="window.open('https://www.ireps.gov.in/ireps/upload/resources/iMMS_Disposal_Module_Manual.pdf', '_blank'); return false;">
                                <button type="submit" class="item-link">
                                    <span class="item-number">3</span>
                                    <span class="item-text">iMMS Disposal Module Manual</span>
                                    <i class="fas fa-external-link-alt item-icon"></i>
                                </button>
                            </form>
                        </li>
                        <li>
                            <form method="get" class="item-form" onsubmit="window.open('https://www.ireps.gov.in/ireps/upload/resources/User_Manual_iMMS_for_Bill_Verification.pdf', '_blank'); return false;">
                                <button type="submit" class="item-link">
                                    <span class="item-number">4</span>
                                    <span class="item-text">iMMS Bill Verification User Manual</span>
                                    <i class="fas fa-external-link-alt item-icon"></i>
                                </button>
                            </form>
                        </li>
                        <li>
                            <form method="get" class="item-form" onsubmit="window.open('https://www.ireps.gov.in/ireps/upload/resources/User_Manual_iMMS_Reconciliation.pdf', '_blank'); return false;">
                                <button type="submit" class="item-link">
                                    <span class="item-number">5</span>
                                    <span class="item-text">iMMS Reconciliation User Manual</span>
                                    <i class="fas fa-external-link-alt item-icon"></i>
                                </button>
                            </form>
                        </li>
                        <li>
                            <form method="get" class="item-form" onsubmit="window.open('https://www.ireps.gov.in/ireps/upload/resources/User_Manual_iMMS_IRP.pdf', '_blank'); return false;">
                                <button type="submit" class="item-link">
                                    <span class="item-number">6</span>
                                    <span class="item-text">iMMS Indent Registration and Progressing (IRP) User Manual</span>
                                    <i class="fas fa-external-link-alt item-icon"></i>
                                </button>
                            </form>
                        </li>
                        <li>
                            <form method="get" class="item-form" onsubmit="window.open('https://www.ireps.gov.in/ireps/upload/resources/iMMS_User_Manual_for_MMIS_Integration.pdf', '_blank'); return false;">
                                <button type="submit" class="item-link">
                                    <span class="item-number">7</span>
                                    <span class="item-text">iMMS User Manual for MMIS Integration</span>
                                    <i class="fas fa-external-link-alt item-icon"></i>
                                </button>
                            </form>
                        </li>
                        <li>
                            <form method="get" class="item-form" onsubmit="window.open('https://www.ireps.gov.in/ireps/upload/resources/iMMS_User_Manual_for_FOIS_Integration.pdf', '_blank'); return false;">
                                <button type="submit" class="item-link">
                                    <span class="item-number">8</span>
                                    <span class="item-text">iMMS User Manual for FOIS Integration</span>
                                    <i class="fas fa-external-link-alt item-icon"></i>
                                </button>
                            </form>
                        </li>
                        <li>
                            <form method="get" class="item-form" onsubmit="window.open('https://www.ireps.gov.in/ireps/upload/resources/User_Manual_for_Integration_of_iMMS_and_HMIS.pdf', '_blank'); return false;">
                                <button type="submit" class="item-link">
                                    <span class="item-number">9</span>
                                    <span class="item-text">User Manual for Integration of iMMS and HMIS</span>
                                    <i class="fas fa-external-link-alt item-icon"></i>
                                </button>
                            </form>
                        </li>
                        <li>
                            <form method="get" class="item-form" onsubmit="window.open('https://www.ireps.gov.in/ireps/upload/resources/User_Manual_Consignee_Wise_AAC.pdf', '_blank'); return false;">
                                <button type="submit" class="item-link">
                                    <span class="item-number">10</span>
                                    <span class="item-text">User Manual – Consignee-wise AAC</span>
                                    <i class="fas fa-external-link-alt item-icon"></i>
                                </button>
                            </form>
                        </li>
                        <li>
                            <form method="get" class="item-form" onsubmit="window.open('https://www.ireps.gov.in/ireps/upload/resources/User_Manual_IMMS_Depot_Receipt.pdf', '_blank'); return false;">
                                <button type="submit" class="item-link">
                                    <span class="item-number">11</span>
                                    <span class="item-text">IMMS User Depot Receipt Manual</span>
                                    <i class="fas fa-external-link-alt item-icon"></i>
                                </button>
                            </form>
                        </li>
                    </ul>
                </div>
            </div>

            <div class="category-card" data-category-id="inspection">
                <div class="category-header">
                    <div class="category-info">
                        <div class="category-icon">
                            <i class="fas fa-search"></i>
                        </div>
                        <h2 class="category-title">Inspection <span class="manual-count"></span></h2>
                    </div>
                    <i class="fas fa-chevron-down toggle-icon"></i>
                </div>
                <div class="item-list-container">
                    <ul class="item-list">
                        <li>
                            <form method="get" class="item-form" onsubmit="window.open('https://www.ireps.gov.in/ireps/upload/resources/User_Manual_for_Inspectors_Version_1.0.pdf', '_blank'); return false;">
                                <button type="submit" class="item-link">
                                    <span class="item-number">1</span>
                                    <span class="item-text">User Manual for Inspectors (Version 1.0)</span>
                                    <i class="fas fa-external-link-alt item-icon"></i>
                                </button>
                            </form>
                        </li>
                        <li>
                            <form method="get" class="item-form" onsubmit="window.open('https://www.ireps.gov.in/ireps/upload/resources/User_Manual_for_Inspection_Certificates_Version_1.0.pdf', '_blank'); return false;">
                                <button type="submit" class="item-link">
                                    <span class="item-number">2</span>
                                    <span class="item-text">User Manual for Inspection Certificates (Version 1.0)</span>
                                    <i class="fas fa-external-link-alt item-icon"></i>
                                </button>
                            </form>
                        </li>
                    </ul>
                </div>
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

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
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

document.addEventListener("DOMContentLoaded", function() {
    const categories = document.querySelectorAll(".category-card");
 // 0. Calculate Total Manuals Per Category
   // Calculate total manuals per category
categories.forEach(function(card) {
    const items = card.querySelectorAll("li");  // simpler selector
    const countSpan = card.querySelector(".manual-count");

    if (countSpan) {
        countSpan.textContent = "(" + items.length + ")";
    }
});


    const searchInput = document.getElementById("searchInput");

    // 1. Accordion/Toggle Functionality
    categories.forEach(card => {
        const header = card.querySelector(".category-header");
        

        
        header.addEventListener("click", () => {
            const isCurrentlyActive = card.classList.contains("active");

            // Optional: Close all other open cards 
            categories.forEach(otherCard => {
                if (otherCard !== card && otherCard.classList.contains("active")) {
                    otherCard.classList.remove("active");
                }
            });

            // Toggle the current card
            if (isCurrentlyActive) {
                card.classList.remove("active");
            } else {
                card.classList.add("active");
            }
        });
    });

    // 2. Search Functionality
 // 2. Search Functionality (WITH VALIDATION)
    searchInput.addEventListener("input", function() {
    	const noResultsMessage = document.getElementById("noResultsMessage");

        const errorDiv = document.getElementById("searchError");
        let query = this.value.trim();
        this.value = query;

        const invalidPattern = /[^a-zA-Z0-9\s._-]/;

        // Reset error state
        if (errorDiv) {
            errorDiv.textContent = "";
            errorDiv.style.display = "none";
        }
        this.classList.remove("input-invalid");

        // If empty → reset everything
       // 🔥 EMPTY INPUT RESET BLOCK (ADD HERE)
    if (query === "") {

        if (noResultsMessage) {
            noResultsMessage.style.display = "none";
        }

        categories.forEach(card => {
            card.style.display = "";
            card.classList.remove("active");

            card.querySelectorAll(".item-link").forEach(itemLink => {

                const textElement = itemLink.querySelector(".item-text");
                const originalText = textElement.textContent;

                // remove highlight
                textElement.innerHTML = originalText;

                itemLink.closest("li").style.display = "";
            });
        });

        return;
    }
        // Minimum 3 characters
        if (query.length < 3) {
            if (errorDiv) {
                errorDiv.textContent = "Please enter at least 3 characters.";
                errorDiv.style.display = "block";
            }
            this.classList.add("input-invalid");
            return;
        }

        // Maximum 60 characters
        if (query.length > 60) {
            if (errorDiv) {
                errorDiv.textContent = "Search cannot exceed 60 characters.";
                errorDiv.style.display = "block";
            }
            this.classList.add("input-invalid");
            return;
        }

        // Special characters validation
        if (invalidPattern.test(query)) {
            if (errorDiv) {
                errorDiv.textContent = "Special characters are not allowed.";
                errorDiv.style.display = "block";
            }
            this.classList.add("input-invalid");
            return;
        }

        // 🔥 ORIGINAL SEARCH LOGIC (unchanged)
        const lowerQuery = query.toLowerCase();
       
        let totalVisibleMatches = 0;

        categories.forEach(card => {
            const items = card.querySelectorAll(".item-link");
            let hasVisibleItem = false;
            
            items.forEach(itemLink => {

                const textElement = itemLink.querySelector(".item-text");
                const originalText = textElement.textContent; // original
                const lowerText = originalText.toLowerCase();
                const listItem = itemLink.closest("li");

                // Reset previous highlight
                textElement.innerHTML = originalText;

                if (lowerText.includes(lowerQuery)) {
                    listItem.style.display = "";
                    hasVisibleItem = true;
                    totalVisibleMatches++;

                    // Highlight matched keyword
                    if (lowerQuery !== "") {
                        const regex = new RegExp("(" + lowerQuery + ")", "gi");
                        textElement.innerHTML = originalText.replace(
                            regex,
                            '<span class="highlight">$1</span>'
                        );
                    }

                } else {
                    listItem.style.display = "none";
                }
            });


            if (hasVisibleItem) {
                card.style.display = "";
                card.classList.add("active");
            } else {
                card.style.display = "none";
            }
        });
        
        
     // Show or hide no results message
        if (noResultsMessage) {
            if (totalVisibleMatches === 0) {
                noResultsMessage.style.display = "block";
            } else {
                noResultsMessage.style.display = "none";
            }
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