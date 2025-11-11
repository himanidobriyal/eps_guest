<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Procurement Projections - IREPS</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
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

        /* MAIN CONTAINER */
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
            border-radius: 20px;
            box-shadow: 0 20px 60px rgba(0, 0, 0, 0.1);
            overflow: visible;
            max-width: 1400px;
            width: 100%;
            margin: 0 auto;
            display: flex;
            flex-direction: column;
        }

        /* TABS STYLING */
        .search-tabs {
            display: flex;
            background: #f8f9fa;
            border-bottom: 1px solid #e9ecef;
            overflow-x: auto;
            gap: 8px;
            padding: 12px;
            border-radius: 20px 20px 0 0;
        }

        .search-tab {
            padding: 10px 16px;
            background: #e9ecef;
            border: 2px solid #dee2e6;
            cursor: pointer;
            white-space: nowrap;
            font-weight: 600;
            font-size: 13px;
            transition: all 0.3s ease;
            border-radius: 10px;
            color: #495057;
            box-shadow: 0 3px 6px rgba(0, 0, 0, 0.15);
            text-transform: uppercase;
            letter-spacing: 0.3px;
            flex-shrink: 0;
            text-decoration: none;
        }

        .search-tab.active {
            background: linear-gradient(45deg, #2c5aa0, #1a4480);
            color: white;
            border: 2px solid #1a4480;
            box-shadow: 0 6px 12px rgba(44, 90, 160, 0.4);
            transform: translateY(-2px);
            font-weight: 700;
        }

        .search-tab:hover {
            background: #dee2e6;
            transform: translateY(-2px);
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.2);
            border: 2px solid #adb5bd;
        }

        .tab-content {
            display: none;
        }

        .tab-content.active {
            display: block;
        }

        .search-content {
            padding: 20px;
        }

        .search-info {
            color: #1565c0;
            padding: 4px 0;
            margin-bottom: 8px;
            font-size: 14px;
            line-height: 1.5;
        }

        /* FORM GRID */
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

        .form-group.full-width {
            grid-column: 1 / -1;
        }

        .form-label {
            font-weight: 600;
            color: #2d3436;
            margin-bottom: 6px;
            font-size: 14px;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        .required-asterisk {
            color: #e17055;
        }

        .form-select,
        .form-control {
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
        }

        .form-select {
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

        .form-select:focus,
        .form-control:focus {
            outline: none;
            border-color: #74b9ff;
            box-shadow: 0 0 0 3px rgba(116, 185, 255, 0.1);
        }

        .projection-group {
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .projection-group select {
            flex: 1;
        }

        .projection-group .years-label {
            font-size: 14px;
            font-weight: 500;
            color: #495057;
            white-space: nowrap;
        }

        /* ACTION BUTTONS */
        .action-buttons {
            display: flex;
            justify-content: center;
            gap: 16px;
            margin-top: 16px;
        }

        .btn {
            padding: 12px 36px;
            border: none;
            border-radius: 50px;
            font-size: 16px;
            font-weight: 600;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            cursor: pointer;
            transition: all 0.3s ease;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
        }

        .btn-primary {
            background: linear-gradient(45deg, #74b9ff, #0984e3);
            color: white;
        }

        .btn-primary:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 25px rgba(116, 185, 255, 0.3);
        }

        .btn-secondary {
            background: transparent;
            color: #666;
            border: 2px solid #ddd;
        }

        .btn-secondary:hover {
            background: #f5f5f5;
            transform: translateY(-2px);
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
            color: #333;
        }

        /* RESULTS SECTION */
        .results-section {
            padding: 20px;
            background: white;
            max-width: 1400px;
            margin: 15px auto 0 auto;
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

        .badge {
            background: #4299e1;
            color: white;
            padding: 5px 12px;
            border-radius: 20px;
            font-size: 14px;
            font-weight: 600;
        }

        /* TABLE STYLING */
        .table-responsive {
            border-radius: 12px;
            overflow: hidden;
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.1);
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
            text-align: center;
            vertical-align: middle;
        }

        .modern-table td:first-child {
            font-weight: 600;
        }

        /* DISCLAIMER */
        .disclaimer {
            margin: 15px 0;
            padding: 16px;
            font-size: 13px;
            line-height: 1.6;
            text-align: justify;
            background: linear-gradient(135deg, #fffbeb 0%, #fef3c7 100%);
            border-left: 4px solid #f6ad55;
            border-radius: 8px;
            color: #92400e;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
        }

        .no-data {
            padding: 60px 30px;
            background: linear-gradient(135deg, #f8fafc 0%, #edf2f7 100%);
            border: 1px solid #e2e8f0;
            border-radius: 12px;
            text-align: center;
            color: #718096;
            margin: 20px 0;
        }

        /* DOWNLOAD CARDS */
        .link-list {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(350px, 1fr));
            gap: 16px;
            padding: 24px;
            background: white;
        }

        .download-card {
            display: flex;
            align-items: center;
            gap: 12px;
            padding: 16px;
            background: linear-gradient(135deg, #f8f9fa 0%, #e3f2fd 100%);
            border: 2px solid #dee2e6;
            border-radius: 12px;
            text-decoration: none;
            color: #2d3436;
            transition: all 0.3s ease;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
        }

        .download-card:hover {
            transform: translateY(-2px);
            box-shadow: 0 6px 20px rgba(44, 90, 160, 0.2);
            border-color: #74b9ff;
        }

        .download-icon {
            font-size: 40px;
        }

        .download-content {
            flex: 1;
        }

        .download-title {
            font-size: 16px;
            font-weight: 600;
            color: #2c5aa0;
            margin-bottom: 4px;
        }

        .download-subtitle {
            font-size: 13px;
            color: #718096;
        }

        /* FOOTER */
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
	width: auto;
	vertical-align: middle;
	object-fit: contain;
}

.footer-text {
	margin-left: 10px;
}

        @media (max-width: 1024px) {
            .form-grid {
                grid-template-columns: repeat(2, 1fr);
            }
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
    <div class="search-card">
        <div class="search-tabs">
            <div class="search-tab active" data-tab="stock">Stock Items</div>
            <div class="search-tab" data-tab="track">Track Items</div>
            <div class="search-tab" data-tab="misc">Other Miscellaneous</div>
        </div>

        <div id="stock" class="tab-content active">
            <div class="search-content">
                <div class="search-info">
                    Enter procurement projection details to generate the report
                </div>

                <form action="${pageContext.request.contextPath}/eps/procurement/projection.do" method="post" id="stockForm">
                    <div class="form-grid">
                        <div class="form-group">
                            <label class="form-label">
                                Organization 
                                <span class="required-asterisk">*</span>
                            </label>
                            <select name="organization" class="form-select">
                                <option>Indian Railway</option>
                            </select>
                        </div>

                        <div class="form-group">
                            <label class="form-label">Zone</label>
                            <select id="zone" name="zone" class="form-select">
                                <option value="">--Select Zone--</option>
                                <c:forEach var="zoneObj" items="${zones}">
                                    <option value="${zoneObj.ouCode}"
                                        <c:if test="${zoneObj.ouCode == param.zone || zoneObj.ouCode == zone}">
                                            selected
                                        </c:if>>
                                        ${zoneObj.ouName}
                                    </option>
                                </c:forEach>
                            </select>
                        </div>

                        <div class="form-group">
                            <label class="form-label">PL Number Start with</label>
                            <input type="text" id="plNo" name="plNo" class="form-control" value="${not empty param.plNo ? param.plNo : plNo}" />
                        </div>

                        <div class="form-group">
                            <label class="form-label">Projection For</label>
                            <div class="projection-group">
                                <select name="projection" class="form-select">
                                    <option>1</option>
                                    <option>2</option>
                                    <option>3</option>
                                </select>
                                <span class="years-label">Years</span>
                            </div>
                        </div>

                        <div class="form-group full-width">
                            <label class="form-label">Description</label>
                            <input type="text" id="description" name="description" class="form-control" style="max-width: 400px;" value="${description}"/>
                        </div>
                    </div>

                    <div class="action-buttons">
                        <button type="submit" class="btn btn-primary">Submit</button>
                        <button type="button" class="btn btn-secondary" onclick="resetForm()">Close</button>
                    </div>
                </form>
            </div>
        </div>

        <div id="track" class="tab-content">
            <div class="link-list">
                <a href="files/Estimated.pdf" target="_blank" class="download-card" onclick="handleDownload(this)">
                    <div class="download-icon">📄</div>
                    <div class="download-content">
                        <div class="download-title">Estimated requirement for New Rails</div>
                        <div class="download-subtitle">PDF Document • Click to download</div>
                    </div>
                </a>
                
                <a href="files/Estimated_Requirement.pdf" target="_blank" class="download-card" onclick="handleDownload(this)">
                    <div class="download-icon">🚂</div>
                    <div class="download-content">
                        <div class="download-title">Estimated Requirement for Track Machines</div>
                        <div class="download-subtitle">PDF Document • Click to download</div>
                    </div>
                </a>
            </div>
        </div>

        <div id="misc" class="tab-content">
            <div class="link-list">
                <a href="files/NAIR.pdf" target="_blank" class="download-card">
                    <div class="download-icon">📋</div>
                    <div class="download-content">
                        <div class="download-title">NAIR</div>
                        <div class="download-subtitle">PDF Document • Click to download</div>
                    </div>
                </a>
                <a href="files/Bed.pdf" target="_blank" class="download-card">
                    <div class="download-icon">🛏️</div>
                    <div class="download-content">
                        <div class="download-title">Bed Rolls</div>
                        <div class="download-subtitle">PDF Document • Click to download</div>
                    </div>
                </a>
            </div>
        </div>
    </div>

    <c:if test="${not empty summary}">
        <div class="results-section">
            <div class="disclaimer">
                <strong>Disclaimer:</strong>
                Procurement Projection Report is the projected requirement of stock items required by 
                selected Railway Unit(s). Items required on regular basis by Railways are classified as 
                stock items. Actual procurement may vary and is dependent on many parameters including 
                production, technical innovation, repair and maintenance requirement.  
                <br/><br/>
                The report is system generated and may reflect data errors, if any. Ministry of Railways, 
                Railway Board, any of the Indian Railways or Railway Units under the administrative control 
                of Ministry of Railways shall not be responsible for any loss or damage to anybody using the information.
            </div>

            <div class="results-header">
                <h3>Search Results</h3>
                <span class="badge">${fn:length(summary)} Records Found</span>
            </div>

            <div class="table-responsive">
                <table class="modern-table">
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>PL Number</th>
                            <th>Item Description</th>
                            <th>Unit</th>
                            <th>Projected Procurement Quantity</th>
                            <th>Projected Procurement Value</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="row" items="${summary}" varStatus="loop">
                            <tr>
                                <td>${loop.index + 1}</td>
                                <td>${row.pl_no}</td>
                                <td>${row.sdes}</td>
                                <td>${row.nlu}</td>
                                <td>${row.tot_aac}</td>
                                <td>${row.aac_value}</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </c:if>

    <c:if test="${empty summary && not empty param.plNo && not empty param.zone && not empty param.description}">
        <div class="results-section">
            <div class="no-data">
                <h5>No Data Found</h5>
                <p>No data found for the given PL No, Zone, and Description.</p>
            </div>
        </div>
    </c:if>
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
// Tab switching
document.querySelectorAll(".search-tab").forEach(tab => {
    tab.addEventListener("click", () => {
        document.querySelectorAll(".search-tab").forEach(t => t.classList.remove("active"));
        document.querySelectorAll(".tab-content").forEach(c => c.classList.remove("active"));

        tab.classList.add("active");
        document.getElementById(tab.dataset.tab).classList.add("active");
    });
});

function handleDownload(element) {
    element.classList.add('downloading');
    setTimeout(() => {
        element.classList.remove('downloading');
    }, 2000);
}

function validateForm() {
    let plNo = document.getElementById("plNo").value.trim();
    let zone = document.getElementById("zone").value.trim();
    let description = document.getElementById("description").value.trim();

    if (plNo === "" || zone === "" || description === "") {
        alert("Please fill all required fields before submitting.");
        return false;
    }
    return true;
}

window.resetForm = function() {
    document.getElementById("stockForm").reset();
    
    const resultSection = document.querySelector(".results-section");
    if (resultSection) {
        resultSection.style.display = "none";
    }
}

// Language translation
const translations = {
    en: {
        selectLanguage: "Select Your Language",
        mainTitle: "Government eMarketplace",
        subTitle: "Indian Railways E-Procurement System",
        organization: "Organization",
        zone: "Zone",
        plNumber: "PL Number Start with",
        description: "Description",
        projectionFor: "Projection For",
        submit: "Submit",
        close: "Close",
        years: "Years"
    },
    hi: {
        selectLanguage: "अपनी भाषा चुनें",
        mainTitle: "सरकारी ई-मार्केटप्लेस",
        subTitle: "भारतीय रेलवे ई-प्रोक्योरमेंट सिस्टम",
        organization: "संगठन",
        zone: "क्षेत्र",
        plNumber: "पीएल नंबर से प्रारंभ",
        description: "विवरण",
        projectionFor: "प्रोजेक्शन के लिए",
        submit: "जमा करें",
        close: "बंद करें",
        years: "साल"
    }
};

function changeLanguage(lang) {
    const t = translations[lang];
    document.querySelector('label[for="language"]').textContent = t.selectLanguage;
    document.querySelector(".main-title").textContent = t.mainTitle;
    document.querySelector(".sub-title").textContent = t.subTitle;
    document.querySelector(".years-label").textContent = t.years;
    document.querySelector('button.btn-primary').textContent = t.submit;
    document.querySelector('button.btn-secondary').textContent = t.close;
}

document.getElementById("language").addEventListener("change", function() {
    changeLanguage(this.value);
});
</script>
</body>
</html>