<%String context = (String) request.getContextPath();
UserProfieForm sessionData=(UserProfieForm) session.getAttribute("sessionData");
String userType = sessionData.getUserType();
String welcomeString = sessionData.getWelcomeString().trim();
welcomeString =welcomeString.replaceAll(sessionData.getUsername().trim(), "");
%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.ireps.admin.entity.UserProfieForm"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="bean"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="html"%>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/ireps/bootstrap/css/bootstrap.min.css">
<script src="/ireps/bootstrap/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.6.3/dist/jquery.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript" src="/ireps/js/works/postRequest.js"></script>
<script src="https://kit.fontawesome.com/a076d05399.js" 
        integrity="sha256-C9VpoA7k7Mr2wL1Xnx/JQ+R5ZdD8zFJLSq8+4F7TjBw=" 
        crossorigin="anonymous"></script>
<c:set var="context" value="${pageContext.request.contextPath}" />
<%-- <c:set var="sessionData" value='${sessionScope["sessionData"]}'></c:set> --%>
<c:set var="grade" value='${sessionData.grade}' />
<c:set var="loggedInOrgZone" value='${sessionData.orgZone}' />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">





<script>
$(window).load(function() {
    $(".loader").fadeOut("slow");
});
</script>

<script>

function nthIndex(str, pat, n){
    var L= str.length, i= -1;
    while(n-- && i++<L){
        i= str.indexOf(pat, i);
        if (i < 0) break;
    }
    return i;
}

//highlight & open left nav.
$(document).ready(function(){
	var location_path =window.location.pathname;
	var startof_controller_path =nthIndex(location_path,'/',2);
	var endof_controller_path =nthIndex(location_path,'?',1);
	var controller_path;
	if(endof_controller_path <1){
		controller_path =location_path.substring(startof_controller_path);
	}else{
		controller_path =location_path.substring(startof_controller_path,endof_controller_path);
	}
	
	if(controller_path.indexOf('/homePage/dashboard')>=0){
		CreateVirtualURL(11);
	}
	
	OldWayMenuHiglight();
});

function disable()
{
	 alert("Currently Not Activated");
	 return false;
}

function checkAuth()
{
	<c:if test="${not empty errorMsg}">
  
        alert("${errorMsg}");
	</c:if>   

}


 function CreateVirtualURL(linkno){
	
 	var linkid ='link'+linkno;
 	localStorage.setItem('sidenavlinkID',linkid);
    
 	//store id of the link holder.
    var linkholderid =$( '#'+linkid ).parent().parent().attr('id');
    localStorage.setItem('sidenavLinkHolderID',linkholderid);
 	
 	//setting up scroll.
 	var ele =document.getElementById('sidebar');
 	var leftnav_scrollbar_position =ele.scrollTop;
	
 	localStorage.setItem('leftnav_scrollbar_position',leftnav_scrollbar_position);
 	localStorage.setItem('fromTabId',''); //when click on any link of sidenav then set tabid to null.
 }
</script>


<style>
    /* Style for menu items */
    .layouts a {
        color: blue; /* Set text color to blue */
        font-weight: bold; /* Set font weight to bold */
    }
    
    
#sidebar {
    width: 300px; /* Adjust the width as per your requirement */
    /* Add other styling properties here */
}

#sidebarCollapse {
    width: 40px; /* Adjust the width of the collapse button if needed */
    /* Add other styling properties here */
}

#content {
    margin-left: 300px; /* Adjust the margin to accommodate the increased width of the sidebar */
    /* Add other styling properties here */
}    
    
    
    #menu13 {
    width: 250px; /* Adjust the width of the submenu container as needed */
    /* Add other styling properties here */
}

/* Adjust the width of the submenu items if necessary */
#menu13 li a {
    width: 100%; /* Set the width to fill the submenu container */
    /* Add other styling properties here */
}
    
    
  /* Adjust the width of the submenu container */
#menu2 {
    width: 250px; /* Adjust the width as needed */
}

/* Ensure submenu items appear in the same line */
#menu2 li {
    display: inline-block;
    width: 100%;
}

/* Add padding and margin to submenu items if necessary */
#menu2 li a {
    padding: 10px; /* Adjust padding as needed */
    margin: 0 5px; /* Adjust margin as needed */
}  
</style>

<script>
var proto=location.protocol;//"https:";
var hostadd=window.location.host;
var linkUrl;

var res = hostadd.substring(0,3);
var context = "eps";
var getUrl= '<%=response.encodeURL(request.getContextPath())%>';
if(res!='www') 
{
	linkUrl=proto+"//www." +hostadd + "/";
}
if((hostadd=="10.60.200.142") || (hostadd=="203.176.113.40"))
{
	linkUrl=proto+"//" +hostadd;
}
else 
	linkUrl=proto+"//" +hostadd;
function GoToHome() 
{
	window.document.location.href=linkUrl+getUrl+"/homeSalePage";
}


</script>

<style>

.layouts{
margin-left:15px;
}

.sidenavscrollbar, .sidebar-header, #link11, #link12, #link13, #link21,
	#link22, #link23, #link24, #link25, #link26, #link27,#link28,#link29,#link211,#link212, #link31, #link32,
	 #link33, #link34,#link35,#link36,#link37,#link38, #link41, #link42,#link43,#link51, #link52,#link53,
	  #link61, #link62,#link63,#link71, #link72,#link81, #link82,#link83,#link84,#link91,
	#link92, #link93, #link94, #link95, #link96, #link97,#link98,#link99,#link911,#link912,#link913,
	#link914,#link915, .dropdown-toggle {
	background-color: #e3e8ed;
	color: black;
	border-radius: 6px;
}


