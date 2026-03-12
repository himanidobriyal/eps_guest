<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    /* ── Replace with DAO / service calls in production ── */
    String ctx = request.getContextPath();
    String loginBase = ctx + "/jsp/admin/home/login.jsp?redirect=";

    String[] newsHeadings = {
        "Pre-bid Meeting for Tender No: 12345678 on 25-April-2024",
        "Attention: Scheduled system downtime on 30-Apr-2024",
        "RDSO has issued Specification No. TI/SPC/OHE/AT/0100 (Amendment 1) on 21-Apr-2024"
    };
    String[] newsDates = { "24-Apr-2024", "23-Apr-2024", "21-Apr-2024" };
    String[] newsTypes = { "info", "warning", "info" };
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <!-- ══ Same dependencies as your existing login.jsp ══ -->
    <link href="https://cdn.jsdelivr.net/npm/opendyslexic@0.0.1/OpenDyslexic.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/accessibility/accessibility.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Source+Sans+3:wght@400;600;700&family=Source+Serif+4:wght@600;700&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>IREPS – Indian Railways E-Procurement System</title>

    <style>
    /* ══ RESET ══════════════════════════════════════════ */
    *, *::before, *::after { box-sizing: border-box; margin: 0; padding: 0; }

    :root {
        --navy:      #0b253f;
        --navy-mid:  #1d5a8a;
        --navy-hov:  #1e3a8a;
        --blue-lt:   #2e7aba;
        --accent:    #ffd700;
        --white:     #ffffff;
        --bg:        #f0f4f8;
        --border:    #d0dde8;
        --muted:     #5a7a9a;
        --danger:    #e05a2b;
    }

    body {
        font-family: 'Source Sans 3','Segoe UI',Tahoma,sans-serif;
        background: var(--bg);
        color: #1a2a3a;
        min-height: 100vh;
        display: flex;
        flex-direction: column;
        transition: background .3s, color .3s;
    }

    /* ══ HEADER ════════════════════════════════════════ */
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


    
   /*  .main-title { font-size: 17px; font-weight: 500; color: white; }
    .sub-title   { font-size: 15px; font-weight: 700; color: var(--accent); }
 */
    /* Search in header */
    .header-search {
        display: flex;
        align-items: center;
        flex-shrink: 0;
    }
    .header-search form { display: flex; }
    .header-search input {
        padding: 9px 14px;
        width: 260px;
        border-radius: 6px 0 0 6px;
        border: 1.5px solid rgba(255,255,255,.25);
        border-right: none;
        background: rgba(255,255,255,.1);
        color: white;
        font-size: 13.5px;
        font-family: inherit;
        outline: none;
        transition: border-color .2s, background .2s;
    }
    .header-search input::placeholder { color: rgba(255,255,255,.5); }
    .header-search input:focus { border-color: var(--accent); background: rgba(255,255,255,.15); }
    .header-search button {
        padding: 0 14px;
        background: var(--navy-mid);
        border: 1.5px solid rgba(255,255,255,.25); border-left: none;
        border-radius: 0 6px 6px 0;
        color: white; cursor: pointer; transition: background .2s;
    }
    .header-search button:hover { background: var(--blue-lt); }
    .header-search button .material-icons { font-size: 19px; vertical-align: middle; }

    .right-section {
        display: flex;
        align-items: center;
        gap: 10px;
        flex-shrink: 0;
    }
    .bhashini-plugin-container { display: flex; align-items: center; }

    .btn-login, .btn-register {
        padding: 8px 18px;
        border-radius: 6px;
        font-size: 13px; font-family: inherit; font-weight: 600;
        cursor: pointer; transition: all .2s;
        text-decoration: none; display: inline-block; white-space: nowrap;
    }
    .btn-login    { background: var(--white); color: var(--navy); border: none; }
    .btn-login:hover { background: #e8f0f8; }
    .btn-register { background: transparent; color: var(--white); border: 1.5px solid rgba(255,255,255,.4); }
    .btn-register:hover { background: rgba(255,255,255,.12); }

    /* Bhashini floating button override (same as login.jsp) */
    .bhashini-translation-trigger {
        color: #fff !important; background: #1e40af !important;
        padding: 8px 12px !important; border-radius: 6px !important;
        font-size: 16px !important; font-weight: 600 !important;
        z-index: 999999 !important;
        box-shadow: 0 3px 6px rgba(0,0,0,.3) !important;
    }
    .bhashini-translation-trigger:hover { background: #3b82f6 !important; }

    /* ══ HERO CAROUSEL ═════════════════════════════════ */
    .hero {
    grid-column: span 2;
margin: 0;
border-radius: 12px;
        /* margin: 22px 26px 0; */
        /* border-radius: 14px; overflow: hidden; */
        background: linear-gradient(135deg, var(--navy) 0%, var(--navy-mid) 55%, var(--blue-lt) 100%);
        min-height: 220px; position: relative;
        display: flex; align-items: center;
    }
    .hero-slide {
        display: none; width: 100%;
        padding: 44px 60px;
        justify-content: space-between; align-items: center;
        animation: hSlide .45s ease;
    }
    .hero-slide.active { display: flex; }
    @keyframes hSlide { from { opacity:0; transform:translateX(16px); } to { opacity:1; transform:none; } }

    .hero-text h1 {
         font-family: 'Source Serif 4', serif;
    font-size: 34px;
    font-weight: 700;
    color: white;
    line-height: 1.25;
    }
    .hero-text p { font-size: 14.5px; color: rgba(255,255,255,.78); margin-top: 9px; max-width: 350px; }
    .hero-cta {
        margin-top: 18px; display: inline-block;
        padding: 9px 22px; background: var(--accent); color: var(--navy);
        border-radius: 6px; font-weight: 700; font-size: 13.5px;
        text-decoration: none; transition: opacity .2s;
    }
    .hero-cta:hover { opacity: .88; }
    .hero-graphic { font-size: 88px; opacity: .85; flex-shrink: 0; }

    .hero-nav {
      position: absolute;
    top: 50%;
    transform: translateY(-50%);
    background: rgba(255,255,255,.25);
    border: none;
    border-radius: 50%;
    width: 40px;
    height: 40px;
    display: flex;
    align-items: center;
    justify-content: center;
    cursor: pointer;
    color: white;
         
    }
    .hero-nav:hover { background: rgba(255,255,255,.3); }
    .hero-nav.prev { left: 12px; }
    .hero-nav.next { right: 12px; }

    .hero-dots {
        position: absolute; bottom: 12px; left: 50%; transform: translateX(-50%);
        display: flex; gap: 8px;
    }
    .hero-dots span {
        width: 8px; height: 8px; border-radius: 50%;
        background: rgba(255,255,255,.4); cursor: pointer;
        transition: background .2s, transform .2s;
    }
    .hero-dots span.active { background: white; transform: scale(1.3); }

    /* ══ SERVICES GRID (sidebar links as cards) ════════ */
    .services-section {
        margin: 22px 26px 0;
    }
    .services-section h2 {
        font-size: 18px; font-weight: 700; color: #1a2a3a;
        margin-bottom: 12px;
        display: flex; align-items: center; gap: 8px;
    }
    .services-section h2::after {
        content: ''; flex: 1; height: 1px; background: var(--border);
    }
    .services-grid {
       display: grid;
    grid-template-columns: repeat(auto-fit, minmax(170px, 1fr));
    gap: 18px;
    margin-top: 16px;
       
}
    }
.svc-card {
    background: white;
    border: 1px solid var(--border);
    border-radius: 10px;
    padding: 20px 16px;
    text-align: center;
    text-decoration: none;
    color: #1a2a3a;
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    gap: 10px;
    min-height: 110px;
    transition: all .2s ease;
}
.svc-card .svc-icon {
    width: 52px;
    height: 52px;
    border-radius: 12px;
    background: #eef4fb;
    display: flex;
    align-items: center;
    justify-content: center;
}

.svc-card .svc-icon .material-icons {
    font-size: 28px;
    color: var(--navy-mid);
}

.svc-card .svc-label {
    font-size: 15px;
    font-weight: 600;
    line-height: 1.4;
}
    .svc-card:hover {
        box-shadow: 0 8px 24px rgba(26,74,114,.15);
        transform: translateY(-4px);
        border-color: var(--navy-mid);
        color: var(--navy-mid);
    }
  
    .svc-card:hover .svc-icon { background: #d8eaf8; }
    .svc-card .svc-icon .material-icons { font-size: 22px; color: var(--navy-mid); }
    .svc-card .svc-label {
        font-size: 11.5px; font-weight: 600; line-height: 1.35;
        color: inherit;
    }

    /* ══ MAIN CONTENT GRID ═════════════════════════════ */
    .main-grid {
        display: grid;
        grid-template-columns: 1fr 1fr 300px;
        gap: 18px;
        margin: 18px 26px;
        flex: 1;
    }

    /* ── Generic card ── */
    .card {
        background: white; border-radius: 10px;
        border: 1px solid var(--border); padding: 20px;
        transition: box-shadow .2s, transform .2s;
    }
    .card:hover { box-shadow: 0 6px 22px rgba(26,74,114,.12); transform: translateY(-2px); }

    /* ── Feature cards (Latest Tenders / Auctions) ── */
    .feature-card { display: flex; align-items: flex-start; gap: 14px; cursor: pointer; }
    .feature-icon {
        width: 48px; height: 48px; border-radius: 10px;
        background: #eef4fb; flex-shrink: 0;
        display: flex; align-items: center; justify-content: center;
    }
    .feature-icon .material-icons { color: var(--navy-mid); font-size: 24px; }
    .feature-card h3 { font-size: 15px; font-weight: 700; margin-bottom: 5px; }
    .feature-card p  { font-size: 12.5px; color: var(--muted); line-height: 1.5; }

    /* ── Quick Actions (right col, spans 2 rows) ── */
    .quick-actions-card { grid-row: span 2; }
    .quick-actions-card h3 { font-size: 16px; font-weight: 700; margin-bottom: 11px; }
    .qa-list { display: flex; flex-direction: column; gap: 7px; }
    .qa-item {
    display: flex;
    align-items: center;
    gap: 12px;
    padding: 12px 14px;
    border: 1px solid var(--border);
    border-radius: 8px;
    font-size: 14px;
    font-weight: 600;
    color: #1a2a3a;
    text-decoration: none;
    cursor: pointer;
    transition: all .2s ease;
    background: white;
        /* display: flex; align-items: center; gap: 10px;
        padding: 9px 13px; border: 1px solid var(--border); border-radius: 8px;
        font-size: 13px; font-weight: 600; color: #1a2a3a;
        text-decoration: none; cursor: pointer;
        transition: background .18s, border-color .18s, color .18s; */
    }
    .qa-item:hover { background: #eef4fb; border-color: var(--navy-mid); color: var(--navy-mid); }
    .qa-item .material-icons { font-size: 20px; color: var(--navy-mid); flex-shrink: 0; }

    /* ── News section ── */
    /* .news-section { grid-column: span 2; } */
 /*    .notifications-section {
    grid-column: span 2;
} */
.notifications-section .news-icon {
    background:#e8f3ff;
}
    .section-header { display: flex; justify-content: space-between; align-items: center; margin-bottom: 13px; }
    .section-header h2 { font-size: 16px; font-weight: 700; }
    .view-all { font-size: 12.5px; color: var(--navy-mid); text-decoration: none; font-weight: 600; }
    .view-all:hover { text-decoration: underline; }

    .news-list { display: flex; flex-direction: column; }
    .news-item {
        display: flex; align-items: flex-start; gap: 12px;
        padding: 13px 0; border-bottom: 1px solid var(--border);
    }
    .news-item:last-child { border-bottom: none; }
    .news-icon {
        width: 30px; height: 30px; border-radius: 6px;
        display: flex; align-items: center; justify-content: center;
        flex-shrink: 0; margin-top: 1px;
    }
    .news-icon.info { background: #eef4fb; }
    .news-icon.info .material-icons { color: var(--navy-mid); font-size: 16px; }
    .news-icon.warning { background: #fff3e0; }
    .news-icon.warning .material-icons { color: var(--danger); font-size: 16px; }
    .news-content h4 { font-size: 13px; font-weight: 600; line-height: 1.45; }
    .news-content .date { font-size: 11px; color: var(--navy-mid); margin-top: 3px; font-weight: 600; }


/* LOGIN BANNER */
.login-banner {
    background: #f4f7fb;
    border-bottom: 1px solid var(--border);
    padding: 12px 26px;
}
.updates-grid {
    grid-column: span 2;
    display: grid;
    grid-template-columns: 1fr 1fr;
    gap: 18px;
}
.login-banner-content {
    display: flex;
    justify-content: flex-end;
    align-items: center;
    gap: 12px;
}

.login-text {
    font-size: 15px;
    font-weight: 700;
    color: #1a2a3a;
}

.login-banner-btn {
    padding: 9px 22px;
    background: var(--navy);
    color: white;
    border-radius: 5px;
    text-decoration: none;
    font-size: 14px;
    font-weight: 700;
}

.register-banner-btn {
    padding: 9px 22px;
    border: 1px solid var(--navy);
    color: var(--navy);
    border-radius: 5px;
    text-decoration: none;
    font-size: 14px;
    font-weight: 700;
}
.login-banner-btn:hover {
    background:#163a5c;
}

.register-banner-btn:hover {
    background:#163a5c;
    color:white;
}
    /* ══ TOAST (same as login.jsp) ════════════════════ */
    #toast {
        visibility: hidden; min-width: 250px;
        background: #2d2d2d; color: #fff;
        text-align: center; border-radius: 8px; padding: 16px;
        position: fixed; z-index: 9999; left: 50%; bottom: 30px;
        transform: translateX(-50%); font-size: 16px;
        box-shadow: 0 0 10px #000000aa;
    }
    #toast.show { visibility: visible; animation: fadein .5s, fadeout .5s 1.5s; }
    @keyframes fadein  { from { bottom:0; opacity:0; } to { bottom:30px; opacity:1; } }
    @keyframes fadeout { from { bottom:30px; opacity:1; } to { bottom:0; opacity:0; } }

    /* ══ FOOTER ════════════════════════════════════════ */
    .footer {
        background: #05173c;
        color: white;
        text-align: center;
        padding: 16px 20px;
        font-size: 14px;
        display: flex; justify-content: center; align-items: center;
        flex-wrap: wrap; gap: 12px;
        width: 100%; margin-top: auto;
    }
    .footer img { height: 48px; width: auto; object-fit: contain; vertical-align: middle; }
    .footer-text { color: rgba(255,255,255,.8); }
    .footer-text strong { color: white; }

    /* ══ RESPONSIVE ════════════════════════════════════ */
    @media (max-width: 1100px) {
        .services-grid { grid-template-columns: repeat(4, 1fr); }
    }
    @media (max-width: 860px) {
        .main-grid { grid-template-columns: 1fr 1fr; }
        .quick-actions-card { grid-row: span 1;
    align-self: start;
} grid-row: auto; }
        .news-section { grid-column: span 1; }
        .services-grid {
    grid-template-columns: repeat(5, 1fr);
    gap: 18px;
}
        .header-search input { width: 180px; }
    }
    @media (max-width: 600px) {
        .ireps-header { height: auto; padding: 12px 14px; flex-wrap: wrap; gap: 10px; }
        .center-section { order: -1; width: 100%; }
        .header-search { display: none; }
        .main-title { font-size: 14px; }
        .sub-title { font-size: 13px; }
        .hero { margin: 12px 12px 0; }
        .hero-slide { padding: 30px 22px; }
        .hero-text h1 { font-size: 22px; }
        .hero-graphic { display: none; }
        .services-section, .main-grid { margin: 12px; }
        .services-grid { grid-template-columns: repeat(2, 1fr); }
        .main-grid { grid-template-columns: 1fr; }
        .quick-actions-card, .news-section { grid-column: span 1; }
    }
    
    /* SERVICE CLUSTERS */

.services-cluster {
    display: flex;
    flex-wrap: wrap;
    gap: 24px;
    margin-top: 16px;
}

/* .service-group {
    flex: 1;
    min-width: 260px;
    background: white;
    border: 1px solid var(--border);
    border-radius: 10px;
    padding: 18px;
} */
.service-group {
    flex: 1;
    min-width: 320px;
    background: linear-gradient(135deg, var(--navy), var(--navy-mid));
    border-radius: 10px;
    padding: 20px;
    color: white;
}

.service-group h3 {
    font-size: 16px;
    margin-bottom: 12px;
    font-weight: 700;
    color: white;
}

.service-buttons {
 display: grid;
    grid-template-columns: repeat(2, 1fr);
    gap: 14px;
    /* display: flex;
    flex-wrap: wrap;
    gap: 14px; */
}

/* .service-btn {
    display: flex;
    align-items: center;
    gap: 8px;
    padding: 10px 14px;
    border: 1px solid var(--border);
    border-radius: 6px;
    background: white;
    font-size: 14px;
    font-weight: 600;
    text-decoration: none;
    color: #1a2a3a;
    transition: all .2s;
} */
.service-btn {
    display: flex;
    align-items: center;
    gap: 10px;
    padding: 14px 16px;
    border: 1px solid var(--border);
    border-radius: 8px;
    background: white;
    font-size: 15px;
    font-weight: 600;
    text-decoration: none;
    color: var(--navy);
    transition: all .2s ease;
}

/* .service-btn:hover {
    background: #eef4fb;
    border-color: var(--navy-mid);
} */
.service-btn:hover {
    background: #f1f6fb;
    transform: translateY(-2px);
}
.service-group h3::after {
    content: '';
    display: block;
    width: 62px;
    height: 3px;
    background: var(--accent);
    margin-top: 6px;
}

.service-btn .material-icons {
    font-size: 22px;
    color: var(--navy-mid);
}
    </style>
</head>
<body>

<!-- ══════════════════════════════════════════════════
     HEADER  (mirrors your login.jsp header structure)
══════════════════════════════════════════════════ -->
<header class="ireps-header">

    <div class="left-section">
        <a href="<%= ctx %>/jsp/admin/home/login.jsp">
            <img src="${pageContext.request.contextPath}/assets/images/logo.png"
                 alt="IREPS Logo"
                 onerror="this.style.display='none'">
        </a>
    </div>

    <div class="center-section">
        <div class="main-title">Government eMarketplace</div>
        <div class="sub-title">Indian Railways E-Procurement System</div>
    </div>

    <!-- Search bar → searchtender -->
   <%--  <div class="header-search">
        <form action="<%= ctx %>/jsp/admin/home/login.jsp" method="get">
            <input type="hidden" name="redirect" value="searchtender">
            <input type="text" name="q" placeholder="Search tenders, auctions or vendors…">
            <button type="submit"><span class="material-icons">search</span></button>
        </form>
    </div> --%>

    <div class="right-section">
        <!-- Bhashini plugin slot (same as login.jsp) -->
        <div class="bhashini-plugin-container"></div>

        <!-- Login / Register -->
       <%--  <a class="btn-login"    href="<%= ctx %>/jsp/admin/home/login.jsp">Login</a>
        <a class="btn-register" href="<%= loginBase %>Bidder">Register</a> --%>
    </div>
</header>

<div class="login-banner">
    <div class="login-banner-content">
        <span class="login-text">New User?</span>

        <a class="login-banner-btn"
           href="<%= ctx %>/jsp/admin/home/login.jsp">
           Login
        </a>

        <a class="register-banner-btn"
           href="<%= loginBase %>Bidder">
           Register Now
        </a>
    </div>
</div>
<!-- ══════════════════════════════════════════════════
     HERO CAROUSEL
══════════════════════════════════════════════════ -->



<!-- ══════════════════════════════════════════════════
     SERVICES GRID
     All 14 sidebar links from login.jsp shown as cards
══════════════════════════════════════════════════ -->
<section class="services-section">

<h2>Services</h2>

<div class="services-cluster">

    <!-- TENDERS -->
    <div class="service-group">
        <h3>Tenders</h3>
        <div class="service-buttons">

            <a href="<%= loginBase %>searchtender" class="service-btn">
                <span class="material-icons">search</span>
                Search Tender
            </a>

            <a href="<%= loginBase %>hightender" class="service-btn">
                <span class="material-icons">trending_up</span>
                High Value Tenders
            </a>

            <a href="<%= loginBase %>itemmaster" class="service-btn">
                <span class="material-icons">inventory_2</span>
                Item Master
            </a>

            <a href="<%= loginBase %>goods" class="service-btn">
                <span class="material-icons">category</span>
                Goods & Services
            </a>

        </div>
    </div>


    <!-- AUCTIONS -->
    <div class="service-group">
        <h3>Auctions</h3>
        <div class="service-buttons">

            <a href="<%= loginBase %>auction" class="service-btn">
                <span class="material-icons">gavel</span>
                Auction Leasing
            </a>

            <a href="<%= loginBase %>Eauction" class="service-btn">
                <span class="material-icons">price_check</span>
                E-Auction System
            </a>

        </div>
    </div>


    <!-- SUPPORT -->
    <div class="service-group">
        <h3>Support</h3>
        <div class="service-buttons">

            <a href="<%= loginBase %>LearningCenter" class="service-btn">
                <span class="material-icons">school</span>
                Learning Center
            </a>

            <a href="<%= loginBase %>Helpdesk" class="service-btn">
                <span class="material-icons">support_agent</span>
                Helpdesk
            </a>

            <a href="<%= loginBase %>Bidder" class="service-btn">
                <span class="material-icons">person_add</span>
                New Bidder
            </a>

            <a href="<%= loginBase %>DepartmentCreation" class="service-btn">
                <span class="material-icons">corporate_fare</span>
                Department Creation
            </a>

        </div>
    </div>

</div>

</section>


<!-- ══════════════════════════════════════════════════
     MAIN GRID  — Feature cards | Quick Actions | News
══════════════════════════════════════════════════ -->
<div class="main-grid">
<div class="hero" id="heroCarousel">
    <button class="hero-nav prev material-icons" onclick="changeSlide(-1)" aria-label="Previous">chevron_left</button>

    <!-- Slide 1 → Search Tender -->
    <div class="hero-slide active">
        <div class="hero-text">
            <h1>Secure Procurement,<br>Safe Cyberspace</h1>
            <p>India's trusted platform for transparent railway e-tendering and auctions.</p>
            <a class="hero-cta" href="<%= loginBase %>searchtender">Search Tenders →</a>
        </div>
        <div class="hero-graphic">🛡️</div>
    </div>

    <!-- Slide 2 → High Value Tenders -->
    <div class="hero-slide">
        <div class="hero-text">
            <h1>Digital Tenders,<br>Faster Decisions</h1>
            <p>Access high-value tenders across all Indian Railway zones instantly.</p>
            <a class="hero-cta" href="<%= loginBase %>hightender">View High Value Tenders →</a>
        </div>
        <div class="hero-graphic">📋</div>
    </div>

    <!-- Slide 3 → E-Auction -->
    <div class="hero-slide">
        <div class="hero-text">
            <h1>Transparent Auctions<br>for Every Vendor</h1>
            <p>Participate in scheduled e-auctions for sales and leasing events.</p>
            <a class="hero-cta" href="<%= loginBase %>Eauction">Go to E-Auction →</a>
        </div>
        <div class="hero-graphic">🏷️</div>
    </div>

    <div class="hero-dots" id="heroDots">
        <span class="active" onclick="goToSlide(0)"></span>
        <span onclick="goToSlide(1)"></span>
        <span onclick="goToSlide(2)"></span>
    </div>

    <button class="hero-nav next material-icons" onclick="changeSlide(1)" aria-label="Next">chevron_right</button>
</div>

<%--     <!-- Latest Tenders → searchtender -->
    <div class="card feature-card"
         onclick="window.location.href='<%= loginBase %>searchtender'">
        <div class="feature-icon"><span class="material-icons">find_in_page</span></div>
        <div>
            <h3>Latest Tenders</h3>
            <p>View and participate in current e-tender opportunities</p>
        </div>
    </div> --%>

   <%--  <!-- Upcoming Auctions → auction -->
    <div class="card feature-card"
         onclick="window.location.href='<%= loginBase %>auction'">
        <div class="feature-icon"><span class="material-icons">gavel</span></div>
        <div>
            <h3>Upcoming Auctions</h3>
            <p>Browse scheduled auctions, sales and leasing events</p>
        </div>
    </div> --%>

    <!-- ── Quick Actions (right col, spans 2 rows) ── -->
    <div class="card quick-actions-card">
        <h3>Quick Actions</h3>
        <div class="qa-list">
           <a class="qa-item" href="<%= loginBase %>viewireps">
        <span class="material-icons">description</span> View Documents
    </a>

    <a class="qa-item" href="<%= loginBase %>projection">
        <span class="material-icons">insert_chart</span> Procurement Projection
    </a>

    <a class="qa-item" href="<%= loginBase %>SPO">
        <span class="material-icons">receipt_long</span> Search Purchase Orders
    </a>

    <a class="qa-item" href="<%= loginBase %>BannedFirms">
        <span class="material-icons">block</span> Banned Firms
    </a>
            <%-- <a class="qa-item" href="<%= loginBase %>searchtender">
                <span class="material-icons">search</span> Search Tender
            </a>
            <a class="qa-item" href="<%= loginBase %>viewireps">
                <span class="material-icons">description</span> Vendor Manuals
            </a>
            <a class="qa-item" href="<%= loginBase %>viewireps">
                <span class="material-icons">article</span> Policy Circulars
            </a>
            <a class="qa-item" href="<%= loginBase %>Helpdesk">
                <span class="material-icons">support_agent</span> Helpdesk
            </a>
            <a class="qa-item" href="<%= loginBase %>LearningCenter">
                <span class="material-icons">school</span> Learning Center
            </a>
            <a class="qa-item" href="<%= loginBase %>BannedFirms">
                <span class="material-icons">block</span> Banned Firms
            </a>
            <a class="qa-item" href="<%= loginBase %>Bidder">
                <span class="material-icons">person_add</span> New Bidder Registration
            </a>
            <a class="qa-item" href="<%= loginBase %>DepartmentCreation">
                <span class="material-icons">corporate_fare</span> Department Creation
            </a> --%>
        </div>
    </div>
<div class="updates-grid">
    <!-- ── News & Updates ── -->
    <div class="news-section">
        <div class="section-header">
            <h2>News &amp; Updates</h2>
            <a class="view-all" href="<%= ctx %>/jsp/admin/home/login.jsp">View all</a>
        </div>
        <div class="card" style="padding: 0 20px;">
            <div class="news-list">
                <%
                    for (int i = 0; i < newsHeadings.length; i++) {
                        String iconName = newsTypes[i].equals("warning") ? "warning" : "event_note";
                %>
                <div class="news-item">
                    <div class="news-icon <%= newsTypes[i] %>">
                        <span class="material-icons"><%= iconName %></span>
                    </div>
                    <div class="news-content">
                        <h4><%= newsHeadings[i] %></h4>
                        <div class="date"><%= newsDates[i] %></div>
                    </div>
                </div>
                <% } %>
            </div>
        </div>
    </div>
    <!-- Notifications -->
<div class="notifications-section">
    <div class="section-header">
        <h2>Notifications</h2>
        <a class="view-all" href="<%= ctx %>/jsp/admin/home/login.jsp">View all</a>
    </div>

    <div class="card" style="padding:0 20px;">
        <div class="news-list">

            <div class="news-item">
                <div class="news-icon info">
                    <span class="material-icons">notifications</span>
                </div>
                <div class="news-content">
                    <h4>Bid submission deadline extended for Tender No: 456789</h4>
                    <div class="date">26-Apr-2024</div>
                </div>
            </div>

            <div class="news-item">
                <div class="news-icon info">
                    <span class="material-icons">notifications</span>
                </div>
                <div class="news-content">
                    <h4>Vendor training webinar scheduled on 28-Apr-2024</h4>
                    <div class="date">25-Apr-2024</div>
                </div>
            </div>

            <div class="news-item">
                <div class="news-icon warning">
                    <span class="material-icons">priority_high</span>
                </div>
                <div class="news-content">
                    <h4>Mandatory update to vendor registration guidelines</h4>
                    <div class="date">24-Apr-2024</div>
                </div>
            </div>

        </div>
    </div>
</div>
</div>
</div><!-- /main-grid -->


<!-- Toast (kept for compatibility with existing JS) -->
<div id="toast"></div>


<!-- ══════════════════════════════════════════════════
     FOOTER  (exact copy from login.jsp)
══════════════════════════════════════════════════ -->
<footer class="footer">
    <img src="${pageContext.request.contextPath}/assets/images/stqc.png" alt="STQC">
    <img src="${pageContext.request.contextPath}/assets/images/cris.png" alt="CRS">
    <div class="footer-text">
        Centre For Railway Information Systems, Designed, Developed and Hosted by CRIS &nbsp;
        <strong>Version 7.1.0</strong>
    </div>
</footer>


<!-- ══════════════════════════════════════════════════
     SCRIPTS
══════════════════════════════════════════════════ -->
<script>
    /* ── Carousel ── */
    let currentSlide = 0;
    const slides = document.querySelectorAll('.hero-slide');
    const dots   = document.querySelectorAll('#heroDots span');

    function goToSlide(n) {
        slides[currentSlide].classList.remove('active');
        dots[currentSlide].classList.remove('active');
        currentSlide = (n + slides.length) % slides.length;
        slides[currentSlide].classList.add('active');
        dots[currentSlide].classList.add('active');
    }
    function changeSlide(dir) { goToSlide(currentSlide + dir); }
    setInterval(() => changeSlide(1), 4000);

    /* ── Toast helper (kept for compatibility) ── */
    function showToast(msg) {
        const t = document.getElementById('toast');
        t.textContent = msg;
        t.className = 'show';
        setTimeout(() => { t.className = t.className.replace('show',''); }, 2000);
    }
</script>

<!-- Accessibility JS (same as login.jsp) -->
<script src="${pageContext.request.contextPath}/assets/accessibility/accessibility.js"></script>

<!-- Bhashini Translation Plugin (same as login.jsp) -->
<script
    src="https://translation-plugin.bhashini.co.in/v3/website_translation_utility.js"
    language-icon-color="#ffffff">
</script>
<script src="${pageContext.request.contextPath}/assets/bhashini/bhashini-init.js"></script>

</body>
</html>


<%-- <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%
    // Sample data - in real app, these would come from service/DAO layers
    String[] newsHeadings = {
        "Pre-bid Meeting for Tender No: 12345678 on 25-April-2024",
        "Attention: Scheduled system downtime on 30-Apr-2024",
        "RDSO has issued Specification No. TI/SPC/OHE/AT/0100 (Amendment 1) on 21-Apr-2024"
    };
    String[] newsDates = { "24-Apr-2024", "23-Apr-2024", "21-Apr-2024" };
    String[] newsTypes = { "info", "warning", "info" };

    String[] quickActions = { "Search Tender", "Vendor Manuals", "Policy Circulars", "Helpdesk" };
    String[] quickIcons  = { "search", "description", "article", "help" };
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Indian Railways E-Procurement System</title>
    <link href="https://fonts.googleapis.com/css2?family=Source+Sans+3:wght@400;600;700&family=Source+Serif+4:wght@600;700&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <style>
        *, *::before, *::after { box-sizing: border-box; margin: 0; padding: 0; }

        :root {
            --navy:       #1a4a72;
            --navy-dark:  #0f2f4a;
            --navy-mid:   #1d5a8a;
            --blue-light: #2e7aba;
            --accent:     #f5a623;
            --white:      #ffffff;
            --bg:         #f0f4f8;
            --card-bg:    #ffffff;
            --text-main:  #1a2a3a;
            --text-muted: #5a7a9a;
            --border:     #d0dde8;
            --danger:     #e05a2b;
        }

        body {
            font-family: 'Source Sans 3', sans-serif;
            background: var(--bg);
            color: var(--text-main);
            min-height: 100vh;
        }

        /* ── HEADER ── */
        header {
            background: var(--navy-dark);
            padding: 0 32px;
            display: flex;
            align-items: center;
            gap: 24px;
            height: 72px;
            position: sticky;
            top: 0;
            z-index: 100;
            box-shadow: 0 2px 12px rgba(0,0,0,.35);
        }

        .logo-area {
            display: flex;
            align-items: center;
            gap: 12px;
            text-decoration: none;
            flex-shrink: 0;
        }

        .logo-circle {
            width: 48px;
            height: 48px;
            border-radius: 50%;
            background: var(--white);
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 22px;
            font-weight: 700;
            color: var(--navy-dark);
            border: 2px solid var(--accent);
            flex-shrink: 0;
        }

        .logo-text { line-height: 1.2; }
        .logo-text .main { font-family: 'Source Serif 4', serif; font-size: 17px; font-weight: 700; color: var(--white); }
        .logo-text .sub  { font-size: 12px; color: #a8c4dc; letter-spacing: .4px; }

        .search-bar {
            flex: 1;
            max-width: 540px;
            margin: 0 auto;
            position: relative;
        }

        .search-bar input {
            width: 100%;
            padding: 10px 44px 10px 16px;
            border-radius: 6px;
            border: 1.5px solid rgba(255,255,255,.2);
            background: rgba(255,255,255,.1);
            color: var(--white);
            font-size: 14px;
            font-family: inherit;
            outline: none;
            transition: border-color .2s, background .2s;
        }
        .search-bar input::placeholder { color: rgba(255,255,255,.5); }
        .search-bar input:focus { border-color: var(--accent); background: rgba(255,255,255,.15); }

        .search-bar .material-icons {
            position: absolute;
            right: 12px;
            top: 50%;
            transform: translateY(-50%);
            color: rgba(255,255,255,.6);
            font-size: 20px;
            cursor: pointer;
        }

        .header-actions { display: flex; align-items: center; gap: 10px; margin-left: auto; }

        .lang-btn {
            display: flex;
            align-items: center;
            gap: 4px;
            padding: 7px 14px;
            border: 1.5px solid rgba(255,255,255,.3);
            border-radius: 6px;
            background: transparent;
            color: var(--white);
            font-size: 13px;
            font-family: inherit;
            cursor: pointer;
            transition: background .2s;
        }
        .lang-btn:hover { background: rgba(255,255,255,.1); }

        .btn-login, .btn-register {
            padding: 8px 20px;
            border-radius: 6px;
            font-size: 14px;
            font-family: inherit;
            font-weight: 600;
            cursor: pointer;
            transition: all .2s;
            border: none;
        }
        .btn-login    { background: var(--white); color: var(--navy-dark); }
        .btn-login:hover { background: #e8f0f8; }
        .btn-register { background: var(--navy-mid); color: var(--white); border: 1.5px solid rgba(255,255,255,.3); }
        .btn-register:hover { background: var(--blue-light); }

        /* ── HERO / CAROUSEL ── */
        .hero {
            margin: 28px 32px 0;
            border-radius: 14px;
            overflow: hidden;
            background: linear-gradient(135deg, var(--navy-dark) 0%, var(--navy-mid) 60%, var(--blue-light) 100%);
            min-height: 240px;
            position: relative;
            display: flex;
            align-items: center;
        }

        .hero-slide {
            display: none;
            width: 100%;
            padding: 48px 64px;
            justify-content: space-between;
            align-items: center;
            animation: fadeIn .5s ease;
        }
        .hero-slide.active { display: flex; }

        @keyframes fadeIn { from { opacity: 0; transform: translateX(20px); } to { opacity: 1; transform: none; } }

        .hero-text h1 {
            font-family: 'Source Serif 4', serif;
            font-size: 36px;
            font-weight: 700;
            color: var(--white);
            line-height: 1.25;
            max-width: 440px;
        }
        .hero-text p { font-size: 15px; color: rgba(255,255,255,.75); margin-top: 12px; max-width: 380px; }

        .hero-graphic {
            font-size: 100px;
            opacity: .85;
            flex-shrink: 0;
        }

        .hero-nav {
            position: absolute;
            top: 50%;
            transform: translateY(-50%);
            background: rgba(255,255,255,.15);
            border: none;
            border-radius: 50%;
            width: 38px; height: 38px;
            display: flex; align-items: center; justify-content: center;
            cursor: pointer;
            color: var(--white);
            transition: background .2s;
            font-size: 20px;
        }
        .hero-nav:hover { background: rgba(255,255,255,.3); }
        .hero-nav.prev { left: 14px; }
        .hero-nav.next { right: 14px; }

        .hero-dots {
            position: absolute;
            bottom: 14px;
            left: 50%;
            transform: translateX(-50%);
            display: flex;
            gap: 8px;
        }
        .hero-dots span {
            width: 8px; height: 8px;
            border-radius: 50%;
            background: rgba(255,255,255,.4);
            cursor: pointer;
            transition: background .2s, transform .2s;
        }
        .hero-dots span.active { background: var(--white); transform: scale(1.3); }

        /* ── MAIN GRID ── */
        .main-grid {
            display: grid;
            grid-template-columns: 1fr 1fr 340px;
            gap: 20px;
            margin: 24px 32px;
        }

        /* ── CARDS ── */
        .card {
            background: var(--card-bg);
            border-radius: 10px;
            border: 1px solid var(--border);
            padding: 24px;
            transition: box-shadow .2s, transform .2s;
        }
        .card:hover { box-shadow: 0 6px 24px rgba(26,74,114,.12); transform: translateY(-2px); cursor: pointer; }

        .feature-card {
            display: flex;
            align-items: flex-start;
            gap: 16px;
        }

        .feature-icon {
            width: 52px; height: 52px;
            border-radius: 10px;
            background: #e8f2fb;
            display: flex; align-items: center; justify-content: center;
            flex-shrink: 0;
        }
        .feature-icon .material-icons { color: var(--navy-mid); font-size: 26px; }

        .feature-card h3 { font-size: 17px; font-weight: 700; color: var(--text-main); margin-bottom: 6px; }
        .feature-card p  { font-size: 13.5px; color: var(--text-muted); line-height: 1.5; }

        /* ── QUICK ACTIONS ── */
        .quick-actions-card {
            grid-row: span 1;
        }
        .quick-actions-card h3 { font-size: 16px; font-weight: 700; margin-bottom: 14px; }

        .qa-list { display: flex; flex-direction: column; gap: 8px; }

        .qa-item {
            display: flex;
            align-items: center;
            gap: 12px;
            padding: 11px 14px;
            border: 1px solid var(--border);
            border-radius: 8px;
            font-size: 14px;
            font-weight: 600;
            color: var(--text-main);
            cursor: pointer;
            transition: background .2s, border-color .2s;
        }
        .qa-item:hover { background: #e8f2fb; border-color: var(--navy-mid); color: var(--navy-mid); }
        .qa-item .material-icons { font-size: 18px; color: var(--navy-mid); }

        /* ── NEWS SECTION ── */
        .news-section {
            grid-column: span 2;
        }

        .section-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 16px;
        }
        .section-header h2 { font-size: 18px; font-weight: 700; }
        .view-all { font-size: 13px; color: var(--navy-mid); text-decoration: none; font-weight: 600; }
        .view-all:hover { text-decoration: underline; }

        .news-list { display: flex; flex-direction: column; gap: 0; }

        .news-item {
            display: flex;
            align-items: flex-start;
            gap: 14px;
            padding: 16px 0;
            border-bottom: 1px solid var(--border);
        }
        .news-item:last-child { border-bottom: none; }

        .news-icon {
            width: 32px; height: 32px;
            border-radius: 6px;
            display: flex; align-items: center; justify-content: center;
            flex-shrink: 0;
            margin-top: 2px;
        }
        .news-icon.info    { background: #e8f2fb; }
        .news-icon.info .material-icons { color: var(--navy-mid); font-size: 18px; }
        .news-icon.warning { background: #fff3e0; }
        .news-icon.warning .material-icons { color: var(--danger); font-size: 18px; }

        .news-content h4 { font-size: 14px; font-weight: 600; line-height: 1.45; color: var(--text-main); }
        .news-content .date { font-size: 12px; color: var(--navy-mid); margin-top: 4px; font-weight: 600; }

        /* ── FOOTER ── */
        footer {
            background: var(--navy-dark);
            color: rgba(255,255,255,.65);
            text-align: center;
            padding: 18px 32px;
            font-size: 12.5px;
            margin-top: 24px;
        }

        @media (max-width: 900px) {
            .main-grid { grid-template-columns: 1fr; }
            .news-section { grid-column: span 1; }
            header { padding: 0 16px; gap: 12px; }
            .search-bar { max-width: 200px; }
            .hero { margin: 16px 16px 0; }
            .hero-text h1 { font-size: 24px; }
            .hero-graphic { display: none; }
            .main-grid { margin: 16px; }
        }
    </style>
</head>
<body>

<!-- ══════════════ HEADER ══════════════ -->
<header>
    <a class="logo-area" href="#">
        <div class="logo-circle">IR</div>
        <div class="logo-text">
            <div class="main">Indian Railways</div>
            <div class="sub">E-Procurement System</div>
        </div>
    </a>

    <div class="search-bar">
        <input type="text" placeholder="Search tenders, auctions or vendors..." />
        <span class="material-icons">search</span>
    </div>

    <div class="header-actions">
        <button class="lang-btn">English <span class="material-icons" style="font-size:16px;">expand_more</span></button>
        <button class="btn-login"    onclick="alert('Login page')">Login</button>
        <button class="btn-register" onclick="alert('Register page')">Register</button>
    </div>
</header>

<!-- ══════════════ HERO CAROUSEL ══════════════ -->
<div class="hero" id="heroCarousel">
    <button class="hero-nav prev material-icons" onclick="changeSlide(-1)">chevron_left</button>

    <div class="hero-slide active">
        <div class="hero-text">
            <h1>Secure Procurement,<br>Safe Cyberspace</h1>
            <p>India's trusted platform for transparent railway e-tendering and auctions.</p>
        </div>
        <div class="hero-graphic">🛡️</div>
    </div>

    <div class="hero-slide">
        <div class="hero-text">
            <h1>Digital Tenders,<br>Faster Decisions</h1>
            <p>Access thousands of active tenders across all Indian Railway zones.</p>
        </div>
        <div class="hero-graphic">📋</div>
    </div>

    <div class="hero-slide">
        <div class="hero-text">
            <h1>Transparent Auctions<br>for Every Vendor</h1>
            <p>Participate in scheduled e-auctions for sales and leasing events.</p>
        </div>
        <div class="hero-graphic">🏷️</div>
    </div>

    <div class="hero-dots" id="heroDots">
        <span class="active" onclick="goToSlide(0)"></span>
        <span onclick="goToSlide(1)"></span>
        <span onclick="goToSlide(2)"></span>
    </div>

    <button class="hero-nav next material-icons" onclick="changeSlide(1)">chevron_right</button>
</div>

<!-- ══════════════ MAIN GRID ══════════════ -->
<div class="main-grid">

    <!-- Latest Tenders -->
    <div class="card feature-card" onclick="location.href='#'">
        <div class="feature-icon"><span class="material-icons">find_in_page</span></div>
        <div>
            <h3>Latest Tenders</h3>
            <p>View and participate in current e-tender opportunities</p>
        </div>
    </div>

    <!-- Upcoming Auctions -->
    <div class="card feature-card" onclick="location.href='#'">
        <div class="feature-icon"><span class="material-icons">gavel</span></div>
        <div>
            <h3>Upcoming Auctions</h3>
            <p>Browse scheduled auctions, sales and leasing events</p>
        </div>
    </div>

    <!-- Quick Actions — spans 2 rows -->
    <div class="card quick-actions-card" style="grid-row: span 2;">
        <h3>Quick Actions</h3>
        <div class="qa-list">
            <%
                for (int i = 0; i < quickActions.length; i++) {
            %>
            <div class="qa-item" onclick="alert('<%= quickActions[i] %>')">
                <span class="material-icons"><%= quickIcons[i] %></span>
                <%= quickActions[i] %>
            </div>
            <% } %>
        </div>
    </div>

    <!-- News & Updates -->
    <div class="news-section" style="grid-column: span 2;">
        <div class="section-header">
            <h2>News &amp; Updates</h2>
            <a class="view-all" href="#">View all</a>
        </div>

        <div class="card" style="padding: 0 24px;">
            <div class="news-list">
                <%
                    for (int i = 0; i < newsHeadings.length; i++) {
                        String iconName = newsTypes[i].equals("warning") ? "warning" : "event_note";
                %>
                <div class="news-item">
                    <div class="news-icon <%= newsTypes[i] %>">
                        <span class="material-icons"><%= iconName %></span>
                    </div>
                    <div class="news-content">
                        <h4><%= newsHeadings[i] %></h4>
                        <div class="date"><%= newsDates[i] %></div>
                    </div>
                </div>
                <% } %>
            </div>
        </div>
    </div>

</div><!-- /main-grid -->

<!-- ══════════════ FOOTER ══════════════ -->
<footer>
    &copy; <%= new java.util.Date().getYear() + 1900 %> Indian Railways E-Procurement System. All rights reserved. &nbsp;|&nbsp; Ministry of Railways, Government of India.
</footer>

<!-- ══════════════ CAROUSEL JS ══════════════ -->
<script>
    let currentSlide = 0;
    const slides = document.querySelectorAll('.hero-slide');
    const dots   = document.querySelectorAll('#heroDots span');

    function goToSlide(n) {
        slides[currentSlide].classList.remove('active');
        dots[currentSlide].classList.remove('active');
        currentSlide = (n + slides.length) % slides.length;
        slides[currentSlide].classList.add('active');
        dots[currentSlide].classList.add('active');
    }

    function changeSlide(dir) { goToSlide(currentSlide + dir); }

    // Auto-advance every 4 seconds
    setInterval(() => changeSlide(1), 4000);
</script>

</body>
</html> --%>


<%-- <%@ page contentType="text/html;charset=UTF-8" language="java" %>
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

	</html>  --%>