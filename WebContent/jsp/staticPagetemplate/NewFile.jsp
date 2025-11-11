<!DOCTYPE html>
<html class="no-js" lang="en">
<head>
	<title>Indian Railways E-Procurement System (IREPS)</title>
	<meta charset="utf-8">
	<meta content="IE=edge" http-equiv="X-UA-Compatible">
	<meta content="" name="description">
	<meta content="no-cache" http-equiv="Pragma">
	<meta content="" name="google-translate-customization">
	<meta content="NO-CACHE" http-equiv="CACHE-CONTROL">
	<meta content="width=device-width, initial-scale=1" name="viewport"><!-- Bootstrap CSS -->
	<link href="/ireps/bootstrapLatest/css/bootstrap.min.css" rel="stylesheet">
	<link href="/ireps/bootstrapLatest/css/bootstrap-grid.min.css" rel="stylesheet">
	<link href="/ireps/bootstrapLatest/css/bootstrap-reboot.min.css" rel="stylesheet"><!-- Custom CSS -->
	<link class="color-switcher-link" href="/ireps/css/irepsnewDesign.css" rel="stylesheet">
	<link href="/ireps/css/irepsAnimation.css" rel="stylesheet">
	<link class="color-switcher-link" href="/ireps/css/irepsNewfont.css" rel="stylesheet"><!-- FontAwesome -->
	<link crossorigin="anonymous" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" integrity="sha512-SfTiTlX6kk+qitfevl/7LibUOeJWlt9rbyDn92a1DqWOw9vWG2MFoays0sgObmWazO5BQPiFucnnEAjpAB+/Sw==" rel="stylesheet"><!-- jQuery -->
	<style>
/* Keep dropdown visible when parent <li> has .open class */
.nav-item.dropdown:focus-within > .dropdown-menu,
.sf-menu li:focus-within > ul {
  display: block !important;
}
</style>

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
	<!-- --------The Code to  USERWAY the Page  -->		
		<script>
		(function(d){
		  var s = d.createElement("script");
		  s.setAttribute("data-account", "YOUR-USERWAY-ID"); // Replace with your UserWay account ID
		  s.setAttribute("src", "https://cdn.userway.org/widget.js");
		  (d.body || d.head).appendChild(s);
		})(document);
</script>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js">
	</script>
	<script src="/ireps/js/irepsnews.js">
	</script><!-- Bootstrap JS -->

	<script src="/ireps/bootstrapLatest/js/bootstrap.bundle.min.js">
	</script><!-- Custom Scripts -->

	<script src="/ireps/js/menu.js">
	</script>
	<script src="/ireps/js/modernizr-2.6.2.min.js">
	</script>
	<script src="/ireps/js/common/a076d05399.js">
	</script>
	<script src="/ireps/js/works/postRequest.js">
	</script><!-- Ad Scripts -->

	<script src="https://securepubads.g.doubleclick.net/tag/js/gpt.js">
	</script>
	<style>
	   body {
	     font-size: 16px; /* Default font size */
	   }
	   .font-controls {
	     display: inline-block;
	     margin-left: 10px;
	   }
	   .font-controls span {
	     cursor: pointer;
	     margin: 0 3px;
	     font-weight: bold;
	     font-size: 16px;
	     padding: 2px 6px;
	     border: 1px solid #fff;
	     border-radius: 3px;
	     color: #fff;              /* White text */
	   }
	   .font-controls span:hover {
	    background-color: #444;   /* Subtle hover effect */
	}
	/* Dark mode class */
	.dark-mode {
	 background-color: #121212 !important;
	 color: #ffffff !important;
	}

	.dark-mode a {
	 color: #90caf9 !important; /* Light blue links */
	}

	</style>
	<script>
	function toggleDarkMode() {
	 document.body.classList.toggle("dark-mode");

	 // Update button text
	 const btn = document.getElementById("darkModeBtn");
	 if (document.body.classList.contains("dark-mode")) {
	   btn.innerText = "Light";
	 } else {
	   btn.innerText = "Dark";
	 }
	}
	</script>
	<style type="text/css">
	.widget_featured_posts li + li {
	   padding-top: 15px;
	   border-top: 1px solid #e6e6e6;
	}

	.epsLabel {
	   font-size: 25px;
	   font-family:  'Adobe Garamond Pro', sans-serif;
	   font-weight: normal;
	   letter-spacing: 1px;
	   color: #3C645F;
	}
	.item {
	   display: none;
	   position: relative;
	   .
	   transition
	   (.1s
	   ease-in-out
	   left);
	}
	.holder {
	   overflow: hidden;
	   padding: 10px;
	   content: "next";
	   font-size: 14px;
	   font-weight: 500;
	   font-family: Arial, "Helvetica Neue", Helvetica, sans-serif;
	   line-height: 1;
	   color: #818181;;
	   height: 350px;
	   text-align: justify;
	}

	#aColor{
	   color: black;
	}

	.holder .mask {
	   left: 0px;
	   top: 80px;
	   overflow: hidden;
	}

	.holder ul {
	   list-style: none;
	   margin: 0;
	   padding: 0;
	   position: relative;
	   text-align: justify;
	}

	.holder ul li {
	   padding: 10px 0px;
	}

	.holder ul li a {
	   color: darkred;
	   text-decoration: none;
	}

	.red {
	   color: #f50000c2;
	}

	.link-dark a{
	color :#333333;
	}

	.bot-icon img{
	     position: fixed;
	     cursor: pointer;
	     bottom: 15px;
	     right: 15px;
	     z-index: 100;
	   }
	   
	.bot{
	     position: fixed;
	     display: none;
	     bottom: 75px;
	     right: 15px;
	     z-index: 100;
	}

	li.big-left-media:hover{
	     background-color:#fff8f2;
	}
	.mt-0{
	     margin-top:0px;
	}
	.color-lightblue{
	 color:rgb(0,176,240);
	}
	.setmargin{
	    margin-bottom: 18px;
	}
	body {
	   font-family: 'Roboto', sans-serif;
	 
	}
	.small-text{
	color:white;
	font-weight: normal;
	font-family: 'Adobe Garamond Pro', sans-serif;
	text-transform: capitalize;
	}
	.sf-menu > li > a:hover,
	 .sf-menu > li.active > a {
	       color: red;
	       border-color: red;
	   }

	   .item_with_border .sf-menu > li.active > a {
	       border-top: 5px solid red;
	   }
	.sf-menu a {
	   font-size: 17px;
	   text-transform: capitalize;
	   font-weight: normal;
	  font-family: 'Adobe Garamond Pro', sans-serif;
	}
	a:focus{
	   color: white;
	   text-decoration: underline;
	}

	</style>
	<script>
	var $ = jQuery.noConflict();
	   $(document).ready(function() {
	     $('.bot-icon').click(function() {
	       $('.bot').toggle(200);
	     });
	   });
	</script>
	<script>
	function surveylink(){
	window.open('https://forms.gle/g1DkeoiXQaKRzJ9d9');
	}
	</script>
	<script>
	 window.googletag = window.googletag || {cmd: []};
	 googletag.cmd.push(function() {
	 googletag.defineSlot('/37179215/IREPS_SIDE_TYPE_1', [[300, 250]], 'div-gpt-ad-1572611857377-0').setCollapseEmptyDiv(true).addService(googletag.pubads());
	 googletag.defineSlot('/37179215/IREPS_BOTTOM', [[970, 90]], 'div-gpt-ad-1572612360884-0').setCollapseEmptyDiv(true).addService(googletag.pubads());
	 googletag.pubads().enableSingleRequest();
	   googletag.enableServices();
	 });
	</script>
	<script>
	   $(document).ready(function(){
	       $("#myModal").modal('show');
	       //$("#cvapModal").modal('show');
	       function alignModal(){
	           var modalDialog = $(this).find(".modal-dialog");
	           /* Applying the top margin on modal dialog to align it vertically center */
	           modalDialog.css("margin-top", Math.max(0, ($(window).height() - modalDialog.height()) / 2));
	       }
	       // Align modal when it is displayed
	       $(".modal").on("shown.bs.modal", alignModal);
	       
	       // Align modal when user resize the window
	       $(window).on("resize", function(){
	           $(".modal:visible").each(alignModal);
	       });  
	   });
	</script>
	<script>

	$(document).ready(function(){
	   
	   setTimeout(setInterval(AutoScroll1, 500),8000);
	   document.getElementById("RollingDiv1").addEventListener("mouseover", function() {
	    document.getElementById("RollingDiv1").style.border = "0px dotted #0000FF";
	   });

	   document.getElementById("RollingDiv1").addEventListener("mouseout", function() {
	    document.getElementById("RollingDiv1").style.border = "0px solid #0000FF";
	   });
	   setTimeout(setInterval(AutoScroll2, 500),8000);
	   document.getElementById("RollingDiv2").addEventListener("mouseover", function() {
	    document.getElementById("RollingDiv2").style.border = "0px dotted #0000FF";
	   });

	   document.getElementById("RollingDiv2").addEventListener("mouseout", function() {
	    document.getElementById("RollingDiv2").style.border = "0px solid #0000FF";
	   });
	});

	function AutoScroll1() {
	      var borderType =document.getElementById("RollingDiv1").style.borderStyle;
	      if(borderType =="dotted"){
	       return ;
	      }

	     var elmnt = document.getElementById("RollingDiv1");
	     var curscrollTop =elmnt.scrollTop;
	     var scrollTo =curscrollTop + 10 ;
	     if( elmnt.scrollTop >= (elmnt.scrollHeight - elmnt.offsetHeight))
	     {
	       elmnt.scrollTop =-20;
	       return;
	     }
	     elmnt.scrollTop =scrollTo;

	     
	   }
	function AutoScroll2() {
	      var borderType =document.getElementById("RollingDiv2").style.borderStyle;
	      if(borderType =="dotted"){
	       return ;
	      }

	     var elmnt = document.getElementById("RollingDiv2");
	     var curscrollTop =elmnt.scrollTop;
	     var scrollTo =curscrollTop + 10 ;
	     if( elmnt.scrollTop >= (elmnt.scrollHeight - elmnt.offsetHeight))
	     {
	       elmnt.scrollTop =-20;
	       return;
	     }
	     elmnt.scrollTop =scrollTo;

	     
	   }

	</script>
	<script>
	   let currentSize = 16; // default font size in px

	   function changeFontSize(action) {
	     if (action === 'increase') {
	       currentSize += 2;
	     } else if (action === 'decrease') {
	       currentSize -= 2;
	     } else if (action === 'reset') {
	       currentSize = 16;
	     }
	     document.body.style.fontSize = currentSize + "px";
	   }
	</script>
	<style>
	.gradientClass{
	background: #07222E;
	font-family: 'Adobe Garamond Pro', sans-serif;
	}
	</style>
	<style>
	        .carousel-control-prev-icon {
	         background-image: url("data:image/svg+xml;charset=utf8,%3Csvg xmlns='http://www.w3.org/2000/svg' fill='%23336699' viewBox='0 0 8 8'%3E%3Cpath d='M5.25 0l-4 4 4 4 1.5-1.5-2.5-2.5 2.5-2.5-1.5-1.5z'/%3E%3C/svg%3E") !important;
	       }
	       
	       .carousel-control-next-icon {
	         background-image: url("data:image/svg+xml;charset=utf8,%3Csvg xmlns='http://www.w3.org/2000/svg' fill='%23336699' viewBox='0 0 8 8'%3E%3Cpath d='M2.75 0l-1.5 1.5 2.5 2.5-2.5 2.5 1.5 1.5 4-4-4-4z'/%3E%3C/svg%3E") !important;
	       }

	       body {
	           font-family: 'Adobe Garamond Pro', serif;
	       }
	       .navbar {
	           background-color: #07222E;
	       }
	       .nav-link {
	           padding: 0.5rem 1rem;
	           font-size: 13px;
	       }
	         .top-right-links {
	           position: absolute;
	           top: 7px;
	           right: 135px;
	       }
	       .bottom-right-links {
	           position: absolute;
	           bottom: 0;
	           right: 100px;
	       }
	        .btn-login {
	           background-color: #dc3545;
	           color: #fff;
	           margin-right: 5px;
	       }
	        mark {
	           background-color: #bb1111;
	           color: white;
	           padding: 5px;
	           border-radius: 2px;
	       }
	      #header1{
	            z-index: 6;
	            }
	        @media (max-width: 768px) {
	            #header1{
	            z-index: 1;
	            }
	           
	       }

	       @media (max-width: 576px) {
	           #header1{
	                z-index: 1;
	                }
	       }
	</style>
	<style>
	/* === Accessibility improvements === */
	.skip-link:focus {
	  position: static !important;
	  left: auto !important;
	  width: auto !important;
	  height: auto !important;
	  overflow: visible !important;
	  z-index: 10000 !important;
	  padding: 8px 12px;
	  background: #000;         /* black background for contrast */
	  color: #fff !important;   /* white text for visibility */
	  border: 2px solid #fff;   /* white border for clarity */
	  border-radius: 4px;
	  display: inline-block;    /* ensures proper sizing */
   }
	

	:focus-visible {
	 outline: 3px solid #ffbf47;
	 outline-offset: 2px;
	}

	a:focus-visible, button:focus-visible, [role="button"]:focus-visible, .nav-link:focus-visible, .btn:focus-visible {
	 outline: 3px solid #ffbf47 !important;
	 outline-offset: 2px !important;
	 text-decoration: underline;
	}

	/* Avoid low-contrast forced white link on focus */
	a:focus {
	 color: inherit;
	 text-decoration: underline;
	}

	/* Improve contrast for nav hover/active on dark background */
	.sf-menu > li > a:hover,
	.sf-menu > li.active > a {
	 color: #ffd166 !important;       /* higher contrast on #07222E */
	 border-color: #ffd166 !important;
	}

	/* Ensure link colors meet contrast on white */
	a, .linkStyle, .small-text a {
	 color: #0645AD;
	}

	a:hover {
	 text-decoration: underline;
	}

	/* Buttons: ensure visible focus */
	button, .btn, .btn-primary, .btn-login {
	 border-width: 2px;
	}

	.btn-primary:focus-visible, .btn-login:focus-visible {
	 box-shadow: none;
	}

	/* Carousel controls: larger hit area + labels */
	.carousel-control-prev, .carousel-control-next {
	 opacity: 0.9;
	}

	.carousel-control-prev:focus-visible, .carousel-control-next:focus-visible {
	 outline: 3px solid #ffbf47;
	 outline-offset: 2px;
	}

	/* Table/Lists focus */
	li:focus-visible, td:focus-visible, th:focus-visible {
	 outline: 3px solid #ffbf47;
	 outline-offset: 2px;
	}
	</style>
	<style>
	/* Enforce sufficient contrast on dark headers */
	.gradientClass, .navbar, .header_gradient, .heading_wrappper {
	 color: #ffffff;
	}

	.gradientClass a, .navbar a, .header_gradient a, .heading_wrappper a {
	 color: #ffffff;
	}
	</style>
	<style>
	/* Accessibility improvements */
	.skip-link {
	 position: absolute;
	 top: -40px;
	 left: 0;
	 background: #000;
	 color: #fff;
	 padding: 8px;
	 z-index: 100;
	}
	.skip-link:focus { top: 0; }

	:focus-visible {
	 outline: 3px solid #ffbf47;
	 outline-offset: 2px;
	}

	/* Better contrast */
	.navbar a, .sf-menu > li > a {
	 color: #ffffff;
	}
	.sf-menu > li > a:hover,
	.sf-menu > li.active > a {
	 color: #ffd166 !important;
	 border-color: #ffd166 !important;
	}

	/* Improve grey text */
	.small-text, .link-dark a, .holder {
	 color: #ffffff !important;
	}

	/* Dropdown focus accessibility */
	.nav-item.dropdown:focus-within > .dropdown-menu {
	 display: block;
	}
	</style>

