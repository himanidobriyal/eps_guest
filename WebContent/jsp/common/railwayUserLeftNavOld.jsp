<%@page import="java.util.ArrayList"%>
<%@page import="com.ireps.admin.entity.UserProfieForm"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="bean" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="html" %>
<script type="text/javascript" src="/ireps/js/works/postRequest.js"></script>
<c:set var ="context" value="${pageContext.request.contextPath}" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha256-YLGeXaapI0/5IgZopewRJcFXomhRMlYYjugPLSyNjTY=" crossorigin="anonymous"><link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- removing this js for menu  -->
<%String context = (String) request.getContextPath();
UserProfieForm sessionData=(UserProfieForm) session.getAttribute("sessionData");
%>
<style>

.card-header:hover {
  transform: scale(1.01,1.01);
  background-color:white;
  font-weight: bold;
}
li:hover{
 background-color:grey;

}
li >A:hover { COLOR: white; TEXT-DECORATION: none; font-weight: none }
</style>
 
<script>
function switchColors(element)  
{   
	links=document.getElementsByTagName("li") ;  
	for (var i = 0 ; i < links.length ; i ++){  
	  if(links.backgroundColor) 
	  	links.item(i).style.backgroundColor ="white"; 
	}
	element.style.backgroundColor ="grey";
	element.firstElementChild.style.color ="white";
}
function showTabs(id){
	idl =localStorage.getItem('prev_menu_tab');
	idc =id;
	localStorage.setItem('prev_menu_tab',idc);
	localStorage.setItem('GLOBAL_tabno',1); //used to control first tab under each submenu.
	
	ele =document.getElementById(idl);
	ele.style.display='none';
	ele =document.getElementById(idc);
	ele.style.display='block';
}
</script>
 <!-- Left side Nav Bar   -->
 
  <div id="accordion">
        
  
     <div class="card">
     
      <div class="card-header">
        <a class="collapsed card-link" data-toggle="collapse" href="#module1" onclick="showTabs('csm_tabs')" style="color: black;" data-target="#module1">
         
          Consignee Stores Module <i class="fa fa-angle-down" style="font-size:15px;font-weight:bold;"></i>
        </a>
      </div>
       <div id="module1" class="collapse" data-parent="#accordion">
        <div class="card-body">
          <div id="m6_submenu" style="background-color:">
          <ul class="sub-menu"> 
        
                <li onclick="switchColors(this);"><a href="#" onclick="postRequest('<c:out value='${context }'/>/ledgerHome')" title="Ledger Home Page">Ledger </a></li>
<%--                 <li onclick="switchColors(this);"> <a href="#" onclick="postRequest('<c:out value='${context }'/>/ledgerHome1?tabno=1')"  title="Ledger Home Page">Ledger New</a></li>
 --%>        		
                 <li onclick="switchColors(this);"> <a href="#" onclick="postRequest('<c:out value='${context }'/>/printLedgerService')"  title="Ledger Home Page">Ledger New</a></li>
 
 <li onclick="switchColors(this);"> <a href="#" onclick="postRequest('<c:out value='${context }'/>/showReceiptTradeDetails')"  title="Receipt">Receipt</a></li>
          		<li onclick="switchColors(this);"> <a href="#" onclick="postRequest('<c:out value='${context }'/>/showUDTransDetails')"  title="Acceptance">Acceptance</a></li>
          		<li onclick="switchColors(this);"> <a href="#" onclick="postRequest('<c:out value='${context }'/>/depotReceipt')"  title="Accountal">Accountal</a></li>
          		<li onclick="switchColors(this);"> <a href="#" onclick="postRequest('<c:out value='${context }'/>/showReqnList')"  title="Issue">Issue</a></li>
          		<li onclick="switchColors(this);"> <a href="#" onclick="postRequest('<c:out value='${context }'/>/showdtbtTransfer')"  title="Requisition">Requisition</a></li>
				<li onclick="switchColors(this);"> <a href="#" onclick="postRequest('<c:out value='${context }'/>/showCreateManualRequisition')"  title="Manual Demand Entry">Demand Entry</a></li>
				<li onclick="switchColors(this);"> <a href="#" onclick="postRequest('<c:out value='${context }'/>/getSearchItemDtlsOutside')"  title="Search">Search</a></li>
          		
          		
          		
          		
