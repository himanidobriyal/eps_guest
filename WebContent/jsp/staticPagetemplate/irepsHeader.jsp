
<!DOCTYPE html>
<html class="no-js" lang="en">
<head>
	<title>eAuction</title>
	<meta charset="utf-8">
	<meta content="IE=edge" http-equiv="X-UA-Compatible">
	<meta content="" name="description">
	<meta content="" name="google-translate-customization">
	<meta content="width=device-width, initial-scale=1" name="viewport"><!-- Bootstrap CSS -->
	

<%@ taglib uri="http://www.springframework.org/tags" prefix="bean" %>
<%
String context = (String) request.getContextPath();
String serverName = request.getServerName(); 
String accessMode=session.getAttribute("accessMode")!=null?(String)session.getAttribute("accessMode"):"";
String actionMode=session.getAttribute("actionMode")!=null?(String)session.getAttribute("actionMode"):"";
String fontSize=session.getAttribute("fontSize")!=null?(String)session.getAttribute("fontSize"):"14";
%>
<style type="text/css">

.small-text{
color:white}
.small-text:hover {
    color: red;
}


</style>
<style>
.gradientClass{
background: #07222E;
font-family: 'Adobe Garamond Pro', sans-serif;
}
  .custom-select {
            margin-right: 30px;
            border: 0px;
            width: 220px;
            background-color: transparent;
            color: white;
            height: 45px;
            -webkit-appearance: none; 
            -moz-appearance: none; 
            appearance: none; 
        }

        .custom-select option {
            color: black;
        }
     
		

    .controls {
     display: flex;
        bottom: 30px; 
         
     }
    .btn {
      border: 1px solid rgba(255,255,255,.35);
      color: #fff;
      padding: 6px 10px;
      border-radius: 8px;
      cursor: pointer;
      font: inherit;
      
    }



:root {
    --app-font-size: 20px;
}

/* Font size - Apply to ALL elements */
*, *::before, *::after {
    font-size: var(--app-font-size) !important;
}

/* Dark theme styles */
.dark-theme {
    background-color: #1a1a1a !important;
    color: #ffffff !important;
}

.dark-theme body,
.dark-theme div,
.dark-theme span,
.dark-theme p,
.dark-theme td,
.dark-theme th,
.dark-theme label {
    background-color: #1a1a1a !important;
    color: #ffffff !important;
}

.dark-theme input,
.dark-theme textarea,
.dark-theme select,
.dark-theme button {
    background-color: #333333 !important;
    color: #ffffff !important;
    border-color: #555555 !important;
}

.dark-theme table,
.dark-theme .table {
    background-color: #1a1a1a !important;
    color: #ffffff !important;
}

.dark-theme table td,
.dark-theme table th,
.dark-theme .table td,
.dark-theme .table th {
    background-color: #1a1a1a !important;
    color: #ffffff !important;
    border-color: #555555 !important;
}

/* Buttons specific styling */
button, input[type="button"], input[type="submit"], .btn {
    font-size: var(--app-font-size) !important;
}

.dark-theme button,
.dark-theme input[type="button"],
.dark-theme input[type="submit"],

    .dark-theme li.layouts,
.dark-theme li.menu-item,
.dark-theme .menu li {
    background-color: #2a2a2a !important;
    border: 1px solid #404040 !important;
    transition: background-color 0.3s ease !important;
}

.dark-theme li.layouts:hover,
.dark-theme li.menu-item:hover,
.dark-theme .menu li:hover {
    background-color: #3a3a3a !important;
}

/* Links inside li elements */
.dark-theme li a {
    color: #66b3ff !important;
    text-decoration: none !important;
}

.dark-theme li a:hover {
    color: #99ccff !important;
}

/* List markers/bullets */
.dark-theme ul li::marker,
.dark-theme ol li::marker {
    color: #ffffff !important;
}

.dark-theme,
.dark-theme * {
    color: #f5f5f5 !important; /* soft white */
}

/* Keep links highlighted */
.dark-theme a {
    color: #66b3ff !important;
}
.dark-theme a:hover {
    color: #99ccff !important;
}


.dark-theme li a,
.dark-theme li a span {
  color: #66b3ff !important;
}
.dark-theme li a:hover,
.dark-theme li a:hover span {
  color: #99ccff !important;
}
.dark-theme li a:visited {
  color: #a6bde5 !important;
}

</style>



