<%@page import="java.util.TimeZone"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.Format"%>
<%@page import="java.util.Date"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.ireps.admin.entity.UserProfieForm"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="bean"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="html"%>
<!DOCTYPE html>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css"
	href="/ireps/css/irepsCommonCss.css">
<link rel="stylesheet" type="text/css"
	href="/ireps/css/iMMSNewDesign.css">
<link href="/ireps/bootstrap/css/style.css" rel="stylesheet">
<script src="https://kit.fontawesome.com/a076d05399.js" 
        integrity="sha256-C9VpoA7k7Mr2wL1Xnx/JQ+R5ZdD8zFJLSq8+4F7TjBw=" 
        crossorigin="anonymous"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha256-YLGeXaapI0/5IgZopewRJcFXomhRMlYYjugPLSyNjTY="
	crossorigin="anonymous">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"
	integrity="sha512-bnIvzh6FU75ZKxp0GXLH9bewza/OIw6dLVh9ICg0gogclmYGguQJWl8U30WpbsGTqbIiAwxTsbe76DErLq5EDQ=="
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
	integrity="sha512-5WvZa4N7Jq3TVNCp4rjcBMlc6pT3lZ7gVxjtI6IkKW+uItSa+rFgtFljvZnCxQGj8SUX5DHraKE6Mn/4smK1Cg=="
	crossorigin="anonymous"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
	integrity="sha512-Ah5hWYPzDsVHf9i2EejFBFrG2ZAPmpu4ZJtW4MfSgpZacn+M9QHDt+Hd/wL1tEkk1UgbzqepJr6KnhZjFKB+0A=="
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
	
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>	

<style>

/* Hide scrollbar for Chrome, Safari and Opera */
.sidenavscrollbar::-webkit-scrollbar {
	display: none;
}

/* Hide scrollbar for IE and Edge */
.sidenavscrollbar {
	-ms-overflow-style: none;
	scrollbar-width: none;
}

.bg-ghostwhite {
	background-color: #f9fbfd;
}

.zero-padding {
	padding: 0px;
}

.zero-margin {
	margin-left: 0px;
	margin-right: 0px;
	margin-top: 0px;
	margin-bottom: 0px;
}

.header-title {
	font-size: 1.24062rem;
	color: #212529;
}

.bg-white {
	background-color: #ffffff;
}

/*~~ User info css */
.sidebar-user {
	padding: 1.5rem 1rem 1rem;
	background: #fff;
	color: #153d77;
	text-align: center;
}

.sidebar-user img {
	width: 64px;
	height: 64px;
}

.mb-2, .my-2 {
	margin-bottom: .5rem !important;
}

.rounded-circle {
	border-radius: 50% !important;
}

.img-fluid, .img-thumbnail {
	max-width: 100%;
	height: auto;
}

img, svg {
	vertical-align: middle;
}

img {
	border-style: none;
}