<style>
/* Watermark background */
body::before {
  content: "TRIAL SITE";
  position: fixed;
  top: 50%;
  left: 50%;
  font-size: 80px;
  font-weight: bold;
  color: rgba(200,0,0,0.15);
  transform: translate(-50%, -50%) rotate(-30deg);
  z-index: 0;
  white-space: nowrap;
  pointer-events: none;
}
body * {
  position: relative;
  z-index: 1;
}
</style>

</head>


<body>
<!-- Google Translate API (Free) -->
<!-- ---Goggle traslator in hindi English start from here  -->
<script src="https://translate.google.com/translate_a/element.js?cb=googleTranslateElementInit"></script>

	<div id="google_translate_element" style="display:none;">
	</div>
	<script type="text/javascript">

	 var translateReady = false;
	 function googleTranslateElementInit() {
	       console.log("Google Translate initialized");
	       new google.translate.TranslateElement(
	         {pageLanguage: 'en', includedLanguages: 'en,hi'},
	         'google_translate_element'
	       );
	       translateReady = true;
	 }

	 function translatePage(lang) {
	     //alert("lang="+lang);
	   if (!translateReady) {
	     setTimeout(function() { translatePage(lang); }, 500);
	     return;
	   }
	   var frame = document.querySelector('iframe.goog-te-menu-frame');
	   if (!frame) return;
	   var innerDoc = frame.contentDocument || frame.contentWindow.document;
	   var langLinks = innerDoc.querySelectorAll('.goog-te-menu2-item span.text');
	   langLinks.forEach(function(link) {
	     if (lang === "hi" && link.innerText.toLowerCase().includes("hindi")) {
	       link.click();
	     }
	     if (lang === "en" && link.innerText.toLowerCase().includes("english")) {
	       link.click();
	     }
	   });
	 }
	</script> 
	
	<!-- ---Goggle traslator in hindi English End here  -->
	
	
	<a class="skip-link" href="#main">Skip to main content</a>

	<div id="canvas">
		<div id="box_wrapper">
			<header class="page_header header_black section_padding_25" id="header1" role="banner">
				<div class="container-fluid gradientClass" style="padding:8px 40px; height:auto;">
					<!-- Top Row: Left = Font Size + Mode | Right = Raise Ticket + Helpdesk -->
					<!--  Top Row: Left = Font Size + Mode | Right = Raise Ticket + Helpdesk -->


					<div class="d-flex justify-content-between align-items-center" style="margin-bottom:10px;">
						<!-- Left: Font Size + Mode -->


						<div class="d-flex align-items-center">
							<span style="color:white; font-size:12px;">Font Size:</span> <a href="javascript:changeFontSize('decrease')" style="color:white; font-size:12px; margin-left:5px;">A-</a> <a href="javascript:changeFontSize('reset')" style="color:white; font-size:12px; margin-left:5px;">A</a> <a href="javascript:changeFontSize('increase')" style="color:white; font-size:12px; margin-left:5px;">A+</a> <span style="color:white; font-size:12px; margin-left:15px;">Mode:</span> <a href="javascript:toggleDarkMode()" id="darkModeBtn" style="color:white; font-size:12px; margin-left:5px;">Dark</a> <!-- Language Dropdown -->
							<span style="color:white; font-size:12px; margin-left:15px;">Language:</span> <select id="languageSwitcher" onchange="translatePage(this.value)" style="font-size:12px; margin-left:5px; padding:2px 6px; background-color:#07222E; color:white; border:1px solid #ccc; border-radius:4px; height:22px; line-height:20px; cursor:pointer;">
								<option value="en">
									English
								</option>

								<option value="hi">
									हिन्दी (Hindi)
								</option>
							</select>
						</div>
						<!-- Right: Raise Ticket + Helpdesk -->


						<div class="d-flex align-items-center" style="margin-right:60px;">
							<a class="nav-link small-text" href="javascript:askQ()" rel="noopener noreferrer" style="color:white; font-size:12px; padding-right:8px;">Raise a Ticket <font color="red">|</font></a> <a class="nav-link small-text" href="javascript:showHelpDeskQueryPage()" rel="noopener noreferrer" style="color:white; font-size:12px;">Contact Helpdesk <font color="red">|</font></a>
						</div>
					</div>
					<!-- 🔹 Second Row: Logo Left + Title Center + Approval/Signup Right -->


					<div class="row align-items-center">
						<!-- Logo -->


						<div class="col-md-4">
							<a class="navbar-brand" href="#" style="margin:-11px;"><img alt="Government eMarketplace (GeM) logo" class="img-fluid" src="/ireps/images/gem-new-logo-v6.png" width="300px"></a>
						</div>
						<!-- Title -->


						<div class="col-md-5 text-center">
							<ul class="mainmenu nav sf-menu" style="margin:0; padding:0; list-style:none;">
								<li style="color:white; font-family: 'Adobe Garamond Pro', sans-serif; font-size:27px; line-height:1.2;">Government eMarketplace<br>
								<span style="color:#ffc000;">Indian Railways E-Procurement System</span></li>
							</ul>
						</div>
						<!-- Approval + Sign Up -->


						<div class="col-md-3 text-right">
							<ul class="mainmenu nav sf-menu" style="margin:0; padding:0; list-style:none;">
								<li>
									<a class="nav-link small-text" href="javascript:vendorApprovalAnn()" rel="noopener noreferrer" style="text-transform:capitalize; font-size:14px; color:white;">Approval of Vendors <font color="red">|</font></a>
								</li>


								<li>
									<a class="nav-link small-text sf-with-ul" href="#" rel="noopener noreferrer" style="text-transform:capitalize; font-size:14px; color:white;">Sign Up <i aria-hidden="true" class="fa fa-caret-down text-danger"></i></a>

									<ul>
										<li>
											<a href="javascript:void(0);" onclick="displayPage()" rel="noopener noreferrer">New Vendors/Contractors<br>
											(E-Tender/E-Auction Leasing)</a>
										</li>


										<li>
											<a href="javascript:bidderRegistration()" rel="noopener noreferrer">New Bidder (E-Auction Sale)</a>
										</li>


										<li>
											<a href="javascript:RequestFormDeptRlyPostUser()" id="aColor" rel="noopener noreferrer">Department Creation Form<br>
											(for Railway Officials)</a>
										</li>
									</ul>
								</li>
							</ul>
						</div>
					</div>
				</div>
			</header>

			<hr style="color:#4A4A4A; width:80%; margin: 0px auto;">


			<header class="page_header bordered_items toggler_left" role="banner" style="z-index: 5;">
				<div class="container-fluid-custompadding gradientClass" style="height: 45px;">
					<div class="row">
						<div class="col-md-12 display_table">
							<div class="header_mainmenu display_table_cell">
								<!-- main nav start -->


								<nav aria-label="Primary" class="mainmenu_wrapper" role="navigation">
									<ul class="mainmenu nav sf-menu">
										<li style=" margin-left: -17px;">
											<a class="small-text" href="#" rel="noopener noreferrer" style="height: 45px;"><mark>Login </mark></a>

											<ul style="margin-left:90px;">
												<li>
													<a href="javascript:void(0);" onclick="fun('supplyWorks');" rel="noopener noreferrer">E-Tender</a>
												</li>


												<li>
													<a href="javascript:void(0);" onclick="fun('auctionuser');" rel="noopener noreferrer">E-Auction-Sale</a>
												</li>


												<li>
													<a href="javascript:void(0);" onclick="fun('rlyofficer');" rel="noopener noreferrer">iMMS</a>
												</li>


												<li>
													<a href="javascript:void(0);" onclick="fun('newIMMS');" rel="noopener noreferrer">UDM</a>
												</li>


												<li>
													<a href="javascript:void(0);" onclick="fun('supplyWorks');" rel="noopener noreferrer">Vendor Approval (UVAM)</a>
												</li>


												<li>
													<a href="javascript:void(0);" onclick="fun('supplyWorks');" rel="noopener noreferrer">Inspection Module</a>
												</li>


												<li>
													<a href="javascript:void(0);" onclick="fun('supplyWorks');" rel="noopener noreferrer">E-Auction Leasing</a>
												</li>
												 <li><a href="javascript:void(0);"
                                                onclick="fun('newIMMSSDM');" rel="noopener noreferrer">IMMS 2.0 </a></li> 
												<!--  <li><a href="javascript:void(0);"
                                                onclick="fun('saleMod');" rel="noopener noreferrer">Sale Module </a></li> -->


												<li>
													<a href="javascript:void(0);" onclick="fun('tpi');" rel="noopener noreferrer">TPI</a>
												</li>


												<li>
													<a href="javascript:void(0);" onclick="fun('stn');" rel="noopener noreferrer">RLY. Board STATIONERY</a>
												</li>


												<li>
													<a href="javascript:void(0);" onclick="fun('med');" rel="noopener noreferrer">RLY. Board e-Medical<img alt="New notification badge" src="/ireps/images/home/New.png"></a>
												</li>


												<li>
													<a href="javascript:void(0);" onclick="fun('crismmis');" rel="noopener noreferrer">CRIS MMIS<img alt="New notification badge" src="/ireps/images/home/New.png"></a>
												</li>


												<li>
													<a href="javascript:void(0);" onclick="fun('helpdesk');" rel="noopener noreferrer">Helpdesk User</a>
												</li>
												<!-- <li><a href="javascript:void(0);"
                                                onclick="fun('crismmis');" rel="noopener noreferrer">CRIS MMIS</a></li> -->
											</ul>
										</li>


										<li>
											<a class="small-text" href="#">E-Tender <i aria-hidden="true" class="fa fa-caret-down text-danger"></i></a>

											<ul>
												<li>
													<a href="#">Works</a>

													<ul>
														


														<li>
															<a href="javascript:anonymSearch();" rel="noopener noreferrer">Search Tenders</a>
														</li>
													</ul>
												</li>


												<li>
													<a href="javascript:void(0);" rel="noopener noreferrer">Goods And Services</a>

													<ul>
														


														<li>
															<a href="javascript:anonymSearchSupply();" rel="noopener noreferrer">Search Tender</a>
														</li>


														<li>
															<a href="javascript:viewApprovedVendor();" rel="noopener noreferrer">View Approved Vendors</a>
														</li>
														<!-- <li><a href="javascript:ContractAwarded();" rel="noopener noreferrer">Contracts
                                                            Awarded</a></li> -->
													</ul>
												</li>
											</ul>
										</li>
										<!-- eof features -->


										<li>
											<a class="small-text" href="#" rel="noopener noreferrer">E-Auction sale  <i aria-hidden="true" class="fa fa-caret-down text-danger"></i></a>

											<ul>
												<li>
													<a href="javascript:void(0);" rel="noopener noreferrer">Sale</a>

													<ul>
														<li>
															<a href="javascript:void(0);" rel="noopener noreferrer">Live Auctions</a>

															<ul>
																<li>
																	<a href="javascript:verifycharPage('m1','liveAuction',%201);" rel="noopener noreferrer">Indian Railways</a>
																</li>
																<!-- ============================ -->
															</ul>
														</li>


														<li>
															<a href="javascript:void(0);" rel="noopener noreferrer">Upcoming Auctions</a>

															<ul>
																<li>
																	<a href="javascript:verifycharPageForthComingAuction('m2','forthComingAuction',%201);" rel="noopener noreferrer">Indian Railways</a>
																</li>
																<!-- ======================== -->
															</ul>
														</li>


														<li>
															<a href="javascript:viewAuctionSechedule();" rel="noopener noreferrer">Auction Schedules</a>
														</li>


														<li>
															<a href="javascript:viewUniformESaleCondition();" rel="noopener noreferrer">Uniform E-Sale Condition</a>
														</li>


														<li>
															<a href="javascript:viewAddressAucUnit();" rel="noopener noreferrer">Addresses of Auctioning Units</a>
														</li>
													</ul>
												</li>
											</ul>
										</li>


										<li>
											<a class="small-text" href="#">E-Auctions Leasing  <i aria-hidden="true" class="fa fa-caret-down text-danger"></i></a>

											<ul>
												<li>
													<a href="javascript:searchEauctionLeasing();" rel="noopener noreferrer">Search E-Auction ( Leasing )</a>
												</li>


												<li>
													<a href="ireps/upload/resources/Standard%20Conditions%20of%20Contract%20Version%202.0.pdf" rel="noopener noreferrer" target="_blank">Standard Conditions of Contract</a>
												</li>


												<li>
													<a href="/ireps/upload/resources/Pre-requisites%20for%20Contractors%20for%20E-Auction%20Leasing%20module.pdf" rel="noopener noreferrer" target="_blank">Pre-requisites for Contractors</a>
												</li>


												<li>
													<a href="/ireps/upload/resources/User%20Manual%20for%20Contractors%20for%20E-Auction%20for%20Earning-Leasing%20Contracts%20Version%201.0.pdf" rel="noopener noreferrer" target="_blank">User Manual for Contractors</a>
												</li>


												<li>
													<a href="/ireps/upload/resources/User%20Guide%20for%20Virtual%20Account%20Mechanism%20Ver%201.0.pdf" rel="noopener noreferrer" target="_blank">User Guide for Payment of Earnest Money<br>
													through Virtual Account Mechanism</a>
												</li>
											</ul>
										</li>


										<li>
											<a class="small-text" href="#">Contracts <i aria-hidden="true" class="fa fa-caret-down text-danger"></i></a>

											<ul>
												<li>
													<a href="javascript:anonymSearchPO();" rel="noopener noreferrer">Supply Contracts</a>
												</li>
												<!-- <li><a href="javascript:supplyContractedZonalRly();" rel="noopener noreferrer">Supply
                                                    Contracts(Other than Zonal Rlys)</a></li> -->
											</ul>
										</li>


										<li>
											<a class="small-text" href="#">FAQ <i aria-hidden="true" class="fa fa-caret-down text-danger"></i></a>

											<ul>
												<li>
													<a class="linkStyle" href="javascript:Etender()" rel="noopener noreferrer">E-Tender</a>
												</li>


												<li>
													<a class="linkStyle" href="javascript:Eauction()" rel="noopener noreferrer">E-Auction</a>
												</li>


												<li>
													<a class="linkStyle" href="javascript:ePayment()" rel="noopener noreferrer">E-Payment</a>
												</li>
											</ul>
										</li>


										<li>
											<a class="small-text" href="javascript:void(0);" onclick="showHelpDeskQueryPage()">Learning <i aria-hidden="true" class="fa fa-caret-down text-danger"></i></a>

											<ul>
												<li>
													<a href="javascript:learningCenter()" rel="noopener noreferrer">Learning Center</a>
												</li>


												<li>
													<a href="javascript:systemSetting()" rel="noopener noreferrer">System Settings</a>
												</li>
											</ul>
										</li>


										<li style="list-style: none">
											<button class="btn-primary" data-toggle="dropdown" style="background-color: transparent;" type="button"><!-- <img src="/ireps/images/home/pin.png" height="25px"
                                            width="20px"> -->
											<i aria-hidden="true" class="fa fa-bell text-uppercase margin_0"></i></button> <!-- - <li align="right"><a href="http://naval.ireps.gov.in:9080/ireps/ireps_V2.html" target="_blank">Version 2</a></li>-->


											<ul class="dropdown-menu dropdown-menu-right list-unstyled" style="margin-top: -10px; padding: 10px;border-radius:10px; margin-right: 180px;">
												<li style="background-color: transparent;">
													<div class="media with_background">
														<div class="media-left media-middle">
															<div class="teaser_icon label-info">
																<i class="fa fa-bullhorn"></i>
															</div>
														</div>


														<div class="media-body media-middle">
															<span>Indian Railways allows the vendors / contractors the option to receive<br>
															contractual payments against letter of credit against<br>
															indigenous contracts.</span>
														</div>
													</div>
												</li>


												<li>
													<div class="media with_background">
														<div class="media-left media-middle">
															<div class="teaser_icon label-info">
																<i class="fa fa-bullhorn"></i>
															</div>
														</div>


														<div class="media-body media-middle">
															<span>The terms and conditions related to payment through Letter<br>
															of Credit are described in the tender documents.</span>
														</div>
													</div>
												</li>


												<li>
													<div class="media with_background">
														<div class="media-left media-middle">
															<div class="teaser_icon label-info">
																<i class="fa fa-bullhorn"></i>
															</div>
														</div>


														<div class="media-body media-middle">
															<span>Vendors / contractors who intend to take advantage of this option can do<br>
															so by selecting suitable payment mode at the time of submission of<br>
															their bid.</span>
														</div>
													</div>
												</li>
											</ul>
										</li>
									</ul>
								</nav>
								<!-- header toggler -->
								<span class="toggle_menu"><span></span></span>
							</div>
						</div>
					</div>
				</div>
			</header>


			<section class="" id="main">
				<div class="fluid" style="padding-left:10px;">
					<div class="row">
						<div class="col-md-2">
							<div class="rounded overflow_hidden">
								<div class="with_padding header_gradient heading_wrappper" style="background-color:black">
									<h5 class="text-uppercase margin_0" style="color:white;">Quick Links</h5>
								</div>


								<div class="ireps_padding" style="border: 1px solid #145683;">
									<div class="widget widget_slider widget_featured_posts">
										<div class="owl-carousel" data-autoplay="true" data-items="1" data-loop="true" data-nav="true" data-responsive-lg="1" data-responsive-md="1" data-responsive-sm="1" data-responsive-xs="1">
											<ul>
												<li class="big-left-media">
													<a href="javascript:anonymSearch();" id="aColor" rel="noopener noreferrer"><font size="3">Search E-Tenders</font></a>
												</li>


												<li class="big-left-media">
													<a href="javascript:searchEauctionLeasing()" id="aColor" rel="noopener noreferrer"><font size="3">Search E-Auctions ( Leasing )</font></a>
												</li>


												<li class="big-left-media">
													<a href="javascript:void(0);" id="aColor" onclick="verifycharPage('m1','liveAuction', 1);" rel="noopener noreferrer"><font size="3">Search E-Auction Sale</font></a>
												</li>
												


												<li class="big-left-media">
													<a href="javascript:systemSetting()" id="aColor" rel="noopener noreferrer"><font size="3">System Settings</font></a>
												</li>
												<!-- <li class="big-left-media">
                                                        
                                                        <a href="javascript:showHelpDeskQueryPage()" id="aColor" rel="noopener noreferrer"><font size="3">Contact Helpdesk</font></a>
                                                    

                                                </li> -->


												<li class="big-left-media">
													<a href="javascript:learningCenter()" id="aColor" rel="noopener noreferrer"><font size="3">Learning Center<br>
													(User Manuals)</font></a>
												</li>


												<li class="big-left-media">
													<a href="javascript:subjectWise()" id="aColor" rel="noopener noreferrer"><font size="3">Rly. Board Policy Circulars<br>
													(For Procurement Of Goods)</font></a>
												</li>
												<!-- <li class="big-left-media">
                                                        
                                                        <a href="javascript:surveylink()" id="aColor" rel="noopener noreferrer"><font size="3">Survey On Circular Procurement <img src="/ireps/images/home/New.png"></font></a>                                                 

                                                </li> -->
											</ul>
										</div>
									</div>
								</div>
								<!-- Other quick link section starts  -->
								<br>


								<div class="heading_wrappper" style="background-color: #D75125; padding:10px;">
									<h6 class="text-uppercase margin_0" style="color:white;">Other Useful Links</h6>
								</div>


								<div class="ireps_padding" style="border: 1px solid #145683;">
									<div class="widget widget_slider widget_featured_posts">
										<div class="owl-carousel" data-autoplay="true" data-items="1" data-loop="true" data-nav="true" data-responsive-lg="1" data-responsive-md="1" data-responsive-sm="1" data-responsive-xs="1">
											<ul>
												<li class="big-left-media" style="text-align: justify;">
													<a aria-label="Open: javascript:iMMSPKI()" href="javascript:iMMSPKI()">Click here</a> if you encounter any error while logging in to iMMS. <!---Checkout the links in the bottom strip of the page for more information and downloads-->
												</li>


												<li class="big-left-media" style="text-align: justify;">
													<a class="linkStyle" href="javascript:highValue();" id="aColor" rel="noopener noreferrer">High Value Tenders</a>
												</li>


												<li class="big-left-media" style="text-align: justify;">
													<a class="linkStyle" href="javascript:jreInstructionPage()" id="aColor" rel="noopener noreferrer" title="Download JAVA (JRE)">Download JAVA (JRE)</a>
												</li>


												<li class="big-left-media" style="text-align: justify;">
													<a href="javascript:irepsSigner15()" id="aColor" rel="noopener noreferrer">IREPS Signer (Version 1.5) <!-- <img SRC="/ireps/images/home/New.png"/> --></a>
												</li>
											</ul>
										</div>
									</div>
								</div>
								<!-- Other quick link section ends -->
							</div>
						</div>


						<div class="col-md-10" style="padding-left:0px;">
							<div class="row" style="height: 420px;">
								<div class="col-md-9 mt-0">
									<!-- <img src="/ireps/images/common/maxresdefault.jpg" class="alignright" alt="About Us"/> -->


									<div aria-label="Carousel myCarousel" aria-roledescription="carousel" class="carousel slide" data-interval="3000" data-ride="carousel" id="myCarousel" role="region">
										<!-- Indicators -->


										<ol class="carousel-indicators">
											<li aria-label="Go to slide 1" class="active" data-slide-to="0" data-target="#myCarousel" role="button" tabindex="0">
											</li>


											<li aria-label="Go to slide 2" data-slide-to="1" data-target="#myCarousel" role="button" tabindex="0">
											</li>


											<li aria-label="Go to slide 3" data-slide-to="2" data-target="#myCarousel" role="button" tabindex="0">
											</li>


											<li aria-label="Go to slide 4" data-slide-to="3" data-target="#myCarousel" role="button" tabindex="0">
											</li>
											<!-- <li data-target="#myCarousel" data-slide-to="4"></li> -->
										</ol>
										<!-- Wrapper for slides -->


										<div class="carousel-inner">
											<div class="carousel-item active"><img alt="IREPS promotional banner" class="" src="/ireps/images/home/image03a.jpg" style="width: 100%; height: 370px;">
											</div>


											<div class="carousel-item"><img alt="IREPS promotional banner" class="" src="/ireps/images/home/ireps4.png" style="width: 100%; height: 370px;">
											</div>


											<div class="carousel-item"><img alt="IREPS promotional banner" class="" src="/ireps/images/home/image05a.png" style="width: 100%; height: 370px;">
											</div>


											<div class="carousel-item"><img alt="IREPS promotional banner" class="" src="/ireps/images/home/image04a.jpg" style="width: 100%; height: 370px;">
											</div>
										</div>
										<!-- Left and right controls -->
										<a class="carousel-control-prev" data-slide="prev" href="#myCarousel" role="button"><span aria-hidden="true" class="carousel-control-prev-icon" style="color: #336699; height: 30px; width: 40px; padding: 5px; margin-top: 8px;"></span> <span class="sr-only">Previous</span></a> <a class="carousel-control-next" data-slide="next" href="#myCarousel" role="button"><span aria-hidden="true" class="carousel-control-next-icon" style="color: #336699; height: 30px; width: 40px; padding: 5px; margin-top: 8px;"></span> <span class="sr-only">Next</span></a>
									</div>
								</div>


								<div class="col-md-auto mt-0">
									<div class="rounded overflow_hidden" style="height:36%">
										<!-- -<div class="with_padding header_gradient heading_wrappper">
                                                    <h5 class="text-uppercase margin_0"> Reserve</h5>
                                                </div>=-->
										<!--                            <div class="ireps_padding"> -->


										<div class="widget widget_slider widget_featured_posts embed-responsive embed-responsive-4by3">
											<!--   <div class="row">
                                                                                <div class="col-md-12" align="center"> -->


											<div id="div-gpt-ad-1572611857377-0" style="width: 300px; height: 250px;">
												<script>
												                                                                                googletag.cmd.push(function() {
												                                                                                  googletag.display('div-gpt-ad-1572611857377-0');
												                                                                                });
												</script>
											</div>


											<div id="div-gpt-ad-1572611857377-0" style="width: 300px; height: 250px;">
												<script>
												                                                                                googletag.cmd.push(function() {
												                                                                                  googletag.display('div-gpt-ad-1572611857377-0');
												                                                                                });
												</script>
											</div>
											<!-- </div>
                                                                    </div>
                     -->
										</div>
										<!--                                </div> -->
									</div>
									<a class="logo top_logo" href="javascript:vendorApprovalAnn()" rel="noopener noreferrer"><img alt="vendor approval" class="img-fluid" src="/ireps/images/vendorapr.png" style="margin-left:-3px;height:90px; width:250px;"></a>
								</div>
							</div>


							<div class="row">
								<div class="col-md-8">
									<h4 class="entry-title"><a href="" rel="bookmark">News &amp; Updates</a>