/* Initially collapse all submenus */
.collapse {
    display: none;
}

/* Show submenus with 'show' class */
.show {
    display: block;
}

/* General styles for menu list */
ul.layouts {
    list-style: none;
    padding: 0;
    margin: 0;
}

/* Style each menu item */
ul.layouts li {
    margin: 8px 0; /* space between items */
}

/* Style the links inside menu */
ul.layouts li a {
    display: flex; /* for icon and text alignment */
    align-items: center; /* vertical alignment */
    padding: 8px 12px;
    text-decoration: none;
    color: #333;
    border-radius: 4px;
    transition: background-color 0.3s, color 0.3s;
    font-size: 14px;
    line-height: 1.4;
    white-space: normal; /* allow wrapping */
}

/* Icon styling */
ul.layouts li a i {
    margin-right: 8px;
    font-size: 14px;
    color: #007bff; /* icon color */
}

/* Hover effect */
ul.layouts li a:hover {
    background-color: #f0f0f0;
    color: #007bff;
}

/* Active state (optional, can be added via JS) */
ul.layouts li a.active {
    background-color: #007bff;
    color: white;
}

/* Handling text inside */
ul.layouts li a span {
    display: block;
    word-break: break-word; /* for long text or if line break needed */
}

/* Optional: if you want a slight separator */
ul.layouts li:not(:last-child) {
    border-bottom: 1px solid #ddd;
    padding-bottom: 6px;
}

/* For submenu look */
ul.layouts li ul {
    margin-left: 16px; /* Indent submenu */
    margin-top: 4px;
}

</style>
<div class="loader"></div>
<div style="position: fixed; top: 0px; z-index: 1000;">
	<button type="button" id="sidebarCollapse" class="btn btn-dark">
		<i class='fas fa-bars' style='font-size: 20px'></i>
	</button>
	<!--                     <button class="btn btn-dark d-inline-block d-lg-none ml-auto" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"> -->
	<!--                         <i class='fas fa-stream' style='font-size:20px'></i> -->
	<!--                     </button> -->
</div>
<!-- Sidebar  -->
<nav id="sidebar"
	class="">
	<div id="mCSB_1"
		class="mCustomScrollBox mCS-minimal mCSB_vertical mCSB_outside justify-content-center"
		style="max-height: none; font-size: 16px;" tabindex="0">
		<div id="mCSB_1_container"
			class="mCSB_container mCS_y_hidden mCS_no_scrollbar_y"
			style="position: relative; top: 0; left: 0;" dir="ltr">
			
				<!-- User info section starts -->
				<div class="sidebar-user "
					style="height: 150px; border: 0px solid black;">
					<div class="">
						<img src="/ireps/images/avatar.png"
							class="img-fluid rounded-circle mb-2">
					</div>
					<div class="" style="text-align: center">
						<div class="font-weight-bold"><%=sessionData.getUsername() %></div>
						<small><%=welcomeString %></small>
                   <%--     <div style="color: red;">${logonForm.designation}</div> --%>
                   <div class="font-weight-bold" style="color: red;"><%=sessionData.getDesignation() %></div>
					</div>
				</div>
				<!-- User info section ends -->
			
			
				<ul class="list-unstyled components">
				



<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%-- Import necessary Java packages --%>
<%@ page import="com.ireps.admin.entity.UserProfieForm" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.ArrayList" %>

<%-- Retrieve necessary data from session --%>


<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="/ireps/bootstrap/css/bootstrap.min.css">
    <script src="/ireps/bootstrap/js/bootstrap.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.3/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
    <script type="text/javascript" src="/ireps/js/works/postRequest.js"></script>
<script src="https://kit.fontawesome.com/a076d05399.js" 
        integrity="sha256-C9VpoA7k7Mr2wL1Xnx/JQ+R5ZdD8zFJLSq8+4F7TjBw=" 
        crossorigin="anonymous"></script>
</head>
<body>

<!-- Sidebar navigation -->
<%-- <nav id="sidebar">
     <div class="sidebar-header sticky-top"> 
        <div class="sidebar-user">
            <img src="/ireps/images/avatar.png" class="img-fluid rounded-circle mb-2">
            <div style="text-align: center">
                <div class="font-weight-bold"><%= sessionData.getUsername() %></div>
                <small><%= welcomeString %></small>
            </div>
        </div>
    </div>
           --%>    
		
	<div class="background-content">			
				 
    <ul class="list-unstyled components">
    
 <li class="layouts">
    <a href="#" onclick="javascript:CreateVirtualURL(06); postRequest('<c:out value='${context }'/>/learningCenter?tabno=tab0'); event.cancelBubble=true;" title="Learning Center">
        <nobr>
            <i class="fas fa-graduation-cap" style="font-size: 18px; margin-left:10px;" aria-hidden="true"></i>&nbsp;&nbsp; Learning center &nbsp;
        </nobr>
    </a> 
</li>
    
     <li class="layouts">
    <a href="https://ireps.gov.in/html/helpdesk/helpdesk.html" target="_blank" title="Frequently Asked Question">
        <nobr>
            <i class="fas fa-question-circle" style="font-size: 18px;margin-left:10px;" aria-hidden="true"></i>&nbsp;&nbsp; Helpdesk &nbsp;
        </nobr>
    </a> 