</head>
<body>

	

	
<div class="gradientClass" style="width: 100%;">

    <div style="height: 20px;"></div>

    <!-- Main Flex Row -->
    <div style="display: flex; align-items: center; justify-content: space-between;">

        <!-- Left: Logo -->
        <div style="width: 15%;">
            <img src="/ireps/images/gem-new-logo-v6.png" style="margin-left:40px;width:350px;height:auto;" />
        </div>

        <!-- Center: Marketplace Heading -->
        <div style="width: 80%; text-align: center;">
            <div style="color:white; font-family: 'Adobe Garamond Pro', sans-serif; font-size:27px; line-height: 1.2;">
                   <!-- Title -->
      <span style="font-size:23px !important; letter-spacing:1px;">
  Government eMarketplace
</span>

        <br>
        
        <!-- Subtitle -->
        <span style="color: gold; font-size:28px !important; letter-spacing: 2px;">
          			  Indian Railways E-Procurement System
        </span>
        <br>
                <div style="height: 0.5em;"></div>

                <% if (serverName.contains("localhost") || serverName.contains("trial") || serverName.contains("naval") || serverName.contains("trivendra")) { %>
                <div class="header_left_logo display_table_cell">
                    <img src="/ireps/images/common/trialSiteLogo.png" width="230px" height="25px" alt="IR">
                </div>
                <% } %>
            </div>
        </div>

        <!-- Right: Controls -->
        <div style=" width: 15%;  padding-left: 20px;  ">
            <div class="controls" aria-label="Display controls" style="display:flex;  gap:5px;">
                <button class="btn" id="fontDec" title="Decrease font size" onclick="changeFontSize('decrease')">A−</button>
                <button class="btn" id="fontReset" title="Reset font size" onclick="changeFontSize('reset')">A</button>
                <button class="btn" id="fontInc" title="Increase font size" onclick="changeFontSize('increase')">A+</button>
                <button class="btn" id="themeToggle" title="Toggle dark/light" onclick="toggleDarkMode()">&#127769/&#127774</button>
            </div>
        </div>
        
        <div style="width: 5%;"></div>

    </div>

    <div style="height: 16px;"></div>

</div>

<script type="text/javascript">
function changeFontSize(action) {
    let currentSize = parseFloat(localStorage.getItem('fontSize')) || 16;
    
    switch(action) {
        case 'increase': currentSize = Math.min(currentSize + 2, 24); break;
        case 'decrease': currentSize = Math.max(currentSize - 2, 12); break;
        case 'reset': currentSize = 16; break;
    }
    
    document.documentElement.style.setProperty('--app-font-size', currentSize + 'px');
    localStorage.setItem('fontSize', currentSize);
    
    // Force refresh layout for buttons and tables
    const buttons = document.querySelectorAll('button, input[type="button"], input[type="submit"]');
    buttons.forEach(btn => btn.style.display = 'none');
    setTimeout(() => buttons.forEach(btn => btn.style.display = ''), 1);
}

function toggleDarkMode() {
    const html = document.documentElement;
    const body = document.body;
    const isDark = html.classList.toggle('dark-theme');
    body.classList.toggle('dark-theme', isDark);
    
    document.getElementById('darkModeBtn').textContent = isDark ? 'Light' : 'Dark';
    localStorage.setItem('darkMode', isDark);
}


//new code 

var accessAjaxUrl='<%=response.encodeURL(request.getContextPath()+"/sessionAcessbility")%>';

function changeFontSize(action) {
    let currentSize = parseFloat(localStorage.getItem('fontSize')) || 14;
    
    switch(action) {
        case 'increase': currentSize = Math.min(currentSize + 2, 24); break;
        case 'decrease': currentSize = Math.max(currentSize - 2, 12); break;
        case 'reset': currentSize = 14; break;
    }
    
    document.documentElement.style.setProperty('--app-font-size', currentSize + 'px');
    localStorage.setItem('fontSize', currentSize);
    
    // Force refresh layout for buttons and tables
    const buttons = document.querySelectorAll('button, input[type="button"], input[type="submit"]');
    buttons.forEach(btn => btn.style.display = 'none');
    setTimeout(() => buttons.forEach(btn => btn.style.display = ''), 1);

    $.ajax({
                type: "POST",
            url: accessAjaxUrl,
            data: {ajaxMode:"setFontSizeMode",actionMode:action,fontSize:currentSize},
                dataType:'json',
            success: function(result) {
                    
            
           },
            error: function(result){
                    
                    return false;
            }
        });

    
}

