<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="bean" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="/ireps/css/irepsCommonCss.css">
<link rel="stylesheet" type="text/css" href="/ireps/css/iMMSNewDesign.css">
<link href="/ireps/bootstrap/css/style.css" rel="stylesheet">
<script src='/ireps/js/common/a076d05399.js'></script><!-- <script src="/ireps/bootstrap/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="/ireps/bootstrap/css/bootstrap.min.css"> -->
<script type="text/javascript" src="/ireps/js/works/postRequest.js"></script>
<script src="https://kit.fontawesome.com/a076d05399.js" 
        integrity="sha256-C9VpoA7k7Mr2wL1Xnx/JQ+R5ZdD8zFJLSq8+4F7TjBw=" 
        crossorigin="anonymous"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

 <style>
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
    border-color: #ffffff; /* White for high contrast */
    background: conic-gradient(#ffff00 0%, #00ffff 100%); /* Bright yellow to cyan gradient */
}


  </style> 
<%@page import="com.ireps.admin.entity.UserProfieForm"%>
<%@ page import="java.util.TimeZone" %>
<%@ page import="java.text.Format" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.util.*" %>
<%UserProfieForm profile=(UserProfieForm) session.getAttribute("sessionData");

String context = request.getContextPath();

if(profile==null)
	response.sendRedirect(response.encodeURL(request.getContextPath())+"/error");
%>
<title><tiles:insertAttribute name="title" ignore="true" /></title>
<%
String serverName = request.getServerName(); 


Date date1 = new Date();
Format formatter = new SimpleDateFormat("dd MMM yyyy HH:mm:ss");
String date = formatter.format(date1);
TimeZone tz = TimeZone.getTimeZone("IST");
String tz1=tz.getID();

String accessMode=session.getAttribute("accessMode")!=null?(String)session.getAttribute("accessMode"):"";
String actionMode=session.getAttribute("actionMode")!=null?(String)session.getAttribute("actionMode"):"";
String fontSize=session.getAttribute("fontSize")!=null?(String)session.getAttribute("fontSize"):"14";
%>



<script type="text/javascript">
		$(document).ready(function() {
			var selItem = localStorage.getItem("locales");
			$('#locales').val(selItem ? selItem : 'en');
			$("#locales").change(function() {
				var selectedOption = $('#locales').val();
				if (selectedOption) {
					window.location.replace('?lang=' + selectedOption);
					localStorage.setItem("locales", selectedOption);
				}
			});
		});
</script>
<style>
/*
    DEMO STYLE
*/

@import "https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700";
body {
    font-family: 'Poppins', sans-serif !important;
    /*background: #fafafa;*/
}

p {
/*
    font-family: 'Poppins', sans-serif;
    font-size: 1.1em;
    font-weight: 300;
    line-height: 1.7em;
    color: #999;*/
}

#sidebar a,
#sidebar a:hover,
#sidebar a:focus {
    color: inherit !important;
    text-decoration: none !important;
    transition: all 0.3s !important;
}

#content.navbar {
    padding: 15px 10px !important;
    background: #fff !important;
    border: none;
    border-radius: 0 !important;
    /*
    margin-bottom: 40px;
    box-shadow: 1px 1px 3px rgba(0, 0, 0, 0.1);
    
    */
}

#content.navbar-btn {
    box-shadow: none !important;
    outline: none !important;
    border: none !important;
}

.line {
    width: 100% !important;
    height: 1px !important;
    border-bottom: 1px dashed #ddd !important;
    margin: 40px 0 !important;
}

/* ---------------------------------------------------
    SIDEBAR STYLE
----------------------------------------------------- */

.wrapper {
    display: flex !important;
    width: 100% !important;
}

#sidebar {
    width: 250px !important;
    position: fixed !important;
    top: 0;
    left: 0;
    height: 100vh;
    z-index: 999;
    /*background: #7386D5;
    color: #fff;
    */
    background:#E6E6E6 !important;
    color:black ;
    transition: all 0.3s;
    overflow-x:hidden;
    overflow-y:scroll;
}

/* Hide scrollbar for Chrome, Safari and Opera */
.sidenavscrollbar::-webkit-scrollbar {
    /*display: none;*/
    scrollbar-width: 10px;
    width:10px;
}
/* Handle */
.sidenavscrollbar:hover::-webkit-scrollbar-thumb {
  background: #C7C7C7; 
  border-radius: 10px;
}
/* Hide scrollbar for IE and Edge */
.sidenavscrollbar {
    /*-ms-overflow-style: none;*/
     scrollbar-width: 10px; 
}
#searchUsersNav {
	background-image: linear-gradient(to right, 
		rgb(0, 179, 136),
		rgb(212, 242, 247));
}

