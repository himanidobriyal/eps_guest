<%@ taglib uri="http://www.springframework.org/tags" prefix="bean" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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

  <style>
    .welcomeLabel {
      color: blue;
    }
  </style>
<nav class="navbar fixed-bottom navbar-expand-sm navbar-dark bg-dark">
	<div class="col-lg-12">
		<div class="row">
<div class="col-lg-4 dev-by-cris">
	    				
	    				<A class="welcomeLabel" HREF="http://cris.org.in/" target="_blank" rel="noopener noreferrer"><font color="white"><bean:message code="home.footer.devby"/></font></A>&nbsp;&nbsp;<%-- <%=serverName%> --%>
	    			<span style="color: white;"> 	Node : <%=node%></span>

	    		   </div>

		    		<div class="col-lg-8">
						  <div class="row justify-content-center justify-content-lg-end">
						   <a class="welcomeLabel" href="/ireps/upload/resources/<%=about%>" target="_blank" rel="noopener noreferrer"><font color="white"><bean:message code="home.about.us" /></font></a>
				    	   &nbsp;&nbsp;<a class="welcomeLabel" href="/ireps/upload/resources/<%=disclaim%>" target="_blank" rel="noopener noreferrer"><font color="white"><bean:message code="header.disclaimer.link.label" /></font></a>
				           &nbsp;&nbsp;<a class="welcomeLabel" href="/ireps/upload/resources/<%=privacypol%>" target="_blank" rel="noopener noreferrer"><font color="white"><bean:message code="header.privacyStatement.link.label" /></font></a>
				           &nbsp;&nbsp;<a class="welcomeLabel" href="http://rti.railnet.gov.in/" target="_blank" rel="noopener noreferrer"><font color="white"><bean:message code="header.rti.link.label" /></font></a>
				           &nbsp;&nbsp;<a class="welcomeLabel" href="/ireps/upload/resources/<%=terms%>" target="_blank" rel="noopener noreferrer"><font color="white"><bean:message code="header.termsAndConditions.link.label" /></font></a>
				           &nbsp;&nbsp;<a class="welcomeLabel" href="/ireps/upload/resources/<%=copyright%>" target="_blank" rel="noopener noreferrer"><font color="white"><bean:message code="header.rti.copyright" /></font></a>
			    	 </div>
		    		</div>

	</div>
</div>
</nav>