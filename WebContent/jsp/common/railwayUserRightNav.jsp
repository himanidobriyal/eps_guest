<%-- <!--  --> <%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.ireps.admin.entity.UserProfieForm"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="bean" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="html" %>

<table width="240" border="0" cellpadding="0" cellspacing="0" style="margin-left:10px;">
 <div class="fixed-bottom">
	
	<tr>
		<td width="202" height="26" valign="top">
		<table width="100%" border="0" cellpadding="0" cellspacing="0" class="titleStyle">
		   <tr>
			 <td width="356" valign="top" class="heading" height="26">&nbsp;&nbsp;<bean:message code="home.links.myProfile"/></td>
		   </tr>
		</table>
		</td>
	</tr>
	
    <tr>
		<td valign="top" class="boxStyle">            
			<table width="100%" class="nit_summary" cellspacing="0" cellpadding="0"> 
			
			</table>
		 </td>
	</tr>	
	
	<tr>
		<td width="240" height="26" valign="top">
		<table width="100%" border="0" cellpadding="0" cellspacing="0" class="titleStyle">
		   <tr>
			 <td width="52%" valign="top" class="heading" height="26" >&nbsp;&nbsp;Notifications</td><td id="img1" style="display:none;" align="right"><img src="/ireps/images/common/animated_new.gif" border="0"></td>
		   </tr>
		</table>
		</td>
	</tr>
    <tr>
		<td valign="top" class="boxStyle" style="height:350px;width:100%;">   
			    
			<table   style="height:350px;width:100%;" class="nit_summary" cellspacing="0" cellpadding="0" id="notificationsMsg">
			</table>	
			
		</td>
	</tr>  
	
	</div>
</table>
  
   --%>
   
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.ireps.admin.entity.UserProfieForm"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="bean" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="html" %>

<script type="text/javascript" src="/ireps/js/works/postRequest.js"></script>
<script src="https://kit.fontawesome.com/a076d05399.js" 
        integrity="sha256-C9VpoA7k7Mr2wL1Xnx/JQ+R5ZdD8zFJLSq8+4F7TjBw=" 
        crossorigin="anonymous"></script><c:set var ="context" value="${pageContext.request.contextPath}" />
<c:set var="sessionData" value='${sessionScope["sessionData"]}'></c:set>
<c:set var = "grade" value='${sessionData.grade}'/>
<c:set var = "loggedInOrgZone" value='${sessionData.orgZone}'/>

<%String context = (String) request.getContextPath();
UserProfieForm sessionData=(UserProfieForm) session.getAttribute("sessionData");
String welcomeString = sessionData.getWelcomeString().trim();
welcomeString =welcomeString.replaceAll(sessionData.getUsername().trim(), "");
List<String> functionIdsList = sessionData.getFunctionIdsList(); 
String consUserType=sessionData.getConsUserType();
String consCode=sessionData.getConsigneeCode();
String acctType=sessionData.getOrgSubUnitDept();
int userGrade=sessionData.getGrade();
%>
<script>
$(document).ready(function(){
    $('[data-toggle="popover"]').popover();   
});
</script>

<!-- script to reset any selected submenu selection -->
<script>
$(document).ready(function(){
	//localStorage.setItem('menunameID','stop');
	//localStorage.setItem('submenuID','stop');
});
</script>
<!-- END  -->

<script>
$(document).ready(function(){

     var openliid =localStorage.getItem('leftnav_open_li');
     var leftnav_i_id =localStorage.getItem('leftnav_i_id');

     if(openliid =="close" || openliid =="null")
   	       openliid =openliid;
     else{
	     var qryselector ="#"+openliid+">ul";
	     var all_child_ul =document.getElementById(openliid).querySelectorAll(qryselector);
	     var first_child_ul =all_child_ul[0];
	     first_child_ul.classList.add("show"); 
	     
	     var element = document.getElementById(leftnav_i_id);
	     element.classList.remove("fa-angle-down");
	     element.classList.add("fa-angle-up");  	
     }
     //highlight menu and its submenu.
     //#ceddfc

     var menunameID =localStorage.getItem('menunameID');
     var submenuID =localStorage.getItem('submenuID');
     if(menunameID =='stop' || submenuID=='stop')
    	 return;
     document.getElementById(menunameID).style.backgroundColor ="#fffafc";
     //document.getElementById(submenuID).style.backgroundColor ="#ceddfc";
     document.getElementById(submenuID).firstElementChild.style.color="white";
     document.getElementById(submenuID).classList.add("bg-info");
     document.getElementById(submenuID).classList.add("shadow");
     //document.getElementById(submenuID).classList.add("gradient_bg_color");

     //auto scroll
     var leftnav_scrollbar_position =localStorage.getItem('leftnav_scrollbar_position');
     document.getElementById('side-navbar-div').scrollTop =leftnav_scrollbar_position;
	});