#sidebar.active {
    margin-left: -250px;
}

#sidebar .sidebar-header {
    padding: 20px;
    /*background: #6d7fcc;*/
    background:#E6E6E6;
}

#sidebar ul.components {
    padding: 20px 0;
    border-bottom: 1px solid #47748b;
}

#sidebar ul p {
    /*color: #fff;*/
    color:balck;
    padding: 10px;
}

#sidebar ul li a {
    padding: 10px;
    font-size: 1.1em;
    display: block;
}

#sidebar ul li a:hover {
    /*color: #7386D5;
    background: #fff;*/
    color:balck;
    background:white;
}

#sidebar ul li.active>a,
a[aria-expanded="true"] {
    /*color: #fff;
    background: #6d7fcc;
    */
    color:balck;
    /* background:#E6E6E6; */
}

a[data-toggle="collapse"] {
    position: relative;
}

.dropdown-toggle::after {
    display: block;
    position: absolute;
    top: 50%;
    right: 20px;
    transform: translateY(-50%);
}

ul.components ul a {
    font-size: 0.9em !important;
    padding-left: 30px !important;
    /*background: #5d6caf;*/
    color:balck;
    background:#dadada;
}

ul.CTAs {
    padding: 20px;
}

ul.CTAs a {
    text-align: center;
    font-size: 0.9em !important;
    display: block;
    border-radius: 5px;
    margin-bottom: 5px;
}

a.download {
    background: #fff;
    color: #7386D5;
}

a.article,
a.article:hover {
    background: #6d7fcc !important;
    color: #fff !important;
}

/* ---------------------------------------------------
    CONTENT STYLE
----------------------------------------------------- */

#content {
    width:calc(100% - 250px);
    padding: 10px;
    min-height: 100vh;
    transition: all 0.1s;
    position: absolute;
    top: 0;
    right: 0;
}

#content.active {
    width: 100%;
    background-color: white !important;
}

/* ---------------------------------------------------
    MEDIAQUERIES
----------------------------------------------------- */

@media (max-width: 1024px) {
    #sidebar {
        margin-left: -250px;
    }
    #sidebar.active {
        margin-left: 0;
    }
    #content {
        width: 100%;
    }
    #content.active {
        /* width: calc(100% - 250px); 
        margin-right: -250px;
        overflow:hidden;
        */
    }
    #sidebarCollapse span {
        display: none;
    }
}

/*~~ User info css */
	.sidebar-user {
	   padding: 1.5rem 1rem 1rem; 
           
/* 			background: #fff; 
       color: #153d77;*/
       color:balck;
	   text-align: center; 
			
	   }
.sidebar-user img {
    width: 54px;
    height: 54px;
}

.item-hover:hover{
   transition:all 0.5;
   transform: scale(1.5); 
}
/*~~ Utility bar css */
#utilitybar{
  transition: width 0.1s;
  transition-timing-function: linear;
}

.utilbar-active{
   width:100%;
}

.utilbar-looks{
  position:fixed;
  /*top:100px;*/
  right:0px;
  /*max-width:500px;*/
  width:0px;
  max-height:100vh;
  min-height:100vh; 
  overflow:hidden;
  z-index:500;
  background-color:#f8f9fa;
}

#utilbar_content_holder {

   
   padding:10px;
   height:100%;
   width:100%;
}

#utilbarnotepad:focus {
    outline: none !important;
    border:0px solid red;
    /*box-shadow: 0 0 10px #719ECE;*/
      font-style: oblique;
}

div.hovereffect2:hover{
   transition: transform .2s; /* Animation */
   transform: scale(0.99);
   background-color:#F9FAFB;
}

.btn-circle.btn-xl {
    width: 70px;
    height: 70px;
    padding: 10px 16px;
    border-radius: 35px;
    font-size: 24px;
    line-height: 1.33;
}

.btn-circle {
    width: 30px;
    height: 30px;
    padding: 6px 0px;
    border-radius: 15px;
    text-align: center;
    font-size: 12px;
    line-height: 1.42857;
}


  .hovereffect1:hover{
       box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
   }
  .bg-lightyellow{
      background-color: lightYellow;
   }
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


