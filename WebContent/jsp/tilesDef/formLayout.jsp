<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="/ireps/bootstrap/css/bootstrap.min.css">
<link href="/ireps/bootstrap/css/style.css" rel="stylesheet">
<script src="/ireps/bootstrap/js/bootstrap.min.js"></script>
<title><tiles:insertAttribute name="title" ignore="true" /></title>
<meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<div class="main-container">
  <div class="row" style="height:120px;">
  	 <div class="col-md-12">
  		<tiles:insertAttribute name="header" />
  	 </div>
  </div>
  <div class="row">
  	 <div class="col-md-12">
  		<tiles:insertAttribute name="top" />
  	 </div>
  </div>
  <div class="row">
    <div class="col-md-12"><tiles:insertAttribute name="body" /></div>
   </div>
 <%--  <div class="footer">
			<tiles:insertAttribute name="footer" />
   </div> --%>
</div>

</html>



