<%@page import="com.ireps.admin.entity.UserProfieForm"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="bean" %>
<%@ page import="java.util.TimeZone" %>
<%@ page import="java.text.Format" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>

<link rel="stylesheet" type="text/css" href="/ireps/css/ddtabmenufiles/ddcolortabsHome.css">
<link rel="stylesheet" type="text/css" href="/ireps/css/menuStyle.css">
<script type="text/javascript" src="/ireps/js/jquery.1.11.1.js"></script>
			
			<script>
				$(document).ready(function(event) {
					foldMenuItems();
					$('.dropdown').click(
						function(event){
							event.stopPropagation(); 
							$(this).find('a:first').css("color","#993333");
							$(this).siblings().find('a').css("color","#000000");
							$($(this).siblings().find('.sub-menu')).each(function() { 
								this.style.display = "none";
							});
							$(this).siblings().map(function(i,n) {
								var id=$(n).attr('id');
								if(id!=undefined && id=="topLink")
								{
									$(n).find('a:first').css("color","#fff");
								}
							});
							var childs = $(this).children();
							for (var j = 0; j < childs.length; j++) {
								if(childs[j].className!=undefined && childs[j].className!="" && childs[j].className =="sub-menu"){
									if($(this).attr("id")!=undefined && $(this).attr("id")=="slidedown"){
										if($(this).children('.sub-menu').is(":visible"))
										{
											$(this).find('.sub-menu').slideUp(50);	
										}else
										{
											$(this).children('.sub-menu').slideDown(50);
										}
									}
									else{
										if( childs[j].style.display=="" || childs[j].style.display=="none")	{
											childs[j].style.display = "block";
										}
										else{
											childs[j].style.display = "none";
										}
									}
									
								}	
							}
						}
					);
				}); 
				$(document).click(function(event) {
					event.stopPropagation(); 
					foldMenuItems();
				}); 
				function foldMenuItems()
				{
					$($("ul.sub-menu").get().reverse()).each(function() { 
						this.style.display = "none";
					});
					$('#mainNav li').map(function(i,n) {
						var id=$(n).attr('id');
						if(id!=undefined && id=="topLink")
						{
							$(n).find('a:first').css("color","#fff");
						}
						else
						{
							$(n).find('a:first').css("color","#000000");
						}
					});
				}
			</script>		
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