<%--           		<li onclick="switchColors(this);"><a href="#" onclick="postRequest('<c:out value='${context }'/>/bookTransfer')" title="Book Transfer">Book Transfer</a></li>
 --%>         		
<%--           		<li onclick="switchColors(this);"><a href="#" onclick="postRequest('<c:out value='${context }'/>/showCreateGatePass')" title="Create GatePass">Create Gate Pass</a></li>
 --%>  				
 <li onclick="switchColors(this);"><a href="#" onclick="#" title="Create GatePass">Reports</a></li>
 <%-- <li onclick="switchColors(this);"><a href="#" onclick="postRequest('<c:out value='${context }'/>/issueToUltimateUser')" title="Search Ledger">Issue to Ultimate User</a></li> --%>
         		         	 
          	<%-- 	<li onclick="switchColors(this);"><a href="#" onclick="postRequest('<c:out value='${context }'/>/showReceiptTradeDetails')" title="Receipt from Trade">Receipt from Trade</a></li>
     
           
               <li onclick="switchColors(this);"><a href="#" onclick="postRequest('<c:out value='${context }'/>/showUDTransDetails')" title="Perform Receipt Transaction">Perform Receipt Transaction</a></li>
       --%>
          
<%--                <li onclick="switchColors(this);"><a href="#" onclick="postRequest('<c:out value='${context }'/>/searchUDTrans')" title="Search Receipt Transaction">Search Receipt Transaction</a></li>
 --%>               
			<%--    <li onclick="switchColors(this);"><a href="<c:out value='${context }'/>/getSearchItemDtlsOutside">Search Item</a></li>  --%>
			 
			 <%--  <li onclick="switchColors(this);"><a href="<c:out value='${context }'/>/showdtbtTransfer">Demand on On-Line User Depots</a></li>
			  
			   <li onclick="switchColors(this);"><a href="<c:out value='${context }'/>/offlineRequisition">Demand on Off-Line User Depots</a></li>
         --%>
         
<%--              <li onclick="switchColors(this);"><a href="#" onclick="postRequest('<c:out value='${context }'/>/showCreateManualRequisition')" title="Create Offline Requisition">Enter Off-Line Demands</a></li>
 --%>             
             
<%-- 			  <li onclick="switchColors(this);"><a href="#" onclick="postRequest('<c:out value='${context }'/>/showdepotTransferRequisition?param=onLineReceipt')" title="Search Demands on User Depots">Search Demands on User Depots</a></li>
 --%>			  
<%--              <li onclick="switchColors(this);"><a href="#" onclick="postRequest('<c:out value='${context }'/>/showDepoReqnLetterOld')" title="Depot Requisition Letter">Depot Requisition Letter</a></li>
 --%>               
            
          
<%--              <li onclick="switchColors(this);"><a href="#" onclick="postRequest('<c:out value='${context }'/>/showReqnList')" title="Create Issue Notes">Issue to User Depots</a></li>
 --%>                          
<%--              <li onclick="switchColors(this);"><a href="#" onclick="postRequest('<c:out value='${context }'/>/depotReceipt')" title="Receipt from On-line User Depots">Receipt from On-line User Depots</a></li>
         			  <li onclick="switchColors(this);"><a href="#" onclick="postRequest('<c:out value='${context }'/>/showdepotTransferRequisition?param=offLineReceipt')" title="Receipt from Off-line User Depots">Receipt from Off-line User Depots</a></li>
  --%>                
   
             <li onclick="switchColors(this);"><a href="#" onclick="postRequest('<c:out value='${context }'/>/showUpdMakeBrand')" title="Update Make Brand">Update Location/Product Details</a></li>
<%--             <li onclick="switchColors(this);"><a href="<c:out value='${context }'/>/issueAcknowNonStk" title="Ack Issue">Non-Stk Receipt from depot</a></li>       
 --%>          <li onclick="switchColors(this);"><a href="#" onclick="postRequest('<c:out value='${context }'/>/showRequisitionDetails')" title="Requisition Details">Requisition Details</a></li>
      
<%--              <li onclick="switchColors(this);"><a href="<c:out value='${context }'/>/showdepotUserRequsition" title="Place Requisition on Stores">S-1313 Requisition on Stores</a></li>
 --%>       <%--       <li onclick="switchColors(this);"><a href="<c:out value='${context }'/>/issueAcknow" title="Ack Issue">S-1313 Ack</a></li> --%>
             <%-- <li onclick="switchColors(this);"><a href="<c:out value='${context }'/>/approveReqn" title="Ack Issue">Approve</a></li> --%>
         