</li>
   
   <li class="layouts">
    <a href="https://ireps.gov.in/ireps/upload/resources/Rly_User_FAQ.pdf" target="_blank" title="Frequently Asked Question">
        <nobr>
            <i class="fas fa-life-ring" style="font-size: 18px;margin-left:10px;" aria-hidden="true"></i>&nbsp;&nbsp; FAQ &nbsp;
        </nobr>
    </a> 
</li>

     <li class="layouts" >
            
             <a id="" title="Dashboard" href="#" onclick="javascript:CreateVirtualURL(31);postRequest('<c:out value='${context }'/>/mapHrmsIdLogin?tabno=tab0');event.cancelBubble=true;">
                <nobr>
<i class="fa fa-american-sign-language-interpreting" style="font-size: 18px; margin-left: 10px; background-color: #dadada  !important;" aria-hidden="true"></i> &nbsp;Map Hrms Id&nbsp;&nbsp;
                </nobr>
            </a>
     </li>

       <li class="layouts" >
            
             <a id="" title="Dashboard" href="#" onclick="javascript:CreateVirtualURL(31);postRequest('<c:out value='${context }'/>/dashBoard?tabno=tab0');event.cancelBubble=true;">
                <nobr>
<i class="fas fa-chart-bar icon" style="font-size: 18px; margin-left: 10px; background-color: #dadada  !important;" aria-hidden="true"></i>Graph Chart &nbsp;&nbsp;
 <img src="/ireps/images/common/animated_new.gif">
                </nobr>
            </a>
     </li>

  

    <li class="layouts">
    <a href="#" class="menu-toggle" onclick="toggleSubMenu('menu13')" title="Quick Access">
        <nobr>
            <i class="fas fa-bolt" style="font-size: 18px; margin-left: 10px;" aria-hidden="true"></i>&nbsp;&nbsp;Quick Access
            <i class="fas fa-caret-down" style="font-size: 14px; float: right;"></i>
        </nobr>
    </a> 
    <ul class="collapse list-unstyled layouts" id="menu13">
        <li>
            <a id="link131" title="View and Publish Category Sequencing" href="#" onclick="CreateVirtualURL(131);postRequest('<c:out value='${context }'/>/viewAndPublishCataegorySequencing?tabno=tab0');event.cancelBubble=true;">
                <div style="display: flex; align-items: center;">
                    <i class="fas fa-arrow-right" aria-hidden="true" style="margin-right: 6px;"></i>
                    <span>View and Publish<br>Category Sequencing</span>
                </div>
            </a>
        </li>
    </ul>
</li>
    

	
	
	<li class="layouts">
  <a href="#" class="menu-toggle" onclick="toggleSubMenu('menu2')" title="My Profile">
    <nobr>
      <i class="fa fa-user" style="font-size: 18px; margin-left:10px;" aria-hidden="true"></i>&nbsp;&nbsp; My Profile
    </nobr> 
    <i class="fas fa-caret-down" style="font-size: 14px; float: right;"></i>
  </a> 

  <ul class="collapse list-unstyled layouts" id="menu2">
    <li>
      <a id="link21" title="View/Edit My Profile" href="#" onclick="javascript:CreateVirtualURL(21); postRequest('<c:out value='${context }'/>/viewEditAuctionProfile?tabno=tab0'); event.cancelBubble=true;">
        <div style="display: flex; align-items: center;">
          <i class="fas fa-arrow-right" style="margin-right: 6px;"></i>
          <span>View/Edit My Profile</span>
        </div>
      </a>
    </li>

    <li>
      <a id="link22" title="View My Account Profile" href="#" onclick="javascript:CreateVirtualURL(22);postRequest('<c:out value='${context}'/>/viewMyAccountProfile?tabno=tab0');event.cancelBubble=true;">
        <div style="display: flex; align-items: center;">
          <i class="fas fa-arrow-right" style="margin-right: 6px;"></i>
          <span>View My Account Profile</span>
        </div>
      </a>
    </li>

    <li>
      <a id="link23" title="Search Account" href="#" onclick="javascript:CreateVirtualURL(23);postRequest('<c:out value='${context }'/>/searchAccounts?tabno=tab2');event.cancelBubble=true;">
        <div style="display: flex; align-items: center;">
          <i class="fas fa-arrow-right" style="margin-right: 6px;"></i>
          <span>Search Account</span>
        </div>
      </a>
    </li> 

    <li>
      <a id="link24" title="Search Users" href="#" onclick="javascript:CreateVirtualURL(24);postRequest('<c:out value='${context }'/>/Search?tabno=tab0');event.cancelBubble=true;">
        <div style="display: flex; align-items: center;">
          <i class="fas fa-arrow-right" style="margin-right: 6px;"></i>
          <span>Search Users</span>
        </div>
      </a>
    </li>

    <li>
      <a id="link25" title="Know Valid HSN Code" href="#" onclick="javascript:CreateVirtualURL(25);postRequest('<c:out value='${context }'/>/hsnValidation?tabno=tab2');event.cancelBubble=true;">
        <div style="display: flex; align-items: center;">
          <i class="fas fa-arrow-right" style="margin-right: 6px;"></i>
          <span>Know Valid HSN Code</span>
        </div>
      </a>
    </li>

    <% if (!userType.equals("9")) { %>
    <li>
      <a id="link26" title="Update HSN Code For Published Lot" href="#" onclick="javascript:CreateVirtualURL(26);postRequest('<c:out value='${context }'/>/updateHsnCode?tabno=tab2');event.cancelBubble=true;">
        <div style="display: flex; align-items: center;">
          <i class="fas fa-arrow-right" style="margin-right: 6px;"></i>
          <span>Update HSN Code For Published Lot</span>
        </div>
      </a>
    </li>
    <% } %>

    <li>
      <a id="link27" title="Change Login Password" href="#" onclick="javascript:CreateVirtualURL(27);postRequest('<c:out value='${context }'/>/showChangeMyPasswordForm?tabno=tab2');event.cancelBubble=true;">
        <div style="display: flex; align-items: center;">
          <i class="fas fa-arrow-right" style="margin-right: 6px;"></i>
          <span>Change Login Password</span>
        </div>
      </a>
    </li>

    <li>
      <a id="link28" title="Enable MobileApp Access" href="#" onclick="disable();">
        <div style="display: flex; align-items: center;">
          <i class="fas fa-arrow-right" style="margin-right: 6px;"></i>
          <span>Enable MobileApp Access</span>
        </div>
      </a> 
    </li> 

    <li>
      <a id="link29" title="eAuction Workdone" href="#" onclick="javascript:CreateVirtualURL(27);postRequest('<c:out value='${context }'/>/workdoneEauction?tabno=tab0');CreateVirtualURL(71);event.cancelBubble=true;">
        <div style="display: flex; align-items: center;">
          <i class="fas fa-arrow-right" style="margin-right: 6px;"></i>
          <span>eAuction Workdone</span>
        </div>
      </a>
    </li>
  </ul>
