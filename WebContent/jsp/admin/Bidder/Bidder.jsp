<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>IREPS - Digital Certificate Attachment</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">


 
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

.sidebar a .dev-note {
    display: block;
    font-size: 11px;
    color: red;
    margin-top: 2px;
}

.main-container {
    flex: 1;
    max-width: 100%;
    margin: 0;
    padding: 0;
    overflow-y: auto;
}

.content-card {
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

.content-header {
    background: white;
    color: #2c5aa0;
    text-align: center;
    position: relative;
    border-bottom: 3px solid #2c5aa0;
    padding: 20px;
}

.content-header h2 {
    font-size: 28px;
    position: relative;
    z-index: 1;
    letter-spacing: 0.5px;
    margin: 0;
    color: #2c5aa0;
}

.content-body {
    padding: 30px;
    background: #f8f9fc;
}

.note-card {
    background: white;
    border-left: 5px solid #0056b3;
    padding: 20px;
    margin-bottom: 20px;
    border-radius: 8px;
    box-shadow: 0 2px 8px rgba(0, 61, 130, 0.1);
    transition: transform 0.2s, box-shadow 0.2s;
}

.note-card:hover {
    transform: translateX(5px);
    box-shadow: 0 4px 12px rgba(0, 61, 130, 0.2);
}

.note-header {
    color: #003d82;
    font-weight: 700;
    font-size: 16px;
    margin-bottom: 12px;
    display: flex;
    align-items: center;
    gap: 10px;
}

.note-number {
    background: linear-gradient(135deg, #0056b3, #003d82);
    color: white;
    padding: 5px 12px;
    border-radius: 20px;
    font-size: 14px;
    font-weight: 600;
}

.note-content {
    color: #2c3e50;
    line-height: 1.8;
    font-size: 15px;
}

.highlight {
    background: linear-gradient(120deg, #fff3cd 0%, #ffeaa7 100%);
    padding: 2px 6px;
    border-radius: 4px;
    font-weight: 600;
    color: #856404;
}

.warning-card {
    background: linear-gradient(135deg, #fff5f5 0%, #ffe5e5 100%);
    border-left: 5px solid #dc3545;
    padding: 20px;
    margin: 25px 0;
    border-radius: 8px;
    box-shadow: 0 3px 10px rgba(220, 53, 69, 0.15);
}

.warning-card strong {
    color: #dc3545;
    font-size: 16px;
}

.signer-section {
    background: linear-gradient(135deg, #e3f2fd 0%, #bbdefb 100%);
    border: 2px solid #2196f3;
    padding: 25px;
    margin: 25px 0;
    border-radius: 12px;
    text-align: center;
    box-shadow: 0 4px 12px rgba(33, 150, 243, 0.2);
}

.signer-title {
    font-size: 18px;
    font-weight: 700;
    color: #1565c0;
    margin-bottom: 15px;
}

.download-link {
    display: inline-block;
    background: linear-gradient(135deg, #0056b3, #003d82);
    color: white;
    padding: 12px 30px;
    border-radius: 25px;
    text-decoration: none;
    font-weight: 600;
    margin: 15px 0;
    box-shadow: 0 4px 15px rgba(0, 61, 130, 0.3);
    transition: all 0.3s;
}

.download-link:hover {
    background: linear-gradient(135deg, #003d82, #002855);
    transform: translateY(-2px);
    box-shadow: 0 6px 20px rgba(0, 61, 130, 0.4);
}

.action-section {
    background: white;
    padding: 40px;
    margin: 30px 0;
    border-radius: 12px;
    text-align: center;
    border: 3px dashed #0056b3;
    box-shadow: 0 4px 15px rgba(0, 61, 130, 0.1);
}

.action-title {
    color: #003d82;
    font-size: 20px;
    font-weight: 700;
    margin-bottom: 25px;
}

.select-button {
    background: linear-gradient(135deg, #28a745, #20c997);
    color: white;
    border: none;
    padding: 15px 50px;
    font-size: 16px;
    font-weight: 600;
    border-radius: 30px;
    cursor: pointer;
    box-shadow: 0 5px 20px rgba(40, 167, 69, 0.3);
    transition: all 0.3s;
}

.select-button:hover {
    background: linear-gradient(135deg, #20c997, #17a2b8);
    transform: translateY(-3px);
    box-shadow: 0 8px 25px rgba(40, 167, 69, 0.4);
}

.link-text {
    color: #0056b3;
    text-decoration: underline;
    cursor: pointer;
    font-weight: 600;
}

.link-text:hover {
    color: #003d82;
}

.badge {
    display: inline-block;
    background: #dc3545;
    color: white;
    padding: 5px 15px;
    border-radius: 20px;
    font-size: 12px;
    font-weight: 700;
    margin-left: 10px;
    animation: pulse 2s infinite;
}

@keyframes pulse {
    0%, 100% {
        transform: scale(1);
    }
    50% {
        transform: scale(1.05);
    }
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

select {
    appearance: none;
    background-image: url("data:image/svg+xml;charset=US-ASCII,<svg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 4 5'><path fill='%23666' d='M2 0L0 2h4zm0 5L0 3h4z'/></svg>");
    background-repeat: no-repeat;
    background-position: right 12px center;
    background-size: 12px;
    padding-right: 40px;
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
        font-size: 20px;
    }

    .content-card {
        margin: 10px;
    }

    .footer {
        flex-direction: column;
        padding: 12px 10px;
    }

    .footer img {
        height: 40px;
    }
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
    <div class="content-card">
        <div class="content-header">
            <h2>Digital Certificate Attachment</h2>
        </div>

        <div class="content-body">
            <div class="note-card">
                <div class="note-header">
                    <span class="note-number">Note 1</span>
                    <span>Digital Signature Requirements</span>
                </div>
                <div class="note-content">
                    For participation in e-auctioning through <span class="highlight">www.ireps.gov.in</span>,
                    Bidders must get themselves registered with valid Class III digital
                    signature certificate. Before applying for Bidder Registration
                    through this link, they should ensure that they have gone through:
                    <strong>a) Learning Centre</strong>, <strong>b) FAQ</strong>, <strong>c)
                    System Settings Links</strong> provided in the home page. They may also
                    call Helpdesk for any guidance, details of which is available under
                    the link 'Helpdesk' in the home page.
                </div>
            </div>

            <div class="note-card">
                <div class="note-header">
                    <span class="note-number">Note 2</span>
                    <span>Certificate Specifications</span>
                </div>
                <div class="note-content">
                    Bidders need to have valid <span class="highlight">Class III
                    Digital Signature Certificate</span> issued by licensed CA with Firm's
                    Name along with valid and active GST Number.
                </div>
            </div>

            <div class="note-card">
                <div class="note-header">
                    <span class="note-number">Note 3</span>
                    <span>Address Consistency</span>
                </div>
                <div class="note-content">
                    Bidders are advised to get Digital
                    Signature certificates with same address as mentioned in the
                    records of Railways/approving/Registering Agencies and enter the
                    same in respective columns in the form below to avoid any
                    complication at later stage.
                </div>
            </div>

            <div class="note-card">
                <div class="note-header">
                    <span class="note-number">Note 4</span>
                    <span>Registration Process</span>
                </div>
                <div class="note-content">
                    Only online Registration are allowed. You have to produce <span
                    class="highlight">affidavit</span> in your selected depot for
                    approval of Registration of your firm by the depot User. Carefully
                    Select your Railway and its depot in Bidder Registration form,
                    later it will not be allowed to change & no other depot can
                    approved the Request. <br><br>
                    Here is the List of existing Depots/Division: 
                    <a href="#" class="link-text">Depot List</a>
                </div>
            </div>

            <div class="warning-card">
                <div class="note-header">
                    <span class="note-number">Note 5</span>
                    <span>⚠️ System Compatibility Warning</span>
                </div>
                <div class="note-content">
                    <strong>All Bidders are advised that they should update
                    their Windows 7 to latest versions of Windows, to avoid facing
                    issue in Lien Mark/Unmark, Payment etc. With windows 7, they may
                    also use Chrome Browser after download Ireps Signer.</strong>
                </div>
            </div>

            <div class="signer-section">
                <div class="signer-title">📥 IREPS Signer (Version 1.5)</div>
                <a href="#" class="download-link">Download the IREPS Signer Setup Utility</a>
                <span class="badge">NEW</span>
                <div style="margin-top: 15px; color: #1565c0; font-size: 14px;">
                    <span class="note-number">Note 6</span>
                    <a href="#" class="link-text">Click here for Step-by-Step Installation Instructions</a>
                </div>
            </div>

            <div class="note-card">
                <div class="note-header">
                    <span class="note-number">Note 7</span>
                    <span>Desktop Shortcut</span>
                </div>
                <div class="note-content">
                    Once installed, shortcut of the Signer will be placed on the Desktop.
                </div>
            </div>

            <div class="note-card">
                <div class="note-header">
                    <span class="note-number">Note 8</span>
                    <span>First Time Setup (Mandatory)</span>
                </div>
                <div class="note-content">
                    The user needs to run the Signer shortcut as <span
                    class="highlight">"Run as administrator"</span> for first time (mandatory).
                </div>
            </div>

            <div class="note-card">
                <div class="note-header">
                    <span class="note-number">Note 9</span>
                    <span>Login Instructions</span>
                </div>
                <div class="note-content">
                    <strong>Refresh (Ctrl+F5)</strong> and go to Login Page.
                </div>
            </div>

            <form method="get" action="${pageContext.request.contextPath}/eps/Bidder/bidderform.do">
                <div class="action-section">
                    <div class="action-title">Please Select the Digital Signature Certificate</div>
                    <button type="submit" class="select-button">
                        Click here To select your Digital Signature Certificate
                    </button>
                </div>
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

function openSidebar() { 
    document.getElementById('mySidebar').style.width = '250px'; 
}

function closeSidebar() { 
    document.getElementById('mySidebar').style.width = '0'; 
}
</script>
</body>
</html>