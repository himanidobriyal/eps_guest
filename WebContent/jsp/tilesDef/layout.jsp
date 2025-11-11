<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- <link rel="stylesheet" type="text/css" href="/ireps/css/irepsCommonCss.css"> -->
<title><tiles:insertAttribute name="title" ignore="true" /></title>
<link rel="stylesheet" href="/ireps/bootstrap/css/bootstrap.min.css">
<link href="/ireps/bootstrap/css/style.css" rel="stylesheet">
<script src="/ireps/bootstrap/js/bootstrap.min.js"></script>

</head>


<div class="main-container">
	    <div>
			<tiles:insertAttribute name="header" />
		</div>
		<div>
			 <tiles:insertAttribute name="top" />
		</div>
		<div>
			<tiles:insertAttribute name="body" />
		</div>
		<div class="footer">
			<tiles:insertAttribute name="footer" />
	    </div>
	</div>
</html>


