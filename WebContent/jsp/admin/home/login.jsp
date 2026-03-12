<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
<link href="https://cdn.jsdelivr.net/npm/opendyslexic@0.0.1/OpenDyslexic.css" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/accessibility/accessibility.css">

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <meta charset="UTF-8">
    <title>IREPS Login</title>
<style>
    * {
        box-sizing: border-box;
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        margin: 0;
        padding: 0;
    }

    body {
        background: linear-gradient(135deg, #f8f9fa 0%, #e9ecef 100%);
        min-height: 100vh;
        display: flex;
        flex-direction: column;
        color: #2c3e50;
        transition: background 0.3s ease, color 0.3s ease;
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

.home-icon {
    font-size: 26px;
    color: white;
    padding: 0px 0px;
    border-radius: 4px;
    background-color: #0000B;
    display: inline-flex;
    align-items: center;
    justify-content: center;
    cursor: pointer;
      position: relative;   /* ✅ header expand nahi hoga */
    top: 40px;  
}

.home-icon:hover {
    background-color: #0056b3;
}

    .content {
        display: flex;
        justify-content: center;
        align-items: center;
        flex: 1;
        padding: 40px 20px;
        min-height: calc(100vh - 200px);
        transition: background 0.3s ease;
    }

    .card {
        background: white;
        width: 100%;
        max-width: 60%;
        border-radius: 8px;
        box-shadow: 0 4px 25px rgba(0, 0, 0, 0.08);
        padding: 40px;
        border: 1px solid #e5e7eb;
        position: relative;
        transition: background 0.3s ease, color 0.3s ease, border-color 0.3s ease;
    }

    .card::before {
        content: '';
        position: absolute;
        top: 0;
        left: 0;
        right: 0;
        height: 4px;
        background: linear-gradient(90deg, #1e40af, #3b82f6);
        border-radius: 8px 8px 0 0;
        transition: background 0.3s ease;
    }

    .card p {
        color: #dc2626;
        font-size: 14px;
        text-align: center;
        margin-bottom: 25px;
        line-height: 1.6;
        background: #fef2f2;
        padding: 15px;
        border-radius: 6px;
        border-left: 4px solid #dc2626;
        transition: background 0.3s ease, color 0.3s ease;
    }

    .card a {
        color: #1e40af;
        text-decoration: none;
        font-weight: 500;
        transition: color 0.2s ease;
    }

    .card a:hover {
        color: #3b82f6;
        text-decoration: underline;
    }

    .form-group {
        margin-bottom: 25px;
    }

    label {
        font-weight: 600;
        display: block;
        margin-bottom: 8px;
        color: #374151;
        font-size: 14px;
        transition: color 0.3s ease;
    }

    .phone-group {
        display: flex;
        border-radius: 6px;
        overflow: hidden;
        border: 1px solid #d1d5db;
        background: white;
        transition: all 0.2s ease;
    }

    .phone-group:focus-within {
        border-color: #1e40af;
        box-shadow: 0 0 0 3px rgba(30, 64, 175, 0.1);
    }

    .phone-group span {
        background: #f8fafc;
        color: #374151;
        padding: 12px 16px;
        font-weight: 600;
        display: flex;
        align-items: center;
        border-right: 1px solid #d1d5db;
        min-width: 65px;
        justify-content: center;
        transition: all 0.3s ease;
    }

    .phone-group input {
        flex: 1;
        padding: 12px 16px;
        border: none;
        background: white;
        font-size: 16px;
        outline: none;
        color: #374151;
        transition: all 0.3s ease;
    }

    .get-otp-btn {
        padding: 12px 20px;
        background: #1e40af;
        color: white;
        border: 1px solid #1e40af;
        border-radius: 4px;
        font-weight: 500;
        cursor: pointer;
        transition: all 0.2s ease;
        white-space: nowrap;
    }

    .get-otp-btn:hover:not(:disabled) {
        background: #1d4ed8;
        border-color: #1d4ed8;
    }

    .get-otp-btn:disabled {
        background: #9ca3af;
        border-color: #9ca3af;
        cursor: not-allowed;
    }

    .otp-input {
        padding: 8px 12px;
        border: 1px solid #d1d5db;
        border-radius: 4px;
        font-size: 16px;
        outline: none;
        transition: all 0.2s ease;
        background: white;
        color: #374151;
        width: 100px;
    }

    .otp-input:focus {
        border-color: #1e40af;
        box-shadow: 0 0 0 3px rgba(30, 64, 175, 0.1);
    }

    .otp-input:disabled {
        background: #f9fafb;
        color: #9ca3af;
    }

    .otp-message {
        color: green;
        font-weight: bold;
        font-size: 12px;
        white-space: nowrap;
    }

    .form-group input[type="text"] {
        width: 100%;
        padding: 12px 16px;
        border: 1px solid #d1d5db;
        border-radius: 6px;
        font-size: 16px;
        outline: none;
        transition: all 0.2s ease;
        background: white;
        color: #374151;
    }

    .form-group input[type="text"]:focus {
        border-color: #1e40af;
        box-shadow: 0 0 0 3px rgba(30, 64, 175, 0.1);
    }

    .button-group {
        display: grid;
        grid-template-columns: 1fr 1fr 1fr;
        gap: 12px;
        margin-top: 30px;
    }

    .btn {
        padding: 12px 20px;
        border-radius: 6px;
        cursor: pointer;
        font-size: 14px;
        font-weight: 500;
        transition: all 0.2s ease;
        border: 1px solid transparent;
        text-align: center;
    }

    .btn:hover {
        transform: translateY(-1px);
        box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
    }

    .btn-primary { background: #059669; color: white; border-color: #059669; }
    .btn-primary:hover { background: #047857; border-color: #047857; }

    .btn-warning { background: #d97706; color: white; border-color: #d97706; }
    .btn-warning:hover { background: #b45309; border-color: #b45309; }

    .btn-secondary { background: #6b7280; color: white; border-color: #6b7280; }
    .btn-secondary:hover { background: #4b5563; border-color: #4b5563; }

    .btn-danger { background: #dc2626; color: white; border-color: #dc2626; }
    .btn-danger:hover { background: #b91c1c; border-color: #b91c1c; }

    .security-note {
        background: #f0f9ff;
        border: 1px solid #c7d2fe;
        border-radius: 6px;
        padding: 15px;
        margin-top: 25px;
        text-align: center;
        color: #1e40af;
        font-size: 13px;
        font-weight: 500;
        transition: all 0.3s ease;
    }

    .error {
        color: #dc2626;
        font-size: 13px;
        display: none;
        margin-top: 8px;
        text-align: center;
        background: #fef2f2;
        padding: 8px 12px;
        border-radius: 4px;
        border: 1px solid #fecaca;
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
        .content { padding: 30px 15px; }
        .card { padding: 30px 25px; margin: 10px; }
        .button-group { grid-template-columns: 1fr; gap: 10px; }
    }

    @media (max-width: 480px) {
        .card { padding: 25px 20px; border-radius: 6px; }
        .phone-group span { padding: 10px 14px; min-width: 55px; }
        .phone-group input { padding: 10px 14px; }
        .btn { padding: 10px 16px; font-size: 13px; }
        .content { padding: 20px 10px; }
    }

    .sidebar a.active-option {
        background-color: #1e3a8a;
        font-weight: bold;
        color: #ffd700;
    }

    #toast {
        visibility: hidden;
        min-width: 250px;
        background-color: #2d2d2d;
        color: #fff;
        text-align: center;
        border-radius: 8px;
        padding: 16px;
        position: fixed;
        z-index: 1;
        left: 50%;
        bottom: 30px;
        transform: translateX(-50%);
        font-size: 16px;
        box-shadow: 0 0 10px #000000aa;
    }

    #toast.show { visibility: visible; animation: fadein 0.5s, fadeout 0.5s 1.5s; }
    @keyframes fadein { from { bottom: 0; opacity: 0; } to { bottom: 30px; opacity: 1; } }
    @keyframes fadeout { from { bottom: 30px; opacity: 1; } to { bottom: 0; opacity: 0; } }

    .sidebar {
        height: 100%; width: 0; position: fixed; z-index: 1000; top: 0; left: 0;
        background-color: #0b253f; overflow-x: hidden; transition: 0.4s; padding-top: 60px;
    }

    .sidebar a { padding: 12px 20px; text-decoration: none; font-size: 18px; color: #fff; display: block; transition: 0.3s; }
    .sidebar a:hover { background-color: #1e3a8a; }
    .sidebar .closebtn { position: absolute; top: 15px; right: 20px; font-size: 28px; color: white; cursor: pointer; }
    .menu-icon { font-size: 26px; cursor: pointer; margin-left: 15px; color: white; }

    select {
        appearance: none;
        background-image: url("data:image/svg+xml;charset=US-ASCII,<svg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 4 5'><path fill='%23666' d='M2 0L0 2h4zm0 5L0 3h4z'/></svg>");
        background-repeat: no-repeat;
        background-position: right 12px center;
        background-size: 12px;
        padding-right: 40px;
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
        			<!-- ⭐ REQUIRED for BHASHINI PLUGIN -->
    <div class="bhashini-plugin-container"></div>
        <a href="${pageContext.request.contextPath}/logon" class="home-icon">
    <i class="fa-solid fa-house"></i>
</a>

    </div>
</header>
<div class="content">
    <div class="card">
        <p>User outside India must install the IREPS mobile app (available on <a href="https://play.google.com/store/apps/details?id=in.gov.ireps">Android</a> and <a href="https://apps.apple.com/in/app/ireps-app/id1462024189">iOS</a>) to receive OTP.</p>

        <form id="loginForm" method="post">
            <input type="hidden" name="selectedOption" id="selectedOption" value="">

            <div class="form-group">
                <label>Mobile Number*:</label>
                <div class="phone-group">
				        <span>+91</span>
				        <input type="text" name="phone" id="phone" value="9876543210" readonly>
				    </div>
				</div>

           
<div class="form-group">
    <label>Complete Captcha and OTP to Proceed:</label>
    <div style="display: flex; align-items: center; gap: 10px; flex-wrap: nowrap;">
        <span id="captchaText" 
              style="font-weight:bold; font-size:18px; letter-spacing:2px; background:#f1f1f1; padding:8px 12px; border-radius:4px; border:1px solid #d1d5db; min-width:100px; text-align:center;">
              ABC123
        </span>
        
        <input type="text" id="captchaInput" value="ABC123" readonly 
               style="padding:8px 12px; border:1px solid #d1d5db; border-radius:4px; font-size:16px; outline:none; background:#e5e7eb; width:120px;">
        
        <button type="button" id="getOtpBtn" disabled title="OTP temporarily disabled for testing"  
                style="padding:8px 16px; background:#1e40af; color:white; border:1px solid #1e40af; border-radius:4px; cursor:pointer; font-weight:500; font-size:14px; white-space:nowrap;">
                Get OTP
        </button>
        
        <span style="color:#374151; font-size:14px; margin:0 5px;">OTP*:</span>
        <input type="text" name="otp" id="otp" placeholder="Enter OTP" required disabled 
               style="padding:8px 12px; border:1px solid #d1d5db; border-radius:4px; font-size:16px; outline:none; background:white; width:120px;">
        <span id="otpMessage" style="color:green; font-weight:bold; font-size:12px; display:none;"></span>
    </div>
    <div class="error" id="otpError" style="display:none;">Invalid OTP</div>
</div>

            <div class="button-group">
                <button type="button" class="btn btn-secondary" onclick="window.location.href='index.jsp'">Home</button>
                <button type="reset" class="btn btn-warning">Reset</button>
                <button id="proceedBtn" type="submit" class="btn btn-primary">Proceed</button>
            </div>
        </form>

        <div class="security-note">For security reasons we have captured your system IP.</div>
    </div>
</div>
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
<div id="toast">Login Successful!</div>
<footer class="footer">
			<img src="${pageContext.request.contextPath}/assets/images/stqc.png" alt="STQC">
			<img src="${pageContext.request.contextPath}/assets/images/cris.png" alt="CRS">

			<div class="footer-text">
				Centre For Railway Information Systems, Designed, Developed and Hosted by CRIS &nbsp;
				<strong>Version 7.1.0</strong>
			</div>
		</footer>
<script>

  const ctx = '<%= request.getContextPath() %>';
  let selected = '';
  let otpGenerated = false; // 🟢 New flag to track if user clicked "Get OTP"

  function selectOption(option, el) {
      selected = option;
      document.getElementById('selectedOption').value = option;
      document.querySelectorAll('.sidebar a').forEach(link => link.classList.remove('active-option'));
      el.classList.add('active-option');
  }

  function openSidebar() { document.getElementById('mySidebar').style.width = '250px'; }
  function closeSidebar() { document.getElementById('mySidebar').style.width = '0'; }

  document.getElementById("getOtpBtn").addEventListener("click", function () {
      otpGenerated = true; // ✅ mark OTP as generated
      document.getElementById("otp").disabled = false;
      const otpMsg = document.getElementById("otpMessage");
      otpMsg.innerText = "Your OTP is 123456";
      otpMsg.style.display = "block";
  });

  const form = document.getElementById('loginForm');
  /*form.addEventListener('submit', function (event) {
      event.preventDefault();

      // ✅ Check if "Get OTP" was clicked
      if (!otpGenerated) {
          alert("Please click on 'Get OTP' before proceeding.");
          return;
      }

      const otpVal = document.getElementById('otp').value.trim();
      if (otpVal === "") {
          alert("Please enter the OTP.");
          return;
      }

      if (otpVal !== "123456") {
          document.getElementById('otpError').style.display = "block";
          return;
      }

      document.getElementById('otpError').style.display = "none";
    */
    
    form.addEventListener('submit', function (event) {
        event.preventDefault();
    
      const params = new URLSearchParams(window.location.search);
      const redirect = params.get('redirect');
      let targetURL = '';

      switch (redirect) {
          case 'projection': targetURL = ctx + '/eps/procurement/projection.do'; break;
          case 'searchtender': targetURL = ctx + '/eps/searchtender/searchtender.do'; break;
          case 'itemmaster': targetURL = ctx + '/eps/itemmaster/manage.do'; break;
          case 'hightender': targetURL = ctx + '/eps/hightender/hello.do'; break;
          case 'viewireps': targetURL = ctx + '/eps/viewireps/view.do'; break;
          case 'goods': targetURL = ctx + '/eps/goods/manage.do'; break;
          case 'auction': targetURL = ctx + '/eps/auction/show.do'; break;
          case 'SPO': targetURL = ctx + '/eps/spo/manage.do'; break;
          case 'Eauction': targetURL = ctx + '/eps/Eauction/manage.do'; break;
          case 'LearningCenter': targetURL = ctx + '/eps/LearningCenter/learn.do'; break;
          case 'Helpdesk': targetURL = ctx + '/eps/Helpdesk/help.do'; break;
          case 'BannedFirms': targetURL = ctx + '/eps/BannedFirms/seen.do'; break;
          case 'Bidder' : targetURL = ctx + '/eps/Bidder/bid.do' ; break;
          case 'DepartmentCreation': targetURL = ctx + '/eps/departmentcreation/load.do'; break;
        	          
          default:
              alert('Invalid redirect option');
              return;
      }

      window.location.href = targetURL;
  });
</script>

<script src="${pageContext.request.contextPath}/assets/accessibility/accessibility.js" ></script>
		
<!-- ⭐ BHASHINI TRANSLATION PLUGIN SCRIPT -->
<script 
    src="https://translation-plugin.bhashini.co.in/v3/website_translation_utility.js"
    language-icon-color="#ffffff">
</script>
</body>
</html>
