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
<link rel="stylesheet" type="text/css" href="/ireps/css/irepsCommonCss.css">
<link rel="stylesheet" type="text/css" href="/ireps/css/iMMSNewDesign.css">
<link href="/ireps/bootstrap/css/style.css" rel="stylesheet">
<script src="https://kit.fontawesome.com/a076d05399.js" 
        integrity="sha256-C9VpoA7k7Mr2wL1Xnx/JQ+R5ZdD8zFJLSq8+4F7TjBw=" 
        crossorigin="anonymous"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha256-YLGeXaapI0/5IgZopewRJcFXomhRMlYYjugPLSyNjTY=" crossorigin="anonymous"><script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js" integrity="sha512-bnIvzh6FU75ZKxp0GXLH9bewza/OIw6dLVh9ICg0gogclmYGguQJWl8U30WpbsGTqbIiAwxTsbe76DErLq5EDQ==" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha512-5WvZa4N7Jq3TVNCp4rjcBMlc6pT3lZ7gVxjtI6IkKW+uItSa+rFgtFljvZnCxQGj8SUX5DHraKE6Mn/4smK1Cg==" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha512-Ah5hWYPzDsVHf9i2EejFBFrG2ZAPmpu4ZJtW4MfSgpZacn+M9QHDt+Hd/wL1tEkk1UgbzqepJr6KnhZjFKB+0A==" crossorigin="anonymous"></script>
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
<%String context = (String) request.getContextPath();
UserProfieForm sessionData=(UserProfieForm) session.getAttribute("sessionData");
%>
<body>
    <div class="col-md-12 bg-ghostwhite sidenavscrollbar" style="height:100vh; overflow:scroll" >
	<%-- 		<div id="alert-box">
			</div>
			<nav class="navbar navbar-expand-sm justify-content-between bg-white">
	    	<!-- 
			<a class="navbar-brand" href="#">
                <i id ="nabbar_open" class="position_top_left fas fa-angle-double-right btn btn-dark btn-sm" data-toggle="tooltip" title="Show Menu" style="z-index:3040;display:none;font-size:24px;color:#2196F3" onclick="OpenSideNav()"></i>
                <img src="/ireps/images/common/logo.png" style="margin-left:50px;width:170px;height:65px;"/>
              </a> -->
              
	   			    <div class="float-right" style="text-align:center;">
	   			           <p class="header-title">
					           Indian Railways E-Procurement System (IREPS)
					           <br>
					       </p>  
					       
	   			    </div>
	     			  
	    			<br>
	    			<br>
		    			<div id="navbar_actions">
			    			<ul class="list-group list-group-horizontal" style="cursor:pointer"></ul>
		    			</div>
			</nav>
			<hr>
			<nav class="navbar navbar-m-lg p-0 navbar-dark bg-info" style="cursor:pointer">
			<a href="<%=response.encodeURL(request.getContextPath())%>/homePage" class="navbar-brand-sm" ><i class="fas fa-home text-white" title="button" style='font-size:25px;color:light'></i></a>						
			</nav>
			
			<hr/>
	          <div class="row justify-content-center">
	          <div class="col-md-12">
	                <tiles:insertAttribute name="body" />
	          </div>           
	          </div>
			
    </div>
  
  </div>
  </div>
</body>
<script type="text/javascript">
function logout() 
{
	windo --%>w.document.location.href='<%=response.encodeURL(request.getContextPath())%>'+'/logout';
}
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
</html>



