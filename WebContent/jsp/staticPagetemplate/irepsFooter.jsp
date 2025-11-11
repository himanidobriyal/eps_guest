<%@ taglib uri="http://www.springframework.org/tags" prefix="bean" %>
<link rel="stylesheet" type="text/css" href="/ireps/css/menuStyle.css">
<link rel="stylesheet" href="/ireps/css/font-awesome.min.css" integrity="sha512-SfTiTlX6kk+qitfevl/7LibUOeJWlt9rbyDn92a1DqWOw9vWG2MFoays0sgObmWazO5BQPiFucnnEAjpAB+/Sw==" crossorigin="anonymous">
<script type="text/javascript" src="/ireps/js/common/a076d05399.js"></script>
<link href="/ireps/bootstrap/css/style_footer.css" rel="stylesheet">
<%
	String language="En";
	String disclaim=language.trim().equals("hi") ? "Disclamier_hi.pdf" : "Disclamier_en.pdf";
	String about=language.trim().equals("hi") ? "AboutUs_hi.pdf" : "AboutUs.pdf";
	String copyright=language.trim().equals("hi") ? "Copyright_hi.pdf" : "Copyright.pdf";
	String privacypol=language.trim().equals("hi") ? "PrivacyPolicy_hi.pdf" : "PrivacyPolicy.pdf";
	String terms=language.trim().equals("hi") ? "TermsAndCondition_hi.pdf" : "TermsAndCondition.pdf";
	String rti=language.trim().equals("hi") ? "List_RTI_Officers.pdf" : "List_RTI_Officers.pdf";
	String context = (String)request.getContextPath();
	String serverName=System.getProperty("ServerName");
	String instance = System.getProperty("jboss.node.name");
	String jbossserverName=System.getProperty("jboss.server.name");
	String node=System.getProperty("jboss.instance.id");
	
%>

 <nav class="navbar fixed-bottom navbar-expand-sm navbar-dark bg-dark">
	<div class="col-lg-12">
	    	<div class="row">

	    			<div class="col-lg-4 dev-by-cris">
	    				<!-- <A  HREF="https://sealinfo.verisign.com/splash?form_file=fdf/splash.fdf&dn=www.ireps.gov.in&lang=en" TARGET="new">
						<IMG SRC="/ireps/images/common/verisign.jpg" BORDER="0"></A> -->
	    				<A HREF="http://cris.org.in/" target="_blank" rel="noopener noreferrer"><font color="white"><bean:message code="home.footer.devby"/></font></A>&nbsp;&nbsp;<%-- <%=serverName%> --%>, 
	    			<span style="color: white;">Node : <%=node%></span>
	    		   </div>

		    		<div class="col-lg-8">
						  <div class="row justify-content-center justify-content-lg-end">
						   <a href="/ireps/upload/resources/<%=about%>" target="_blank" rel="noopener noreferrer" ><font color="white"><bean:message code="home.about.us" /></font></a>
				    	   &nbsp;&nbsp;<a href="/ireps/upload/resources/<%=disclaim%>" target="_blank" rel="noopener noreferrer"><font color="white"><bean:message code="header.disclaimer.link.label" /></font></a>
				           &nbsp;&nbsp;<a href="/ireps/upload/resources/<%=privacypol%>" target="_blank" rel="noopener noreferrer"><font color="white"><bean:message code="header.privacyStatement.link.label" /></font></a>
				           &nbsp;&nbsp;<a href="http://rti.railnet.gov.in/" target="_blank" rel="noopener noreferrer"><font color="white"><bean:message code="header.rti.link.label" /></font></a>
				           &nbsp;&nbsp;<a href="/ireps/upload/resources/<%=terms%>" target="_blank" rel="noopener noreferrer"><font color="white"><bean:message code="header.termsAndConditions.link.label" /></font></a>
				           &nbsp;&nbsp;<a href="/ireps/upload/resources/<%=copyright%>" target="_blank" rel="noopener noreferrer"><font color="white"><bean:message code="header.rti.copyright" /></font></a>
				          &nbsp;&nbsp;<a href="/eps/FeedbackForm.do?param=showPage&language=<%=language%>"><font color="white"><bean:message code="header.feedback.link.label"/></font></a>
				    	 </div>
		    		</div>
	    	</div>
    </div></nav>

