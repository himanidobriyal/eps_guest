<%@ page contentType="text/html;charset=UTF-8" language="java" %>
	<!DOCTYPE html>
	<html lang="en">

	<head>
		<link href="https://cdn.jsdelivr.net/npm/opendyslexic@0.0.1/OpenDyslexic.css" rel="stylesheet">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/accessibility/accessibility.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

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
.content {
	display: flex;
	justify-content: center;
	align-items: flex-start;
	padding: 5px 20px 30px 20px;
	background:linear-gradient(135deg,#c7d2fe,#e0f2fe,#dbeafe);
	position: relative;
	overflow: hidden;
}

/* Animated background patterns */
.content::before {
	content: '';
	position: absolute;
	top: 0;
	left: -50%;
	width: 200%;
	height: 200%;
	background: 
		radial-gradient(circle at 20% 30%, rgba(30, 64, 175, 0.08) 0%, transparent 40%),
		radial-gradient(circle at 80% 70%, rgba(59, 130, 246, 0.08) 0%, transparent 40%),
		radial-gradient(circle at 50% 50%, rgba(96, 165, 250, 0.05) 0%, transparent 50%);
	animation: floatBackground 20s ease-in-out infinite;
	pointer-events: none;
}

@keyframes floatBackground {
	0%, 100% { transform: translate(0, 0) rotate(0deg); }
	33% { transform: translate(2%, -2%) rotate(2deg); }
	66% { transform: translate(-2%, 2%) rotate(-2deg); }
}

/* Decorative circles */
.content::after {
	content: '';
	position: absolute;
	width: 400px;
	height: 400px;
	border-radius: 50%;
	background: radial-gradient(circle, rgba(59, 130, 246, 0.1) 0%, transparent 70%);
	top: 40%;
	right: 5%;
	animation: pulse 8s ease-in-out infinite;
	pointer-events: none;
}

@keyframes pulse {
	0%, 100% { transform: scale(1); opacity: 0.5; }
	50% { transform: scale(1.1); opacity: 0.3; }
}

.card{
margin-top:15px;

background:rgba(255,255,255,0.25);
backdrop-filter:blur(12px);
-webkit-backdrop-filter:blur(12px);

border:1px solid rgba(255,255,255,0.3);
border-radius:18px;

padding:25px 30px;

width:100%;
max-width:1100px;

box-shadow:0 20px 45px rgba(0,0,0,0.15);

transition:all .3s ease;
}

.card:hover{
transform:translateY(-3px);
box-shadow:0 25px 55px rgba(0,0,0,0.25);
}

@keyframes slideUp {
	from {
		opacity: 0;
		transform: translateY(30px);
	}
	to {
		opacity: 1;
		transform: translateY(0);
	}
}

/* Gradient top border with shine effect */
.card::before {
	content: '';
	position: absolute;
	top: 0;
	left: 0;
	right: 0;
	height: 8px;
	background: linear-gradient(90deg, #1e40af 0%, #3b82f6 50%, #60a5fa 100%);
	border-radius: 20px 20px 0 0;
	overflow: hidden;
}

/* Shine animation on top border */
.card::before::after {
	content: '';
	position: absolute;
	top: 0;
	left: -100%;
	width: 100%;
	height: 100%;
	background: linear-gradient(90deg, transparent, rgba(255, 255, 255, 0.4), transparent);
	animation: shine 3s infinite;
}

@keyframes shine {
	0% { left: -100%; }
	50%, 100% { left: 100%; }
}

/* Bottom shadow decoration */
.card::after {
	content: '';
	position: absolute;
	bottom: -3px;
	left: 50%;
	transform: translateX(-50%);
	width: 70%;
	height: 3px;
	background: linear-gradient(90deg, transparent, rgba(30, 64, 175, 0.2), transparent);
	filter: blur(2px);
}

/* Welcome heading with enhanced styling */
.card h1{
font-size:28px;
font-weight:700;
color:#1e3a8a;
margin-bottom:8px;
background:none;
-webkit-text-fill-color:#1e3a8a;
}

@keyframes fadeInDown {
	from {
		opacity: 0;
		transform: translateY(-20px);
	}
	to {
		opacity: 1;
		transform: translateY(0);
	}
}

/* Decorative underline with animation */
.card h1::after {
	content: '';
	position: absolute;
	bottom: 0;
	left: 50%;
	transform: translateX(-50%);
	width: 0;
	height: 5px;
	background: linear-gradient(90deg, #1e40af, #3b82f6, #60a5fa);
	border-radius: 3px;
	animation: expandLine 1s ease-out 0.5s forwards;
}

@keyframes expandLine {
	to { width: 100px; }
}

.card p{
background:rgba(255,255,255,0.4);
border-radius:12px;
padding:10px 15px;

color:#1e293b;

backdrop-filter:blur(6px);

border:1px solid rgba(255,255,255,0.4);
}

@keyframes fadeIn {
	from { opacity: 0; }
	to { opacity: 1; }
}

/* Animated gradient border */
.card p::before {
	content: '';
	position: absolute;
	top: 0;
	left: 0;
	width: 5px;
	height: 100%;
	background: linear-gradient(180deg, #1e40af 0%, #3b82f6 50%, #60a5fa 100%);
	animation: borderGlow 3s ease-in-out infinite;
}

@keyframes borderGlow {
	0%, 100% { opacity: 1; }
	50% { opacity: 0.6; }
}

/* Remove arrow icon - not needed */
.card p::after {
	display: none;
}

/* Hover effects */
.card:hover {
	transform: translateY(-5px);
	box-shadow: 
		0 30px 80px rgba(30, 64, 175, 0.2),
		0 12px 32px rgba(0, 0, 0, 0.1);
}

.card:hover p {
	background: linear-gradient(135deg, #eff6ff 0%, #dbeafe 100%);
	border-color: rgba(59, 130, 246, 0.3);
}

/* Add icon to heading */
.card h1::before {
	content: '🏛️';
	display: block;
	font-size: 1.8rem;
	margin-bottom: 5px;
	animation: bounce 2s ease-in-out infinite;
}

@keyframes bounce {
	0%, 100% { transform: translateY(0); }
	50% { transform: translateY(-10px); }
}

/* Remove icon before text - keeping it simple */
.card p strong {
	font-weight: 600;
	color: #1e40af;
}

/* Responsive adjustments */
@media (max-width: 768px) {
	.content {
		padding: 20px 20px 30px 20px;
	}

	.content::after {
		width: 300px;
		height: 300px;
	}

	.card {
		padding: 8px 20px;
		max-width: 800px;
		border-radius: 16px;
	}

	.card h1 {
		font-size: 24px;
		margin-bottom: 1px;
		margin-top: 1px;
	}

	.card h1::before {
		font-size: 1.4rem;
		margin-bottom: 1px;
	}

	.card p {
		font-size: 15px;
		padding: 8px 15px;
	}
}

@media (max-width: 480px) {
	.content {
		padding: 30px 10px;
	}

	.content::after {
		width: 250px;
		height: 250px;
	}

	.card {
		padding: 40px 25px;
		border-radius: 14px;
	}

	.card::before {
		height: 6px;
	}

	.card h1 {
		font-size: 1.875rem;
		margin-bottom: 20px;
		letter-spacing: -0.5px;
	}

	.card h1::before {
		font-size: 2.625rem;
		margin-bottom: 10px;
	}

	.card h1::after {
		width: 80px;
		height: 4px;
	}

	.card p {
		font-size: 1rem;
		padding: 25px 20px;
	}
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

			.btn-primary {
				background: #059669;
				color: white;
				border-color: #059669;
			}

			.btn-primary:hover {
				background: #047857;
				border-color: #047857;
			}

			.btn-warning {
				background: #d97706;
				color: white;
				border-color: #d97706;
			}

			.btn-warning:hover {
				background: #b45309;
				border-color: #b45309;
			}

			.btn-secondary {
				background: #6b7280;
				color: white;
				border-color: #6b7280;
			}

			.btn-secondary:hover {
				background: #4b5563;
				border-color: #4b5563;
			}

			.btn-danger {
				background: #dc2626;
				color: white;
				border-color: #dc2626;
			}

			.btn-danger:hover {
				background: #b91c1c;
				border-color: #b91c1c;
			}

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
				.content {
					padding: 30px 15px;
				}

				.card {
					padding: 30px 25px;
					margin: 10px;
				}

				.button-group {
					grid-template-columns: 1fr;
					gap: 10px;
				}
			}

			@media (max-width: 480px) {
				.card {
					padding: 25px 20px;
					border-radius: 6px;
				}

				.phone-group span {
					padding: 10px 14px;
					min-width: 55px;
				}

				.phone-group input {
					padding: 10px 14px;
				}

				.btn {
					padding: 10px 16px;
					font-size: 13px;
				}

				.content {
					padding: 20px 10px;
				}
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

			#toast.show {
				visibility: visible;
				animation: fadein 0.5s, fadeout 0.5s 1.5s;
			}

			@keyframes fadein {
				from {
					bottom: 0;
					opacity: 0;
				}

				to {
					bottom: 30px;
					opacity: 1;
				}
			}

			@keyframes fadeout {
				from {
					bottom: 30px;
					opacity: 1;
				}

				to {
					bottom: 0;
					opacity: 0;
				}
			}

			.sidebar {
				display:none;
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
		/* Fix Bhashini floating language button visibility */
.bhashini-translation-trigger {
    color: #ffffff !important;          /* white text */
    background: #1e40af !important;     /* blue button */
    padding: 8px 12px !important;
    border-radius: 6px !important;
    font-size: 16px !important;
    font-weight: 600 !important;
    z-index: 999999 !important;
}

/* Optional: Add slight shadow */
.bhashini-translation-trigger {
    box-shadow: 0 3px 6px rgba(0,0,0,0.3) !important;
}

/* Ensure the button is clickable */
.bhashini-translation-trigger:hover {
    background: #3b82f6 !important;
    color: #fff !important;
}
.services-grid{
display:grid;
grid-template-columns:repeat(auto-fit,minmax(240px,1fr));
gap:24px;
margin-top:30px;
}
.service-box{

background:rgba(255,255,255,0.35);

backdrop-filter:blur(10px);
-webkit-backdrop-filter:blur(10px);

border:1px solid rgba(255,255,255,0.4);

padding:20px;

border-radius:16px;

display:flex;
align-items:center;
gap:14px;

font-size:15px;
font-weight:600;

cursor:pointer;

transition:all .25s ease;

box-shadow:0 8px 25px rgba(0,0,0,0.1);
}

.service-box:hover{

transform:translateY(-6px) scale(1.02);

box-shadow:0 20px 40px rgba(30,64,175,0.25);

border-color:#2563eb;

background:rgba(255,255,255,0.55);

}

.service-box i{

font-size:22px;

color:#2563eb;

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

		<div class="content">
		
		    <div style="max-width:1100px;width:100%;">
		
		        <div class="card" style="margin-bottom:40px;">
		            <h1>Welcome to IREPS Website</h1>
		            <p>Please choose a service below to continue.</p>
		        </div>
		
		        <div class="services-grid">
		
		            <div class="service-box" onclick="selectOption('hightender',this)">
		                <i class="fa-solid fa-chart-line"></i>
		                <span>High Value Tenders</span>
		            </div>
		
		            <div class="service-box" onclick="selectOption('searchtender',this)">
		                <i class="fa-solid fa-search"></i>
		                <span>Search Tender</span>
		            </div>
		
		            <div class="service-box" onclick="selectOption('itemmaster',this)">
		                <i class="fa-solid fa-box"></i>
		                <span>Item Master</span>
		            </div>
		
		            <div class="service-box" onclick="selectOption('projection',this)">
		                <i class="fa-solid fa-chart-bar"></i>
		                <span>Procurement Projection</span>
		            </div>
		
		            <div class="service-box" onclick="selectOption('viewireps',this)">
		                <i class="fa-solid fa-file-lines"></i>
		                <span>View IREPS Document</span>
		            </div>
		
		            <div class="service-box" onclick="selectOption('goods',this)">
		                <i class="fa-solid fa-cart-shopping"></i>
		                <span>Goods and Services</span>
		            </div>
		
		            <div class="service-box" onclick="selectOption('auction',this)">
		                <i class="fa-solid fa-gavel"></i>
		                <span>Auction Leasing</span>
		            </div>
		
		            <div class="service-box" onclick="selectOption('SPO',this)">
		                <i class="fa-solid fa-magnifying-glass"></i>
		                <span>Search Purchase Orders</span>
		            </div>
		
		            <div class="service-box" onclick="selectOption('Eauction',this)">
		                <i class="fa-solid fa-landmark"></i>
		                <span>E-Auction System</span>
		            </div>
		
		            <div class="service-box" onclick="selectOption('LearningCenter',this)">
		                <i class="fa-solid fa-graduation-cap"></i>
		                <span>Learning Center</span>
		            </div>
		
		            <div class="service-box" onclick="selectOption('BannedFirms',this)">
		                <i class="fa-solid fa-ban"></i>
		                <span>Banned Firms</span>
		            </div>
		
		            <div class="service-box" onclick="selectOption('Helpdesk',this)">
		                <i class="fa-solid fa-headset"></i>
		                <span>Helpdesk</span>
		            </div>
		
		            <div class="service-box" onclick="selectOption('Bidder',this)">
		                <i class="fa-solid fa-user-plus"></i>
		                <span>New Bidder (E-Auction Sale)</span>
		            </div>
		
		            <div class="service-box" onclick="selectOption('DepartmentCreation',this)">
		                <i class="fa-solid fa-building"></i>
		                <span>Department Creation</span>
		            </div>
		
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

		<script src="${pageContext.request.contextPath}/assets/accessibility/accessibility.js"></script>
		
<!-- ⭐ BHASHINI TRANSLATION PLUGIN SCRIPT -->
<script 
    src="https://translation-plugin.bhashini.co.in/v3/website_translation_utility.js"
    language-icon-color="#ffffff">
</script>
<script src="${pageContext.request.contextPath}/assets/bhashini/bhashini-init.js"></script>
	</body>

	</html>