.modal-overlay {
        position: fixed;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background: rgba(0, 0, 0, 0.4);
        z-index: 1000;
        display: flex;
        align-items: center;
        justify-content: center;
    }

    /* Modal content */
    .modal-content {
        background-color: #fff3cd;
        color: #856404;
        width: 60%;
        padding: 20px 25px;
        border-radius: 8px;
        box-shadow: 0 2px 10px rgba(0,0,0,0.3);
        font-family: 'Segoe UI', sans-serif;
        position: relative;
    }

    .modal-title {
        font-size: 18px;
        font-weight: bold;
        color: #b71c1c;
        text-align: center;
        margin-bottom: 15px;
        text-transform: uppercase;
    }

    .modal-content p {
        margin: 8px 0;
        font-size: 14px;
        line-height: 1.5;
    }

    /* Close button */
    .close-btn {
        position: absolute;
        top: 10px;
        right: 15px;
        background-color: transparent;
        border: none;
        font-size: 20px;
        font-weight: bold;
        color: #333;
        cursor: pointer;
    }

    .close-btn:hover {
        color: red;
    }
    
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
		
	
   
/* Root variables */
:root {
    --app-font-size: 14px;
    /* Button theme variables for light theme */
    --btn-border-color: #007bff;
    --btn-text-color: #007bff;
    --btn-hover-bg: #007bff;
    --btn-hover-text: #ffffff;
    --notification-border: #28a745;
    --notification-text: #28a745;
    --notification-hover-bg: #28a745;
}

/* Controls layout */
.controls { 
    display: flex; 
    align-items: center; 
    gap: .5rem; 
}

/* Font size - Apply to ALL elements */
*, *::before, *::after {
    font-size: var(--app-font-size) !important;
}

/* IMPROVED BUTTON STYLES - Works for both light and dark themes */
.btn {
    background-color: transparent !important;
    border: 2px solid var(--btn-border-color) !important;
    color: var(--btn-text-color) !important;
    padding: 6px 10px;
    border-radius: 8px;
    cursor: pointer;
    font: inherit;
    transition: all 0.3s ease;
}

.btn:hover {
    background-color: var(--btn-hover-bg) !important;
    color: var(--btn-hover-text) !important;
    border-color: var(--btn-hover-bg) !important;
}

/* Notification button specific styling */
.btn.notification-btn {
    border-color: var(--notification-border) !important;
    color: var(--notification-text) !important;
}

.btn.notification-btn:hover {
    background-color: var(--notification-hover-bg) !important;
    color: #ffffff !important;
    border-color: var(--notification-hover-bg) !important;
}

/* Alternative button style (btn1) for light theme */
.btn1 {
    background: #f5f5f5;
    border: 1px solid #ccc; 
    border-radius: 6px;
    padding: 6px 12px;
    font-size: 14px;
    font-weight: bold;
    cursor: pointer;
    transition: all 0.3s ease;
    margin: 2px;
    color: #333;
    box-shadow: 0 2px 4px rgba(0,0,0,0.1);
}

.btn1:hover {
    background: #e0e0e0;
    border-color: #999;
    transform: translateY(-2px);
    box-shadow: 0 4px 8px rgba(0,0,0,0.15);
}

.btn1:active {
    transform: translateY(0);
    box-shadow: 0 1px 2px rgba(0,0,0,0.2);
}