</li>
	
	
	
    
    <li class="layouts">
  <a href="#" class="menu-toggle" onclick="toggleSubMenu('menu3')" title="Lot Module">
    <nobr>
      <i class="fas fa-file-alt" style="font-size: 18px;margin-left:10px;" aria-hidden="true"></i>&nbsp;&nbsp; Lot Module
      <i class="fas fa-caret-down" style="font-size: 14px; float: right;"></i>
    </nobr>
  </a>

  <ul class="collapse list-unstyled layouts" id="menu3">

    <li>
      <a id="link31" title="Create Lot" href="#" onclick="javascript:CreateVirtualURL(31);postRequest('<c:out value='${context }'/>/createLot?tabno=tab0');event.cancelBubble=true;">
        <div style="display: flex; align-items: center;">
          <i class="fas fa-arrow-right" aria-hidden="true" style="margin-right: 6px;"></i>
          <span>Create Lot</span>
        </div>
      </a>
    </li>

    <li>
      <a id="link32" title="Create Lot -TMS (P-way)" href="#" onclick="javascript:CreateVirtualURL(32);postRequest('<c:out value='${context }'/>/createTMSLot?tabno=tab2');event.cancelBubble=true;">
        <div style="display: flex; align-items: center;">
          <i class="fas fa-arrow-right" aria-hidden="true" style="margin-right: 6px;"></i>
          <span>Create Lot -TMS (P-way)</span>
        </div>
      </a>
    </li>

    <li>
      <a id="link33" title="Search Lot" href="#" onclick="javascript:CreateVirtualURL(33);postRequest('<c:out value='${context }'/>/searchLot1?tabno=tab6');event.cancelBubble=true;">
        <div style="display: flex; align-items: center;">
          <i class="fas fa-arrow-right" aria-hidden="true" style="margin-right: 6px;"></i>
          <span>Search Lot</span>
        </div>
      </a>
    </li>

    <li>
      <a id="link34" title="Publish Lot(s)" href="#" onclick="javascript:CreateVirtualURL(34);postRequest('<c:out value='${context }'/>/lotPublish?tabno=tab3');event.cancelBubble=true;">
        <div style="display: flex; align-items: center;">
          <i class="fas fa-arrow-right" aria-hidden="true" style="margin-right: 6px;"></i>
          <span>Publish Lot(s)</span>
        </div>
      </a>
    </li>

    <li>
      <a id="link35" title="View Published/DePublish Lot(s)" href="#" onclick="javascript:CreateVirtualURL(35);postRequest('<c:out value='${context }'/>/viewLotPublish?tabno=tab9');event.cancelBubble=true;">
        <div style="display: flex; align-items: center;">
          <i class="fas fa-arrow-right" aria-hidden="true" style="margin-right: 6px;"></i>
          <span>View Published/DePublish Lot(s)</span>
        </div>
      </a>
    </li>

    <li>
      <a id="link36" title="Re-Publish/DePublished Lot(s)" href="#" onclick="javascript:CreateVirtualURL(36);postRequest('<c:out value='${context }'/>/withdrawLotPublish?tabno=tab9');event.cancelBubble=true;">
        <div style="display: flex; align-items: center;">
          <i class="fas fa-arrow-right" aria-hidden="true" style="margin-right: 6px;"></i>
          <span>Re-Publish/DePublished Lot(s)</span>
        </div>
      </a>
    </li>

    <li>
      <a id="link37" title="View Published Data For Upcoming Auction" href="#" onclick="javascript:CreateVirtualURL(37);postRequest('<c:out value='${context }'/>/viewLotPublishBidder?tabno=tab3');event.cancelBubble=true;">
        <div style="display: flex; align-items: center;">
          <i class="fas fa-arrow-right" aria-hidden="true" style="margin-right: 6px;"></i>
          <span>View Published Data For Upcoming Auction</span>
        </div>
      </a>
    </li>

  </ul>
