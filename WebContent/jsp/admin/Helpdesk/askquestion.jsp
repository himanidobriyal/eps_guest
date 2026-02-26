<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/accessibility/accessibility.css">
<script src="${pageContext.request.contextPath}/assets/accessibility/accessibility.js" defer></script>
<title>IREPS Helpdesk</title>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

<style>

/* ===== REUSE SAME SEARCHTENDER STYLING ===== */

body {
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    background: white;
    margin:0;
}
* {

	margin: 0;
	padding: 0;
	box-sizing: border-box;
}
.main-title {
	font-size: 30px;
	font-weight: 500;
	}
.sub-title {
	color: #ffd700;
	font-size: 28px;
	align-items:center;
	font-weight: bold;
	
	}
	

/* HEADER */
.ireps-header {
    display:flex;
    align-items:center;
    justify-content:space-between;
    background-color:#0b253f;
    padding:40px 20px;
    color:white;
}

.center-section {
    text-align:center;
    flex:1;
}

.main-title {
    font-size:30px;
}

.sub-title {
    font-size:28px;
    font-weight:bold;
    color:#ffd700;
}

.icon-row a {
    color:white;
    font-size:22px;
    margin-left:15px;
}
.ireps-header {
    display: flex;
    align-items: center;
    justify-content: space-between;
    background-color: #0b253f;
    padding: 25px 30px;   /* balanced padding */
    position: relative;
}

.left-section {
    flex: 1;
}

.center-section {
    flex: 2;              /* more space for heading */
    text-align: center;
}

.right-section {
    flex: 1;
    text-align: right;
}

.ireps-logo {
    height: 60px;
    width: auto;
}

.main-title {
    font-size: 28px;
    color: white;
}

.sub-title {
    font-size: 26px;
    color: #ffd700;
    font-weight: bold;
}

/* CARD */
.main-container {
    padding:30px;
}

.search-card {
    background:white;
    border-radius:20px;
    box-shadow:0 20px 60px rgba(0,0,0,0.1);
    max-width:1400px;
    margin:0 auto;
    overflow:hidden;
}