<script type="text/javascript">
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
  digital1.setSeconds( seconds+1 );
  if (hours < 10) hours = '0' + hours;
  if (minutes < 10) minutes = '0' + minutes;
  if (seconds < 10) seconds = '0' + seconds;
  var dispTime = d+"-"+monat[m]+"-"+y+" "+hours + ":" + minutes + ":" + seconds+" "+timezone1;
  document.getElementById('pendlum').innerHTML = dispTime;
  setTimeout("clock()", 1000);
   
}
function color(param)
{
	var currwkarea ='<%=currworkarea%>';
	//var modvalue = param;
	//thisForm=document.forms[0];
	var elem=document.getElementById("color"+currwkarea);
	if(elem && elem!=undefined){
		elem.style.background='#CC9999';
	}
	/* if(currwkarea=='LA')
	{
    	document.getElementById("colorLA").style.background='#CC9999';
	}
	if(currwkarea=='SA')
	{
	 	document.getElementById("colorSA").style.background='#CC9999'; 
	}
	if(currwkarea=='WT')
	{
		document.getElementById("colorWT").style.background='#CC9999'; 
	}
	if(currwkarea=='PT')
	{
		document.getElementById("colorLA").style.background='#CC9999'; 
	} */
	 
} 
</script>
	 <table width="100%" border="0" cellpadding="0" cellspacing="0" class="topStrip">
	   <tr>
	        <td width="1%">&nbsp;</td>
			<td width="5%" >
				<div id='upper' style='display:block'>
					<table width="100%" border="0" cellpadding="0" cellspacing="0" class="topStrip">
					 <tr>
						<div id="ddtabs" class="ddcolortabsHome">
							<ul>
						 		<li> <A  id="style1"  HREF="/iMMS/home/homePage" title="IREPS Home Page" ><B><span><bean:message code="home.ireps.topStrip" /></span></B></A></li>
					    	</ul>
						</div>
		              </tr>
					</table>
				</div>
			</td>
			  
            <td width="57%" height="20" valign="middle" align="center"  class="welcomeLabel"><%=welcomeString%> (IREPS ID-&nbsp;<%=sessionData.getAccountId() %>)</td>
			<td  width= "25.5%" height="20"   class="welcomeLabel" align="center" ><div id= 'pendlum'> </div></td>
			  <%					
					//for trail enable this
					//if(allowdedWorkArea.length > 1 && (sessionData.getAccountId().equalsIgnoreCase("301") || sessionData.getAccountId().equalsIgnoreCase("31886") || sessionData.getAccountId().equalsIgnoreCase("31889") || sessionData.getAccountId().equalsIgnoreCase("31890") || sessionData.getAccountId().equalsIgnoreCase("31891")))
					//for production enable this
					if(allowdedWorkArea.length > 1) // && (sessionData.getAccountId().equalsIgnoreCase("301") || sessionData.getAccountId().equalsIgnoreCase("79465") || sessionData.getAccountId().equalsIgnoreCase("79464") || sessionData.getAccountId().equalsIgnoreCase("79466")))					
					{
				%>
			  <td align="left" >
				<div id="wrapper">	
		        <ul class="content clearfix" id="mainNav">
		    	
				<li class="dropdown" id="topLink" style="width:80px;"> <a href="javascript:void(0);">SWITCH</a>
				<ul class="sub-menu" style="display:none">
				 
				 <%
					
					 for(int i=0; i<allowdedWorkArea.length ; i++)
					 {
					 	if (allowdedWorkArea[i].equalsIgnoreCase("WT") && !currworkarea.equalsIgnoreCase("WT"))
					 	{ 
					 %>
							<li><A id="colorWT" HREF="#" URL="<%=response.encodeURL(context+"/home/showHome.do?switchWorkArea=WT")%>" title="WT Home Page" class="postRequest"><B><span>Works</span></B></A></li>
					 <%
					 	}
					 	else if (allowdedWorkArea[i].equalsIgnoreCase("PT") && !currworkarea.equalsIgnoreCase("PT"))
					 	{ 
					 %>
					 		<li><A id="colorLA" HREF="#" URL="<%=response.encodeURL(context+"/home/showHome.do?switchWorkArea=PT")%>"  title="PT Home Page" class="postRequest"><B><span>Goods & Services</span></B></A></li>
					 <%
						 }
					  	else if (allowdedWorkArea[i].equalsIgnoreCase("LT") && !currworkarea.equalsIgnoreCase("LT"))
					 	{ 
					 %>
					 		<li><A id="colorLA" HREF="#" URL="<%=response.encodeURL(context+"/home/showHome.do?switchWorkArea=LT")%>"  title="LT Home Page" class="postRequest"><B><span>Earning / Leasing Tender</span></B></A></li>
					 <%
						 }
					 }
					 %>			
					 
				</ul>
			   </li>
			   </ul>
			   </div>
			
			</td> 	
			<%
					}
			%>
		    <td width="3.99%"  height="20" id="topLink" bgcolor="#D75125" align="center"><A HREF="<%=response.encodeURL(context+"/home/logout.do")%>">LOGOUT</A></td>
			<td width="1%"></td>
            
       </tr>	 
    </table>
    
    <div id='lower' style='display:none'>
	 <table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#F5F9F8">
	 
	    <tr>
			<td width="100%" height="20" style="padding-left:12px;" class="" style="border-bottom-width:1px;border-bottom-style:solid;border-bottom-color: #9ACFC7;">&nbsp;</td>
		</tr>
		<tr>
			<td width="100%" height="20" style="padding-left:12px;" class="welcomeLabel" style="border-bottom-width:1px;border-bottom-style:solid;border-bottom-color: #9ACFC7;">
			<A HREF="<%=response.encodeUrl(context+"/home/showHome.do")%>" title="IREPS Home Page" class="breadcrumb"><B><bean:message code="home.ireps.topStrip" /></B></A>&nbsp;<B><span id="spanBrdcrumb" class="breadcrumb"> </span></B></td>
		 </tr>	   
    </table>
	</div>
<script type="text/javascript">
	clock(); color();
</script>
	