</li>
    
      
    
      
      <li class="layouts">
    <%
        if (userType.equals("8")) {
    %>
    <a href="#" class="menu-toggle" onclick="toggleSubMenu('menu4')" title="Update Parameter">
        <nobr>
            <i class="fas fa-edit" style="font-size: 18px;margin-left:10px;" aria-hidden="true"></i>&nbsp;&nbsp; Update Parameter
            <i class="fas fa-caret-down" style="font-size: 14px; float: right;"></i>
        </nobr>
    </a>
    <ul class="collapse list-unstyled layouts" id="menu4">

        <li>
            <a id="link41" title="Update Min. Increment Value" href="#" onclick="postRequest('<c:out value='${context }'/>/updateMinIncrementValue?tabno=tab0');CreateVirtualURL(41);event.cancelBubble=true;">
                <div style="display: flex; align-items: center;">
                    <i class="fas fa-arrow-right" aria-hidden="true" style="margin-right: 6px;"></i>
                    <span>Update Min. Increment Value</span>
                </div>
            </a>
        </li>

        <li>
            <a id="link42" title="Enter/Update Allocations" href="#" onclick="postRequest('<c:out value='${context }'/>/enterUpdateAllocations?tabno=tab2');CreateVirtualURL(42);event.cancelBubble=true;">
                <div style="display: flex; align-items: center;">
                    <i class="fas fa-arrow-right" aria-hidden="true" style="margin-right: 6px;"></i>
                    <span>Enter/Update Allocations</span>
                </div>
            </a>
        </li>

        <li>
            <a id="link43" title="Enter/Update BSV Interest Rate" href="#" onclick="postRequest('<c:out value='${context }'/>/enterUpdateBsvInterestRate?tabno=tab6');CreateVirtualURL(43);event.cancelBubble=true;">
                <div style="display: flex; align-items: center;">
                    <i class="fas fa-arrow-right" aria-hidden="true" style="margin-right: 6px;"></i>
                    <span>Enter/Update BSV Interest Rate</span>
                </div>
            </a>
        </li>

    </ul>
    <% } %>
</li>
      
      
        	
       	<li class="layouts">
    <a href="#" class="menu-toggle" onclick="toggleSubMenu('menu5')" title="Bidder">
        <nobr>
            <i class="fas fa-address-card" style="font-size: 18px;margin-left:10px;" aria-hidden="true"></i>&nbsp;&nbsp; Bidder
            <i class="fas fa-caret-down" style="font-size: 14px; float: right;"></i>
        </nobr>
    </a> 
    <ul class="collapse list-unstyled layouts" id="menu5">

        <% if (userType.equals("8") || userType.equals("9")) { %>
        <li>
            <a id="link51" title="Approve Bidder Registration" href="#" onclick="postRequest('<c:out value='${context }'/>/approveBiddderRegistrations?tabno=tab0');CreateVirtualURL(51);event.cancelBubble=true;">
                <div style="display: flex; align-items: center;">
                    <i class="fas fa-arrow-right" aria-hidden="true" style="margin-right: 6px;"></i>
                    <span>Approve Bidder Registration</span>
                </div>
            </a>
        </li>
        <% } %>

        <li>
            <a id="link52" title="Search Bidder" href="#" onclick="postRequest('<c:out value='${context }'/>/searchBiddder?tabno=tab2');CreateVirtualURL(52);event.cancelBubble=true;">
                <div style="display: flex; align-items: center;">
                    <i class="fas fa-arrow-right" aria-hidden="true" style="margin-right: 6px;"></i>
                    <span>Search Bidder</span>
                </div>
            </a>
        </li>

        <li>
            <a id="link53" title="Auto-Decide Bids" href="#" onclick="postRequest('<c:out value='${context }'/>/ChooseCatalogToClose?tabno=tab6');CreateVirtualURL(53);event.cancelBubble=true;">
                <div style="display: flex; align-items: center;">
                    <i class="fas fa-arrow-right" aria-hidden="true" style="margin-right: 6px;"></i>
                    <span>Auto-Decide Bids</span>
                </div>
            </a>
        </li>

    </ul>
</li>
       	
       		
			
			<li class="layouts">
    <a href="#" class="menu-toggle" onclick="toggleSubMenu('menu6')" title="E-Auction">
<div style="display: inline-block; width: 100%; max-width: 300px; line-height: 1.4; font-family: Arial, sans-serif; position: relative;">
  <div> <b>
    <i class="fas fa-gavel" style="font-size: 18px; margin-right: 5px;" aria-hidden="true"></i>
    View/Create
  </div>
  <div style="position: relative; padding-right: 20px;">
   Schedule/ Catalog
    <i class="fas fa-caret-down" style="font-size: 14px; position: absolute; right: 0; top: 0;"></i>
</b>  </div>
</div>

    </a>
    <ul class="collapse list-unstyled layouts" id="menu6">

        <li>
            <a id="link61" title="Create/Update E-Auction Schedule" href="#" onclick="postRequest('<c:out value='${context }'/>/createSchedule?task=showpage&tabno=tab0');CreateVirtualURL(61);event.cancelBubble=true;">
                <div style="display: flex; align-items: center;">
                    <i class="fas fa-arrow-right" aria-hidden="true" style="margin-right: 6px;"></i>
                    <span>Create/Update E-Auction Schedule</span>
                </div>
            </a>
        </li>

        <li>
            <a id="link62" title="View E-Auction Schedules of All Units" href="#" onclick="postRequest('<c:out value='${context }'/>/viewAuctionScheduleForAllUnits?tabno=tab2');CreateVirtualURL(62);event.cancelBubble=true;">
                <div style="display: flex; align-items: center;">
                    <i class="fas fa-arrow-right" aria-hidden="true" style="margin-right: 6px;"></i>
                    <span>View E-Auction Schedules of All Units</span>
                </div>
            </a>
        </li>

        <li>
            <a id="link63" title="Manually Create Auction Catalogue" href="#" onclick="postRequest('<c:out value='${context }'/>/createAutoCatalog?tabno=tab6');CreateVirtualURL(63);event.cancelBubble=true;">
                <div style="display: flex; align-items: center;">
                    <i class="fas fa-arrow-right" aria-hidden="true" style="margin-right: 6px;"></i>
                    <span>Manually Create Auction Catalogue</span>
                </div>
            </a>
        </li>

    </ul>
