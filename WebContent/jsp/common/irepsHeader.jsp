<%@page import="com.ireps.admin.entity.UserProfieForm"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="bean" %>

<%
UserProfieForm sessionData=(UserProfieForm) session.getAttribute("sessionData");
String lastLoginDate=null;
String workArea= null;
String headerDisplay="<img src=\"/ireps/images/common/imms.png\" width=\"10%\"/>";
if(sessionData != null)
{
	lastLoginDate= sessionData.getLastLoginData();
	workArea=sessionData.getWorkArea();
	
}
String context = (String) request.getContextPath();
if(workArea != null)
{
		if(workArea.equalsIgnoreCase("LA"))
		{	
			headerDisplay = "Leasing";
		}
		else if(workArea.equalsIgnoreCase("WT"))
		{
			headerDisplay="<img src=\"/ireps/images/common/Works Red PNG.png\" width=\"10%\"/>";
		}
		else if(workArea.equalsIgnoreCase("PT"))
		{
			headerDisplay="<img src=\"/ireps/images/common/Goods & Services Red PNG.png\" width=\"20%\"/>";
		}
		else if(workArea.equalsIgnoreCase("LT"))
		{
			headerDisplay="<img src=\"/ireps/images/common/Earning - Leasing.png\" width=\"20%\"/>";
		}
		else if(workArea.equalsIgnoreCase("SA"))
		{
			headerDisplay = "E-Auction";
		}
		else if(workArea.equalsIgnoreCase("MM"))
		{
			headerDisplay="<img src=\"/ireps/images/common/imms.png\" width=\"10%\"/>";
		}
}
%>

<!-- 
<div class="container-fluid">
		<div class="row">
			<marquee>Welcome to IREPS</marquee>
		</div>
	</div> -->

	<!--Header-->
	<header class="bg-header">
		<div class="overlay"></div>
		<div class="container-fluid" class="bg">
			<div class="row my-pd">
				<!--Logo-->
				<div class="col-sm-2 text-center">
					<img src="/ireps/images/common/logo.png" style="margin-left:50px;width:200px;height:70px;"/>
				</div>
				<div class="col-sm-8 text-center">
					<%-- <h2 class="text-white bg-shadow">Indian Railways E-Procurement System <bean:message code="home.header.name"/></h2> --%>
					<h3 class="" style="color: #3C645F">Indian Railways E-Procurement System <bean:message code="home.header.name"/></h3>
					<h3><%=headerDisplay%></h3>
				</div>
				<div class="col-sm-2">
					<!-- <img src="/ireps/images/common/railways.jpg" class="logo"> -->
				</div>
			</div>
		</div>
		 
	</header>
	

       	