*, :after, :before {
	box-sizing: border-box;
}


    .countdown-container {
      text-align: center;
      position: relative;
    }

    .countdown-circle {
      width: 80px;
      height: 80px;
      border: 5px solid #f32f05;
      border-radius: 50%;
      display: flex;
      justify-content: center;
      align-items: center;
      font-size: 24px;
      transition: background 0.5s;
      
        border-color: #ffffff; /* White for high contrast */
    background: conic-gradient(#ffff00 0%, #00ffff 100%); /* Bright yellow to cyan gradient */
    }

    .red-circle {
      border-color: #ff0000;
      background: conic-gradient(#ff0000 0%, #ff0000 100%);
    }




    .controls {
     display: flex;
        bottom: 30px; 
         
     }


.btn {
  background-color: #f5f5f5 !important; /* solid light background */
  border: 1px solid #ccc !important; 
  border-radius: 6px;
  padding: 6px 12px;
  font-size: 14px;
  font-weight: bold;
  cursor: pointer;
  transition: all 0.3s ease;
  margin: 2px;
  color: #333 !important; /* dark text */
  box-shadow: 0 2px 4px rgba(0,0,0,0.1);
}

/* Hover effect */
.btn:hover {
  background-color: #e0e0e0 !important;
  border-color: #999 !important;
  transform: translateY(-2px);
  box-shadow: 0 4px 8px rgba(0,0,0,0.15);
}

/* Active (click) effect */
.btn:active {
  transform: translateY(0);
  box-shadow: 0 1px 2px rgba(0,0,0,0.2);
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
button, input[type="button"], input[type="submit"]{
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


.dark-theme .dataTables_wrapper,
.dark-theme .pagination li a,
.dark-theme .pagination li span {
  background-color: transparent !important;
  color: #fff !important;
  border: 1px solid #444 !important;
}

.dark-theme .pagination li.active a,
.dark-theme .pagination li.active span {
  background-color: #111 !important;
  color: #99ccff !important;
  border-color: #666 !important;
}
/* User info css  ~~ */
</style>

<style type="text/css">
.epsLabel {
	font-size: 33px;
	/* font-family: Cambria; */
	font-weight: normal;
	letter-spacing: 2px;
	color: white;
	font-family: 'Roboto', sans-serif;
}
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
        .small-text{
			color:white;
			font-weight: normal;
			font-family: 'Adobe Garamond Pro', sans-serif;
			text-transform: capitalize;
		}
		
		.welcomeLabel2 {
      color: blue;
    }
    

</style>

</head>

<%
	String language="En";
	String disclaim=language.trim().equals("hi") ? "Disclamier_hi.pdf" : "Disclamier_en.pdf";
	String about=language.trim().equals("hi") ? "AboutUs_hi.pdf" : "AboutUs.pdf";
	String copyright=language.trim().equals("hi") ? "Copyright_hi.pdf" : "Copyright.pdf";
	String privacypol=language.trim().equals("hi") ? "PrivacyPolicy_hi.pdf" : "PrivacyPolicy.pdf";
	String terms=language.trim().equals("hi") ? "TermsAndCondition_hi.pdf" : "TermsAndCondition.pdf";
	String rti=language.trim().equals("hi") ? "List_RTI_Officers.pdf" : "List_RTI_Officers.pdf";
	String serverName=System.getProperty("ServerName");
	String instance = System.getProperty("jboss.node.name");
	String jbossserverName=System.getProperty("jboss.server.name");
	String node=System.getProperty("jboss.instance.id");
%>

<%
	String context = (String) request.getContextPath();
	UserProfieForm sessionData = (UserProfieForm) session.getAttribute("sessionData");
	String welcomeString = sessionData.getWelcomeString().trim();
	welcomeString = welcomeString.replaceAll(sessionData.getUsername().trim(), "");
	String accessMode=session.getAttribute("accessMode")!=null?(String)session.getAttribute("accessMode"):"";
	String actionMode=session.getAttribute("actionMode")!=null?(String)session.getAttribute("actionMode"):"";
	String fontSize=session.getAttribute("fontSize")!=null?(String)session.getAttribute("fontSize"):"14";
%>

<script>
function logout() 
{
	localStorage.setItem('sidenavlinkID','');
	localStorage.setItem('leftnav_scrollbar_position',0);
	
	window.document.location.href="/eAuction/logout";
	
} 
</script>

<%


Date date1 = new Date();
Format formatter = new SimpleDateFormat("dd MMM yyyy HH:mm:ss");
String date = formatter.format(date1);
TimeZone tz = TimeZone.getTimeZone("IST");
String tz1=tz.getID();

%>


<script type="text/javascript">

var request;
var monat=new Array("Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sept","Oct","Nov","Dec");

var monthindi= new Array("&#2332;&#2344;&#2357;&#2352;&#2368","&#2347;&#2352;&#2357;&#2352;&#2368",
                         "&#2350;&#2366;&#2352;&#2381;&#2330","&#2309;&#2346;&#2381;&#2352;&#2376;&#2354",
						 "&#2350;&#2312","&#2332;&#2370;&#2344",
						 "&#2332;&#2369;&#2354;&#2366;&#2312;", "&#2309;&#2327;&#2360;&#2381;&#2340",
						 "&#2360;&#2367;&#2340;&#2350;&#2381;&#2348;&#2352","&#2309;&#2325;&#2381;&#2335;&#2370;&#2348;&#2352",
						 "&#2344;&#2357;&#2306;&#2348;&#2352","&#2342;&#2367;&#2360;&#2350;&#2381;&#2348;&#2352");

var ist=new Array("&#2310;&#2312;&#2319;&#2360;&#2335;&#2368");

var digital='<%=date%>';
var timezone1='<%=tz1%>';
var digital1 = new Date(digital);

function clock()
{
  var hours = digital1.getHours();
  var minutes = digital1.getMinutes();
  var seconds = digital1.getSeconds();
  var ampm = '';
  var d = digital1.getDate();
  if (d < 10) d = '0' + d; 
  var m = digital1.getMonth();
  var y = digital1.getFullYear();
  digital1.setSeconds( seconds+1 );
  if (hours < 10) hours = '0' + hours;
  if (minutes < 10) minutes = '0' + minutes;
  if (seconds < 10) seconds = '0' + seconds;
  var dispTime = d+"-"+monat[m]+"-"+y+" "+hours + ":" + minutes + ":" + seconds+" "+timezone1;
  document.getElementById('pendlum').innerHTML = dispTime;
  setTimeout("clock()", 1000);
   
}
</script>
<body onload="clock(); ">
	<%-- <div class="container-fluid  zero-margin">
   <div class="row vh-100 ">
   
  <div class="sidebar-user" style="height:150px; border:0px solid black;width:240px;">
	<img src="/ireps/images/avatar.png" class="img-fluid rounded-circle mb-2" alt="Linda Miller">
	<div class="font-weight-bold"><%=sessionData.getUsername() %></div>
	<small><%=welcomeString %></small>	
		
 </div> --%>


	<!-- <div class="col-md-12 bg-ghostwhite sidenavscrollbar"
		style="height: 100vh; overflow: scroll">
		<div id="alert-box"></div> -->
		<!-- <nav class="navbar navbar-expand-sm justify-content-between bg-white"> -->

			
<div class="gradientClass" style="width: 100%;">
    <div style="height: 20px;"></div>
    <div style="display: flex; align-items: center;">
        <div style="width: 15%;">
            <img src="/ireps/images/gem-new-logo-v6.png" style="margin-left:40px;width:350px;height:auto;"/>
        </div>
        <div style="width: 65%; text-align: center;">
            <div style="color:white; font-family: 'Adobe Garamond Pro', sans-serif; font-size:27px; line-height: 1.2;">
                     <span style="font-size:23px !important; letter-spacing:1px;">
  Government eMarketplace
</span>

        <br>
        
        <!-- Subtitle -->
        <span style="color: gold; font-size:28px !important; letter-spacing: 2px;">
          			  Indian Railways E-Procurement System
        </span>
                <br>
                 <img src="/ireps/images/eAuctionSale.png" style="margin-right:10px;width:250px;height:auto;"/>
                 
                 
          </div>
         
        </div>
        
             <div style=" width: 15%;  padding-left: 20px;  ">
            <div class="controls" aria-label="Display controls" style="display:flex;  gap:5px;">
                <button class="btn" id="fontDec" title="Decrease font size" onclick="changeFontSize('decrease')">A-</button>
                <button class="btn" id="fontReset" title="Reset font size" onclick="changeFontSize('reset')">A</button>
                <button class="btn" id="fontInc" title="Increase font size" onclick="changeFontSize('increase')">A+</button>
                <button class="btn" id="themeToggle" title="Toggle dark/light" onclick="toggleDarkMode()">&#127769/&#127774</button>
            </div>
        </div>
        
        
				<div class="countdown-container" style="float:right;">
								          <div class="countdown-circle" id="countdown-timer"  style="display: none;"   >
								            <div id="timer"  class="mt-3">3:00</div>
								          </div>
			     </div> 
    <%--     <div style="width: 15%; text-align: right;">
            <select class="custom-select small-text" onchange="location = this.value;">
                <option value=""><bean:message code="header.dropdown.language"/></option>
                <option value="?language=en"><bean:message code="header.dropdown.english" /></option>
                <option value="?language=hi"><bean:message code="header.dropdown.hindi" /></option>
            </select>
        </div> --%>
        
        
    </div>
    <div style="height: 16px;"></div>
</div>
<hr style="color:#4A4A4A;margin: 0px;">
			
		

			
			<div id="navbar_actions">
				<ul class="list-group list-group-horizontal" style="cursor: pointer">
			
				</ul>
			</div>


		<!-- </nav> -->

		<hr style="margin:0;">

		<nav class="navbar navbar-m-lg p-0 navbar-dark" style="background-color: #07222e;">

		<a href="<%=response.encodeURL(request.getContextPath())%>/homePage"
   class="navbar-brand-sm"
   style="margin-left: 10px;">
  <img src="/ireps/images/LatestHome.png" alt="Home" style="width:30px;height:30px;">
</a>
 
			<div class="welcomeLabel" ><%=sessionData.getWelcomeString().trim()%> </div>
			<div class="welcomeLabel" id= 'pendlum'> </div>
			<a onclick="javascript:logout();" class="navbar-brand-sm"> <i
				class="fas fa-power-off text-white mr-2"
				style="font-size: 15px; color: red"></i>
			</a>
		</nav>


		<hr />
		<div class="row justify-content-center">
			<div class="col-md-12">
				<tiles:insertAttribute name="body" />
			</div>

		</div>
		
		
<br>

<nav class="navbar fixed-bottom navbar-expand-sm navbar-dark bg-dark">
	<div class="col-lg-12">
		<div class="row">
<div class="col-lg-4 dev-by-cris">
	    				<!-- <A  HREF="https://sealinfo.verisign.com/splash?form_file=fdf/splash.fdf&dn=www.ireps.gov.in&lang=en" TARGET="new">
						<IMG SRC="/ireps/images/common/verisign.jpg" BORDER="0"></A> -->
	    				<A class="welcomeLabe2" HREF="http://cris.org.in/" target="_blank" rel="noopener noreferrer"><font color="white"><bean:message code="home.footer.devby"/></font></A>&nbsp;&nbsp;<%=serverName%>
	    					<span style="color: white;"> 	Node : <%=node%></span>
	    		   </div>

		    		<div class="col-lg-8">
						  <div class="row justify-content-center justify-content-lg-end">
						   <a class="welcomeLabe2" href="/ireps/upload/resources/<%=about%>" target="_blank" rel="noopener noreferrer"><font color="white"><bean:message code="home.about.us" /></font></a>
				    	   &nbsp;&nbsp;<a class="welcomeLabe2" href="/ireps/upload/resources/<%=disclaim%>" target="_blank" rel="noopener noreferrer"><font color="white"><bean:message code="header.disclaimer.link.label" /></font></a>
				           &nbsp;&nbsp;<a class="welcomeLabe2" href="/ireps/upload/resources/<%=privacypol%>" target="_blank" rel="noopener noreferrer"><font color="white"><bean:message code="header.privacyStatement.link.label" /></font></a>
				           &nbsp;&nbsp;<a class="welcomeLabe2" href="http://rti.railnet.gov.in/" target="_blank" rel="noopener noreferrer"><font color="white"><bean:message code="header.rti.link.label" /></font></a>
				           &nbsp;&nbsp;<a class="welcomeLabe2" href="/ireps/upload/resources/<%=terms%>" target="_blank" rel="noopener noreferrer"><font color="white"><bean:message code="header.termsAndConditions.link.label" /></font></a>
				           &nbsp;&nbsp;<a class="welcomeLabe2" href="/ireps/upload/resources/<%=copyright%>" target="_blank" rel="noopener noreferrer"><font color="white"><bean:message code="header.rti.copyright" /></font></a>
			    	 </div>
		    		</div>

	</div>
</div>
</nav>

		<hr />


	<!-- </div> -->

	</div>
	</div>
</body>
<script type="text/javascript">

<%-- function switchToIreps(){
	var address='<%=response.encodeURL(request.getContextPath())%>
	'
				+ '/switchToIreps';
		$
				.ajax({
					type : "POST",
					url : address,
					dataType : 'text',
					success : function(result) {
						var resultString = result.split('^');
						if (resultString[0] == 'OK') {
							var param = {
								'emailId' : resultString[3],
								'userId' : resultString[2],
								'randomNumber' : resultString[1]
							};
							OpenWindowWithPost(
									resultString[4],
									"width=1000, height=600, left=100, top=100, resizable=yes, scrollbars=yes",
									"", param);
						} else {
							alert(result);
							return false;
						}
					},
					error : function(result) {
						alert("Error Occured =========>" + result);
					}
				});
	} --%>
	function OpenWindowWithPost(url, windowoption, name, params) {
		var form = document.createElement("form");
		form.setAttribute("method", "post");
		form.setAttribute("action", url);
		form.setAttribute("target", name);
		for ( var i in params) {
			if (params.hasOwnProperty(i)) {
				var input = document.createElement('input');
				input.type = 'hidden';
				input.name = i;
				input.value = params[i];
				form.appendChild(input);
			}
		}
		document.body.appendChild(form);
		//note I am using a post.htm page since I did not want to make double request to the page
		//it might have some Page_Load call which might screw things up.
		form.submit();
		document.body.removeChild(form);
	}
</script>

<script>
//clock structure creation
    function startCountdown(duration) {
      const timerElement = document.getElementById("timer");
      const countdownCircle = document.getElementById("countdown-timer");
      let timer = duration, minutes, seconds;

      const countdownInterval = setInterval(function () {
        minutes = parseInt(timer / 60, 10);
        seconds = parseInt(timer % 60, 10);

        minutes = minutes < 10 ? "0" + minutes : minutes;
        seconds = seconds < 10 ? "0" + seconds : seconds;

        timerElement.textContent = minutes + ":" + seconds;

        const progress = 100 - (timer / (duration * 60)) * 100;
        countdownCircle.style.background = `conic-gradient(#3498db ${progress}%, transparent ${progress}%)`;

        if (timer <= 10) {
          countdownCircle.classList.add("red-circle");
        }

        if (--timer < 0) {
          clearInterval(countdownInterval);
          timerElement.textContent = "00:00";
          countdownCircle.style.background = "conic-gradient(transparent)";
          // Do something when the timer reaches 0
        }
      }, 1000);
    }
//to start countdown timer for 3 minute
     function trackSessionbyClock() {
      setTimeout(function () {
        const countdownTimer = document.getElementById("countdown-timer");
        countdownTimer.style.display = "block";
        startCountdown(3 * 60); // 3 minutes countdown (3 minutes * 60 seconds)
      }, 12 * 60 * 1000);
    }

     trackSessionbyClock();  
    //session update by ajax call
    function trackSession() {
        setTimeout(function(){
        	swal({
                    //title: '',
                    text: 'Your session is going to expire shortly. Please click on OK button to continue working, or on Cancel button to logout from eAuction. Any unsaved data will be lost if you click on Cancel button.',
                    buttons: [
    		            'cancel',
    		            'OK'
    		          ],
    		          dangerMode: true,
        	}).then(function(isConfirm) {
		          if (isConfirm) {
		        	  $.ajax({
                          type:"POST",
                      url: "<%=response.encodeURL(request.getContextPath()+"/getServerReponse")%>",
                      data: {ajaxMode:"checkSession"},
                          dataType:'text',
                      success: function(result) {                                                                       
                           
                    	
                    	  if(result != '<%=sessionData.getUserId()%>')
                                      {                                            
                                              window.document.location.href = '<%=response.encodeURL(context + "/logon")%>';
                                      }
                              else
                                      {                                                            
                                              trackSession();   
                                              const countdownTimer = document.getElementById("countdown-timer");
                                              countdownTimer.style.display = "none";
                                              trackSessionbyClock();
                                      } 
                          },
                      error: function(result){
                                      
                      }
                  });
		        	  
		          } else {
  		            //swal("Cancelled", "You are not Updated days!");
  		          }
  		        });	
                  

         },1000*60*12 ); //1000*60*15
    }
    trackSession();
  </script>


<script type="text/javascript">



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
</html>