<div style="padding:10px; border:2px dashed red; background:#fff3f3; margin-bottom:10px;">
  <h5 style="color:red;">⚠ TRIAL SITE – News & Events</h5>
  <p>This is a <b>trial version</b> of the IREPS portal. The data shown here is <u>dummy/sample only</u> 
     and should not be treated as official information.</p>
</div>
<!--<img
                                    SRC="/ireps/images/home/New.png">==-->
									</h4>


									<div class="row">
										<div class="with_border" id="RollingDiv1" style="max-height:250px; -ms-overflow-y: scroll; overflow-y:scroll;">
											<!--                                <marquee behavior="scroll"  scrollamount="3" direction="up"  onmouseover="this.stop();" onmouseout="this.start();"> -->


											<ul style="text-align: justify;">
												<!-- <li><b><font color="#D75125">Tender document for sale of serviceable machinery & plants by CLW<img SRC="/ireps/images/home/New.png"/></font></b>
                                        <br><span>(02/06/2025)</span><br>Tender documents of 16 tender cases are attached herewith for information. Prospective bidders  can participate by logging in on IREPS website. 
                                             Click on the Tender Number to download the documents.&nbsp;
                                             <a href="./ireps/upload/resources/08240001.pdf" target=_blank  rel="noopener noreferrer">08240001</a> 
                                             <a href="./ireps/upload/resources/08240002.pdf" target=_blank  rel="noopener noreferrer">08240002</a> 
                                             <a href="./ireps/upload/resources/08240003.pdf" target=_blank  rel="noopener noreferrer">08240003</a> 
                                             <a href="./ireps/upload/resources/08240004.pdf" target=_blank  rel="noopener noreferrer">08240004</a>
                                             <a href="./ireps/upload/resources/08240005.pdf" target=_blank  rel="noopener noreferrer">08240005</a>
                                             <a href="./ireps/upload/resources/08240007.pdf" target=_blank  rel="noopener noreferrer">08240007</a> 
                                             <a href="./ireps/upload/resources/08240008.pdf" target=_blank  rel="noopener noreferrer">08240008</a>
                                             <a href="./ireps/upload/resources/08240009.pdf" target=_blank  rel="noopener noreferrer">08240009</a>
                                             <a href="./ireps/upload/resources/08240010.pdf" target=_blank  rel="noopener noreferrer">08240010</a>
                                             <a href="./ireps/upload/resources/08240011.pdf" target=_blank  rel="noopener noreferrer">08240011</a>
                                             <a href="./ireps/upload/resources/08240014.pdf" target=_blank  rel="noopener noreferrer">08240014</a>
                                             <a href="./ireps/upload/resources/08240015.pdf" target=_blank  rel="noopener noreferrer">08240015</a>
                                             <a href="./ireps/upload/resources/08240016.pdf" target=_blank  rel="noopener noreferrer">08240016</a>
                                             <a href="./ireps/upload/resources/08240018.pdf" target=_blank  rel="noopener noreferrer">08240018</a>
                                             <a href="./ireps/upload/resources/08240019.pdf" target=_blank  rel="noopener noreferrer">08240019</a>
                                             <a href="./ireps/upload/resources/08240020.pdf" target=_blank  rel="noopener noreferrer">08240020</a>
                                                
                                        </li><br/>  -->
												<!-- <li><b><font color="#D75125">Tender document for sale of serviceable machinery & plants by CLW</font></b>
                                        <br><span>(29/10/2024)</span><br>Tender documents of 04 tender cases are attached herewith for information. Prospective bidders  can participate by logging in on IREPS website. 
                                             Click on the Tender Number to download the documents.&nbsp;
                                             <a href="./ireps/upload/resources/Item-08240001_merged.pdf" target=_blank  rel="noopener noreferrer">08240001 </a> 
                                             <a href="./ireps/upload/resources/Item-08240002_merged.pdf" target=_blank  rel="noopener noreferrer">08240002 </a> 
                                             <a href="./ireps/upload/resources/Item-08240003_merged.pdf" target=_blank  rel="noopener noreferrer">08240003 </a> 
                                             <a href="./ireps/upload/resources/Item-08240004_merged.pdf" target=_blank  rel="noopener noreferrer">08240004</a> 
                                        </li><br/> -->


												<li><b><font color="#D75125">Rail Coach Factory (RCF)-Kapurthala shall be organizing Vendor Development Programme (VDP).</font></b><br>
												<span>(20/08/2025)</span><br>
												Rail Coach Factory (RCF)-Kapurthala shall be organizing Vendor Development Programme (VDP) on Saturday, 6th September 2025 at 10: hrs. onwards in Waris Shah Auditorium, RCF-Kapurthala. To generate awareness related to PPP-MII Order 2017 and also to promote indigenization. All the vendors / MSEs etc. are invited to attend this VDP.</li>


												<li style="list-style: none"><br>
												</li>


												<li>
													<b><font color="#D75125">EOI for SALE of In-Service Diesel Locomotives.</font></b><br>
													<span>(20/08/2025)</span><br>
													NORTH EASTERN RAILWAY (NER) is seeking qualified partners for sale of seventeen (17) In-Service Diesel Locomotives. Qualified firms with adequate resources, who are interested to purchase In-Service Diesel Locomotives, are requested to submit their Expression of Interest (EOI) before 16:00 hrs on 13Sept. 2025. <a href="https://ner.indianrailways.gov.in/view_section.jsp?lang=0&amp;id=0,1,304,424" rel="noopener noreferrer" target="_blank">Notice for EOI</a> OR <a href="https://ner.indianrailways.gov.in/uploads/files/1755605521843-Notice%20for%20EOI%20for%20sale%20of%20in%20service%20Diesel%20locomotive%20NER.pdf" rel="noopener noreferrer" target="_blank">EOI Document</a>
												</li>


												<li style="list-style: none"><br>
												<br>
												</li>


												<li><b><font color="#D75125">Online Submission of Post-Contract Clarification/Amendment Requests by vendors.</font></b><br>
												<span>(21/03/2025)</span><br>
												All Vendors are requested to lodge their post-contract clarification/amendment requests exclusively through IREPS.</li>


												<li style="list-style: none"><br>
												</li>


												<li><b><font color="#D75125">IR-USSOR 2021 (as per ACS 1 to IRUSSOR 2021) directory published</font></b><br>
												<span>(14/06/2024)</span><br>
												1. IRUSSOR-2019 and USSOR-2010 has been archived on 14.06.2024.<br>
												2. A new version (Version 3) has been created for IR-USSOR 2021 (as per ACS 1 to IRUSSOR 2021). All zonal railways are advised to updated the rates against this version at the earliest. IR-USSOR 2021 Version 2 will be discontinued from 01.07.2024.</li>


												<li style="list-style: none"><br>
												<br>
												<br>
												<br>
												<br>
												<br>
												</li>
											</ul>
											<!--                                </marquee> -->
										</div>
									</div>
								</div>


								<div class="col-md-4 rounded">
									<h4 class="entry-title"><a href="" rel="bookmark">Notifications</a>
									</h4>


									<div class="row" id="RollingDiv2" style="max-height:250px; -ms-overflow-y: scroll; overflow-y:scroll;">
										<div class="">
											<div style="margin-left: 13px;margin-right: 20px;">
												<div class="owl-carousel" data-autoplay="true" data-items="1" data-loop="true" data-nav="true" data-responsive-lg="1" data-responsive-md="1" data-responsive-sm="1" data-responsive-xs="1">
													<ul>
														


														<li>
															<p style="margin: 10px;text-align: justify;"><b><font color="#D75125">Rail Coach Factory (RCF)-Kapurthala shall be organizing Vendor Development Programme (VDP) on Saturday, 6th September 2025 at 10:00 hrs. onwards in Waris Shah Auditorium, RCF-Kapurthala.</font></b><img alt="New notification badge" src="/ireps/images/home/New.png">
															</p>
														</li>


														<li style="list-style: none"><br>
														</li>


														<li>
															<p style="margin: 10px;text-align: justify;"><b><font color="#D75125">NORTH EASTERN RAILWAY (NER) is seeking qualified partners for sale of seventeen (17) In-Service Diesel Locomotives. Qualified firms with adequate resources, who are interested to purchase In-Service Diesel Locomotives, are requested to submit their Expression of Interest (EOI) before 16:00 hrs on 13Sept. 2025. <a href="https://ner.indianrailways.gov.in/view_section.jsp?lang=0&amp;id=0,1,304,424" rel="noopener noreferrer" target="_blank">Notice for EOI</a> OR <a href="https://ner.indianrailways.gov.in/uploads/files/1755605521843-Notice%20for%20EOI%20for%20sale%20of%20in%20service%20Diesel%20locomotive%20NER.pdf" rel="noopener noreferrer" target="_blank">EOI Document</a></font></b> <img alt="New notification badge" src="/ireps/images/home/New.png"></p>
														</li>


														<li style="list-style: none"><br>
														</li>


														<li>
															<p style="margin: 10px;text-align: justify;"><b><font color="#D75125">Online Appeal for Reinstatement of Cancelled Leasing Contracts</font></b><br>
															All Vendors are requested to submit their appeals for reinstatement of cancelled leasing contracts online exclusively through IREPS.</p>
														</li>


														<li>
															<p style="margin: 10px;text-align: justify;"><b><font color="#D75125">Online Submission of Post-Contract Clarification/Amendment Requests by vendors.</font></b><br>
															All Vendors are requested to lodge their post-contract clarification/amendment requests exclusively through IREPS.</p>
														</li>


														<li>
															<p style="margin: 10px;text-align: justify;"><b><font color="#D75125">IR-USSOR 2021 (as per ACS 1 to IRUSSOR 2021) directory published</font></b><br>
															1. IRUSSOR-2019 and USSOR-2010 has been archived on 14.06.2024.<br>
															2. A new version (Version 3) has been created for IR-USSOR 2021 (as per ACS 1 to IRUSSOR 2021). All zonal railways are advised to updated the rates against this version at the earliest. IR-USSOR 2021 Version 2 will be discontinued from 01.07.2024.<img alt="New notification badge" src="/ireps/images/home/New.png"></p>
														</li>


														<li>
															<p style="margin: 10px;text-align: justify;"><b><font color="#D75125">Attention Vendors: - Generation of e-Dispatch Note in Goods &amp; Services Module of IREPS</font></b><br>
															It is mandatory for all vendors to generate e-dispatch note duly entering the dispatch details, while dispatching the materials to consignee against the Indian Railway supply contracts. This facility can be accessed through Contracts Tab on your homepage after login in Goods &amp; Services Module.<img alt="New notification badge" src="/ireps/images/home/New.png"></p>
														</li>


														<li>
															<p style="margin: 10px;text-align: justify;"><b><font color="#D75125">QR based Gate Entry System</font></b><br>
															QR based Gate Entry System has been developed on IMMS. Please refer to the User Manual for the same. <a aria-label="Open: ./ireps/upload/resources/egate_entry.pdf" href="./ireps/upload/resources/egate_entry.pdf" rel="noopener noreferrer" target="_blank">Please click</a> .<img alt="New notification badge" src="/ireps/images/home/New.png"></p>
														</li>


														<li>
															<p style="margin: 10px;text-align: justify;"><b><font color="#D75125">Implementation of Warranty Policy on IR</font></b><br>
															Handling of Warranty Rejections. <a aria-label="Open: ./ireps/upload/resources/Handling_of_Warranty_rejections_17102022.pdf" href="./ireps/upload/resources/Handling_of_Warranty_rejections_17102022.pdf" rel="noopener noreferrer" target="_blank">Please click</a> Railway Board's letter No.2022/RS(G)/779/7(3390005) dated 17.10.2022 for details.<img alt="New notification badge" src="/ireps/images/home/New.png"></p>
														</li>
													</ul>
												</div>
											</div>
										</div>
									</div>
									<!-- <div><ul><li><a href="#" data-toggle="modal" data-target="#GSCCModal" rel="noopener noreferrer">View More......</a></p>
                                            </li></ul></div> -->
								</div>
							</div>
						</div>
					</div>
				</div>
			</section>
		</div>
		<!-- Modal Window for Notification -->


		<div aria-hidden="true" aria-labelledby="myModalLabel" class="modal fade" id="GSCCModal" role="dialog" tabindex="-1">
			<div class="modal-dialog modal-lg">
				<div class="modal-content">
					<div class="modal-header">
						<button aria-hidden="true" class="close" data-dismiss="modal" type="button">×</button>

						<h4 class="entry-title" id="myModalLabel"><a href="#">Notifications</a>
						</h4>
					</div>


					<div class="modal-body" style="height:290px; -ms-overflow-y: scroll; overflow:auto;text-align: justify;">
						<ul>
							<li>All vendors are advised to generate e-dispatch note duly entering the dispatch details, while dispatching the materials to consignee against the Indian Railway supply contracts. This facility can be accessed through Contracts Tab on your homepage after login in Goods &amp; Services Module.</li>


							<li style="list-style: none"><br>
							<br>
							</li>


							<li>For convenience of all stake-holders, functionality for on-line submission of Non-Stock Bills by vendors on IREPS Portal has been made live for POL items (High Speed Diesel etc.) also. Vendors are suggested to submit their on-line Bills on IREPS Portal for POL items (Non-Stock) against Digitally-signed Receipt Documents generated in User Depot Module (UDM).<img alt="New notification badge" src="/ireps/images/home/New.png"></li>


							<li style="list-style: none"><br>
							<br>
							</li>


							<li>Important information to vendors: Online Bill Payment has been implemented in RCF, hence all the vendors are advised to submit bills only through online system of IREPS for material supplied from 1st May 22 onwards.</li>


							<li style="list-style: none"><br>
							<br>
							</li>


							<li>In terms of Railway Board's instructions no.2021/RS(G)/779/7 dated 30.03.2022, from 01.04.2022 onwards directory of approved vendors of RDSO, CLW, BLW, RCF, ICF, MCF, and CORE as available on UVAM only shall be considered valid directories for all purposes by all stakeholders. Vendor directories being maintained in other forms (manual or online), if any, shall not be valid. <a aria-label="Open: ./ireps/upload/resources/Procurement%20from%20approved%20sources%20300322.pdf" href="./ireps/upload/resources/Procurement%20from%20approved%20sources%20300322.pdf" rel="noopener noreferrer" target="_blank">Click Here</a> to view/download Railway Board Letter.
							</li>


							<li style="list-style: none"><br>
							<br>
							</li>


							<li>In terms of Railway Board's letter No.2021/RS(M)/Paperless Working/1 dt.25.08.2021, Suppliers can now submit their Bills on-line on IREPS Portal (<a href="https://ireps.gov.in/" rel="noopener noreferrer">https://ireps.gov.in/</a>) for Non-Stock items supplied against Purchase Orders placed by Stores Department, as being done for Stock Items.<br>
								<br>
								For Non-Stock items supplied, Suppliers can view digitally-signed Consignment Receipt Certificate (CRC) under CRC (UDM) Tab for Advance Payment of 80% / 90% / 95% / 98% etc. (similar to Receipted Challan for Stock Items) &amp; Consignment Receipt Note (CRN) under CRN (UDM) Tab for Final Payment (similar for R-Note for Stock Items) by clicking "View &amp; Manage Contracts" link under "My Contracts" Tab and clicking the icon "Manage Your Purchase Order" available against the selected Purchase Order on the Home Page of IREPS site available after login.<br>
								<br>
								Digitally-signed Receipted Challans &amp; R-Notes issued by Stores Depots against Purchase Orders for Non-Stock items will be visible to supplier under Rect. Challan &amp; R/Notes Tabs respectively wherever such supplies are made to Stores Depot.<br>
								<br>
								Vendor has to select the relevant CRC / CRN / Receipted Challan / R-Note while submitting the Bill on-line on IREPS Portal for the supplied Non-Stock item. Suppliers may refer "User Manual for Vendors on Post Contract Activities" available on IREPS Portal in "Learning Centre" link at S.No.3 under Heading "E-Tender (Goods &amp; Services)" for guidance.<br>
								<br>
								<br>
								<br>
								<br>
								<br>
							</li>


							<li style="list-style: none"><br>
							<br>
							</li>


							<li>All vendors supplying common use goods and services to Railways are advised to get themselves registered with GeM portal (<a href="https://gem.gov.in" rel="noopener noreferrer" target="_blank">www.gem.gov.in</a>) for availing business opportunities offered by GeM.<br>
								<br>
							</li>


							<li>Exhibition of Critical Items by Northern Railway <a href="https://sites.google.com/view/northern-railway-vendor-meet/exhibition-of-items?authuser=0" rel="noopener noreferrer" target="_blank">(Click here) <img alt="New notification badge" src="/ireps/images/home/New.png"></a><br>
								<br>
							</li>


							<li>Indian Railways allows the vendors / contractors the option to receive contractual payments against letter of credit against indigenous contracts. The terms and conditions related to payment through Letter of Credit are described in the tender documents. Vendors / contractors who intend to take advantage of this option can do so by selecting suitable payment mode at the time of submission of their bid.</li>
						</ul>
					</div>


					<div class="modal-footer">
						<button class="btn btn-primary btn-sm" data-dismiss="modal" style="float:right;" type="button">Close</button>
					</div>
				</div>
			</div>
		</div>


		<div aria-hidden="true" aria-labelledby="myModalLabel" class="modal fade" id="GSCCModal1" role="dialog" tabindex="-1">
			<div class="modal-dialog modal-lg">
				<div class="modal-content">
					<div class="modal-body" style="height:400px; -ms-overflow-y: scroll; overflow:auto;text-align: justify;">
						<table align="center" width="300">
							<tbody>
								<tr style="text-align: justify;">
									<td><img alt="Indian Railways E-Procurement System logo" height="100" src="./ireps/images/notification_image/logo.jpeg" style="display: block; margin-left: auto; margin-right: auto;" width="100">
									</td>
								</tr>


								<tr style="text-align: justify;">
									<td>
									</td>
								</tr>


								<tr>
									<td align="left" style="text-align: justify;" width="100%"><font color="black" size="+1"><b>Shri Ashwini Vaishnaw, Minister of Railways, Communications and Electronics &amp; Information Technology launched e-Auction of Commercial Earning &amp; NFR Contracts on 24th June,2022 at 5:15 PM</b></font>
									</td>
								</tr>


								<tr style="text-align: justify;">
									<td style="text-align: justify;"><img alt="IREPS promotional banner" src="./ireps/images/notification_image/banner.jpeg">
									</td>
								</tr>


								<tr>
									<td>
									</td>
								</tr>


								<tr>
									<td align="left" style="text-align: justify;" width="100%"><font color="black" size="+1"><b>YouTube link for recording of the event is as under:</b></font>
									</td>
								</tr>


								<tr>
									<td><iframe allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen frameborder="0" height="400" src="https://www.youtube.com/embed/JrScKXqBzsc" title="YouTube video player" width="100%"></iframe>
									</td>
								</tr>
							</tbody>
						</table>
					</div>


					<div class="modal-footer">
						<button class="btn btn-primary btn-sm" data-dismiss="modal" style="float:right;" type="button">Close</button>
					</div>
				</div>
			</div>
		</div>
		<!-- End of modal window -->


		<section>
			<div class="row">
				<div class="col-md-12" style="padding-left:325px;">
					<div id="div-gpt-ad-1572612360884-0" style="width: 970px; height: 90px;">
						<script>
						                                                                  googletag.cmd.push(function() {
						                                                                    googletag.display('div-gpt-ad-1572612360884-0');
						                                                                  });
						</script>
					</div>
				</div>
			</div>
		</section>


		<footer class="page_footer ds darkblue parallax" role="contentinfo">
			<div class="container" style="padding: 0 340px;">
				<div class="row">
					<div class="col-md-4 text-left">
						<div class="widget widget_contacts topmargin_5">
							<h4 class="setmargin">Assistance</h4>


							<p><a href="javascript:void(0);" onclick="showHelpDeskQueryPage()">Helpdesk</a>
							</p>


							<p><a href="javascript:learningCenter()">User Manuals</a>
							</p>


							<p><a href="javascript:systemSetting()">System Settings</a>
							</p>
							<!--                                    <a href="http://rti.railnet.gov.in/" target="_blank">FAQs </a> -->


							<ul style="list-style-type:none;">
								<li>FAQs

									<ul style="list-style-type:none;">
										<li>-  <a class="linkStyle" href="javascript:Etender()">E-Tender</a>
										</li>


										<li>-  <a class="linkStyle" href="javascript:Eauction()">E-Auction</a>
										</li>


										<li>-  <a class="linkStyle" href="javascript:ePayment()">E-Payment</a>
										</li>
									</ul>
								</li>
							</ul>
						</div>
					</div>


					<div class="col-md-4 text-left" data-animation="fadeInUp">
						<div class="widget widget_contacts topmargin_5">
							<h4 class="setmargin"><span class="color-lightblue">Useful Info</span>
							</h4>


							<p><a class="linkStyle" href="javascript:annualProcReport();">Procurement Projections</a>
							</p>


							<p><a class="linkStyle" href="javascript:highValue();">High Value Tenders</a>
							</p>


							<p><a class="linkStyle" href="javascript:viewApprovedVendor();">Approved Vendors</a>
							</p>


							<p><a class="linkStyle" href="javascript:bannFirms();">Banned / Suspended Firms</a>
							</p>
						</div>
					</div>


					<div class="col-md-4 text-left" data-animation="fadeInUp">
						<div class="widget widget_contact topmargin_5">
							<h4 class="setmargin"><span class="color-lightblue" rel="noopener noreferrer">Miscellaneous</span>
							</h4>
							<!-- <img SRC="/ireps/images/home/New.png"> -->


							<p class=""><a class="linkStyle" href="javascript:aboutUs()" rel="noopener noreferrer">About IREPS</a>
							</p>


							<p class=""><a href="http://cris.org.in/" rel="noopener noreferrer" target="_blank">CRIS</a>
							</p>


							<p class=""><a href="javascript:TermsAndCondition()" rel="noopener noreferrer">Terms &amp; Conditions</a>
							</p>


							<p class=""><a href="javascript:Copyright()" rel="noopener noreferrer">Copyright</a>
							</p>


							<p class=""><a href="javascript:PrivacyPolicy()" rel="noopener noreferrer">Privacy Statement</a>
							</p>


							<p class=""><a href="javascript:Contactus()" rel="noopener noreferrer">Contact</a>
							</p>
						</div>
					</div>
				</div>


				<div class="row">
					<div class="col-md-4 text-left" data-animation="fadeInUp">
						<div class="widget widget_contacts topmargin_5">
							<h4 class="setmargin"><span class="color-lightblue">Downloads</span>
							</h4>


							<p><a href="javascript:irepsSigner15()">IREPS Signer (Version 1.5) <img alt="New notification badge" src="/ireps/images/home/New.png"></a>
							</p>


							<p><a href="javascript:learningCenter()">User Manuals</a>
							</p>
							<!--                                    <a href="javascript:Disclamier()">Public Documents</a> -->


							<ul style="list-style-type:none;">
								<li>Public Documents

									<ul style="list-style-type:none;">
										<li>-  <a class="linkStyle" href="javascript:irepsDocumentNew('supply')" rel="noopener noreferrer">Goods &amp; Services</a>
										</li>
										<!--<li>-&nbsp<a href="javascript:irepsDocumentAuction()" class="linkStyle" rel="noopener noreferrer"> Auction (Sale) </a></li>'-->


										<li>-  <a class="linkStyle" href="javascript:irepsDocumentNew('works')" rel="noopener noreferrer">Works</a>
										</li>


										<li>-  <a class="linkStyle" href="javascript:irepsDocumentNew('lease')" rel="noopener noreferrer">Earning / Leasing</a>
										</li>
									</ul>
								</li>
							</ul>
						</div>
					</div>


					<div class="col-md-5 text-left" data-animation="fadeInUp">
						<div class="widget widget_contacts topmargin_5">
							<h4 class="setmargin"><span class="color-lightblue">Important External Links</span>
							</h4>


							<p><a class="linkStyle" href="javascript:jreInstructionPage()" rel="noopener noreferrer" title="Download JAVA (JRE)">Download JAVA (JRE)</a>
							</p>


							<p><a class="linkStyle" href="http://adobe.com/downloads" rel="noopener noreferrer" target="_blank" title="Acrobat Reader Version 8 or above">Download PDF Reader</a>
							</p>


							<p><a class="linkStyle" href="http://cca.gov.in" rel="noopener noreferrer" target="_blank">CCA India</a>
							</p>


							<p><a href="http://www.indianrailways.gov.in" rel="noopener noreferrer" target="_blank">Indian Railways</a>
							</p>


							<p><a href="http://www.nic.in" rel="noopener noreferrer" target="_blank">National Informatics Center</a>
							</p>
						</div>
					</div>
				</div>


				<div class="row">
					<div class="col-md-12 text-left" data-animation="fadeInUp">
						<div class="widget widget_contacts topmargin_5">
							<p><a href="./ireps/upload/resources/stqc_certificate.PDF" rel="noopener noreferrer" target="_blank"><img alt="CRIS" height="60" src="/ireps/images/common/logo/stqc.png" width="60">   </a>    <a href="http://cris.org.in/" rel="noopener noreferrer" target="_blank"><img alt="CRIS" height="70" src="/ireps/images/common/logo/5.jpeg" width="70">   Centre For Railway Information Systems, Designed, Developed and Hosted by CRIS Version 7.1.0</a></p>
						</div>
					</div>
				</div>
			</div>
		</footer>
	</div>
	<!-- eof #box_wrapper -->
	<!-- For The POP UP Message Start From HERE by NAVAL KUMAR GUPTA -->


	<div class="modal fade" id="myModal">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<!-- Modal body -->


				<div class="modal-body">
					<!--====Code Added for IMMIS NEW PKI ===============-->
					<!--====Code Added for IMMIS NEW PKI UP to HERE ===============-->
					<!-- DO NOT REMOVE THESE TAGS -->


					<div id="dmsg_tag">
					</div>


					<table>
						
						


						<tr>
							<td align="left" style="text-align: justify;" width="100%"><font color="#D75125"><b>V. Important</b></font><br>
							<br>
							<font color="black">IREPS services have been discontinued on Internet Explorer as of July 13, 2024. All users are advised to switch to other browsers such as Chrome, Edge, or Firefox to avoid any inconvenience.</font>
							</td>
						</tr>
					</table>
					


					<table>
						<tr>
							<td align="center" height="10" width="100%"><button class="btn btn-primary btn-sm" data-dismiss="modal" type="button">Close</button>
							</td>
						</tr>
					</table>
				</div>
			</div>
		</div>
	</div>
	<!--Added By wasi for cvap  30-03-2021 starts -->


	<div class="modal fade" id="cvapModal">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-body">
					<table align="center" style="width: 97%;border-style: dashed;border-width: 2px;border-color: #806000; margin-left: 10px; margin-right: 10px;margin-top:10px;margin-bottom:10px;">
						<tr>
							<td align="center">
								<table border="0" style="width: 93%">
									<tr>
										<td align="center" style="padding: 0px;" width="100%">
											<table border="0" style="width: 100%">
												<tr>
													<td style="text-align: right;padding-top: 25px;">
														<font color="#D75125"></font>

														<h3><font color="#D75125">Unified Vendor Approval Module</font>
														</h3>
													</td>

													<td align="left"><img alt="Indian Railways E-Procurement System logo" height="60" src="/ireps/images/common/U-VAM_logo.png" width="150">
													</td>
												</tr>
											</table>
										</td>
									</tr>


									<tr height="25px;">
										<td align="left" style="text-align: justify;" width="100%">Indian Railways procure various items related to safety of passengers and trains from approved vendors. Various units of Indian Railways like <b>RDSO</b> (Research Design &amp; Standards Organization, Lucknow), <b>ICF</b> (Integral Coach Factory, Perambur), <b>MCF</b> (Modern Coach Factory, Rae Bareilly), <b>RCF</b> (Rail Coach Factory, Kapurthala), <b>BLW</b> (Benaras Locomotive Works, Varanasi), <b>CLW</b> (Chittaranjan Locomotive Works, Chittaranjan) and <b>CORE</b> (Central Organization for Railway Electrification, Prayagraj) are engaged in approval of vendors for various categories of items.</td>
									</tr>


									<tr height="25px;">
										<td align="left" style="text-align: justify;" width="100%">UVAM is a digitization initiative of Indian Railways through which all the activities related to approval of vendors has been digitized.</td>
									</tr>


									<tr height="25px;">
										<td align="left" style="text-align: justify;" width="100%">Requests for approval can be submitted by the vendors online through their IREPS account, and the status of application can also be tracked. All the drawings, specifications, and schedule of technical requirements can be viewed and downloaded.</td>
									</tr>


									<tr height="25px;">
										<td align="left" style="text-align: justify;" width="100%">Manufactures who are interested in getting themselves approved may click on Approval of Vendors link on IREPS home page for further Details.</td>
									</tr>


									<tr height="25px;">
										<td align="left" style="text-align: justify;" width="100%">
										</td>
									</tr>


									<tr height="25px;">
										<td align="center" width="100%">............................................</td>
									</tr>


									<tr height="25px;">
										<td align="left" style="text-align: justify;" width="100%">
										</td>
									</tr>


									<tr height="25px;">
										<td align="left" style="text-align: center;" width="100%"><button class="btn btn-primary btn-sm" data-dismiss="modal" type="button">Close</button>
										</td>
									</tr>
								</table>
							</td>
						</tr>
					</table>
				</div>
			</div>
		</div>
	</div>
	<a href="#" id="toTop" style="display: block;"><span id="toTopHover" style="opacity: 0;"></span>To Top</a> <!--Added By wasi for cvap  30-03-2021 starts -->
	<!-- -END OF POPUP MESSAGE -->
	<script>
	 // Get the "To Top" button element
	 const toTopButton = document.getElementById("toTop");

	 // Function to toggle the visibility of the button based on scroll position
	 window.onscroll = function() {
	   // Check if the page is scrolled more than 50px
	   if (document.body.scrollTop > 50 || document.documentElement.scrollTop > 50) {
	     toTopButton.style.display = "block";  // Show button when scrolled
	   } else {
	     toTopButton.style.display = "none";  // Hide button when at the top
	   }
	 };

	 // Optionally, smooth scroll to the top when the button is clicked
	 toTopButton.addEventListener("click", function(e) {
	   e.preventDefault();
	   window.scrollTo({ top: 0, behavior: 'smooth' });
	 });
	</script> 
	<script>
	$(document).ready(function(){
	 $("ul#ticker01").liScroll();
	});

	(function( $ ){
	  $.fn.liScroll = function(settings) {
	       settings = jQuery.extend({
	       travelocity: 0.03
	       }, settings);       
	       return this.each(function(){
	               var $strip = jQuery(this);
	               $strip.addClass("newsticker")
	               var stripHeight = 0.5;
	               $strip.find("li").each(function(i){
	                   stripHeight += jQuery(this, i).outerHeight(true); // thanks to Michael Haszprunar and Fabien Volpi
	               });
	               var $mask = $strip.wrap("<div class='mask'><\/div>");
	               var $tickercontainer = $strip.parent().wrap("<div class='tickercontainer'><\/div>");                             
	               var containerHeight = 100;  //a.k.a. 'mask' width   
	               $strip.height(stripHeight);         
	               var totalTravel = stripHeight;
	               var defTiming = totalTravel/settings.travelocity;   // thanks to Scott Waye     
	               function scrollnews(spazio, tempo){
	               $strip.animate({top: '-='+ spazio}, tempo, "linear", function(){$strip.css("top", containerHeight); scrollnews(totalTravel, defTiming);});
	               }
	               scrollnews(totalTravel, defTiming);             
	               $strip.hover(function(){
	                 jQuery(this).stop();
	               },
	               function(){
	                 var offset = jQuery(this).offset();
	                 var residualSpace = offset.top + stripHeight;
	                 var residualTime = residualSpace/settings.travelocity;
	                 scrollnews(residualSpace, residualTime);
	               });         
	       }); 
	  }; 
	})( jQuery );
	window.onload = function(){
	var notification_date ="24.11.2020";

	document.getElementById('notification_date').innerHTML = notification_date;

	};
	document.getElementById("dmsg_tag").innerHTML= //"<TABLE  border=2 bordercolor=#336666 width=98% bgcolor=#ffffff align=center height=100%><TR><TD width=100% align=left ><FONT color=#c00000 size=+1><B>Downtime Alert ( 28/May/2025 ) :<\/B><\/FONT><\/TD><\/TR><TR><TD width=100% align=left ><FONT color=black size=+1><B>IMMS(User Depot Module) will not be available on 28-May-2025 (Wednesday) from 17:30 hrs to 18:00 hrs IST due to schedule maintenance.<br/><\/B><\/FONT><\/TD><\/TR><\/TABLE>";


	</script>' 
	<script>
	// Accessible dropdown menus with keyboard support
	document.querySelectorAll('.nav-item.dropdown > a, .sf-with-ul').forEach(function(dropToggle) {
	 dropToggle.setAttribute('aria-haspopup', 'true');
	 dropToggle.setAttribute('aria-expanded', 'false');

	 dropToggle.addEventListener('keydown', function(e) {
	   const menu = this.nextElementSibling;
	   if (!menu) return;

	   // Open submenu with Enter, Space, or ArrowDown
	   if (e.key === 'Enter' || e.key === ' ' || e.key === 'ArrowDown') {
	     e.preventDefault();
	     menu.style.display = (menu.style.display === 'block') ? 'none' : 'block';
	     this.setAttribute('aria-expanded', menu.style.display === 'block');
	     if (menu.style.display === 'block') {
	       const firstLink = menu.querySelector('a');
	       if (firstLink) firstLink.focus();
	     }
	   }

	   // Close submenu with Escape
	   if (e.key === 'Escape') {
	     menu.style.display = 'none';
	     this.setAttribute('aria-expanded', 'false');
	     this.focus();
	   }
	 });
	});
	</script>
</body>
</html>