<%--              <li onclick="switchColors(this);"><a href="#" onclick="postRequest('<c:out value='${context }'/>/imprestReqn')" title="Imprest Requisition on Stores">Imprest Requisition on Stores</a></li>
 --%>          
<%--              <li onclick="switchColors(this);"><a href="#" onclick="postRequest('<c:out value='${context }'/>/showdiffrequisition')" title="Search Requisitions on Stores Depots">Search Requisitions on Stores Depots</a></li>
 --%>             
        	<li onclick="switchColors(this);"><a href="#" onclick="postRequest('<c:out value='${context }'/>/showReturnStockReceipt')" title="UnConnected Receipt From Field">UnConnected Receipt From Field</a></li>
             
             <li onclick="switchColors(this);"><a href="#" onclick="postRequest('<c:out value='${context }'/>/returnLoanList')" title="Return of Loan">Return Of Loan</a></li>
             
            </ul>
     
            
	      </div>  
        </div> 
      </div> 
    </div>
   
     <div class="card">
      <div class="card-header">
        <a class="collapsed card-link" data-toggle="collapse" href="#module2" onclick="showTabs('im_tabs')" style="color: black;">
     
          Indentor Module <i class="fa fa-angle-down" style="font-size:14px;font-weight:bold;"></i>
        </a>
      </div>
      <div id="module2" class="collapse" data-parent="#accordion">
        <div class="card-body">
          <div id="m2_submenu" style="background-color:">
            <ul class="sub-menu">
              <li onclick="switchColors(this);"><a href="#" style="white-space:nowrap">Requisition</a></li>
              <li onclick="switchColors(this);"><a href="#">Imprest</a></li>
              <li onclick="switchColors(this);"><a href="#">N/S Indent</a></li>
            </ul>
	      </div>
        </div>
      </div>
    </div>
    <div class="card">
      <div class="card-header">
        <a class="collapsed card-link" data-toggle="collapse" href="#module3" onclick="showTabs('plm_tabs')" style="color: black;">
          PL Module <i class="fa fa-angle-down" style="font-size:14px;font-weight:bold;"></i>
        </a>
      </div>
      <div id="module3" class="collapse" data-parent="#accordion">
        <div class="card-body">
          <div id="m3_submenu" style="background-color:">
            <ul class="sub-menu">
              <li onclick="switchColors(this);"><a href="<c:out value='${context}'/>/showItemMaster">ITEM MASTER</a></li>
            </ul>
	      </div>
        </div>
      </div>
    </div>
    <div class="card">
      <div class="card-header">
        <a class="card-link" data-toggle="collapse" href="#module4" onclick="showTabs('im_tabs')" style="color: black;">
       
          Depot Module <i class="fa fa-angle-down" style="font-size:14px;font-weight:bold;"></i>
        </a>
        
   
      </div>
      <div id="module4" class="collapse" data-parent="#accordion">
        <div class="card-body">
          <div id="m4_submenu" style="background-color:">
            <ul class="sub-menu">
            <li>
				<div id="accordion2">
					<div class="card">
					      <div class="" style="padding:2px;">
					        <a class="collapsed card-link" data-toggle="collapse" href="#module4_1" style="color: black; padding:2px;display: block;
	position: relative;">
					          Ledger <i class="fa fa-angle-down" style="font-size:14px;font-weight:bold;"></i>
					        </a>
					      </div>
					      <div id="module4_1" class="collapse" data-parent="#accordion2">
					        <div class="card-body">
					          <div id="m4_1_submenu" style="background-color:">
					            <ul>
					              <li onclick="switchColors(this);"><a href="<c:out value='${context }'/>/showUDTransDetails" style="white-space:nowrap">Stocking Proposal</a></li>
					              <li onclick="switchColors(this);"><a href="<c:out value='${context }'/>/showUDTransDetails">AAC/EAC</a></li>
					              <li onclick="switchColors(this);"><a href="<c:out value='${context }'/>/showUDTransDetails">AIS</a></li>
					              <li onclick="switchColors(this);"><a href="<c:out value='${context }'/>/showUDTransDetails" >Stock Demand(ERM)</a></li>
					              <li onclick="switchColors(this);"><a href="<c:out value='${context }'/>/showUDTransDetails" style="white-space:nowrap">DTR Approvals</a></li>
					              <li onclick="switchColors(this);"><a href="<c:out value='${context }'/>/showUDTransDetails" style="white-space:nowrap">Imprest Master</a></li>
					              <li onclick="switchColors(this);"><a href="<c:out value='${context }'/>/showUDTransDetails">WorkOrder</a></li>
					            </ul>
						      </div>
					        </div>
					      </div>
					    </div>
				  </div>
			  </li>
			  <li onclick="switchColors(this);"><a href="#" onclick="postRequest('<c:out value='${context }'/>/depotHome')" title="Depot Home Page">Depot Folders</a></li>
			  <li onclick="switchColors(this);"><a href="<c:out value='${context }'/>/showDRRBasicDetails" style="white-space:nowrap" >Material Receipt</a></li>
              <li onclick="switchColors(this);"><a href="<c:out value='${context }'/>/rIList">Inspection</a></li>
              <li onclick="switchColors(this);"><a href="<c:out value='${context }'/>/getRnoteList">Receipt Note</a></li>
              <li onclick="switchColors(this);"><a href="<c:out value='${context }'/>/rOList">Rnote Process</a></li>
              <li onclick="switchColors(this);"><a href="<c:out value='${context }'/>/showRnoteDetails">Claims</a></li>
              <li onclick="switchColors(this);"><a href="<c:out value='${context }'/>/showRejAdvDetails" style="white-space:nowrap">Rejection Advice</a></li>
              <li onclick="switchColors(this);"><a href="<c:out value='${context }'/>/trans">Transactions</a></li> 
            </ul>
	      </div>
        </div>
      </div>
    </div>
    <div class="card">
      <div class="card-header" >
        <a class="collapsed card-link" data-toggle="collapse" href="#module5" onclick="showTabs('pm_tabs')" style="color: black;">
     
        Purchase Module <i class="fa fa-angle-down" style="font-size:14px;font-weight:bold;"></i>
      </a>
      </div>
      <div id="module5" class="collapse" data-parent="#accordion">
        <div class="card-body">
           <div id="m5_submenu" style="background-color:">
              <ul class="sub-menu">
              <li><a href="<c:out value='${context }'/>/showNSBasicDetails" title="Create NS Demand" class="">NS Demand</a></li>
                <li><a href="#" class="">PO Search</a></li>
                <li><a href="#" class="">PO Order</a></li>
                <li><a href="#" class="">Demand</a></li>
                <li><a href="#" class="">Purchase Order</a></li>
                <li><a href="#" class="">Order Gen</a></li>
                <li><a href="#" class="">Order Sdnjngf</a></li>
              </ul>
          </div>
        </div>
      </div>
    </div>
      <div class="card">
      <div class="card-header">
        <a class="collapsed card-link" data-toggle="collapse" href="#module6" onclick="showTabs('sm_tabs')" style="color: black;">
    
         Sales Module <i class="fa fa-angle-down" style="font-size:14px;font-weight:bold;"></i>
        </a>
      </div>
      <div id="module6" class="collapse" data-parent="#accordion">
        <div class="card-body">
	    <div id="m6_submenu" style="background-color:">
	      <ul class="sub-menu">

		  </ul>
	    </div>
        </div>
      </div>
  </div>
      <div class="card">
      <div class="card-header">
        <a class="collapsed card-link" data-toggle="collapse" href="#module7" onclick="showTabs('xm_tabs')" style="color: black;">
       
         X Module <i class="fa fa-angle-down" style="font-size:14px;font-weight:bold;"></i>
        </a>
      </div>
      <div id="module7" class="collapse" data-parent="#accordion">
        <div class="card-body">
	    <div id="m7_submenu" style="background-color:">
	      <ul class="sub-menu">
		    <li><a href="#" class="">X1</a></li>
		    <li><a href="#" class="">X2</a></li>
		    <li><a href="#" class="">X3</a></li>
		    
		  </ul>
	    </div>
        </div>
      </div>
  </div>
  <div class="card"><div class="card-header" onclick="javascript:switchToIreps();"><a class="collapsed card-link" data-toggle="collapse"  href="#"  style="color: black;">
         User Management </a></div>
  </div>
  </div>
  
  <script type="text/javascript">
$(document).ready(function () {
    setInterval("$('.blink').fadeOut().fadeIn();",2000);
});
function switchToIreps(){
	var address='<%=response.encodeURL(context)%>'+'/switchToIreps';
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
      
      
  
  
  
