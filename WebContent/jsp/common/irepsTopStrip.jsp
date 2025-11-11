<%@ taglib uri="http://www.springframework.org/tags" prefix="bean" %>
<%@page import="com.ireps.admin.entity.UserProfieForm"%>
<%@ page import="java.util.TimeZone" %>
<%@ page import="java.text.Format" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<head>
<link rel="stylesheet" type="text/css" href="/ireps/css/menuStyle.css">
<script type="text/javascript" src="/ireps/js/jquery.1.11.1.js"></script>
<script type="text/javascript">
var proto=location.protocol;//"https:";
var hostadd=window.location.host;
var linkUrl;
/*-----------------------------Added by Aastha---------------------------------*/
var res = hostadd.substring(0,3);
var context = "iMMS";
if(res!='www') 
{
	linkUrl=proto+"//www." +hostadd + "/";
}
if((hostadd=="10.60.200.142") || (hostadd=="203.176.113.40"))
{
	linkUrl=proto+"//" +hostadd + "/";
}
else 
	linkUrl=proto+"//" +hostadd + "/";

function home1() 
{
	window.document.location.href=linkUrl+"iMMS/homePage";
}

function logout() 
{
	window.document.location.href=linkUrl+"iMMS/logout";
}
</script>
<style>

#wrapper1 {
    background: #07222E;
	font-family: 'Adobe Garamond Pro', sans-serif;
    width: 100%;
    height: 20px;
}

</style>
		
</head>
<%
String context = (String) request.getContextPath();
UserProfieForm sessionData=(UserProfieForm) session.getAttribute("sessionData");
String welcomeString="";
String currworkarea="";
String[] allowdedWorkArea={};
if(sessionData !=null)
{
	welcomeString= sessionData.getWelcomeString();
	allowdedWorkArea=sessionData.getAllowdedWorkArea();
	currworkarea=sessionData.getWorkArea();
} 
Date date1 = new Date();
Format formatter = new SimpleDateFormat("dd MMM yyyy HH:mm:ss");
String date = formatter.format(date1);
TimeZone tz = TimeZone.getTimeZone("IST");
String tz1=tz.getID();
%>

 </div> --%>
 
<nav class="navbar navbar-light justify-content-between" >
 
 
    <h6 class="mr-sm-2" style="color: white;"><%=welcomeString%> (IREPS ID-&nbsp;<%=sessionData.getAccountId() %>)</h6>
    <a href="javascript:logout();" class="btn btn-warning my-1 my-sm-0" type="submit" style="background-image: linear-gradient(#FE8938,#FF6600);padding:5px; width:100px;
    font-size: 15px; font-family: 'Poppins', sans-serif !important;" >Logout</a>
</nav>
<script type="text/javascript">
$(document).ready(function () {
    setInterval("$('.blink').fadeOut().fadeIn();",2000);
});

</script>
<style>
.blink_me {
  animation: blinker 1s linear infinite;
}

@keyframes blinker {  
  50% { opacity: 0.0; }
}
</style>