function loadChangeFontSize() {
        var currentSize = "";
        var action="";
        
    <% if (actionMode != null) { %> 
        currentSize = '<%=fontSize%>';
        action='<%=actionMode%>';
  <% } else { %>

      currentSize = parseFloat(localStorage.getItem('fontSize')) || 14;
   
     <% } %>
    
    document.documentElement.style.setProperty('--app-font-size', currentSize + 'px');
    localStorage.setItem('fontSize', currentSize);
    
    // Force refresh layout for buttons and tables
  /*   const buttons = document.querySelectorAll('button, input[type="button"], input[type="submit"]');
    buttons.forEach(btn => btn.style.display = 'none');
    setTimeout(() => buttons.forEach(btn => btn.style.display = ''), 1); */

    
}
loadChangeFontSize();
function loadToggleDarkMode() {
        
    const html = document.documentElement;
    const body = document.body;
    
    var isDark =false;
   
    <% if (accessMode != null) { %> 
        isDark = <%= "true".equalsIgnoreCase(accessMode) ? "true" : "false" %>;
        html.classList.toggle('dark-theme', isDark);
     
    <% } else { %>
   
        isDark = html.classList.toggle('dark-theme');
       
    <% } %>
    
    body.classList.toggle('dark-theme', isDark);
   
    //document.getElementById('darkModeBtn').textContent = isDark ? 'Light' : 'Dark';
    localStorage.setItem('darkMode', isDark);

   
}
loadToggleDarkMode();
 function toggleDarkMode() {
        const html = document.documentElement;
    const body = document.body;
    const isDark = html.classList.toggle('dark-theme');
    body.classList.toggle('dark-theme', isDark);
   
    //document.getElementById('darkModeBtn').textContent = isDark ? 'Light' : 'Dark';
  
    localStorage.setItem('darkMode', isDark);
   
    $.ajax({
                type: "POST",
            url: accessAjaxUrl,
            data: {ajaxMode:"setVisibilityMode",accessMode:isDark},
                dataType:'json',
            success: function(result) {
                    
            
           },
            error: function(result){
                    return false;
            }
        });
} 

// **MODIFIED: Reset font size on page refresh**
window.addEventListener('load', function() {
    // ALWAYS reset font size to default on page refresh
    //document.documentElement.style.setProperty('--app-font-size', '14px');
    //localStorage.setItem('fontSize', '14');
    
    // Only preserve dark mode setting
    const darkMode = localStorage.getItem('darkMode') === 'true';
    if (darkMode) {
        document.documentElement.classList.add('dark-theme');
        document.body.classList.add('dark-theme');
        const btn = document.getElementById('darkModeBtn');
        if (btn) btn.textContent = 'Light';
    }
});





</script>

<script>
// Make dropdown menus accessible with keyboard
document.addEventListener('DOMContentLoaded', function () {
  document.querySelectorAll('.sf-menu > li > a').forEach(function (link) {
    link.setAttribute('role', 'button');
    link.setAttribute('aria-haspopup', 'true');
    link.setAttribute('aria-expanded', 'false');

    link.addEventListener('keydown', function (e) {
      if (e.key === "Enter" || e.key === " " || e.key === "ArrowDown") {
        e.preventDefault();
        let submenu = this.nextElementSibling;
        if (submenu && submenu.tagName === "UL") {
          submenu.style.display = "block";
          this.setAttribute('aria-expanded', 'true');
          submenu.querySelector('a')?.focus();
        }
      }
      if (e.key === "Escape") {
        this.setAttribute('aria-expanded', 'false');
        this.focus();
        let submenu = this.nextElementSibling;
        if (submenu) submenu.style.display = "none";
      }
    });
  });
});
//Make dropdown menus accessible with keyboard end here
</script>
<!-- --------The Code to reset the setting USERWAY while refresh the Page  -->	
 	<script>
		function resetUserWay() {
		    if (window.UserWay && typeof window.UserWay.resetAll === "function") {
		        window.UserWay.resetAll();
		        console.log("UserWay reset to default");
		    } else {
		        // Retry after 300ms until UserWay is loaded
		        setTimeout(resetUserWay, 300);
		    }
		}
		resetUserWay();
		</script>
		<script>
		(function(d){
		  var s = d.createElement("script");
		  s.setAttribute("data-account", "YOUR-USERWAY-ID"); // Replace with your UserWay account ID
		  s.setAttribute("src", "https://cdn.userway.org/widget.js");
		  (d.body || d.head).appendChild(s);
		})(document);
</script> 
</body></html>
       	