</li>
			
	 
    
    <li class="layouts">
    <a href="#" class="menu-toggle" onclick="toggleSubMenu('menu7')" title="E-Reports">
        <nobr>
            <i class="fa fa-file" style="font-size: 18px;margin-left:10px;" aria-hidden="true"></i>&nbsp;&nbsp; E-Reports
            <i class="fas fa-caret-down" style="font-size: 14px; float: right;"></i>
        </nobr>
    </a> 
    <ul class="collapse list-unstyled layouts" id="menu7">
        <%
            if (userType.equals("8") || userType.equals("9")) {
        %>
        <li>
            <a id="link71" title="Auction Reports" href="#" onclick="postRequest('<c:out value='${context }'/>/auctionReports?tabno=tab0');CreateVirtualURL(71);event.cancelBubble=true;">
                <div style="display: flex; align-items: center;">
                    <i class="fas fa-arrow-right" aria-hidden="true" style="margin-right: 6px;"></i>
                    <span>Auction Reports</span>
                </div>
            </a>
        </li>
        <%
            }
        %>

        <li>
            <a id="link72" title="Verify E-Scroll Payment" href="#" onclick="postRequest('<c:out value='${context }'/>/verifyEscrollPayment?tabno=tab0');CreateVirtualURL(72);event.cancelBubble=true;">
                <div style="display: flex; align-items: center;">
                    <i class="fas fa-arrow-right" aria-hidden="true" style="margin-right: 6px;"></i>
                    <span>Verify E-Scroll Payment Report</span>
                </div>
            </a>
        </li>

        <li>
            <a id="link73" title="E-Scroll Report" href="#" onclick="postRequest('<c:out value='${context }'/>/eScrollReport?tabno=tab0');CreateVirtualURL(73);event.cancelBubble=true;">
                <div style="display: flex; align-items: center;">
                    <i class="fas fa-arrow-right" aria-hidden="true" style="margin-right: 6px;"></i>
                    <span>E-Scroll Report</span>
                </div>
            </a>
        </li>

        <li>
            <a id="link74" title="Sold Rate Report (Last 90 days)" href="#" onclick="postRequest('<c:out value='${context }'/>/soldRateReport?tabno=tab0');CreateVirtualURL(74);event.cancelBubble=true;">
                <div style="display: flex; align-items: center;">
                    <i class="fas fa-arrow-right" aria-hidden="true" style="margin-right: 6px;"></i>
                    <span>Sold Rate Report (Last 90 days)</span>
                </div>
            </a>
        </li>
        
     
<%
    if ("depotadmin10@gmail.com".equals(sessionData.getEmailId()) ||
        "753348".equals(sessionData.getDepotId()) ||
        "188460".equals(sessionData.getDepotId())) {
%>
    <li>
        <a id="link74" 
           title="Search lot details" 
           href="#" 
           onclick="postRequest('<c:out value='${context}'/>/searchLotDetails?tabno=tab0'); CreateVirtualURL(74); event.cancelBubble = true;">
            <div style="display: flex; align-items: center;">
                <i class="fas fa-arrow-right" aria-hidden="true" style="margin-right: 6px;"></i>
                <span>Search lot details</span>
            </div>
        </a>
    </li>
<% 
    } 
%>


    </ul>
</li>
    
    
    
    
    
    
             
		   
		   
		   <li class="layouts">
    <a href="#" class="menu-toggle" onclick="toggleSubMenu('menu8')" title="Documents">
        <nobr>
            <i class="fa fa-book" style="font-size: 18px;margin-left:10px;" aria-hidden="true"></i>&nbsp;&nbsp;Documents
            <i class="fas fa-caret-down" style="font-size: 14px; float: right;"></i>
        </nobr>
    </a> 
    <ul class="collapse list-unstyled layouts" id="menu8">
        <li>
            <a id="link81" title="View & Publish Depot Condition" href="#" onclick="postRequest('<c:out value='${context }'/>/uploadDocs?frontPage=yes&tabno=tab0');CreateVirtualURL(81);event.cancelBubble=true;">
                <div style="display: flex; align-items: center;">
                    <i class="fas fa-arrow-right" aria-hidden="true" style="margin-right: 6px;"></i>
                    <span>View & Publish Depot Condition</span>
                </div>
            </a>
        </li>
    </ul>