/* DARK THEME STYLES */
.dark-theme {
    background-color: #1a1a1a !important;
    color: #ffffff !important;
    /* Update CSS variables for dark theme */
    --btn-border-color: rgba(255, 255, 255, 0.8);
    --btn-text-color: #ffffff;
    --btn-hover-bg: rgba(255, 255, 255, 0.2);
    --btn-hover-text: #ffffff;
    --notification-border: #66ff66;
    --notification-text: #66ff66;
    --notification-hover-bg: rgba(102, 255, 102, 0.2);
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
    background-color: #1a1a1a;
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

.dark-theme button,
.dark-theme input[type="button"],
.dark-theme input[type="submit"] {
    background-color: #444444 !important;
    color: #ffffff !important;
    border-color: #666666 !important;
}

/* Dark theme text colors */
.dark-theme,
.dark-theme * {
    color: #f5f5f5 !important;
}

/* Keep links highlighted in dark theme */
.dark-theme a {
    color: #66b3ff !important;
}

.dark-theme a:hover {
    color: #99ccff !important;
}

/* Basic li styling for dark theme */
.dark-theme li {
    background-color: #1a1a1a !important;
    color: #ffffff !important;
    border-color: #555555 !important;
}

/* For your specific menu items */
.dark-theme li.layouts {
    background-color: #2a2a2a !important;
    border: 1px solid #404040 !important;
    transition: background-color 0.3s ease !important;
}

.dark-theme li.layouts:hover {
    background-color: #3a3a3a !important;
}

/* Force ALL text to white in dark theme */
.dark-theme * {
    color: #fff !important;
}

/* Links & nav items in dark theme */
.dark-theme a,
.dark-theme .nav-link {
    background-color: transparent !important;
    color: #fff !important;
    border-color: #555 !important;
}

/* Hover effect for links and nav in dark theme */
.dark-theme a:hover,
.dark-theme .nav-link:hover {
    background-color: #111 !important; 
    color: #99ccff !important; 
    border-color: #888 !important;
}

/* Dark theme notification button hover override */
.dark-theme .btn.notification-btn:hover {
    color: #66ff66 !important; /* Keep green color for notifications */
}

/* Bold, italic, span, label text should stay white in dark theme */
.dark-theme b,
.dark-theme i,
.dark-theme label,
.dark-theme span {
    color: #fff !important;
}

/* Icons (FontAwesome, SVG, etc.) in dark theme */
.dark-theme i,
.dark-theme svg {
    color: #fff !important;
    fill: #fff !important;
}

.dark-theme a:hover i,
.dark-theme a:hover svg {
    color: #99ccff !important;
    fill: #99ccff !important;
}

/* Tables and pagination (like DataTables page numbers) in dark theme */
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

/* Dark theme btn1 override */
.dark-theme .btn1 {
    background: #2a2a2a !important;
    border: 1px solid #555 !important;
    color: #fff !important;
    box-shadow: 0 2px 4px rgba(0,0,0,0.3) !important;
}

.dark-theme .btn1:hover {
    background: #3a3a3a !important;
    border-color: #777 !important;
    box-shadow: 0 4px 8px rgba(0,0,0,0.4) !important;
}

/* Bootstrap button overrides for better visibility */
.btn-outline-primary {
    border-width: 2px !important;
}

.dark-theme .btn-outline-primary {
    border-color: rgba(255, 255, 255, 0.8) !important;
    color: #ffffff !important;
}

.dark-theme .btn-outline-primary:hover {
    background-color: rgba(255, 255, 255, 0.2) !important;
    border-color: rgba(255, 255, 255, 0.9) !important;
    color: #ffffff !important;
}

.dark-theme .btn-outline-info {
    border-color: rgba(255, 255, 255, 0.8) !important;
    color: #ffffff !important;
}

.dark-theme .btn-outline-info:hover {
    background-color: rgba(255, 255, 255, 0.2) !important;
    border-color: rgba(255, 255, 255, 0.9) !important;
    color: #ffffff !important;
}


</style>


<script>

$(document).ready(function () {

    $('#sidebarCollapse').on('click', function () {
        $('#sidebar').toggleClass('active');
        $('#content').toggleClass('active');
    });

});

function logout() 
{
	localStorage.setItem('sidenavlinkID','');
	localStorage.setItem('leftnav_scrollbar_position',0);
	
	window.document.location.href="<%=response.encodeURL(request.getContextPath())%>/logout";
	
} 
<%-- function showSalesModule() 
{
	window.document.location.href='<%=response.encodeURL(request.getContextPath())%>'+'/homeSalePage';
}

 --%>

function CloseUtilBarFromWrapper(){
	if(window.UTILBAROPEN ==1){
		OpenUtilityBar();
	}
}

function OpenUtilityBar(){
	
	if(document.getElementById("utilitybar").classList.contains("utilbar-active")){
	  
	  document.getElementById("utilitybar").style.width = "0px";
	  //document.getElementById("utilitybar").style.visibility = "hidden";
	  
	  //document.getElementById("utilbar_content_holder").style.display = "none";

	}else{

	  //document.getElementById("utilitybar").style.visibility = "visible";
	  document.getElementById("utilitybar").style.width = "500px";		
	  //document.getElementById("utilbar_content_holder").style.display = "";

	}
	document.getElementById("utilitybar").classList.toggle("utilbar-active");
}


</script>


<!-- 
<script>
$(document).ready(function(){
  	GetSetUtilBarData();
});


function GetSetUtilBarData(){
		GetSetFinyr();
		GetSetTodayDate();
		GetSetRlyList();
		GetSetNotepad();
}

function GetSetFinyr(){
	  var xhttp =new XMLHttpRequest();
	  xhttp.onreadystatechange =function(){
		  if(this.readyState ==4 && this.status ==200){
			  var data =this.responseText;
			
			  window.UTILBARFINYR =data;
			  
			  document.getElementById("utilbar_finyr").innerHTML  =data;
			  
		  }
	  };
	  var request_string ="/depot/depot/commonservice/getfinyr";
	  xhttp.open("GET", request_string, true);
	  xhttp.send(); 
	  return true;
}

function GetSetTodayDate(){
   var data =new Date().toDateString();
   document.getElementById("utilbar_datetoday").innerHTML  =data;
   window.UTILBARDATE =data;
}

function GetSetRlyList(){
    var dataString = $('#cc41dataform').serialize();
    $.ajax({
      type: "GET",
      url: "/depot/depot/commonservice/getrlylist",
      data: dataString,
      success: function (data,status) {
        var rlylist =data;
        window.RLYLIST =rlylist;
        RenderRlyList();
      }
    });

}
function RenderRlyList(){
	var html = '<ul id="utilitybar_dataholder_rlylist">';
    var li='';
    var rlylist =window.RLYLIST;

    for(var i = 0; i < rlylist.length; i++) {
        var obj = rlylist[i];
        li =li +'<li>';    
        li =li + obj.rly +" "+obj.shortname +" "+ obj.railname;
        li =li +'</li>';
    }
    
    html =html +li +'</ul>';
    
    document.getElementById("utilitybar_dataholder_rlylist_holder").innerHTML = html;
}

function GetSetNotepad(){
	var text =localStorage.getItem('utilitybar_notepad_text');
	document.getElementById("utilbarnotepad").value =text;
}

function SetNotepad(){
	var text =document.getElementById("utilbarnotepad").value;
    localStorage.setItem('utilitybar_notepad_text',text);
}

function CopyNotepad(){
	  /* Get the text field */
	  var copyText = document.getElementById("utilbarnotepad");

	  /* Select the text field */
	  copyText.select();
	  copyText.setSelectionRange(0, 99999); /* For mobile devices */

	  /* Copy the text inside the text field */
	  document.execCommand("copy");
}
function DeleteNotepad(){
	document.getElementById("utilbarnotepad").value ="";	
	SetNotepad();
}
function PasteInNotePad(){
	
}
function openCalculator(){
	 $("#carouselExampleIndicators").carousel(2);
}

function NextSlide(){
	 $("#carouselExampleIndicators").carousel("next");
}

function PrevSlide(){
	$("#carouselExampleIndicators").carousel("prev");
}
</script> -->

<script>

function SearchRly(){
	var srch_keyword =$("#utilbar_rlysearch_bar").val().toLowerCase();
	var result ="";
	if(srch_keyword.trim() ==""){
		document.getElementById("utilbar_rlysearch_result").innerHTML = "";
		return true;
	}
    $("#utilitybar_dataholder_rlylist li").filter(function() {
    	var res =$(this).text().toLowerCase().indexOf(srch_keyword) > -1;
    	if(res){
    		result =result +$(this).text() +"<br>";
    	}
    });
    document.getElementById("utilbar_rlysearch_result").innerHTML = result;	
}


$(document).ready(function(){
	  $("#utilbar_rlysearch_bar").on("keyup", function() {
		 // document.getElementById("utilbar_rlysearch_result").innerHTML = "";
		  SearchRly();
	  });
});

</script>



</head>
<body>
<div class="wrapper">
        <tiles:insertAttribute name="left" /> 
        <!-- Page Content  -->
        <div id="content">
        
        

	



<div class="gradientClass" style="width: 100%;">
    <div style="height: 20px;"></div>
    <div style="display: flex; align-items: center;">
        <div style="width: 15%;">
            <img src="/ireps/images/gem-new-logo-v6.png" style="margin-left:40px;width:350px;height:auto;"/>
        </div>
        <div style="width: 70%; text-align: center;">
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
           <div style="height: 0.5em;"></div>
             <%if( serverName.contains("trial") || serverName.contains("naval") || serverName.contains("trivendra")){ %>
                                                            <div class="header_left_logo display_table_cell">
                                                                <a href="./" class="logo top_logo"> <img
                                                                        src="/ireps/images/common/trialSiteLogo.png" width=230px height=25px alt="IR">

                                                                </a>
                                                                
                                                        </div>
                                                        <%} %>
        </div>
 <%--        <div style="width: 15%; text-align: right;">
            <select class="custom-select small-text" onchange="location = this.value;">
                <option value=""><bean:message code="header.dropdown.language"/></option>
                <option value="?language=en"><bean:message code="header.dropdown.english" /></option>
                <option value="?language=hi"><bean:message code="header.dropdown.hindi" /></option>
            </select>
        </div> --%>
        
        	<div  style="display:none; " id="hrmsBackBtn">
					    <a href="#" onclick="openpage('<%=response.encodeURL(context+"/backToSSO")%>');">
					        <i class="fas fa-angle-double-left icon" title="Back to SSO" style="font-size: 27px; color: white;"></i>
					    </a></div>
					    
					    
					           <div style=" width: 15%;  padding-left: 20px;  ">
            <div class="controls" aria-label="Display controls" style="display:flex;  gap:5px;">
                <button class="btn1" id="fontDec" title="Decrease font size" onclick="changeFontSize('decrease')">A-</button>
                <button class="btn1" id="fontReset" title="Reset font size" onclick="changeFontSize('reset')">A</button>
                <button class="btn1" id="fontInc" title="Increase font size" onclick="changeFontSize('increase')">A+</button>
                <button class="btn1" id="themeToggle" title="Toggle dark/light" onclick="toggleDarkMode()">&#127769/&#127774</button>
            </div>
        </div>
        
        			<br> <br>
 		<div class="countdown-container" style="float:right;">
								          <div class="countdown-circle" id="countdown-timer" style="display: none;" >
								            <div id="timer"  class="mt-3">3:00</div>
								          </div>
	    </div>
	    
	      <div style="margin-right: 180px;"></div>
							
							
							<div class="d-flex">
							 
                              <div class="p-2 flex-fill item-hover" onclick="javascript:logout();" title="logout">
							     <i class="fas fa-power-off" style="font-size:20px;color:red" aria-hidden="true"></i>
							   </div>
							</div>
							<br>
							
		    		
        
    </div>
    <div style="height: 16px;"></div>
</div>
<br>
<hr style="color:#4A4A4A;margin-top: -20px;">


			<div class="row justify-content-center">
			<div  style="text-align: center">
			 <span class="blink" style="font-size:14px;color:blue;text-align: center">Please visit the 'View & Manage Pending Activity' section in 'Manage Sold Lot' under the 'Sold Lot(s)' tab for SRO(s) action pending.
. </span>
			</div>
			</div>

<!-- Modal HTML -->
<div class="modal-overlay" id="tdsModal" style="display: none;">
    <div class="modal-content">
        <button class="close-btn" onclick="hideTdsPopup()">&times;</button>
        <div class="modal-title">Important Notice for TDS</div>

        <p>2% TDS shall be applicable on all transactions of Metal Scrap falling under Chapter 72 to 81 where the total taxable value exceeds Rs. 2,50,000/- from the date of Notification No. 25/2024-Central Tax dated 09.10.2024 (Ministry of Finance, Department of Revenue).</p>

        <p>The system for TDS has been implemented on the IREPS eAuction (Sale) module effective from <strong>01.07.2025</strong>. As per the new provision, TDS must be deposited by the purchasers directly on the GST portal against all such lots where GST-TDS (currently @2%) is applicable.</p>

        <p>Accordingly, purchasers are required to deposit the BSV shown by the system, which will automatically include the TDS amount. To safeguard Railway interests, purchasers must mark a <strong>Lien Amount equal to the TDS amount</strong> before making BSV payment as Security Deposit (SD). Ensure you have sufficient IREPS Lien Balance before attempting to create lien or pay BSV.</p>

        <p>The blocked SD lien will be released after verification of the TDS deposited by the purchaser. All purchasers are advised to deposit TDS on time as per the TDS Ledger and to keep their email and mobile number updated on IREPS.</p>
				<p > <strong>it is recommended that for a purchaser, all the SD lien pending without release 
				for more than 150 days shall be forfeited and transferred to Railways. This forfeited
				amount cannot be claimed as a refund by the purchaser in the future. </strong></p>
        <p>For previous transactions where TDS was deposited before <strong>01.07.2025</strong>, purchasers should contact the auction-conducting Railway for manual refund processing after verification.</p>

        <p><strong>For any issues, please contact the IREPS Helpdesk:</strong><br> 011-41385200</p>
    </div>
</div>

<br>

<div style="display: flex; gap: 25px; align-items: center; font-family: 'Segoe UI', sans-serif; margin: 10px 0;">

    <!-- Notification 1 -->
    <div style="font-size: 12px; color: red; display: flex; align-items: center;">
        <img src="/ireps/images/common/animated_new.gif" alt="New" style="height: 16px; margin-right: 5px;" />
        <a href="/ireps/upload/resources/RBTDSRecommendation.pdf  " 
           title="Guideline for new platform" 
           class="linkStyle" 
           target="_blank" 
           style="color: red; font-weight: bold; text-decoration: none;">
            GST-TDS PDF 1  !!
        </a>
    </div>

    <!-- Notification 2 -->
    <div style="font-size: 12px; color: red; display: flex; align-items: center;">
        <img src="/ireps/images/common/animated_new.gif" alt="New" style="height: 16px; margin-right: 5px;" />
        <a href="/ireps/upload/resources/FinNotification.pdf" 
           title="Finance Notification PDF" 
           class="linkStyle" 
           target="_blank" 
           style="color: red; font-weight: bold; text-decoration: none;">
          GST-TDS PDF 2 !!
        </a>
    </div>
    
    
 <a href="javascript:void(0);" onclick="showTdsPopup()" >
     Click Here for GST-TDS Important Notice
</a>
    

</div>


<div style="margin-top: 5px;"></div>

			<hr>
			<div id="menulink_tab_holder">
			   
			</div>
            <tiles:insertAttribute name="body" />
            <tiles:insertAttribute name="footer" />
        </div>
    </div>
    
    
 <div id="utilitybar" class="utilbar-looks border"  >
  <div id="utilbar_content_holder" style="width:500px;  z-index:600; height:100vh;">
    
    <div class="d-flex justify-content-around mb-2">
    	<div class="p-2 ">
	       <button type="button" class="btn" id="closeutlbarbtn" onclick ="OpenUtilityBar();" ><i class='fas fa-times' style='font-size:38px;color:grey'></i></button>
	    </div>
	    <div class="p-2 ">
	       <button type="button" id="myBtn" onclick ="PrevSlide();" class=" btn"> <i class='far fa-arrow-alt-circle-left' style='font-size:38px;color:grey'></i></button>
	    </div>
	    <div class="p-2 ">
          <button type="button" id="myBtn2" onclick ="NextSlide();" class=" btn"> <i class='far fa-arrow-alt-circle-right' style='font-size:38px;color:grey'></i></button>	      
	    </div>
    </div>
	<div id="carouselExampleIndicators" style="heigth:100%;width:100%;" class="carousel slide " data-ride="carousel" data-interval="false">
		  <ol class="carousel-indicators">
		    <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
		    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
		    <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
		  </ol>
		  <div class="carousel-inner">
		    <div class="carousel-item active">
				   <div class="card p-0 " style="background-color:#938eff;border-radius:10px;">

					  <div class="card-body text-white" >
					       <div class="d-inline-flex p-2">  
							    <div class="p-2"><i class='far fa-calendar-alt' style='font-size:58px;color:white'></i></div>
							    <div class="p-2 ">
							       <p class="card-text" ><strong>Ongoing Financial Year : <span id="utilbar_finyr"></span> </strong></p>
					               <p class="card-text" ><strong>Date Today : <span id="utilbar_datetoday"></span> </strong></p>
							    </div>
							</div>
					  </div>
					</div>
		            <div class="card p-0 mt-3 " style="background-color: #85FFBD;
                           background-image: linear-gradient(45deg, #85FFBD 0%, #FFFB7D 100%); border-radius:10px;">
					  <div class="card-body text-dark" >
					       <div class="d-inline-flex p-0">  
							    <div class="p-2">
							      <i class='fas fa-search' style='font-size:28px;color:white'></i>
							      <p>Railway</p>
							    </div>
							    <div class="p-2 ">
							<div class="input-group mb-3">
							  <input id="utilbar_rlysearch_bar" type="text" class="form-control">
							  <div class="input-group-append">
							    <button class="btn btn-success" onclick="SearchRly();" type="button">Go</button>
							  </div>
							</div>
							<p id="utilbar_rlysearch_result"></p>
							    </div>
							</div>
					  </div>
					</div>	
				<div class="card mt-2 ">
				  <div class="card-header p-0">
				    <div class="d-flex justify-content-between ">
					    <div class="p-2 ">
					       <i class='far fa-clipboard' style='font-size:24px'></i> Notepad    
					     </div>
					      <div class="">
							  <ul class="list-group list-group-horizontal">
							    <li class="list-group-item" data-toggle="tooltip" title="Copy to clipboard!" onclick="CopyNotepad();"><i class='far fa-copy' style='font-size:14px'></i></li>
<!-- 							    <li class="list-group-item "><i class='fas fa-edit' style='font-size:14px'></i></li> -->
							    <li class="list-group-item" data-toggle="tooltip" title="Delete Notes" onclick="DeleteNotepad();"><i class='far fa-trash-alt' style='font-size:14px'></i></li>
							
							  </ul>
					       </div>
					 </div>
				  </div>
				  <div class="card-body p-0">
                      <textarea id="utilbarnotepad" onblur="SetNotepad()" rows="6" style="border: none; width:100%;height:100%;"></textarea>
				  </div>
				</div>	
				<div class="card bg-transparent mt-4">
					<div class="card-columns">
					  <div class="card bg-secondary hovereffect2 ">
					    <div class="card-body text-center">
					      <p class="card-text"><i class='far fa-comment-dots' style='font-size:28px;color:white'></i></p>
					    </div>
					  </div>
					  <div class="card bg-secondary hovereffect2 ">
					    <div class="card-body text-center">
					      <p class="card-text"><i class='far fa-address-book' style='font-size:28px;color:white'></i></p>
					    </div>
					  </div>
					  <div class="card bg-secondary hovereffect2 ">
					    <div class="card-body text-center">
					      <p class="card-text"><i class='fas fa-chart-pie' style='font-size:28px;color:white'></i></p>
					    </div>
					  </div>
					  <div class="card bg-secondary hovereffect2 ">
					    <div class="card-body text-center">
					      <p class="card-text"><i class='fas fa-shield-alt' style='font-size:28px;color:white'></i></p>
					    </div>
					  </div>
					  <div class="card bg-secondary hovereffect2 " title="jump to calculator" onclick="openCalculator()">
					    <div class="card-body text-center">
					      <p class="card-text"><i class='fas fa-calculator' style='font-size:28px;color:white'></i></p>
					    </div>
					  </div>
					  <div class="card bg-secondary hovereffect2 ">
					    <div class="card-body text-center">
					      <p class="card-text"><i class='fas fa-question-circle' style='font-size:28px;color:white'></i></p>
					    </div>
					  </div>
					</div>
				</div>										
		    </div>
		  
		    
		  </div>

		</div>

  </div>
  
</div>   
<div id="utilitybar_dataholder" style="display:none">
    <div id="utilitybar_dataholder_rlylist_holder">
    
    </div>
</div>    
    
    
   <%-- <div class="row">
				<div class="col-md-6">
				   <tiles:insertAttribute name="left" />
				</div>
				
				 <div class="col-md-6">
				   <tiles:insertAttribute name="right" />
				</div> 			
			</div>  --%>
</body>



<script>

    function showTdsPopup() {
        document.getElementById('tdsModal').style.display = 'flex';
    }

    function hideTdsPopup() {
        document.getElementById('tdsModal').style.display = 'none';
    }
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
                              if(result != '<%=profile.getUserId()%>')
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
    

	function openpage(url, reqWA){
		  postRequest(url);
		}
  </script>
  
    <script>
var monat=new Array("Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sept","Oct","Nov","Dec");
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
  digital1.setSeconds(seconds+1 );
  if (hours < 10) hours = '0' + hours;
  if (minutes < 10) minutes = '0' + minutes;
  if (seconds < 10) seconds = '0' + seconds;
  var dispTime = d+"-"+monat[m]+"-"+y+" "+hours + ":" + minutes + ":" + seconds;
  if(document.getElementById('sidebarbar_date_time'))
  document.getElementById('sidebarbar_date_time').innerHTML = dispTime;
  if(document.getElementById('sidebarbar_date_time_zone'))
  document.getElementById('sidebarbar_date_time_zone').innerHTML = timezone1;
  //alert("dispTime=="+dispTime);
  setTimeout("clock()", 1000);
  
   
}

clock();
</script>

<script type="text/javascript">


function switchToIreps(){
	var address='<%=response.encodeURL(request.getContextPath())%>'+'/switchToIreps';
	$.ajax({
	type: "POST",
    url: address,
    dataType:'text',    	
    success: function(result) {		
		var resultString = result.split('^');
		if(resultString[0]=='OK'){
			var param = { 'emailId' : resultString[3] ,'userId' : resultString[2],'randomNumber':resultString[1]};	    	
	    	OpenWindowWithPost(resultString[4], "width=1000, height=600, left=100, top=100, resizable=yes, scrollbars=yes", "", param);
		}else{
			alert(result);
			return false;
		}
		},
			error: function(result){
			alert("Error Occured =========>"+result);
		}
		});
}
function OpenWindowWithPost(url, windowoption, name, params)
{
 var form = document.createElement("form");
 form.setAttribute("method", "post");
 form.setAttribute("action", url);
 form.setAttribute("target", name);
 for (var i in params)
 {
   if (params.hasOwnProperty(i))
   {
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
    buttons.forEach(btn1 => btn1.style.display = 'none');
    setTimeout(() => buttons.forEach(btn1 => btn1.style.display = ''), 1);
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
    buttons.forEach(btn => btn1.style.display = 'none');
    setTimeout(() => buttons.forEach(btn1 => btn1.style.display = ''), 1);

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
    buttons.forEach(btn1 => btn1.style.display = 'none');
    setTimeout(() => buttons.forEach(btn1 => btn1.style.display = ''), 1); */

    
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
        const btn1 = document.getElementById('darkModeBtn');
        if (btn1) btn1.textContent = 'Light';
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