</script>


<style>
    html{
       scroll-behavior: smooth;
    }
    .list-group-item{
        @extend .list-group-item;
	    padding-top: 0.45rem;
	    padding-right: 1.25rem;
	    padding-bottom: 0.45rem;
	    padding-left: 1.25rem;
    }
    .menulink {
        color: black;
        font-family: "Cerebri Sans",sans-serif;
        font-size: .9375rem;
    }
   .menulinkforgrad {
        color: black;
        font-family: "Cerebri Sans",sans-serif;
        font-size: .9375rem;
    }
    .menulink_home{
        color: #de4d43;
        font-family: "Cerebri Sans",sans-serif;
        font-size: .9375rem;
        font-weight: bold;
    }
    
    a.menulink:hover {
        text-decoration: none;
        font-weight:bold;
    }
    
    a.menulinkforgrad:hover {
        text-decoration: none;
        font-weight:bold;
    }
    
    #side-navbar {
        background-color: #f6f7f9;
        margin-left:0px;
        opacity:0.9;
    }
    
    #side-navbar>a:hover {
/*         color: #6597d1; */
        font-weight: bold;
    }
    #side-navbar >li{
        margin-top:0px;
        margin-left:0px;

    }

  #menu1_submenu >li::before {
	  content:"\2022"; /* Insert content that looks like bullets */
	  list-style-type: circle;
	  padding-right: 8px;
	  color: blue; /* Or a color you prefer */
  }
  
  .fa-circle{
    @extend .fa-circle;
    padding-right:8px;
  }
  
  /*~~ User info css */
	.sidebar-user {
	   padding: 1.5rem 1rem 1rem; 
           
/* 			background: #fff; */
			color: #153d77;
text-align: center; 
			
	   }
.sidebar-user img {
    width: 44px;
    height: 44px;
}
.mb-2, .my-2 {
    margin-bottom: .5rem!important;
}
.rounded-circle {
    border-radius: 50%!important;
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
/* User info css  ~~ */

#menuhome{
  background:#fce8e6;
  color:#de4d43;
}

.bg-whitesmoke{
background-color:#f1f3f4;
}

.side-nav{
  min-width:250px;
  max-width:300px;
  transition: all 0.2s;
}
.side-nav-linkholder{
   max-height:100%;
   overflow:scroll;
}

@media only screen and (max-width: 1024px) {
.side-nav{
  min-width:250px;
  max-width:300px;
  height:100vh;
  margin-left:-250px;
  position:fixed;
  top:0px;
  z-index:3020;
  background-color:white;
  opacity:1;
  transition: all 0.2s;
}
}
</style>
 <nav id="sidenavbar" class="side-nav  d-flex flex-column justify-content-start bg-white-transparent">
<i id ="nabbar_close" class="position_top_left fas fa-angle-double-left btn btn-dark btn-sm" data-toggle="tooltip" title="Hide Menu" style="z-index:3040;font-size:24px;color:#2196F3" onclick="CloseSideNav()"></i>
<!-- User info section starts -->
  <!-- background: linear-gradient(180deg, rgba(0,212,255,1) 0%, rgba(255,255,255,1) 52%);  -->
  <div class="sidebar-user " style="height:150px; border:0px solid black;">
	 <div class="">
	   <img src="/ireps/images/avatar.png" class="img-fluid rounded-circle mb-2">
	</div>
	<div class="" style="text-align:center">
	   <div class="font-weight-bold"><%=sessionData.getUsername() %></div>
	  <small><%=welcomeString %></small>	
    </div> 
 </div> 
<div id='side-navbar-div' class="sidenavscrollbar side-nav-linkholder mt-3" style="">