</li>
		   
		   
		   
		   
		    <!-- Added by Shadab -->	
				
				
		    
		    <% if (!userType.equals("9")) { %>
<li class="layouts">
    <a href="#" class="menu-toggle" onclick="toggleSubMenu('menu9')" title="Admin Function">
        <nobr>
            <i class="fas fa-user-tie" style="font-size: 18px;margin-right:10px;" aria-hidden="true"></i>&nbsp;&nbsp;Admin Function
            <i class="fas fa-caret-down" style="font-size: 14px; float: right;"></i>
        </nobr>
    </a>
    <ul class="collapse list-unstyled layouts" id="menu9">

        <li>
            <a id="link91" title="Search/Edit Account" href="#" onclick="postRequest('<c:out value='${context }'/>/searchAccounts?tabno=tab0');CreateVirtualURL(91);event.cancelBubble=true;">
                <div style="display: flex; align-items: center;">
                    <i class="fas fa-arrow-right" aria-hidden="true" style="margin-right: 6px;"></i>
                    <span>Search/Edit Account</span>
                </div>
            </a>
        </li>

        <li>
            <a id="link92" title="Search/Edit Users" href="#" onclick="postRequest('<c:out value='${context }'/>/Search?tabno=tab0');CreateVirtualURL(24);event.cancelBubble=true;">
                <div style="display: flex; align-items: center;">
                    <i class="fas fa-arrow-right" aria-hidden="true" style="margin-right: 6px;"></i>
                    <span>Search/Edit Users</span>
                </div>
            </a>
        </li>

        <li>
            <a id="link93" title="Bidder De-Registration" href="#" onclick="postRequest('<c:out value='${context }'/>/showDeregistration?tabno=tab2');CreateVirtualURL(93);event.cancelBubble=true;">
                <div style="display: flex; align-items: center;">
                    <i class="fas fa-arrow-right" aria-hidden="true" style="margin-right: 6px;"></i>
                    <span>Bidder De-Registration</span>
                </div>
            </a>
        </li>



        <li>
            <a id="link94" title="Add AU_Code" href="#" onclick="postRequest('<c:out value='${context }'/>/mapAccountingUnitCode?tabno=tab2');CreateVirtualURL(94);event.cancelBubble=true;">
                <div style="display: flex; align-items: center;">
                    <i class="fas fa-arrow-right" aria-hidden="true" style="margin-right: 6px;"></i>
                    <span>Add AU_Code</span>
                </div>
            </a>
        </li>

        <li>
            <a id="link95" title="Auto Decide Bids" href="#" onclick="postRequest('<c:out value='${context }'/>/ChooseCatalogToClose?tabno=tab2');CreateVirtualURL(95);event.cancelBubble=true;">
                <div style="display: flex; align-items: center;">
                    <i class="fas fa-arrow-right" aria-hidden="true" style="margin-right: 6px;"></i>
                    <span>Auto Decide Bids</span>
                </div>
            </a>
        </li>

        <li>
            <a id="link96" title="Upload Encryption Certificate" href="#" onclick="postRequest('<c:out value='${context }'/>/UploadEncrypCertNew?tabno=tab2');CreateVirtualURL(96);event.cancelBubble=true;">
                <div style="display: flex; align-items: center;">
                    <i class="fas fa-arrow-right" aria-hidden="true" style="margin-right: 6px;"></i>
                    <span>Upload Encryption Certificate</span>
                </div>
            </a>
        </li>

        <li>
            <a id="link98" title="Verify CPCB/SPCB Certificate" href="#" onclick="postRequest('<c:out value='${context }'/>/verifyCertificate?task=showPage');CreateVirtualURL(98);event.cancelBubble=true;">
                <div style="display: flex; align-items: center;">
                    <i class="fas fa-arrow-right" aria-hidden="true" style="margin-right: 6px;"></i>
                    <span>Verify CPCB/SPCB Certificate</span>
                </div>
            </a>
        </li>

        <li>
            <a id="link911" title="Today's Mark and Unmark Details" href="#" onclick="postRequest('<c:out value='${context }'/>/viewMarkUnmark?tabno=tab2');CreateVirtualURL(911);event.cancelBubble=true;">
                <div style="display: flex; align-items: center;">
                    <i class="fas fa-arrow-right" aria-hidden="true" style="margin-right: 6px;"></i>
                    <span>Today's Mark and Unmark Details</span>
                </div>
            </a>
        </li>

        <li>
            <a id="link912" title="View and Publish Category Sequencing" href="#" onclick="postRequest('<c:out value='${context }'/>/viewAndPublishCataegorySequencing?tabno=tab2');CreateVirtualURL(912);event.cancelBubble=true;">
                <div style="display: flex; align-items: center;">
                    <i class="fas fa-arrow-right" aria-hidden="true" style="margin-right: 6px;"></i>
                    <span>View and Publish Category Sequencing</span>
                </div>
            </a>
        </li>

        <% if(sessionData.getEmailId()!=null && (
            sessionData.getEmailId().equals("depotadmin10@gmail.com") || 
            sessionData.getEmailId().equals("depotadmin5@gmail.com") || 
            sessionData.getEmailId().equals("testspring1@gmail.com") || 
            sessionData.getEmailId().equals("rcfuser1@gmail.com"))) { %>

        <li>
            <a id="link913" title="Success/Fail BSV Payment for Testing" href="#" onclick="postRequest('<c:out value='${context }'/>/bsvPayment?tabno=tab2');CreateVirtualURL(913);event.cancelBubble=true;">
                <div style="display: flex; align-items: center;">
                    <i class="fas fa-arrow-right" aria-hidden="true" style="margin-right: 6px;"></i>
                    <span>Success/Fail BSV Payment for Testing</span>
                </div>
            </a>
        </li>

        <li>
            <a id="link914" title="Manual Sync Mark/Unmark" href="#" onclick="postRequest('<c:out value='${context }'/>/manualSync');CreateVirtualURL(914);event.cancelBubble=true;">
                <div style="display: flex; align-items: center;">
                    <i class="fas fa-arrow-right" aria-hidden="true" style="margin-right: 6px;"></i>
                    <span>Manual Sync Mark/Unmark</span>
                </div>
            </a>
        </li>

        <% } %>

        <li>&nbsp;&nbsp;</li>
    </ul>
</li>
<% } %>
		    
		    
<li class="layouts">

 <a id="link94" title="View TDS Ledger of bidders" href="#" 
   onclick="postRequest('<c:out value='${context }'/>/viewTDSLedger?tabno=tab2');CreateVirtualURL(94);event.cancelBubble=true;">
    <span style="display: inline-flex; align-items: center;">
        <span style="position: relative; width: 24px; height: 24px; margin-right: 6px; display: inline-block;">
            <img src="https://cdn.iconscout.com/icon/free/png-512/free-tds-icon-download-in-svg-png-gif-file-formats--tax-bill-receipt-payment-deducted-services-pack-business-icons-1538212.png?f=webp&amp;w=256"
                 alt="TDS Icon"
                 style="width: 100%; height: 100%;" />
            <span style="position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%);
                         font-weight: bold; font-size: 10px; color: black;">TDS</span>
        </span>
        <span style="">View TDS Ledger of bidders</span>
    </span>
