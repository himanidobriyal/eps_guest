<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@page import="java.util.Map"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.ireps.admin.entity.UserProfieForm"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="bean" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="html" %>
<!DOCTYPE html>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css"
	href="/ireps/css/irepsCommonCss.css">
<link rel="stylesheet" type="text/css"
	href="/ireps/css/iMMSNewDesign.css">
<link href="/ireps/bootstrap/css/style.css" rel="stylesheet">
<script src="https://kit.fontawesome.com/a076d05399.js" 
        integrity="sha256-C9VpoA7k7Mr2wL1Xnx/JQ+R5ZdD8zFJLSq8+4F7TjBw=" 
        crossorigin="anonymous"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha256-YLGeXaapI0/5IgZopewRJcFXomhRMlYYjugPLSyNjTY="
	crossorigin="anonymous">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"
	integrity="sha512-bnIvzh6FU75ZKxp0GXLH9bewza/OIw6dLVh9ICg0gogclmYGguQJWl8U30WpbsGTqbIiAwxTsbe76DErLq5EDQ=="
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
	integrity="sha512-5WvZa4N7Jq3TVNCp4rjcBMlc6pT3lZ7gVxjtI6IkKW+uItSa+rFgtFljvZnCxQGj8SUX5DHraKE6Mn/4smK1Cg=="
	crossorigin="anonymous"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
	integrity="sha512-Ah5hWYPzDsVHf9i2EejFBFrG2ZAPmpu4ZJtW4MfSgpZacn+M9QHDt+Hd/wL1tEkk1UgbzqepJr6KnhZjFKB+0A=="
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">

<style>

/* Hide scrollbar for Chrome, Safari and Opera */
.sidenavscrollbar::-webkit-scrollbar {
    display: none;
}

/* Hide scrollbar for IE and Edge */
.sidenavscrollbar {
    -ms-overflow-style: none;
     scrollbar-width: none; 
}

.bg-ghostwhite{
      background-color:#f9fbfd;	
}
.zero-padding{
      padding:0px;
}
.zero-margin{
      margin-left:0px;
      margin-right:0px;
      margin-top:0px;
      margin-bottom:0px;
}

.header-title {
    font-size: 1.24062rem;
    color: #212529;
}
.bg-white{
  background-color:#ffffff;	
}

  /*~~ User info css */
	.sidebar-user {
		   padding: 1.5rem 1rem 1rem;
			background: #fff;
			color: #153d77;
			text-align: center;
			
	   }
.sidebar-user img {
    width: 64px;
    height: 64px;
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
</style>

</head>
<br/>
<body>
	          <div class="row justify-content-center">
	          <div class="col-md-12">
	                <tiles:insertAttribute name="body" />
	          </div>           
	          </div>
</body>
</html>