<ul id="side-navbar" class="list-group ">
    
    	
      <li id="menu1li1" class="list-group-item border-0 bg-whitesmoke" data-toggle="collapse" onclick="ChangeCaretDirection(1)" data-target="#menu1_submenu">
      <p class="text-light bg-dark"> My Profile&nbsp;&nbsp;</p>
     
       
    </li>
    
          <li id="menu1submenu1li23" class="list-group-item list-group-flush border-0">
	             <a href="#" onclick="postRequest('<c:out value='${context }'/>/viewEditAuctionProfile');">View / Edit My Profile</a>
	             </li>   
	            <li id="menu1submenu1li23" class="list-group-item list-group-flush border-0">
	             <a href="#" onclick="postRequest('<c:out value='${context }'/>/viewAuctionAccount?accountName);">View My Account Profile</a>
	              <a href="#" onclick="postRequest('<c:out value='${context }'/>/viewAuctionAccount');">View My Account Profile</a>
	             </li>
	             	 <li id="menu1submenu1li23" class="list-group-item list-group-flush border-0">
	             <a onclick="postRequest('<c:out value='${context }'/>/searchAccounts');">Search Account</a>
	             </li>
	             
		             <li id="menu1submenu1li23" class="list-group-item list-group-flush border-0">
	             <a onclick="postRequest('<c:out value='${context }'/>/searchUsers');">Search Users</a>
	             </li>
		           	 
		           	 <li id="menu1submenu1li23" class="list-group-item list-group-flush border-0">
	             <a onclick="postRequest('<c:out value='${context }'/>/hsnValidation');">Know Valid HSN Code</a>
	             </li>
	             	 <li id="menu1submenu1li23" class="list-group-item list-group-flush border-0">
	             <a onclick="postRequest('<c:out value='${context }'/>/showChangeMyPasswordForm');">Change Login Password</a>
	             </li>
	              <li id="menu1submenu1li23" class="list-group-item list-group-flush border-0">
	             <a onclick="postRequest('<c:out value='${context }'/>/enableMobileApp');">Enable MobileApp Access for आपूर्ति </a>
	             </li>
	            <hr> 	
	             <li id="menu1li1" class="list-group-item border-0 bg-whitesmoke" data-toggle="collapse" onclick="ChangeCaretDirection(1)" data-target="#menu1_submenu">
      <p class="text-light bg-dark"> Admin Function&nbsp;&nbsp;</p> 
       <li id="menu1submenu1li23" class="list-group-item list-group-flush border-0">
	             <a onclick="postRequest('<c:out value='${context }'/>/searchAccounts');">Search/Edit Account</a>
	             </li>
	             
		           <li id="menu1submenu1li23" class="list-group-item list-group-flush border-0">
	             <a onclick="postRequest('<c:out value='${context }'/>/searchUsers');">Search/Edit Users</a>
	             </li>
	             
		           <li id="menu1submenu1li23" class="list-group-item list-group-flush border-0">
	             <a onclick="postRequest('<c:out value='${context }'/>/showDeregistration');">Bidder De-Registration</a>
	             </li>
	             
		           <li id="menu1submenu1li23" class="list-group-item list-group-flush border-0">
	             <a onclick="postRequest('<c:out value='${context }'/>/mapAccountingUnit');">Add AU_Code</a>
	             </li>
	             
		           <li id="menu1submenu1li23" class="list-group-item list-group-flush border-0">
	             <a onclick="postRequest('<c:out value='${context }'/>/updateParameter');">Update Common Parameter Values</a>
	             </li>
	             <hr>  
	             <li id="menu1submenu1li23" class="list-group-item list-group-flush border-0">
	             <a onclick="postRequest('<c:out value='${context }'/>/ChooseCatalogToClose');">Auto Decide Bids</a>
	             </li>
	             
		           <li id="menu1submenu1li23" class="list-group-item list-group-flush border-0">
	             <a onclick="postRequest('<c:out value='${context }'/>/UploadEncrypCertNew');">Upload Encryption Certificate </a>
	             </li>
	             
		           <li id="menu1submenu1li23" class="list-group-item list-group-flush border-0">
	             <a href="#" onclick="postRequest('<c:out value='${context }'/>/corrigendumDetails');">Verify CPCB/SPCB Certificate</a>
	             </li>
	             
		           <li id="menu1submenu1li23" class="list-group-item list-group-flush border-0">
	             <a href="#" onclick="postRequest('<c:out value='${context }'/>/viewPendingInvoices');">Pending Invoices</a>
	             </li>
	             
		           <li id="menu1submenu1li23" class="list-group-item list-group-flush border-0">
	             <a href="#" onclick="postRequest('<c:out value='${context }'/>/viewMarkUnmark');">Today's Mark and Unmark Details</a>
	             </li>
	             
		           <li id="menu1submenu1li23" class="list-group-item list-group-flush border-0">
	             <a href="#" onclick="postRequest('<c:out value='${context }'/>/bid');">Today's Mark and Unmark Details</a>
	             </li>
	             
		           <hr> 	          
       </ul>
    
 
  
    
	  
	   
	   
</ul>

</div>
</nav> --%>