</a>

</li>


		    
		    
		  
		  
		   <li class="layouts">
    <a href="#" class="menu-toggle" onclick="toggleSubMenu('menu10')" title="Direct Sale">
        <nobr>
            <i class="fa fa-user" style="font-size: 18px; margin-left:10px;" aria-hidden="true"></i>&nbsp;&nbsp;Direct Sale
            <i class="fas fa-caret-down" style="font-size: 14px; float: right;"></i>
        </nobr>
    </a>
    <ul class="collapse list-unstyled layouts" id="menu10">

        <li>
            <a id="link101" title="Generate Sale Order" href="#" onclick="checkAuth();postRequest('<c:out value='${context }'/>/directSale?tabno=tab0');CreateVirtualURL(101);event.cancelBubble=true;">
                <div style="display: flex; align-items: center;">
                    <i class="fas fa-arrow-right" aria-hidden="true" style="margin-right: 6px;"></i>
                    <span>Generate Sale Order</span>
                </div>
            </a>
        </li>
        
 		<li>
            <a id="link104" title="My Sale Order" href="#" onclick="postRequest('<c:out value='${context }'/>/mySaleOrder?tabno=tab0');CreateVirtualURL(104);event.cancelBubble=true;">
                <div style="display: flex; align-items: center;">
                    <i class="fas fa-arrow-right" aria-hidden="true" style="margin-right: 6px;"></i>
                    <span>My Sale Order</span>
                </div>
            </a>
        </li>
        <li>
            <a id="link102" title="Generate Delivery Order" href="#" onclick="postRequest('<c:out value='${context }'/>/generateDO?tabno=tab0');CreateVirtualURL(102);event.cancelBubble=true;">
                <div style="display: flex; align-items: center;">
                    <i class="fas fa-arrow-right" aria-hidden="true" style="margin-right: 6px;"></i>
                    <span>Generate Delivery Order</span>
                </div>
            </a>
        </li>

        <li>
            <a id="link103" title="My Delivery Order" href="#" onclick="postRequest('<c:out value='${context }'/>/myDeliveryOrder?tabno=tab0');CreateVirtualURL(103);event.cancelBubble=true;">
                <div style="display: flex; align-items: center;">
                    <i class="fas fa-arrow-right" aria-hidden="true" style="margin-right: 6px;"></i>
                    <span>My Delivery Order</span>
                </div>
            </a>
        </li>
       
       <li>
            <a id="link105" title="Generate Delivery Order" href="#" onclick="postRequest('<c:out value='${context }'/>/uploadContractDetails?tabno=tab0');CreateVirtualURL(102);event.cancelBubble=true;">
                <div style="display: flex; align-items: center;">
                    <i class="fas fa-arrow-right" aria-hidden="true" style="margin-right: 6px;"></i>
                    <span>Upload Contract Details</span>
                </div>
            </a>
        </li>
    </ul>
</li>
		    
		    
		    
		    
		<li><ul>&nbsp;&nbsp;</ul></li>	    
		    
		    
		    
		    
		    
		</ul></div>
		</body>
		</html>
		</ul>
		</div>
		</div>
		
		
	<div id="mCSB_1_scrollbar_vertical"
		class="mCSB_scrollTools mCSB_1_scrollbar mCS-minimal mCSB_scrollTools_vertical"
		style="display: none;">
		<div class="mCSB_draggerContainer">
			<div id="mCSB_1_dragger_vertical" class="mCSB_dragger"
				style="position: absolute; min-height: 50px; height: 0px; top: 0px;">
				<div class="mCSB_dragger_bar" style="line-height: 50px;"></div>
			</div>
			<div class="mCSB_draggerRail"></div>
		</div>
	</div>


<script>
     function toggleSubMenu(menuId) {
    	    var submenu = document.getElementById(menuId);
    	    var allSubmenus = document.querySelectorAll('.collapse.list-unstyled.layouts');

    	    allSubmenus.forEach(function(item) {
    	        if (item.id !== menuId) {
    	            item.classList.remove('show');
    	        }
    	    });

    	    submenu.classList.toggle('show');
    	}
</script>
</nav>


