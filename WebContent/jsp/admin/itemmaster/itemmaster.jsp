<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en"> 
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Item Master - Government E-Procurement System</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/accessibility/accessibility.css">
<script src="${pageContext.request.contextPath}/assets/accessibility/accessibility.js" defer></script>	
 
<style>  

* { margin: 0; padding: 0; box-sizing: border-box; }
.body { font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; background: white; min-height: 100vh; display: flex; flex-direction: column; overflow-x: hidden; }
.ireps-header { display: flex; align-items: center; justify-content: space-between; background-color: #0b253f; padding: 40px 20px; color: white; }
.left-section { display: flex; align-items: center; gap: 15px; height: 50px; }
.center-section { text-align: center; flex: 1; transform: translateX(-70px); }
.main-title { font-size: 30px; font-weight: 500; }
.sub-title { color: #ffd700; font-size: 28px; font-weight: bold; }
.right-section { display: flex; flex-direction: column; align-items: flex-end; font-size: 16px; color: white; margin-right: 20px; gap: 8px; }
.right-section label { color: white; font-weight: 500; margin-right: 8px; }
.lang-container { display: flex; align-items: center; gap: 8px; }
.icon-row { display: flex; gap: 10px; position: relative; top: 40px; }
.home-icon, .logout-icon { font-size: 26px; color: white; background-color: #0000B; padding: 4px 10px; border-radius: 4px; display: inline-flex; align-items: center; justify-content: center; cursor: pointer; text-decoration: none; }
.main-container { flex: 1; max-width: 100%; margin: 0; padding: 0; overflow-y: auto; }
.search-card { margin: 20px auto; background: rgba(255, 255, 255, 0.98); backdrop-filter: blur(15px); border-radius: 20px; box-shadow: 0 20px 60px rgba(0, 0, 0, 0.1); overflow: visible; max-width: 1400px; width: 100%; display: flex; flex-direction: column; }
.search-header { background: white; color: #2c5aa0; text-align: center; position: relative; border-bottom: 3px solid #2c5aa0; }
.search-header h2 { font-size: 28px; position: relative; z-index: 1; letter-spacing: 0.5px; margin: 0; color: #2c5aa0; }
.status-bar { display: flex; justify-content: space-between; align-items: center; padding: 15px 30px; background: linear-gradient(90deg, #f0f7ff 0%, #ffffff 50%, #f0fff4 100%); border-bottom: 1px solid #d1e3f8; }
.status-left { display: flex; align-items: center; gap: 12px; font-weight: 700; color: #0b253f; font-size: 17px; letter-spacing: 0.8px; }
.status-left i { font-size: 22px; color: #2c5aa0; }
.status-right { font-weight: 600; color: #2d3436; font-size: 16px; letter-spacing: 0.5px; }
.status-published { color: #22c55e; font-weight: 700; text-transform: uppercase; letter-spacing: 0.8px; margin-left: 6px; font-size: 17px; }
.search-content { padding: 20px; }
.search-info { color: #1565c0; padding: 4px 0; margin-bottom: 8px; font-size: 14px; line-height: 1.5; }
.form-grid { display: grid; grid-template-columns: repeat(auto-fit, minmax(300px, 1fr)); gap: 16px; margin-bottom: 16px; }
.form-group { display: flex; flex-direction: column; }
.form-group label { font-weight: 600; color: #2d3436; margin-bottom: 6px; font-size: 14px; }
.form-select, .form-control { padding: 10px 14px; border: 2px solid #ddd; border-radius: 10px; font-size: 14px; font-weight: 500; transition: all 0.3s ease; background: white; color: #2d3436; min-height: 42px; }
.form-select { appearance: none; -webkit-appearance: none; -moz-appearance: none; background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='12' height='12' viewBox='0 0 12 12'%3E%3Cpath fill='%23333' d='M10.293 3.293L6 7.586 1.707 3.293A1 1 0 00.293 4.707l5 5a1 1 0 001.414 0l5-5a1 1 0 10-1.414-1.414z'/%3E%3C/svg%3E"); background-repeat: no-repeat; background-position: right 12px center; background-size: 12px; padding-right: 40px; cursor: pointer; }
.form-select:focus, .form-control:focus { outline: none; border-color: #74b9ff; box-shadow: 0 0 0 3px rgba(116, 185, 255, 0.1); }
.field-error { border-color: #e74c3c !important; box-shadow: 0 0 0 3px rgba(231, 76, 60, 0.15) !important; }
.field-error-msg { color: #e74c3c; font-size: 12px; margin-top: 4px; font-weight: 500; display: none; }
.advanced-filter-toggle { margin: 16px 0; }
.btn-advanced { background: none; color: #2196F3; font-weight: 500; padding: 6px 0; border: none; cursor: pointer; font-size: 14px; display: flex; align-items: center; gap: 8px; }
.btn-advanced:hover { color: #1976D2; }
.btn-advanced .arrow-icon::before { content: ""; border: solid #2196F3; border-width: 0 2px 2px 0; display: inline-block; padding: 3px; transform: rotate(45deg); transition: transform 0.3s ease; }
.btn-advanced.open .arrow-icon::before { transform: rotate(-135deg); }
.advanced-filters { margin-top: 12px; }
.action-buttons { display: flex; justify-content: center; gap: 16px; margin-top: 16px; }
.btn { padding: 12px 36px; border: none; border-radius: 50px; font-size: 16px; font-weight: 600; cursor: pointer; transition: all 0.3s ease; box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1); }
.btn-primary { background: linear-gradient(45deg, #74b9ff, #0984e3); color: white; }
.btn-primary:hover { transform: translateY(-2px); box-shadow: 0 8px 25px rgba(116, 185, 255, 0.3); }
.btn-secondary { background: transparent; color: #666; border: 2px solid #ddd; }
.btn-secondary:hover { background: #f5f5f5; transform: translateY(-2px); color: #333; }
.results-section { padding: 20px; background: white; max-width: 1400px; margin: 15px auto 30px auto; }
.results-header { background: linear-gradient(135deg, #2c5aa0 0%, #1a4480 50%, #0f3460 100%); color: white; padding: 12px 18px; border-radius: 12px; margin-bottom: 15px; box-shadow: 0 4px 15px rgba(44, 90, 160, 0.3); display: flex; justify-content: space-between; align-items: center; }
.results-header h3 { font-size: 22px; font-weight: 700; margin: 0; }
.results-header .total-count { font-size: 18px; font-weight: 600; }
.pagination-controls { display: flex; justify-content: space-between; align-items: center; margin-bottom: 15px; padding: 12px 16px; background: linear-gradient(135deg, #f8fbff 0%, #e8f2ff 100%); border-radius: 15px; border: 2px solid rgba(42, 82, 152, 0.1); box-shadow: 0 5px 15px rgba(42, 82, 152, 0.1); }
.results-info { display: flex; align-items: center; gap: 12px; }
.records-per-page { display: flex; align-items: center; gap: 8px; font-weight: 600; color: #1e3c72; }
.records-per-page select { padding: 7px 11px; border: 2px solid #2a5298; border-radius: 8px; background: white; color: #1e3c72; font-weight: 600; cursor: pointer; }
.pagination-nav { display: flex; align-items: center; gap: 10px; }
.page-info { font-weight: 600; color: #1e3c72; padding: 7px 13px; background: rgba(255, 255, 255, 0.7); border-radius: 15px; border: 2px solid rgba(42, 82, 152, 0.2); }
.pagination-btn { background: linear-gradient(135deg, #2a5298 0%, #1e3c72 100%); color: white; border: none; padding: 9px 14px; border-radius: 10px; cursor: pointer; font-weight: 600; transition: all 0.3s ease; display: flex; align-items: center; gap: 5px; box-shadow: 0 3px 10px rgba(42, 82, 152, 0.3); }
.pagination-btn:hover:not(:disabled) { transform: translateY(-2px); box-shadow: 0 5px 15px rgba(42, 82, 152, 0.4); }
.pagination-btn:disabled { background: #ccc; cursor: not-allowed; box-shadow: none; }
.table-responsive { border-radius: 12px; overflow: hidden; box-shadow: 0 8px 25px rgba(0, 0, 0, 0.1); margin-bottom: 30px; }
.modern-table { width: 100%; border-collapse: collapse; background: white; margin: 0; }
.modern-table thead { background: linear-gradient(135deg, #2c5aa0 0%, #1a4480 100%); }
.modern-table th { padding: 14px 10px; color: white; font-weight: 600; font-size: 14px; text-align: center; border: none; letter-spacing: 0.3px; }
.modern-table tbody tr { background: white; transition: all 0.3s ease; }
.modern-table tbody tr:hover { background: linear-gradient(45deg, #e3f2fd, #f0f8ff); }
.modern-table td { padding: 12px 10px; border-bottom: 1px solid #e9ecef; font-size: 13px; color: #2d3436; text-align: left; vertical-align: middle; }
.modern-table td:first-child { font-weight: 600; }

/* ===== VALIDATION ALERT ===== */
#validationAlert {
    display: none; position: fixed; top: 20px; left: 50%; transform: translateX(-50%);
    z-index: 9999; min-width: 340px; max-width: 500px;
    background: #fff3cd; border: 2px solid #e67e22; border-left: 6px solid #e67e22;
    border-radius: 10px; padding: 14px 20px; box-shadow: 0 8px 25px rgba(0,0,0,0.15);
    animation: slideDown 0.3s ease;
}
#validationAlert .alert-icon { color: #e67e22; font-size: 20px; margin-right: 10px; }
#validationAlert .alert-message { color: #7d4e00; font-weight: 600; font-size: 14px; }
#validationAlert .alert-close { float: right; cursor: pointer; color: #e67e22; font-size: 18px; font-weight: bold; line-height: 1; margin-left: 10px; }
@keyframes slideDown { from { top: -20px; opacity: 0; } to { top: 20px; opacity: 1; } }

/* -- All -- option styling */
option.opt-all { color: #1a4480; font-weight: 700; font-style: italic; }

.footer { background: #05173c !important; background-image: none !important; color: white; text-align: center; padding: 16px 10px; font-size: 15px; display: flex; justify-content: center; align-items: center; flex-wrap: wrap; gap: 12px; width: 100%; margin-top: auto; }
.footer img { height: 50px; width: auto; vertical-align: middle; object-fit: contain; }
.footer-text { margin-left: 10px; }

@media (max-width: 768px) {
    .ireps-header { flex-direction: column; gap: 15px; padding: 15px; }
    .center-section { transform: translateX(0); }
    .main-title { font-size: 24px; } .sub-title { font-size: 20px; }
    .form-grid { grid-template-columns: 1fr; }
    .modern-table th, .modern-table td { padding: 8px 6px; font-size: 12px; }
    .pagination-controls { flex-direction: column; gap: 12px; }
    .status-bar { flex-direction: column; gap: 10px; align-items: flex-start; }
    .footer { flex-direction: column; padding: 12px 10px; }
    .footer img { height: 40px; }
}
.sidebar { height: 100%; width: 0; position: fixed; z-index: 1000; top: 0; left: 0; background-color: #0b253f; overflow-x: hidden; transition: 0.4s; padding-top: 60px; }
.sidebar a { padding: 12px 20px; text-decoration: none; font-size: 18px; color: #fff; display: block; transition: 0.3s; }
.sidebar a:hover { background-color: #1e3a8a; }
.sidebar .closebtn { position: absolute; top: 15px; right: 20px; font-size: 28px; color: white; cursor: pointer; }
.menu-icon { font-size: 26px; cursor: pointer; margin-left: 15px; color: white; }
select { appearance: none; background-image: url("data:image/svg+xml;charset=US-ASCII,<svg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 4 5'><path fill='%23666' d='M2 0L0 2h4zm0 5L0 3h4z'/></svg>"); background-repeat: no-repeat; background-position: right 12px center; background-size: 12px; padding-right: 40px; }
</style>
</head>
<body>

<div id="validationAlert">
    <span class="alert-close" onclick="closeValidationAlert()">&times;</span>
    <span class="alert-icon"><i class="fa-solid fa-triangle-exclamation"></i></span>
    <span class="alert-message" id="validationAlertMsg">Please fill required fields.</span>
</div>

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
        <div class="lang-container"><label for="language">Select Your Language</label></div>
        <div class="bhashini-plugin-container"></div>
        <div class="icon-row">
            <a href="${pageContext.request.contextPath}/logon" class="home-icon"><i class="fa-solid fa-house"></i></a>
            <a href="${pageContext.request.contextPath}/logon" class="logout-icon"><i class="fa-solid fa-right-from-bracket"></i></a>
        </div>
    </div>
</header>

<div id="mySidebar" class="sidebar">
    <a href="javascript:void(0)" class="closebtn" onclick="closeSidebar()">&times;</a>
    <a href="javascript:void(0)" onclick="selectOption('hightender', this)">High Value Tenders</a>
    <a href="javascript:void(0)" onclick="selectOption('searchtender', this)">Search Tender</a>
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
</div>

<div class="main-container">
    <div class="search-card">
        <div class="search-header"><h2>Item Master</h2></div>
        <div class="status-bar">
            <div class="status-left"><i class="bi bi-train-front"></i> INDIAN RAILWAYS</div>
            <div class="status-right">Status : <span class="status-published">Published</span></div>
        </div>
        <div class="search-content">
            <div class="search-info">Search and view Item Master details by selecting Organization, Department, and other criteria</div>
            <form id="itemMasterForm" method="post" action="${pageContext.request.contextPath}/eps/itemmaster/manage.do">
                <div class="form-grid">

                    <!-- ===== APPROVING AGENCY ===== -->
                    <div class="form-group">
                        <label>Approving Agency <span style="color:red;">*</span></label>
                        <select class="form-select" name="approvingAgency" id="approvingAgency">
                            <option value="">-- Select --</option>
                            <option value="ALL" class="opt-all">-- All --</option>
                            <c:forEach var="agency" items="${approvingAgencies}">
                                <option value="${agency.agencyId}">${agency.agencyName}</option>
                            </c:forEach>
                        </select>
                        <span class="field-error-msg" id="agencyError">Please select an Approving Agency before searching.</span>
                    </div>

                    <!-- ===== DEPARTMENT ===== -->
                    <div class="form-group">
                        <label>Department</label>
                        <select class="form-select" name="department" id="department">
                            <option value="">-- Select --</option>
                            <option value="ALL" class="opt-all">-- All --</option>
                            <c:forEach var="dept" items="${departments}">
                                <option value="${dept.deptId}">${dept.deptName}</option>
                            </c:forEach>
                        </select>
                    </div>

                    <!-- ===== SUB-DIRECTORATE ===== -->
                    <div class="form-group">
                        <label>Sub-Directorate</label>
                        <select class="form-select" name="subDirectorate" id="subDirectorate">
                            <option value="">-- Select --</option>
                            <option value="ALL" class="opt-all">-- All --</option>
                        </select>
                        <span class="field-error-msg" id="subDirError">Please select a Department first before selecting Sub-Directorate.</span>
                    </div>

                </div>

                <div class="advanced-filter-toggle">
                    <button type="button" id="advancedToggle" class="btn-advanced">
                        <span class="filter-icon">
                            <svg width="14" height="14" viewBox="0 0 24 24" fill="#2196F3">
                                <path d="M4.25 5.61C6.27 8.2 10 13 10 13v6c0 .55.45 1 1 1h2c.55 0 1-.45 1-1v-6s3.72-4.8 5.74-7.39c.51-.66.04-1.61-.79-1.61H5.04c-.83 0-1.3.95-.79 1.61z"/>
                            </svg>
                        </span>
                        <span id="toggleText">Show Advanced Filters</span>
                        <span class="arrow-icon"></span>
                    </button>
                </div>

                <div class="advanced-filters" id="advancedFilters" style="display: none;">
                    <div class="form-grid">
                        <div class="form-group">
                            <label>Item / Sub-Item Description / ID / PL No</label>
                            <input type="text" class="form-control" name="itemDescription" id="itemDescription" placeholder="Enter item description or ID">
                        </div>
                        <div class="form-group">
                            <label>Specification</label>
                            <input type="text" class="form-control" name="specification" id="specification" placeholder="Enter specification">
                        </div>
                        <div class="form-group">
                            <label>Drawing</label>
                            <input type="text" class="form-control" name="drawing" id="drawing" placeholder="Enter drawing number">
                        </div>
                        <div class="form-group">
                            <label>STR</label>
                            <input type="text" class="form-control" name="str" id="str" placeholder="Enter STR">
                        </div>
                    </div>
                </div>

                <div class="action-buttons">
                    <button type="button" id="searchBtn" class="btn btn-primary">Search</button>
                    <button type="reset" id="resetBtn" class="btn btn-secondary">Reset</button>
                </div>
            </form>
        </div>
    </div>

    <div class="results-section" id="resultsDiv" style="display: none;">
        <div class="container-fluid" style="max-width: 1400px;">
            <div class="results-header">
                <h3>Search Results</h3>
                <span class="total-count">Total: 0</span>
            </div>
            <div class="pagination-controls" id="paginationControls" style="display: none;">
                <div class="results-info">
                    <div class="records-per-page">
                        <label for="recordsPerPage">Show:</label>
                        <select id="recordsPerPage">
                            <option value="2">2 per page</option>
                            <option value="5" selected>5 per page</option>
                            <option value="10">10 per page</option>
                            <option value="25">25 per page</option>
                            <option value="50">50 per page</option>
                        </select>
                    </div>
                </div>
                <div class="pagination-nav">
                    <div class="page-info" id="pageInfo">Page 1 of 1</div>
                    <button class="pagination-btn" id="prevPage" disabled><i class="bi bi-chevron-left"></i> Previous</button>
                    <button class="pagination-btn" id="nextPage" disabled>Next <i class="bi bi-chevron-right"></i></button>
                </div>
            </div>
            <div class="table-responsive" id="tableWrapper">
                <table id="itemTable" class="modern-table">
                    <thead>
                        <tr>
                            <th>S.No</th><th>Item ID</th><th>Zone Name</th><th>Department</th>
                            <th>Directorate</th><th>Description</th><th>Sub Item ID</th>
                            <th>Sub Item Desc</th><th>PL No</th><th>Drawing</th><th>Spec</th><th>STR</th>
                        </tr>
                    </thead>
                    <tbody id="itemTableBody"></tbody>
                </table>
            </div>
        </div>
    </div>
</div>

<footer class="footer">
    <img src="${pageContext.request.contextPath}/assets/images/stqc.png" alt="STQC">
    <img src="${pageContext.request.contextPath}/assets/images/cris.png" alt="CRIS">
    <div class="footer-text">Centre For Railway Information Systems, Designed, Developed and Hosted by CRIS &nbsp;<strong>Version 7.1.0</strong></div>
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
const ctx = '<%= request.getContextPath() %>';
let selected = '';
function selectOption(option, el) {
    selected = option;
    document.querySelectorAll('.sidebar a').forEach(link => link.classList.remove('active-option'));
    el.classList.add('active-option');
    window.location.href = ctx + '/jsp/admin/home/login.jsp?redirect=' + option;
}
function openSidebar() { document.getElementById('mySidebar').style.width = '250px'; }
function closeSidebar() { document.getElementById('mySidebar').style.width = '0'; }

function showValidationAlert(message) {
    document.getElementById('validationAlertMsg').innerText = message;
    document.getElementById('validationAlert').style.display = 'block';
    setTimeout(function() { closeValidationAlert(); }, 4000);
}
function closeValidationAlert() {
    document.getElementById('validationAlert').style.display = 'none';
}
function clearFieldErrors() {
    document.getElementById('approvingAgency').classList.remove('field-error');
    document.getElementById('subDirectorate').classList.remove('field-error');
    document.getElementById('agencyError').style.display = 'none';
    document.getElementById('subDirError').style.display = 'none';
}

/* Helper: convert "ALL" or empty to blank for backend (means fetch all) */
function toBackendVal(val) {
    return (val === 'ALL') ? '' : val;
}

function validateBeforeSearch() {
    clearFieldErrors();

    // Validation 1: Approving Agency mandatory — popup only when -- Select -- (empty value "")
    const agency = document.getElementById('approvingAgency').value;
    if (!agency || agency.trim() === '') {
        document.getElementById('approvingAgency').classList.add('field-error');
        document.getElementById('agencyError').style.display = 'block';
        showValidationAlert('Please select an Approving Agency before searching.');
        return false;
    }

    // Validation 2: Sub-Directorate needs Department selected first
    // "ALL" counts as a valid department selection, only empty "" is invalid
    const dept = document.getElementById('department').value;
    const subDir = document.getElementById('subDirectorate').value;
    if (subDir && subDir.trim() !== '' && (!dept || dept.trim() === '')) {
        document.getElementById('subDirectorate').classList.add('field-error');
        document.getElementById('subDirError').style.display = 'block';
        showValidationAlert('Please select a Department first before selecting Sub-Directorate.');
        return false;
    }

    // Validation 3: Advanced filter min 3 chars
    const description = document.getElementById('itemDescription').value.trim();
    const specification = document.getElementById('specification').value.trim();
    const drawing = document.getElementById('drawing').value.trim();
    const str = document.getElementById('str').value.trim();
    if (description.length > 0 && description.length < 3) {
        showValidationAlert('Item Description must be at least 3 characters long.');
        document.getElementById('itemDescription').classList.add('field-error');
        return false;
    }
    if (specification.length > 0 && specification.length < 3) {
        showValidationAlert('Specification must be at least 3 characters long.');
        document.getElementById('specification').classList.add('field-error');
        return false;
    }
    if (drawing.length > 0 && drawing.length < 3) {
        showValidationAlert('Drawing number must be at least 3 characters long.');
        document.getElementById('drawing').classList.add('field-error');
        return false;
    }
    if (str.length > 0 && str.length < 3) {
        showValidationAlert('STR must be at least 3 characters long.');
        document.getElementById('str').classList.add('field-error');
        return false;
    }
    return true;
}

const contextPath = "${pageContext.request.contextPath}";
let page = 1, size = 5, totalPages = 1;
let advancedFilters, advancedToggle, toggleText;

$(document).ready(function() {
    $("#paginationControls").hide();
    togglePagination();

    advancedToggle = document.getElementById('advancedToggle');
    advancedFilters = document.getElementById('advancedFilters');
    toggleText = document.getElementById('toggleText');

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

    // Clear errors when user changes Approving Agency
    $('#approvingAgency').on('change', function() {
        $(this).removeClass('field-error');
        $('#agencyError').hide();
        closeValidationAlert();
        // Reset department and sub-directorate when agency changes
        $('#department').val('');
        $('#subDirectorate').html(
            '<option value="">-- Select --</option>' +
            '<option value="ALL" class="opt-all">-- All --</option>'
        );
        page = 1;
    });

    // When department changes, reload sub-directorates
    $('#department').on('change', function() {
        closeValidationAlert();
        // Reset sub-directorate
        $('#subDirectorate').html(
            '<option value="">-- Select --</option>' +
            '<option value="ALL" class="opt-all">-- All --</option>'
        );
        page = 1;
        loadSubDirectorates();
    });

    // Sub-directorate change — warn immediately if dept not selected
    $('#subDirectorate').on('change', function() {
        $(this).removeClass('field-error');
        $('#subDirError').hide();
        closeValidationAlert();
        const dept = $('#department').val();
        const subDir = $(this).val();
        if (subDir && subDir.trim() !== '' && (!dept || dept.trim() === '')) {
            $(this).addClass('field-error');
            $('#subDirError').show();
            showValidationAlert('Please select a Department first before selecting Sub-Directorate.');
        }
    });

    $('#itemDescription, #specification, #drawing, #str').on('input', function() {
        $(this).removeClass('field-error');
        closeValidationAlert();
    });

    // Search button
    $("#searchBtn").click(function(e) {
        e.preventDefault();
        if (!validateBeforeSearch()) return;
        page = 1;
        loadItems();
    });

    // Reset button
    $("#resetBtn").click(function() {
        clearFieldErrors();
        closeValidationAlert();
        $("#itemMasterForm")[0].reset();
        // Restore all three dropdowns to Select + All
        $("#subDirectorate").html(
            '<option value="">-- Select --</option>' +
            '<option value="ALL" class="opt-all">-- All --</option>'
        );
        page = 1; size = 5;
        $("#recordsPerPage").val('5');
        $(".total-count").text("Total: 0");
        $("#pageInfo").text("Page 1 of 1");
        $("#resultsDiv").hide();
        $("#tableWrapper").hide();
        $("#paginationControls").hide();
        if (advancedFilters && advancedFilters.style.display === 'block') {
            advancedFilters.style.display = 'none';
            if (toggleText) toggleText.textContent = 'Show Advanced Filters';
            if (advancedToggle) advancedToggle.classList.remove('open');
        }
    });

    $("#recordsPerPage").change(function() { size = parseInt($(this).val()); page = 1; loadItems(); });
    $("#prevPage").click(function() { if (page > 1) { page--; loadItems(); } });
    $("#nextPage").click(function() { if (page < totalPages) { page++; loadItems(); } });

    // ===== loadSubDirectorates =====
    function loadSubDirectorates() {
        var orgZone = $('#approvingAgency').val();
        var rlyDept = $('#department').val();

        // If either is ALL or empty, don't load specific sub-directorates
        if (!orgZone || !rlyDept || rlyDept === 'ALL') return;

        $.ajax({
            url: contextPath + '/eps/itemmaster/getSubDirectorates',
            type: 'GET', dataType: 'json',
            data: {
                orgZone: toBackendVal(orgZone),
                rlyDept: toBackendVal(rlyDept)
            },
            success: function(data) {
                $('#subDirectorate').html(
                    '<option value="">-- Select --</option>' +
                    '<option value="ALL" class="opt-all">-- All --</option>'
                );
                if (Array.isArray(data) && data.length > 0) {
                    $.each(data, function(index, sub) {
                        $('#subDirectorate').append(
                            '<option value="' + sub.subId + '">' + sub.subName + '</option>'
                        );
                    });
                }
            },
            error: function(xhr, status, error) {
                console.error('Error loading sub-directorates:', status, error);
            }
        });
    }

    // ===== loadItems =====
    function loadItems() {
        const approvingAgency = $("#approvingAgency").val();
        const department = $("#department").val();
        const subDirectorate = $("#subDirectorate").val();
        const description = $("input[name='itemDescription']").val();
        const status = $("input[name='status']").val();

        if (page === 1) {
            $(".total-count").text("Total: 0");
            $("#pageInfo").text("Page 1 of 1");
        }

        $.ajax({
            url: contextPath + '/eps/itemmaster/items',
            type: "GET", dataType: "json",
            data: {
                // "ALL" → send empty string → backend fetches all
                orgZone: toBackendVal(approvingAgency),
                rlyDept: toBackendVal(department),
                subId:   toBackendVal(subDirectorate),
                description: description,
                status: status,
                page: page,
                size: size
            },
            success: function(response) {
                const data = response.data || [];
                const total = Number(response.total) || 0;
                renderTable(data);
                totalPages = Math.max(1, Math.ceil(total / size));
                $("#pageInfo").text("Page " + page + " of " + totalPages);
                $(".total-count").text("Total: " + total);
                if (total === 0) { $("#paginationControls").hide(); } else { $("#paginationControls").show(); }
                togglePagination();
                $("#resultsDiv").show();
                $("#tableWrapper").show();
            },
            error: function(xhr, status, err) {
                console.error("Error fetching items:", status, err);
                showValidationAlert("Error fetching items. Please try again.");
            }
        });
    }

    function renderTable(data) {
        let rows = "";
        if (!data || data.length === 0) {
            rows = "<tr><td colspan='12' class='text-center py-3'>No Records Found</td></tr>";
        } else {
            let sno = ((page - 1) * size) + 1;
            $.each(data, function(i, item) {
                const hasSubItems = item.subItems && item.subItems.length > 0;
                const subCount = hasSubItems ? item.subItems.length : 1;
                function val(v) { return (v == null || v === "") ? "-" : v; }
                if (hasSubItems) {
                    const first = item.subItems[0];
                    rows += "<tr style='border-top:3px solid #2c5aa0;'>" +
                        "<td rowspan='" + subCount + "' style='vertical-align:middle;text-align:center;font-weight:800;color:#1a4480;border-left:4px solid #2c5aa0;'>" + sno + "</td>" +
                        "<td rowspan='" + subCount + "' style='vertical-align:middle;font-weight:800;font-size:15px;color:#1a4480;border-right:3px solid #2c5aa0;'>" + val(item.itemId) + "</td>" +
                        "<td rowspan='" + subCount + "' style='vertical-align:middle;font-weight:600;'>" + val(item.orgZoneName) + "</td>" +
                        "<td rowspan='" + subCount + "' style='vertical-align:middle;font-weight:600;'>" + val(item.deptName) + "</td>" +
                        "<td rowspan='" + subCount + "' style='vertical-align:middle;font-weight:600;'>" + val(item.directorateName) + "</td>" +
                        "<td rowspan='" + subCount + "' style='vertical-align:middle;font-weight:600;border-right:3px solid #2c5aa0;'>" + val(item.itemDescription) + "</td>" +
                        "<td style='background:#e8f4fd;color:#1a4480;font-weight:700;'>" + val(first.subItemId) + "</td>" +
                        "<td style='background:#e8f4fd;'>" + val(first.subItemDesc) + "</td>" +
                        "<td style='background:#e8f4fd;'>" + val(first.plNumber) + "</td>" +
                        "<td style='background:#e8f4fd;'>" + val(first.drawing) + "</td>" +
                        "<td style='background:#e8f4fd;'>" + val(first.spec) + "</td>" +
                        "<td style='background:#e8f4fd;'>" + val(first.str) + "</td>" +
                        "</tr>";
                    for (let j = 1; j < item.subItems.length; j++) {
                        const sub = item.subItems[j];
                        rows += "<tr style='border-left:4px solid #2c5aa0;'>" +
                            "<td style='background:#e8f4fd;color:#1a4480;font-weight:700;'>" + val(sub.subItemId) + "</td>" +
                            "<td style='background:#e8f4fd;'>" + val(sub.subItemDesc) + "</td>" +
                            "<td style='background:#e8f4fd;'>" + val(sub.plNumber) + "</td>" +
                            "<td style='background:#e8f4fd;'>" + val(sub.drawing) + "</td>" +
                            "<td style='background:#e8f4fd;'>" + val(sub.spec) + "</td>" +
                            "<td style='background:#e8f4fd;'>" + val(sub.str) + "</td>" +
                            "</tr>";
                    }
                } else {
                    rows += "<tr style='border-top:3px solid #2c5aa0;border-left:4px solid #2c5aa0;'>" +
                        "<td style='text-align:center;font-weight:800;color:#1a4480;border-left:4px solid #2c5aa0;'>" + sno + "</td>" +
                        "<td style='font-weight:800;font-size:15px;color:#1a4480;border-right:3px solid #2c5aa0;'>" + val(item.itemId) + "</td>" +
                        "<td style='font-weight:600;'>" + val(item.orgZoneName) + "</td>" +
                        "<td style='font-weight:600;'>" + val(item.deptName) + "</td>" +
                        "<td style='font-weight:600;'>" + val(item.directorateName) + "</td>" +
                        "<td style='font-weight:600;border-right:3px solid #2c5aa0;'>" + val(item.itemDescription) + "</td>" +
                        "<td colspan='6' style='color:#aaa;font-style:italic;text-align:center;'>No Sub-Items</td>" +
                        "</tr>";
                }
                sno++;
            });
        }
        $("#itemTableBody").html(rows);
    }

    function togglePagination() {
        $("#prevPage").prop("disabled", page === 1);
        $("#nextPage").prop("disabled", page >= totalPages);
    }
});
</script>
<script src="https://translation-plugin.bhashini.co.in/v3/website_translation_utility.js" language-icon-color="#ffffff"></script>
<script src="${pageContext.request.contextPath}/assets/bhashini/bhashini-init.js"></script>
</body>
</html>