.search-header {
    background:linear-gradient(135deg,#2c5aa0 0%,#1a4480 50%,#0f3460 100%);
    color:white;
    padding:20px;
    text-align:center;
}

.search-header h3 {
    margin:0;
    font-size:26px;
}

.search-content {
    padding:30px;
}
/* NORMAL PROFESSIONAL RADIO */
.criteria-option input[type="radio"] {
    width: 18px;
    height: 18px;
    accent-color: #2c5aa0;   /* Blue theme like IREPS */
    cursor: pointer;
}

/* Remove bulky background */
.criteria-option {
    background: transparent;
    border: none;
    padding: 4px 0;
    display: flex;
    align-items: center;
    gap: 8px;
    font-size: 14px;
}
/* FORM */
.form-grid {
    display:grid;
    grid-template-columns:repeat(auto-fit,minmax(300px,1fr));
    gap:20px;
    margin-bottom:20px;
}

.form-group {
    display:flex;
    flex-direction:column;
}

.form-group label {
    font-weight:600;
    margin-bottom:8px;
    font-size:14px;
}

.form-group input,
.form-group select,
textarea {
    padding:12px;
    border:2px solid #ddd;
    border-radius:10px;
    font-size:14px;
}

.form-group input:focus,
.form-group select:focus,
textarea:focus {
    border-color:#74b9ff;
    outline:none;
}

.required {
    color:red;
}

/* RADIO STYLE */
.criteria-options {
    display:flex;
    gap:20px;
    flex-wrap:wrap;
}

.criteria-option {
    display:flex;
    align-items:center;
    gap:8px;
    background:#f8f9fa;
    padding:7px 11px;
    border-radius:4px;
    border:1px solid #ddd;
}

/* TABLE */
.tender-table {
    width:100%;
    border-collapse:collapse;
    margin-top:10px;
}

.tender-table th {
    background:linear-gradient(135deg,#2c5aa0,#1a4480);
    color:white;
    padding:12px;
}

.tender-table td {
    padding:10px;
    border-bottom:1px solid #ddd;
}

/* BUTTONS */
.action-buttons {
    display:flex;
    justify-content:center;
    gap:20px;
    margin-top:30px;
}

.btn {
    padding:12px 35px;
    border:none;
    border-radius:50px;
    font-size:15px;
    cursor:pointer;
    font-weight:600;
}

.btn-primary {
    background:linear-gradient(45deg,#74b9ff,#0984e3);
    color:white;
}

.btn-secondary {
    background:white;
    border:1px solid #ccc;
}

/* FOOTER */
.footer {
    background-color: #0b253f;
    color:white;
    text-align:center;
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
.error-text {
    color: red;
    font-size: 12px;
    margin-top: 4px;
}

.input-error {
    border: 2px solid red !important;
}



.ireps-logo {
    height: 65px;      /* increase */
    width: auto;
    object-fit: contain;
}
.valid-text {
    color: green;
    font-size: 13px;
}

.invalid-text {
    color: red;
    font-size: 13px;
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
    margin-right: 15px;
}
.remove-btn {
    background: #ff4d4d;
    border: none;
    color: white;
    padding: 5px 10px;
    border-radius: 5px;
    cursor: pointer;
    font-weight: bold;
}

.remove-btn:hover {
    background: #cc0000;
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
    <h3>IREPS Query Module</h3>
</div>

<form  id="helpdeskForm" method="post" action="#" enctype="multipart/form-data">

<div class="search-content">

<!-- Account -->
<div class="form-group">
<label>Do you have user account on IREPS?</label>
<div class="criteria-options">
    <div class="criteria-option">
        <input type="radio" name="account" value="yes"> Yes
    </div>
    <div class="criteria-option">
        <input type="radio" name="account" value="no"> No
    </div>
</div>
</div>

<div class="form-grid">

<div class="form-group">
<label>Your E-Mail ID <span class="required">*</span></label>
<input type="email" name="email" placeholder="Enter your registered email ID">
</div>

<!-- 🔥 UPDATED MODULE DROPDOWN -->
<div class="form-group">
<label>Query Related to (Module)</label>
<select name="module">
    <option value="">Select</option>
    <option>User Depot Module</option>
    <option>Goods and Services Tender</option>
    <option>U-VAM</option>
    <option>Works Tender</option>
    <option>Inspection</option>
    <option>Earning / Leasing Tender</option>
    <option>E-Auction Leasing</option>
    <option>E-Auction (Sale)</option>
    <option>IMMS</option>
    <option>Mobile App</option>
</select>
</div>

<div class="form-group">
<label>Subject <span class="required">*</span></label>
<input type="text" name="subject" placeholder="Enter subject of your query">
</div>

<div class="form-group">
<label>Query Type <span class="required">*</span></label>
<div class="criteria-options">
    <div class="criteria-option">
        <input type="radio" name="type" value="immediate"> Immediate Help Required
    </div>
    <div class="criteria-option">
        <input type="radio" name="type" value="suggestion"> Suggestion for Improvement
    </div>
</div>
</div>

</div>

<!-- Query Description -->
<div class="form-group">
<label>Query Description <span class="required">*</span></label>
<textarea name="description" id="description"
          rows="5"
          placeholder="Please describe your issue clearly with complete details (Tender No, Module Name, Error Message etc.)  (Max 500 characters)"></textarea>
          <div id="descError" class="error-text"></div>
</div>

<!-- 🔥 IMPROVED DOCUMENT TABLE -->
<div class="form-group">
<label>Upload Supporting Documents (PDF Only)</label>

<table class="tender-table">
<thead>
<tr>
<th width="60%">Enter Document Description</th>
<th width="40%">Upload File (PDF)</th>
</tr>
</thead>
<tbody id="docTableBody">

<tr class="doc-row">
<td>
<input type="text"
       class="doc-desc"
       name="docDesc1"
       style="width:100%;"
       placeholder="Enter document description (3-50 characters)">
<div class="docError error-text"></div>
</td>
<td style="display:flex;gap:10px;align-items:center;">
<input type="file" name="file1" accept=".pdf">
<button type="button" class="remove-btn" >✖</button>
</td>
</tr>

</tbody>
</table>

<div style="margin-top:15px;display:flex;align-items:center;gap:15px;">
<button type="button" id="addDocBtn" class="btn btn-secondary">
+ Add More Document
</button>

<span id="docCounter" style="font-weight:600;color:#1a4480;">
1 / 5 Documents Added
</span>
</div>




</div>

<!-- 🔥 UPDATED CAPTCHA WITH RESET BUTTON -->
<div class="form-group">
<label>Verification Code <span class="required">*</span></label>

<div style="display:flex;align-items:center;gap:15px;flex-wrap:wrap;">

    <div style="
        padding:10px 25px;
        border:2px solid #ddd;
        background:#f8f9fa;
        font-weight:bold;
        letter-spacing:3px;
        font-size:18px;">
        <span id="captchaText"></span>
    </div>

    <button type="button"
            onclick="refreshCaptcha()"
            style="background:#2c5aa0;color:white;border:none;padding:8px 12px;border-radius:5px;cursor:pointer;">
        <i class="fa fa-refresh"></i>
    </button>

    <input type="text"
           id="captchaInput"
           placeholder="Enter Verification Code">

    <div id="captchaStatus"></div>

</div>
</div>
<div class="action-buttons">
<button type="submit" class="btn btn-primary">Submit</button>
<button type="reset" class="btn btn-secondary">Cancel</button>
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
	function openSidebar() { document.getElementById('mySidebar').style.width = '250px'; }



	function closeSidebar() { document.getElementById('mySidebar').style.width = '0'; }
</script>
<script>

let generatedCaptcha = "";

/* Generate Captcha */
function refreshCaptcha() {
    const chars = "ABCDEFGHJKLMNPQRSTUVWXYZabcdefghijkmnopqrstuvwxyz23456789";
    generatedCaptcha = "";

    for (let i = 0; i < 6; i++) {
        generatedCaptcha += chars.charAt(Math.floor(Math.random() * chars.length));
    }

    document.getElementById("captchaText").innerText = generatedCaptcha;

    document.getElementById("captchaInput").value = "";
    document.getElementById("captchaStatus").innerText = "";
}

/* DOM Ready */
document.addEventListener("DOMContentLoaded", function(){

    refreshCaptcha();

    const form = document.querySelector("form");
    const input = document.getElementById("captchaInput");
    const status = document.getElementById("captchaStatus");

    /* Auto captcha validation */
    input.addEventListener("input", function(){

        let userValue = input.value.trim();

        if(userValue.length === 0){
            status.innerText = "";
            status.style.color = "";
            return;
        }

        if(userValue.toLowerCase() === generatedCaptcha.toLowerCase()){
            status.innerText = "Valid Captcha ✓";
            status.style.color = "green";
        } else {
            status.innerText = "Invalid Captcha ✗";
            status.style.color = "red";
        }
    });

    /* Form validation */
    form.addEventListener("submit", function(e){

        let hasError = false;

        document.querySelectorAll(".error-text").forEach(el => el.innerText = "");
        document.querySelectorAll("input, textarea").forEach(el => el.classList.remove("input-error"));

        // Query description validation
        const desc = document.getElementById("description");
        let descValue = desc.value.trim();

        if(descValue.length < 3){
            document.getElementById("descError").innerText = "Minimum 3 characters required.";
            desc.classList.add("input-error");
            hasError = true;
        }
        else if(descValue.length > 500){
            document.getElementById("descError").innerText = "Maximum 500 characters allowed.";
            desc.classList.add("input-error");
            hasError = true;
        }

        // Document description validation
        const docFields = document.querySelectorAll(".doc-desc");

        docFields.forEach(function(field){

            let value = field.value.trim();
            let regex = /^[A-Za-z0-9\- ]+$/;
            let errorDiv = field.nextElementSibling;

            if(value === "") return;

            if(value.length < 3){
                errorDiv.innerText = "Minimum 3 characters required.";
                field.classList.add("input-error");
                hasError = true;
            }
            else if(value.length > 50){
                errorDiv.innerText = "Maximum 50 characters allowed.";
                field.classList.add("input-error");
                hasError = true;
            }
            else if(!regex.test(value)){
                errorDiv.innerText = "Only alphanumeric and hyphen allowed.";
                field.classList.add("input-error");
                hasError = true;
            }
        });

  /*       docFields.forEach(function(field){

            let value = field.value.trim();
            let regex = /^[A-Za-z0-9\- ]+$/;

            if(value === "") return;

            if(value.length < 3){
                field.classList.add("input-error");
                hasError = true;
            }
            else if(value.length > 50){
                field.classList.add("input-error");
                hasError = true;
            }
            else if(!regex.test(value)){
                field.classList.add("input-error");
                hasError = true;
            }
        });
         */
     
        // Captcha validation before submit
        if(input.value.trim().toLowerCase() !== generatedCaptcha.toLowerCase()){
            status.innerText = "Invalid Captcha ✗";
            status.style.color = "red";
            input.classList.add("input-error");
            hasError = true;
        }

        if(hasError){
            e.preventDefault();
        }

    });

 // ============================
 // Dynamic Document Handling
 // ============================

 let maxDocs = 5;
 let docCount = 1;

 const addBtn = document.getElementById("addDocBtn");
 const tableBody = document.getElementById("docTableBody");
 const counter = document.getElementById("docCounter");

 function updateCounter() {
     counter.innerText = docCount + " / 5 Documents Added";

     if (docCount >= maxDocs) {
         addBtn.disabled = true;
         addBtn.style.opacity = "0.6";
         addBtn.style.cursor = "not-allowed";
     } else {
         addBtn.disabled = false;
         addBtn.style.opacity = "1";
         addBtn.style.cursor = "pointer";
     }
 }

 addBtn.addEventListener("click", function () {

     if (docCount >= maxDocs) return;

     docCount++;

     const newRow = document.createElement("tr");
     newRow.classList.add("doc-row");

     newRow.innerHTML = `
         <td>
             <input type="text"
                    class="doc-desc"
                    name="docDesc${docCount}"
                    style="width:100%;"
                    placeholder="Enter document description (3-50 characters)">
             <div class="docError error-text"></div>
         </td>
         <td style="display:flex;gap:10px;align-items:center;">
             <input type="file" name="file${docCount}" accept=".pdf">
             <button type="button" class="remove-btn">✖</button>
         </td>
     `;

     tableBody.appendChild(newRow);
     updateCounter();
 });

 // Remove Document
 tableBody.addEventListener("click", function (e) {

     if (e.target.classList.contains("remove-btn")) {

         e.target.closest("tr").remove();
         docCount--;
         updateCounter();
     }

 });

 updateCounter();

});

</script>
</body>



</html>