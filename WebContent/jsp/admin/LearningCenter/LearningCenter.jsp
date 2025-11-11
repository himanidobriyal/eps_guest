<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>IREPS - Learning Center</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
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
    margin: 12px 0px;
    padding-bottom: 30px;
    overflow-y: auto;
}

.learning-card {
    background: rgba(255, 255, 255, 0.98);
    backdrop-filter: blur(15px);
    border-radius: 20px;
    box-shadow: 0 20px 60px rgba(0, 0, 0, 0.1);
    overflow: visible;
    max-width: 1400px;
    width: 100%;
    margin: 0 auto;
    display: flex;
    flex-direction: column;
}

.learning-header {
    background: white;
    color: #2c5aa0;
    text-align: center;
    position: relative;
    border-bottom: 3px solid #2c5aa0;
}

.learning-header h2 {
    font-size: 28px;
    position: relative;
    z-index: 1;
    letter-spacing: 0.5px;
    margin: 0;
    color: #2c5aa0;
    padding: 20px;
}

.stats-bar {
    display: flex;
    justify-content: space-around;
    padding: 15px 20px;
    background: linear-gradient(90deg, #f0f7ff 0%, #ffffff 50%, #f0fff4 100%);
    border-bottom: 1px solid #d1e3f8;
}

.stat-item {
    text-align: center;
}

.stat-number {
    font-size: 28px;
    font-weight: 700;
    color: #2c5aa0;
}

.stat-label {
    color: #6c757d;
    font-size: 14px;
    font-weight: 500;
}

.search-section {
    padding: 15px 20px;
    background: #f8fbff;
    border-bottom: 1px solid #e0e8f0;
}

.search-bar {
    max-width: 600px;
    margin: 0 auto;
}

.search-bar input {
    width: 100%;
    padding: 12px 20px;
    border: 2px solid #ddd;
    border-radius: 50px;
    font-size: 14px;
    transition: all 0.3s ease;
}

.search-bar input:focus {
    outline: none;
    border-color: #74b9ff;
    box-shadow: 0 0 0 3px rgba(116, 185, 255, 0.1);
}

.content-section {
    padding: 20px;
    background: white;
    max-width: 1400px;
    margin: 0 auto;
}

.category-card {
    background: white;
    border-radius: 12px;
    padding: 15px;
    margin-bottom: 12px;
    box-shadow: 0 4px 15px rgba(0, 82, 204, 0.08);
    border-left: 4px solid #2c5aa0;
    transition: all 0.3s ease;
}

.category-card:hover {
    transform: translateY(-2px);
    box-shadow: 0 6px 20px rgba(0, 82, 204, 0.12);
}

.category-header {
    display: flex;
    align-items: center;
    gap: 12px;
    margin-bottom: 12px;
    cursor: pointer;
}

.category-icon {
    width: 40px;
    height: 40px;
    background: linear-gradient(135deg, #2c5aa0, #4c9aff);
    border-radius: 10px;
    display: flex;
    align-items: center;
    justify-content: center;
    color: white;
    font-size: 1.2rem;
    box-shadow: 0 3px 10px rgba(44, 90, 160, 0.3);
    flex-shrink: 0;
}

.category-title {
    font-size: 1.25rem;
    font-weight: 700;
    color: #0b253f;
    margin: 0;
}

.item-list {
    list-style: none;
    padding: 0;
    margin: 0;
}

.item-list li {
    margin-bottom: 8px;
}

.item-form {
    margin: 0;
    width: 100%;
}

.item-link {
    display: flex;
    align-items: center;
    padding: 10px 12px;
    background: linear-gradient(135deg, #f0f7ff 0%, #ffffff 100%);
    border-radius: 8px;
    color: #2d3436;
    transition: all 0.3s ease;
    border: 1px solid transparent;
    width: 100%;
    text-align: left;
    cursor: pointer;
    font-family: inherit;
    font-size: 14px;
    font-weight: 500;
}

.item-link:hover {
    background: linear-gradient(135deg, #2c5aa0 0%, #4c9aff 100%);
    color: white;
    transform: translateX(8px);
    border-color: #2c5aa0;
    box-shadow: 0 3px 12px rgba(44, 90, 160, 0.25);
}

.item-number {
    min-width: 28px;
    height: 28px;
    background: white;
    border-radius: 50%;
    display: flex;
    align-items: center;
    justify-content: center;
    font-weight: 700;
    color: #2c5aa0;
    margin-right: 10px;
    font-size: 13px;
    flex-shrink: 0;
    box-shadow: 0 2px 6px rgba(0, 82, 204, 0.15);
}

.item-link:hover .item-number {
    background: #0b253f;
    color: white;
}

.item-text {
    flex: 1;
    line-height: 1.4;
}

.item-icon {
    margin-left: auto;
    opacity: 0;
    transform: translateX(-10px);
    transition: all 0.3s ease;
    flex-shrink: 0;
}

.item-link:hover .item-icon {
    opacity: 1;
    transform: translateX(0);
}

.badge-new {
    background: linear-gradient(135deg, #ff6b6b, #ee5a6f);
    color: white;
    padding: 3px 10px;
    border-radius: 20px;
    font-size: 11px;
    font-weight: 600;
    margin-left: 8px;
    text-transform: uppercase;
    letter-spacing: 0.5px;
}

.badge-railway {
    background: linear-gradient(135deg, #00b894, #00cec9);
    color: white;
    padding: 3px 10px;
    border-radius: 20px;
    font-size: 11px;
    font-weight: 600;
    margin-left: 8px;
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
}

.footer img {
    height: 50px;
    vertical-align: middle;
}

.footer-text {
    margin-left: 10px;
}

@media (max-width: 768px) {
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
    
    .category-card {
        padding: 12px;
    }
    
    .item-link {
        padding: 8px 10px;
        font-size: 13px;
    }
    
    .stats-bar {
        flex-direction: column;
        gap: 10px;
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
    <div class="learning-card">
        <div class="learning-header">
            <h2>IREPS Learning Center</h2>
        </div>

        <div class="stats-bar">
            <div class="stat-item">
                <div class="stat-number">50+</div>
                <div class="stat-label">User Manuals</div>
            </div>
            <div class="stat-item">
                <div class="stat-number">8</div>
                <div class="stat-label">Categories</div>
            </div>
            <div class="stat-item">
                <div class="stat-number">24/7</div>
                <div class="stat-label">Access</div>
            </div>
        </div>

        <div class="search-section">
            <div class="search-bar">
                <input type="text" id="searchInput" placeholder="Search for manuals, guides, or documentation...">
            </div>
        </div>

        <div class="content-section">
            <!-- General Section -->
            <div class="category-card">
                <div class="category-header">
                    <div class="category-icon">
                        <i class="fas fa-book"></i>
                    </div>
                    <h2 class="category-title">General</h2>
                </div>
                <ul class="item-list">
                    <li>
                        <form method="get" class="item-form" onsubmit="window.open('https://www.ireps.gov.in/html/helpdesk/undefinedireps.html', '_blank'); return false;">
                            <button type="submit" class="item-link">
                                <span class="item-number">1</span>
                                <span class="item-text">Trial Site</span>
                                <i class="fas fa-arrow-right item-icon"></i>
                            </button>
                        </form>
                    </li>
                    <li>
                        <form method="get" class="item-form" onsubmit="window.open('https://www.ireps.gov.in/ireps/upload/resources/SecurityAspectofeTokens.pdf', '_blank'); return false;">
                            <button type="submit" class="item-link">
                                <span class="item-number">2</span>
                                <span class="item-text">Security Aspects for use of E-tokens</span>
                                <i class="fas fa-arrow-right item-icon"></i>
                            </button>
                        </form>
                    </li>
                    <li>
                        <form method="get" class="item-form" onsubmit="window.open('https://www.ireps.gov.in/ireps/upload/resources/PublicKeyExportProcess.pdf', '_blank'); return false;">
                            <button type="submit" class="item-link">
                                <span class="item-number">3</span>
                                <span class="item-text">Procedure for Public Key Export from E-token</span>
                                <i class="fas fa-arrow-right item-icon"></i>
                            </button>
                        </form>
                    </li>
                    <li>
                        <form method="get" class="item-form" onsubmit="window.open('https://www.ireps.gov.in/ireps/upload/resources/List-Of-Special-Characters.pdf', '_blank'); return false;">
                            <button type="submit" class="item-link">
                                <span class="item-number">4</span>
                                <span class="item-text">List of Special Characters Not Allowed as Input / Upload</span>
                                <i class="fas fa-arrow-right item-icon"></i>
                            </button>
                        </form>
                    </li>
                    <li>
                        <form method="get" class="item-form" onsubmit="window.open('https://www.ireps.gov.in/ireps/upload/resources/Getting_Your_System_Ready_for_IREPS_Application_Version_2.0.pdf', '_blank'); return false;">
                            <button type="submit" class="item-link">
                                <span class="item-number">5</span>
                                <span class="item-text">Getting Your System Ready for IREPS Application Version 2.0</span>
                                <i class="fas fa-arrow-right item-icon"></i>
                            </button>
                        </form>
                    </li>
                    <li>
                        <form method="get" class="item-form" onsubmit="window.open('https://www.ireps.gov.in/ireps/upload/resources/SecrityTipsIREPS.pdf', '_blank'); return false;">
                            <button type="submit" class="item-link">
                                <span class="item-number">6</span>
                                <span class="item-text">IREPS Security Tips</span>
                                <i class="fas fa-arrow-right item-icon"></i>
                            </button>
                        </form>
                    </li>
                    <li>
                        <form method="get" class="item-form" onsubmit="window.open('https://www.ireps.gov.in/ireps/upload/resources/Guidelines_for_Procurement_and_Management_of_DEC_Version_2.0.pdf', '_blank'); return false;">
                            <button type="submit" class="item-link">
                                <span class="item-number">7</span>
                                <span class="item-text">Guidelines for Procurement, Use and Management of Encryption Certificate Version 2.0 <span class="badge-railway">for Railway Users</span></span>
                                <i class="fas fa-arrow-right item-icon"></i>
                            </button>
                        </form>
                    </li>
                    <li>
                        <form method="get" class="item-form" onsubmit="window.open('https://www.ireps.gov.in/ireps/upload/resources/Procedure_for_Mapping_Party_Codes_&_Viewing_Bills.pdf', '_blank'); return false;">
                            <button type="submit" class="item-link">
                                <span class="item-number">8</span>
                                <span class="item-text">Procedure for Mapping Party Codes & Viewing Status of Bills</span>
                                <i class="fas fa-arrow-right item-icon"></i>
                            </button>
                        </form>
                    </li>
                    <li>
                        <form method="get" class="item-form" onsubmit="window.open('https://www.ireps.gov.in/ireps/upload/resources/User_Manual_for_Contractors-Suppliers_for_Online_Bill_Tracking_Version_1.0.pdf', '_blank'); return false;">
                            <button type="submit" class="item-link">
                                <span class="item-number">9</span>
                                <span class="item-text">User Manual for Contractors / Suppliers for Online Bill Tracking Version 1.0</span>
                                <i class="fas fa-arrow-right item-icon"></i>
                            </button>
                        </form>
                    </li>
                    <li>
                        <form method="get" class="item-form" onsubmit="window.open('https://www.ireps.gov.in/ireps/upload/resources/User_Manual_for_Registration_of_New_Vendors_&_Contractors_Version_1.0.pdf', '_blank'); return false;">
                            <button type="submit" class="item-link">
                                <span class="item-number">10</span>
                                <span class="item-text">User Manual for Registration of New Vendors & Contractors Version 1.0</span>
                                <i class="fas fa-arrow-right item-icon"></i>
                            </button>
                        </form>
                    </li>
                    <li>
                        <form method="get" class="item-form" onsubmit="window.open('https://www.ireps.gov.in/ireps/upload/resources/User_Manual_for_Creation-Change_of_Primary_User_(Vendors).pdf', '_blank'); return false;">
                            <button type="submit" class="item-link">
                                <span class="item-number">11</span>
                                <span class="item-text">User Manual for Creation / Change of Primary User (Vendors)</span>
                                <i class="fas fa-arrow-right item-icon"></i>
                            </button>
                        </form>
                    </li>
                </ul>
            </div>

            <!-- New IMMS (UDM) Section -->
            <div class="category-card">
                <div class="category-header">
                    <div class="category-icon">
                        <i class="fas fa-warehouse"></i>
                    </div>
                    <h2 class="category-title">New IMMS (UDM) <span class="badge-new">NEW</span></h2>
                </div>
                <ul class="item-list">
                    <li>
                        <form method="get" class="item-form" onsubmit="window.open('https://www.ireps.gov.in/ireps/upload/resources/Manual_for_User_Depot_Module.pdf', '_blank'); return false;">
                            <button type="submit" class="item-link">
                                <span class="item-number">1</span>
                                <span class="item-text">User Manual for User Depot Module (UDM)</span>
                                <i class="fas fa-arrow-right item-icon"></i>
                            </button>
                        </form>
                    </li>
                    <li>
                        <form method="get" class="item-form" onsubmit="window.open('https://www.ireps.gov.in/ireps/upload/resources/Ready-Reckoner_UDM.pdf', '_blank'); return false;">
                            <button type="submit" class="item-link">
                                <span class="item-number">2</span>
                                <span class="item-text">Ready Reckoner for User Depot Module (UDM)</span>
                                <i class="fas fa-arrow-right item-icon"></i>
                            </button>
                        </form>
                    </li>
                    <li>
                        <form method="get" class="item-form" onsubmit="window.open('https://www.ireps.gov.in/ireps/upload/resources/UDM_HMISIntegration.pdf', '_blank'); return false;">
                            <button type="submit" class="item-link">
                                <span class="item-number">3</span>
                                <span class="item-text">UDM-HMIS Integration Functionality</span>
                                <i class="fas fa-arrow-right item-icon"></i>
                            </button>
                        </form>
                    </li>
                    <li>
                        <form method="get" class="item-form" onsubmit="window.open('https://www.ireps.gov.in/ireps/upload/resources/User_Manual_for_new_Release_Order_System_Sleeper_Distribution_for_Engineering_Users.pdf', '_blank'); return false;">
                            <button type="submit" class="item-link">
                                <span class="item-number">4</span>
                                <span class="item-text">User Manual for new Release Order System <span class="badge-railway">Sleeper Distribution for Engineering Users</span></span>
                                <i class="fas fa-arrow-right item-icon"></i>
                            </button>
                        </form>
                    </li>
                    <li>
                        <form method="get" class="item-form" onsubmit="window.open('https://www.ireps.gov.in/ireps/upload/resources/UserManual_SupplementaryWarranty.pdf', '_blank'); return false;">
                            <button type="submit" class="item-link">
                                <span class="item-number">5</span>
                                <span class="item-text">User Manual for Supplementary Warranty</span>
                                <i class="fas fa-arrow-right item-icon"></i>
                            </button>
                        </form>
                    </li>
                    <li>
                        <form method="get" class="item-form" onsubmit="window.open('https://www.ireps.gov.in/ireps/upload/resources/UserManual_FieldLotModule_UDM.pdf', '_blank'); return false;">
                            <button type="submit" class="item-link">
                                <span class="item-number">6</span>
                                <span class="item-text">User Manual for Field Lot</span>
                                <i class="fas fa-arrow-right item-icon"></i>
                            </button>
                        </form>
                    </li>
                </ul>
            </div>

            <!-- E-Tender (Goods & Services) Section -->
            <div class="category-card">
                <div class="category-header">
                    <div class="category-icon">
                        <i class="fas fa-shopping-cart"></i>
                    </div>
                    <h2 class="category-title">E-Tender (Goods & Services)</h2>
                </div>
                <ul class="item-list">
                    <li>
                        <form method="get" class="item-form" onsubmit="window.open('https://www.ireps.gov.in/ireps/upload/resources/User_Manual_for_Vendors_(Goods&Services)_Version_1.0.pdf', '_blank'); return false;">
                            <button type="submit" class="item-link">
                                <span class="item-number">1</span>
                                <span class="item-text">User Manual for Vendors (Goods & Services) Version 1.0</span>
                                <i class="fas fa-arrow-right item-icon"></i>
                            </button>
                        </form>
                    </li>
                    <li>
                        <form method="get" class="item-form" onsubmit="window.open('https://www.ireps.gov.in/ireps/upload/resources/Compatibility_View_Settings.pdf', '_blank'); return false;">
                            <button type="submit" class="item-link">
                                <span class="item-number">2</span>
                                <span class="item-text">How to Turn Off Compatibility View Settings</span>
                                <i class="fas fa-arrow-right item-icon"></i>
                            </button>
                        </form>
                    </li>
                    <li>
                        <form method="get" class="item-form" onsubmit="window.open('https://www.ireps.gov.in/ireps/upload/resources/User_Manual_for_Vendors_on_Post_Contract_Activities_(Version-2.0).pdf', '_blank'); return false;">
                            <button type="submit" class="item-link">
                                <span class="item-number">3</span>
                                <span class="item-text">User Manual for Vendors on Post Contract Activities (Version-2.0)</span>
                                <i class="fas fa-arrow-right item-icon"></i>
                            </button>
                        </form>
                    </li>
                    <li>
                        <form method="get" class="item-form" onsubmit="window.open('https://www.ireps.gov.in/ireps/upload/resources/User_Manual_for_Vendors_%20for_Reverse_Auction_(Goods_&_Services_Module)_Version_2.pdf', '_blank'); return false;">
                            <button type="submit" class="item-link">
                                <span class="item-number">4</span>
                                <span class="item-text">User Manual for Vendors – Reverse Auction (Goods & Services Module) Version 2</span>
                                <i class="fas fa-arrow-right item-icon"></i>
                            </button>
                        </form>
                    </li>
                    <li>
                        <form method="get" class="item-form" onsubmit="window.open('https://www.ireps.gov.in/ireps/upload/resources/User_Manual_for_Supplementary_Bills_(Vendors)_Version_2.0.pdf', '_blank'); return false;">
                            <button type="submit" class="item-link">
                                <span class="item-number">5</span>
                                <span class="item-text">User Manual for On-Line Submission of Supplementary Bills by Vendors (Version-2.0)</span>
                                <i class="fas fa-arrow-right item-icon"></i>
                            </button>
                        </form>
                    </li>
                    <li>
                        <form method="get" class="item-form" onsubmit="window.open('https://www.ireps.gov.in/ireps/upload/resources/User_Manual_for_On-Line_Submission_of_Bills_having_Multiple_GST_Invoices.pdf', '_blank'); return false;">
                            <button type="submit" class="item-link">
                                <span class="item-number">6</span>
                                <span class="item-text">User Manual for On-Line Submission of Bills having Multiple GST Invoices</span>
                                <i class="fas fa-arrow-right item-icon"></i>
                            </button>
                        </form>
                    </li>
                    <li>
                        <form method="get" class="item-form" onsubmit="window.open('https://www.ireps.gov.in/ireps/upload/resources/User_Manual_for_Vendors_-_Third_Party_Inspection_System_Version_1.0.pdf', '_blank'); return false;">
                            <button type="submit" class="item-link">
                                <span class="item-number">7</span>
                                <span class="item-text">User Manual for Vendors – Third Party Inspection System Version 1.0</span>
                                <i class="fas fa-arrow-right item-icon"></i>
                            </button>
                        </form>
                    </li>
                    <li>
                        <form method="get" class="item-form" onsubmit="window.open('https://www.ireps.gov.in/ireps/upload/resources/VG_for_Vendors.mp4', '_blank'); return false;">
                            <button type="submit" class="item-link">
                                <span class="item-number">8</span>
                                <span class="item-text">Video Guide for Vendors – Third Party Inspection System Version 1.0</span>
                                <i class="fas fa-arrow-right item-icon"></i>
                            </button>
                        </form>
                    </li>
                </ul>
            </div>

            <!-- E-Tender (Works) Section -->
            <div class="category-card">
                <div class="category-header">
                    <div class="category-icon">
                        <i class="fas fa-hard-hat"></i>
                    </div>
                    <h2 class="category-title">E-Tender (Works)</h2>
                </div>
                <ul class="item-list">
                    <li>
                        <form method="get" class="item-form" onsubmit="window.open('https://www.ireps.gov.in/ireps/upload/resources/User_Manual_for_Contractors.pdf', '_blank'); return false;">
                            <button type="submit" class="item-link">
                                <span class="item-number">1</span>
                                <span class="item-text">User Manual for Contractors</span>
                                <i class="fas fa-arrow-right item-icon"></i>
                            </button>
                        </form>
                    </li>
                    <li>
                        <form method="get" class="item-form" onsubmit="window.open('https://www.ireps.gov.in/ireps/upload/resources/User_Manual_Railway_User_Version_1.0.pdf', '_blank'); return false;">
                            <button type="submit" class="item-link">
                                <span class="item-number">2</span>
                                <span class="item-text">User Manual for Standard Railway User (Version 1.0)</span>
                                <i class="fas fa-arrow-right item-icon"></i>
                            </button>
                        </form>
                    </li>
                    <li>
                        <form method="get" class="item-form" onsubmit="window.open('https://www.ireps.gov.in/ireps/upload/resources/User_Manual_for_Department_Admins_Version_1.0.pdf', '_blank'); return false;">
                            <button type="submit" class="item-link">
                                <span class="item-number">3</span>
                                <span class="item-text">User Manual for Department Admins (Version 1.0) <span class="badge-railway">for Railway Users</span></span>
                                <i class="fas fa-arrow-right item-icon"></i>
                            </button>
                        </form>
                    </li>
                    <li>
                        <form method="get" class="item-form" onsubmit="window.open('https://www.ireps.gov.in/ireps/upload/resources/CM_SOR_NS_Item_DIR.pdf', '_blank'); return false;">
                            <button type="submit" class="item-link">
                                <span class="item-number">4</span>
                                <span class="item-text">Creation & Management of SOR & NS Item Directories <span class="badge-railway">for Railway Users</span></span>
                                <i class="fas fa-arrow-right item-icon"></i>
                            </button>
                        </form>
                    </li>
                    <li>
                        <form method="get" class="item-form" onsubmit="window.open('https://www.ireps.gov.in/ireps/upload/resources/User_Manual_for_Contractors-For_Two_Stage_Reverse_Auction_(Works_Module)_Version_2.0.pdf', '_blank'); return false;">
                            <button type="submit" class="item-link">
                                <span class="item-number">5</span>
                                <span class="item-text">User Manual for Contractors – Two Stage Reverse Auction (Works Module) Version 2.0</span>
                                <i class="fas fa-arrow-right item-icon"></i>
                            </button>
                        </form>
                    </li>
                </ul>
            </div>

            <!-- E-Tender (Earning / Leasing) Section -->
            <div class="category-card">
                <div class="category-header">
                    <div class="category-icon">
                        <i class="fas fa-chart-line"></i>
                    </div>
                    <h2 class="category-title">E-Tender (Earning / Leasing)</h2>
                </div>
                <ul class="item-list">
                    <li>
                        <form method="get" class="item-form" onsubmit="window.open('https://www.ireps.gov.in/ireps/upload/resources/User_Manual_for_Contractors_(Earning-Leasing)_Version_1.0.pdf', '_blank'); return false;">
                            <button type="submit" class="item-link">
                                <span class="item-number">1</span>
                                <span class="item-text">User Manual for Contractors (Earning / Leasing) Version 1.0</span>
                                <i class="fas fa-arrow-right item-icon"></i>
                            </button>
                        </form>
                    </li>
                </ul>
            </div>

            <!-- E-Auction Leasing Section -->
            <div class="category-card">
                <div class="category-header">
                    <div class="category-icon">
                        <i class="fas fa-gavel"></i>
                    </div>
                    <h2 class="category-title">E-Auction Leasing</h2>
                </div>
                <ul class="item-list">
                    <li>
                        <form method="get" class="item-form" onsubmit="window.open('https://www.ireps.gov.in/ireps/upload/resources/User%20Manual%20for%20Contractors%20for%20E-Auction%20for%20Earning-Leasing%20Contracts%20Version%201.0.pdf', '_blank'); return false;">
                            <button type="submit" class="item-link">
                                <span class="item-number">1</span>
                                <span class="item-text">User Manual for Contractors for E-Auction Leasing Module Version 1.0</span>
                                <i class="fas fa-arrow-right item-icon"></i>
                            </button>
                        </form>
                    </li>
                    <li>
                        <form method="get" class="item-form" onsubmit="window.open('https://www.ireps.gov.in/ireps/upload/resources/Standard%20Conditions%20of%20Contract%20Version%202.0.pdf', '_blank'); return false;">
                            <button type="submit" class="item-link">
                                <span class="item-number">2</span>
                                <span class="item-text">Standard Conditions of Contract Version 2.0</span>
                                <i class="fas fa-arrow-right item-icon"></i>
                            </button>
                        </form>
                    </li>
                    <li>
                        <form method="get" class="item-form" onsubmit="window.open('https://www.ireps.gov.in/ireps/upload/resources/Pre-requisites%20for%20Contractors%20for%20E-Auction%20Leasing%20module.pdf', '_blank'); return false;">
                            <button type="submit" class="item-link">
                                <span class="item-number">3</span>
                                <span class="item-text">Pre-requisites for Contractors for E-Auction Leasing module Version 1.0</span>
                                <i class="fas fa-arrow-right item-icon"></i>
                            </button>
                        </form>
                    </li>
                    <li>
                        <form method="get" class="item-form" onsubmit="window.open('https://www.ireps.gov.in/ireps/upload/resources/Special%20Requirements%20for%20Bidders%20for%20Catering%20Lots%20Version%201.0.pdf', '_blank'); return false;">
                            <button type="submit" class="item-link">
                                <span class="item-number">4</span>
                                <span class="item-text">Special Requirements for Catering Lots Version 1.0</span>
                                <i class="fas fa-arrow-right item-icon"></i>
                            </button>
                        </form>
                    </li>
                    <li>
                        <form method="get" class="item-form" onsubmit="window.open('https://www.ireps.gov.in/ireps/upload/resources/User%20Guide%20for%20Virtual%20Account%20Mechanism%20Ver%201.0.pdf', '_blank'); return false;">
                            <button type="submit" class="item-link">
                                <span class="item-number">5</span>
                                <span class="item-text">User Guide for Payment of Earnest Money through Virtual Account Mechanism Version 1.0</span>
                                <i class="fas fa-arrow-right item-icon"></i>
                            </button>
                        </form>
                    </li>
                </ul>
            </div>

            <!-- E-Auction Section -->
            <div class="category-card">
                <div class="category-header">
                    <div class="category-icon">
                        <i class="fas fa-hammer"></i>
                    </div>
                    <h2 class="category-title">E-Auction</h2>
                </div>
                <ul class="item-list">
                    <li>
                        <form method="get" class="item-form" onsubmit="window.open('https://www.ireps.gov.in/ireps/upload/resources/Bidder_manual.pdf', '_blank'); return false;">
                            <button type="submit" class="item-link">
                                <span class="item-number">1</span>
                                <span class="item-text">Bidder User Manual</span>
                                <i class="fas fa-arrow-right item-icon"></i>
                            </button>
                        </form>
                    </li>
                    <li>
                        <form method="get" class="item-form" onsubmit="window.open('https://www.ireps.gov.in/ireps/upload/resources/SBICorporateGuide.pdf', '_blank'); return false;">
                            <button type="submit" class="item-link">
                                <span class="item-number">2</span>
                                <span class="item-text">Guide For SBI Corporate Account User</span>
                                <i class="fas fa-arrow-right item-icon"></i>
                            </button>
                        </form>
                    </li>
                    <li>
                        <form method="get" class="item-form" onsubmit="window.open('https://www.ireps.gov.in/ireps/upload/resources/E-auction_bsvinvoice.pdf', '_blank'); return false;">
                            <button type="submit" class="item-link">
                                <span class="item-number">3</span>
                                <span class="item-text">User Manual of Balance Sale Value & Invoice Generation</span>
                                <i class="fas fa-arrow-right item-icon"></i>
                            </button>
                        </form>
                    </li>
                    <li>
                        <form method="get" class="item-form" onsubmit="window.open('https://www.ireps.gov.in/ireps/upload/resources/BidderManual_LotPublishing.pdf', '_blank'); return false;">
                            <button type="submit" class="item-link">
                                <span class="item-number">4</span>
                                <span class="item-text">User Manual for Bidders on Lot Publishing Module</span>
                                <i class="fas fa-arrow-right item-icon"></i>
                            </button>
                        </form>
                    </li>
                </ul>
            </div>

            <!-- iMMS Section -->
            <div class="category-card">
                <div class="category-header">
                    <div class="category-icon">
                        <i class="fas fa-boxes"></i>
                    </div>
                    <h2 class="category-title">iMMS</h2>
                </div>
                <ul class="item-list">
                    <li>
                        <form method="get" class="item-form" onsubmit="window.open('https://www.ireps.gov.in/ireps/upload/resources/iMMS_HQ_Manual.pdf', '_blank'); return false;">
                            <button type="submit" class="item-link">
                                <span class="item-number">1</span>
                                <span class="item-text">User Manual for HQ users (HQ Module)</span>
                                <i class="fas fa-arrow-right item-icon"></i>
                            </button>
                        </form>
                    </li>
                    <li>
                        <form method="get" class="item-form" onsubmit="window.open('https://www.ireps.gov.in/ireps/upload/resources/iMMS_Depot_Manual.pdf', '_blank'); return false;">
                            <button type="submit" class="item-link">
                                <span class="item-number">2</span>
                                <span class="item-text">User Manual for Depot users (Depot Module)</span>
                                <i class="fas fa-arrow-right item-icon"></i>
                            </button>
                        </form>
                    </li>
                    <li>
                        <form method="get" class="item-form" onsubmit="window.open('https://www.ireps.gov.in/ireps/upload/resources/iMMS_LP_Manual.pdf', '_blank'); return false;">
                            <button type="submit" class="item-link">
                                <span class="item-number">3</span>
                                <span class="item-text">User Manual for Depot & Division users (LP Module)</span>
                                <i class="fas fa-arrow-right item-icon"></i>
                            </button>
                        </form>
                    </li>
                    <li>
                        <form method="get" class="item-form" onsubmit="window.open('https://www.ireps.gov.in/ireps/upload/resources/iMMS_SYSADM_User_Manual.pdf', '_blank'); return false;">
                            <button type="submit" class="item-link">
                                <span class="item-number">4</span>
                                <span class="item-text">User Manual for System Administrator</span>
                                <i class="fas fa-arrow-right item-icon"></i>
                            </button>
                        </form>
                    </li>
                    <li>
                        <form method="get" class="item-form" onsubmit="window.open('https://www.ireps.gov.in/ireps/upload/resources/Procedure%20For%20Installation%20of%20Java%20And%20PkiServer.pdf', '_blank'); return false;">
                            <button type="submit" class="item-link">
                                <span class="item-number">5</span>
                                <span class="item-text">Procedure for Installation of Java and PKI Server</span>
                                <i class="fas fa-arrow-right item-icon"></i>
                            </button>
                        </form>
                    </li>
                    <li>
                        <form method="get" class="item-form" onsubmit="window.open('https://www.ireps.gov.in/ireps/upload/resources/Procedure%20For%20Change%20Digital%20Certificate(DSC).pdf', '_blank'); return false;">
                            <button type="submit" class="item-link">
                                <span class="item-number">6</span>
                                <span class="item-text">Procedure for Change Digital Certificate (DSC)</span>
                                <i class="fas fa-arrow-right item-icon"></i>
                            </button>
                        </form>
                    </li>
                    <li>
                        <form method="get" class="item-form" onsubmit="window.open('https://www.ireps.gov.in/ireps/upload/resources/egate_entry.pdf', '_blank'); return false;">
                            <button type="submit" class="item-link">
                                <span class="item-number">7</span>
                                <span class="item-text">User Manual for Gate Entry System (Depot Module)</span>
                                <i class="fas fa-arrow-right item-icon"></i>
                            </button>
                        </form>
                    </li>
                    <li>
                        <form method="get" class="item-form" onsubmit="window.open('https://www.ireps.gov.in/ireps/upload/resources/Joint_Inspection_User_Manual_IMMS.pdf', '_blank'); return false;">
                            <button type="submit" class="item-link">
                                <span class="item-number">8</span>
                                <span class="item-text">User Manual for Joint Inspection</span>
                                <i class="fas fa-arrow-right item-icon"></i>
                            </button>
                        </form>
                    </li>
                    <li>
                        <form method="get" class="item-form" onsubmit="window.open('https://www.ireps.gov.in/ireps/upload/resources/user_mannual_hmis_to_imms.pdf', '_blank'); return false;">
                            <button type="submit" class="item-link">
                                <span class="item-number">9</span>
                                <span class="item-text">User Manual for Integration of iMMS and HMIS</span>
                                <i class="fas fa-arrow-right item-icon"></i>
                            </button>
                        </form>
                    </li>
                    <li>
                        <form method="get" class="item-form" onsubmit="window.open('https://www.ireps.gov.in/ireps/upload/resources/User_Manual_Consignee_Wise_AAC.pdf', '_blank'); return false;">
                            <button type="submit" class="item-link">
                                <span class="item-number">10</span>
                                <span class="item-text">User Manual – Consignee-wise AAC</span>
                                <i class="fas fa-arrow-right item-icon"></i>
                            </button>
                        </form>
                    </li>
                    <li>
                        <form method="get" class="item-form" onsubmit="window.open('https://www.ireps.gov.in/ireps/upload/resources/User_Manual_IMMS_Depot_Receipt.pdf', '_blank'); return false;">
                            <button type="submit" class="item-link">
                                <span class="item-number">11</span>
                                <span class="item-text">IMMS User Depot Receipt Manual</span>
                                <i class="fas fa-arrow-right item-icon"></i>
                            </button>
                        </form>
                    </li>
                </ul>
            </div>

            <!-- Inspection Section -->
            <div class="category-card">
                <div class="category-header">
                    <div class="category-icon">
                        <i class="fas fa-clipboard-check"></i>
                    </div>
                    <h2 class="category-title">Inspection</h2>
                </div>
                <ul class="item-list">
                    <li>
                        <form method="get" class="item-form" onsubmit="window.open('https://www.ireps.gov.in/ireps/upload/resources/Inspection%20Module%201.0.pdf', '_blank'); return false;">
                            <button type="submit" class="item-link">
                                <span class="item-number">1</span>
                                <span class="item-text">User Manual for Inspection Module version 1.0 <span class="badge-railway">for Railway Users</span></span>
                                <i class="fas fa-arrow-right item-icon"></i>
                            </button>
                        </form>
                    </li>
                </ul>
            </div>

            <!-- Vendor Approval (UVAM) Section -->
            <div class="category-card">
                <div class="category-header">
                    <div class="category-icon">
                        <i class="fas fa-user-check"></i>
                    </div>
                    <h2 class="category-title">Vendor Approval (UVAM)</h2>
                </div>
                <ul class="item-list">
                    <li>
                        <form method="get" class="item-form" onsubmit="window.open('https://www.ireps.gov.in/ireps/upload/resources/BoM_UVAM%20VD_06.06.2025.pdf', '_blank'); return false;">
                            <button type="submit" class="item-link">
                                <span class="item-number">1</span>
                                <span class="item-text">User Manual for Upload Bill of Materials in Vendor Directory <span class="badge-railway">for Railway Users</span></span>
                                <i class="fas fa-arrow-right item-icon"></i>
                            </button>
                        </form>
                    </li>
                </ul>
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
document.addEventListener("DOMContentLoaded", function() {
    const searchInput = document.getElementById("searchInput");
    const items = document.querySelectorAll(".item-link");
    const categories = document.querySelectorAll(".category-card");

    searchInput.addEventListener("input", function() {
        const query = this.value.toLowerCase().trim();

        categories.forEach(category => {
            let hasVisibleItem = false;
            const categoryItems = category.querySelectorAll(".item-link");

            categoryItems.forEach(item => {
                const text = item.querySelector(".item-text").textContent.toLowerCase();
                const listItem = item.closest("li");

                if (text.includes(query) || query === "") {
                    listItem.style.display = "";
                    hasVisibleItem = true;
                } else {
                    listItem.style.display = "none";
                }
            });

            category.style.display = hasVisibleItem || query === "" ? "" : "none";
        });
    });

    // Scroll animation
    const observerOptions = {
        threshold: 0.1,
        rootMargin: '0px 0px -50px 0px'
    };

    const observer = new IntersectionObserver((entries) => {
        entries.forEach(entry => {
            if (entry.isIntersecting) {
                entry.target.style.opacity = '1';
                entry.target.style.transform = 'translateY(0)';
            }
        });
    }, observerOptions);

    categories.forEach(card => {
        card.style.opacity = '0';
        card.style.transform = 'translateY(20px)';
        card.style.transition = 'opacity 0.6s ease, transform 0.6s ease';
        observer.observe(card);
    });
});
</script>
</body>
</html>