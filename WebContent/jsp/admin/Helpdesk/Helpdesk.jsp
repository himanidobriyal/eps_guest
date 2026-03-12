<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>IREPS Helpdesk</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
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
					  position: absolute;
    left: 50%;
    transform: translateX(-50%);
    text-align: center;
				}
				.helpdesk-section {
    margin-top: 20px;
    padding: 20px;
    background: #fafcff;
    border-radius: 10px;
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

.content-wrapper {
    max-width: 1400px;
    margin: 20px auto;
    padding: 0 20px 40px 20px;
    min-height: 500px;
}

.section-card {
    background: rgba(255, 255, 255, 0.98);
    backdrop-filter: blur(15px);
    border-radius: 20px;
    box-shadow: 0 20px 60px rgba(0, 0, 0, 0.1);
    overflow: visible;
    margin-bottom: 25px;
}

.section-header {
    background: white;
    color: #2c5aa0;
    text-align: center;
    position: relative;
    border-bottom: 3px solid #2c5aa0;
    padding: 20px;
    border-radius: 20px 20px 0 0;
    font-size: 28px;
    font-weight: 500;
    letter-spacing: 0.5px;
    margin: 0;
}

.content {
    padding: 20px;
    color: #333;
}

.content ol li {
    margin-bottom: 12px;
    line-height: 1.6;
}

.highlight {
    color: #0d6efd;
    text-decoration: none;
    font-weight: 500;
}

.highlight:hover {
    text-decoration: underline;
}

.contact-info {
    margin-top: 15px;
    font-size: 0.95rem;
}

.contact-info p {
    margin-bottom: 8px;
}

.small-note {
    font-size: 0.9rem;
    color: #555;
}

.helpdesk-section {
    border-left: 4px solid #ffc107;
    padding-left: 15px;
    margin-bottom: 25px;
}

.helpdesk-section h6 {
    margin-bottom: 12px;
}

.helpdesk-section p {
    margin-bottom: 8px;
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
    
    .content-wrapper {
        padding: 0 15px 40px 15px;
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

.helpdesk-card {
    background: #ffffff;
    border-radius: 12px;
    padding: 20px;
    margin-bottom: 20px;
    transition: 0.3s ease;
    border-left: 4px solid #0056b3;
    box-shadow: 0 4px 12px rgba(0,0,0,0.08);
}

.helpdesk-card:hover {
    transform: translateY(-4px);
    box-shadow: 0 8px 20px rgba(0,0,0,0.12);
}
.section-title {
    font-size: 22px;
    font-weight: 600;
    color: #1a2b4c;
    margin-bottom: 15px;
}
.btn-primary-custom {
    background: linear-gradient(135deg, #004aad, #007bff);
    border: none;
    border-radius: 8px;
    padding: 8px 18px;
    color: white;
    font-weight: 500;
    transition: 0.3s;
}

.btn-primary-custom:hover {
    background: linear-gradient(135deg, #003080, #0056b3);
}
.phone-highlight {
    font-size: 18px;
    font-weight: 600;
    color: #0056b3;
}
/* ===== ACTION GRID ===== */
.action-grid {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
    gap: 20px;
    margin-top: 15px;
}

.action-card {
    display: flex;
    align-items: center;
    gap: 15px;
    padding: 18px;
    border-radius: 12px;
    text-decoration: none;
    background: linear-gradient(135deg, #f8f9fa, #eef3ff);
    border: 1px solid #dce3f5;
    transition: all 0.3s ease;
    color: #1a2b4c;
}

.action-card i {
    font-size: 28px;
    color: #0056b3;
}

.action-card h6 {
    margin: 0;
    font-weight: 600;
}

.action-card small {
    color: #666;
}

.action-card:hover {
    transform: translateY(-5px);
    box-shadow: 0 8px 25px rgba(0, 0, 0, 0.12);
    background: linear-gradient(135deg, #e6f0ff, #ffffff);
}

.phone-highlight {
    font-size: 18px;
    font-weight: 600;
    color: #0056b3;
}
.section-header {
    background: linear-gradient(135deg, #2c5aa0, #1a4480);
    color: white;
    text-align: center;
    padding: 18px;
    border-radius: 20px 20px 0 0;
    font-size: 22px;
    font-weight: 600;
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
    <div class="content-wrapper">
        <form method="get" action="#">

            <!-- Helpdesk Information -->
            <div class="section-card">
                <div class="section-header">
                    <i class="bi bi-question-circle"></i> Helpdesk
                </div>
                <div class="content">
                    <ol class="mb-0">
                        <li>
                            User Manuals are available for different modules of IREPS. These manuals can be accessed through
                            Learning Center links available on IREPS Home Page, Bidders' Home Page, and Railway Users' Home Page.
                            Some manuals require login. You are advised to go through these manuals before approaching Helpdesk.
                            <a href="${pageContext.request.contextPath}/eps/Helpdesk/learningcenter.do" class="highlight"> Click Here </a>
                            <!-- <a href="#" class="highlight">Click Here</a> to go to Learning Centre. -->
                        </li>
                        <li class="mt-2">
                            Please approach the tendering department for any Tender or Contract specific clarifications.
                            Helpdesk will assist only for system-specific issues like payments, bid submission, viewing of documents,
                            login issues, registration issues, etc.
                        </li>
                        <li class="mt-2">
                            You may click on any link on this page (shown in blue color) for assistance or information.
                        </li>
                    </ol>
                </div>
            </div>

            <!-- Helpdesk Options -->
            <div class="section-card">
                <div class="section-header">
                    <i class="bi bi-headset"></i> Helpdesk Options
                </div>
                <div class="content">

                    <!-- IREPS Helpdesk -->
                    <div class="helpdesk-section">
                        <h6><strong>IREPS Helpdesk</strong> <span class="text-muted">(for IREPS related queries)</span></h6>
                       <%--  <p><a href="${pageContext.request.contextPath}/eps/Helpdesk/askquestion.do"> Ask a Question</a> A Query ID will be generated for each query submitted.</p>
                        <p><a href="${pageContext.request.contextPath}/eps/Helpdesk/viewreply.do"> View Reply to Questison</a> Requires Query ID and Email ID.</p>
                        <p><a href="${pageContext.request.contextPath}/eps/Helpdesk/changeDSC.do"> Request for Change of Digital Signing Certificate</a> New DSC client name must match user account.</p>
 --%>
 
 <div class="action-grid">

    <a href="${pageContext.request.contextPath}/eps/Helpdesk/askquestion.do" class="action-card">
        <i class="bi bi-chat-dots"></i>
        <div>
            <h6>Ask a Question</h6>
            <small>A Query ID will be generated</small>
        </div>
    </a>

    <a href="${pageContext.request.contextPath}/eps/Helpdesk/viewreply.do" class="action-card">
        <i class="bi bi-reply"></i>
        <div>
            <h6>View Reply</h6>
            <small>Requires Query ID & Email</small>
        </div>
    </a>

    <a href="${pageContext.request.contextPath}/eps/Helpdesk/changeDSC.do" class="action-card">
        <i class="bi bi-shield-lock"></i>
        <div>
            <h6>Change Digital Signing Certificate</h6>
            <small>DSC name must match account</small>
        </div>
    </a>

</div>
                        <div class="contact-info">
                            <p><strong>Telephonic Assistance:</strong> <span class="phone-highlight">011-41385200</span> (10 lines)</p>
                            <p><strong>Timings:</strong> 08:00 AM - 07:00 PM</p>
                            <p class="small-note">(Not available on Sundays and Gazetted Holidays.)<a href="${pageContext.request.contextPath}/assets/pdf/List_of_Gazetted_Holidays.pdf"  target="_blank" class="highlight">Click Here</a> to view holidays.</p>
                        </div>
                    </div>

                    <!-- SBI Helpdesk -->
                    <div class="helpdesk-section">
                        <h6><strong>SBI Helpdesk</strong> <span class="text-muted">(for SBI payments related queries)</span></h6>
                        <p><strong>For SBI Netbanking:</strong></p>
                        <p class="ms-3 mb-0">
                            022-27566066, 022-27566067, 022-27560137, 022-27566501<br>
                            Email: <a href="mailto:inb.cinb@sbi.co.in" class="highlight">inb.cinb@sbi.co.in</a>
                        </p>

                        <p class="mt-3"><strong>For SBIePay:</strong></p>
                        <p class="ms-3 mb-0">
                            022-27523618 <span class="small-note">(Timings: 24x7x365)</span><br>
                            Email: <a href="mailto:sbiepay@sbi.co.in" class="highlight">sbiepay@sbi.co.in</a>
                        </p>
                    </div>

                </div>
            </div>

        </form>
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

</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script 
    src="https://translation-plugin.bhashini.co.in/v3/website_translation_utility.js"
    language-icon-color="#ffffff">
</script>
<script src="${pageContext.request.contextPath}/assets/bhashini/bhashini-init.js"></script>
</body>
</html>