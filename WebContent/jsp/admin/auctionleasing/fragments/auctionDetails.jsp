<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<title>Auction Catalogue</title>
<!-- Assuming your project uses a standard CSS file or framework for general styling -->
<style>
body {
	font-family: Arial, sans-serif;
	margin: 20px;
	color: #333;
	/* FIX: Added explicit scroll to ensure the content is scrollable 
               when loaded inside a fixed-size container like a modal or iframe. */
	height: auto;
	overflow-y: auto;
}

h2 {
	color: #007bff;
	border-bottom: 2px solid #007bff;
	padding-bottom: 5px;
	margin-bottom: 20px;
}

h3 {
	color: #555;
	border-bottom: 1px solid #ddd;
	padding-bottom: 5px;
	margin-top: 25px;
}

.header-table, .lot-list-table {
	width: 100%;
	border-collapse: collapse;
	margin-bottom: 20px;
}

.header-table th, .header-table td {
	padding: 10px;
	border: 1px solid #ddd;
	text-align: left;
	font-size: 0.9rem;
}

.header-table th {
	background-color: #f8f8f8;
	font-weight: 600;
	width: 25%;
}

.important-block {
	border: 1px solid #ffe0b2;
	background-color: #fff8e1;
	padding: 15px;
	margin-top: 20px;
	border-radius: 4px;
}

.lot-list-table th {
	background-color: #0963a1; /* Dark blue header for the list */
	color: white;
	padding: 12px 10px;
	text-align: left;
	font-weight: 10;
	font-size: 0.85rem;
}

.lot-list-table td {
	padding: 10px;
	border: 1px solid #eee;
	vertical-align: top;
	font-size: 0.8rem;
}

.lot-list-table tr:nth-child(even) {
	background-color: #fcfcfc;
}

.action-button {
	background-color: #28a745;
	color: white;
	border: none;
	padding: 5px 10px;
	border-radius: 4px;
	cursor: pointer;
	font-size: 0.8rem;
}

.close-btn-container {
	text-align: center;
	margin: 30px 0;
}

.close-btn {
	background-color: #6c757d;
	color: white;
	padding: 10px 30px;
	border: none;
	border-radius: 4px;
	font-size: 1rem;
	cursor: pointer;
}
</style>
</head>
<body>

	<!-- Main Title -->
	<h2 style="text-align: center;">Auction Catalogue</h2>



	<table class="header-table">
		<tr>
			<th>Admin Unit/Zone</th>
			<td>${auctionHeader.adminUnitZone}</td>
			<th>Auctioning Authority</th>
			<td>${auctionHeader.auctioningAuthority}</td>
		</tr>
		<tr>
			<th>Auction Catalogue No.</th>
			<td>${auctionHeader.auctionCatalogueNo}</td>
			<th>Auction Type</th>
			<td>${auctionHeader.auctionType}</td>
		</tr>
		<tr>
			<th>Bidding System</th>
			<td>${auctionHeader.biddingSystem}</td>
			<th>Initial Cooling Off Period</th>
			<td>${auctionHeader.initialCoolingOffPeriod}</td>
		</tr>
		<tr>
			<th>Auction Start (All Lots)</th>
			<td>${auctionHeader.auctionStart}</td>
			<th>Successive Lots Closing Interval</th>
			<td>${auctionHeader.successiveLotsClosingInterval}</td>
		</tr>
		<tr>
			<th>Auction Close Date/Time</th>
			<td>${auctionHeader.auctionCloseDateTime}</td>
			<th>Maximum Auto Extensions</th>
			<td>${auctionHeader.maximumAutoExtensions}</td>
		</tr>
		<tr>
			<th>Auto Extensions Zone</th>
			<td>${auctionHeader.autoExtensionsZone}</td>
			<th>Catalogue Published On</th>
			<td>${auctionHeader.cataloguePublishedOn}</td>
		</tr>
		<tr>
			<th>Auto Extension Duration</th>
			<td>${auctionHeader.autoExtensionDuration}</td>
			<th>Whether Right of First Refusal (ROFR) applicable?</th>
			<td>${auctionHeader.rofrApplicable}</td>
		</tr>
	</table>



	<div class="important-block">
		<!-- Display Important Conditions (Assuming this is a list of strings or a large text block in 'conditions' object) -->
		<!-- 2. Important Conditions (Screenshot 1768/1769 - Middle Section) -->
		<div>
			<h2 style="color: red;">Important:</h2>
			<p>1) The lot (s) included in this Auction Catalogue is/ are
				covered under Right of First Refusal policy of Indian Railways.
				Accordingly, the proponent (s) shall have the Right of First Refusal
				against these lots, and Railway reserves the right to award the
				contract to the Proponent (s), and not to the highest bidder (s). In
				such an eventuality, the Earnest Money of the highest bidder will be
				released, and the highest bidder shall not have any other claim
				against Railways. In case the Proponent foregoes its Right of First
				Refusal, the contract may be awarded to the highest bidder, who
				shall be bound to accept the same.</p>
			<p>2) In case the Proponent is not the Selected Bidder subsequent
				to the Bidding Process, the Proponent would be eligible to receive
				from the Selected Bidder through the Railway, an amount inclusive of
				all applicable taxes and duties equal to 2% of the average annual
				earnings of the Highest Bid which shall be payable by the Selected
				Bidder. The maximum compensation payable to the Proponent would be 1
				(one) crore. This amount would be due compensation for the cost
				incurred by the Proponent for its efforts and works undertaken by it
				in conceptualization of the Project/Scheme and preparation of the
				Earning Plan.</p>
		</div>
		<c:forEach var="condition" items="${conditions.importantPoints}"
			varStatus="loop">
			<p style="margin-bottom: 10px;">
				<strong>${loop.index + 1})</strong> ${condition}
			</p>
		</c:forEach>
	</div>

	<!-- 3. Standard Conditions Link -->
	<p style="margin-top: 15px;">
		<a href="${conditions.standardConditionsLink}" target="_blank"
			style="color: #007bff; text-decoration: underline;"> Standard
			Conditions of Contract (Version
			${conditions.standardConditionsVersion}) </a>
	</p>

	<!-- 4. Lot Details and List (Screenshot 1769 - Bottom Section) -->
	<h3>Lot Details</h3>
	<div
		style="display: flex; gap: 10px; align-items: center; margin-bottom: 20px;">
		<label for="categorySubCategoryDropdown"
			style="font-weight: bold; color: #555; white-space: nowrap;">
			Category / Sub Category: </label> <select id="categorySubCategoryDropdown"
			name="categorySubCategory"
			style="padding: 5px; border: 1px solid #ccc; border-radius: 4px; font-size: 0.9rem;">
			<c:forEach var="entry" items="${categoryMap}">
				<option value="${entry.key}">${entry.value}</option>
			</c:forEach>
		</select>
	</div>

	<table class="lot-list-table">
		<thead>
			<tr>
				<th>Seq No</th>
				<th>Lot No. / Category</th>
				<th>Description</th>
				<th>Rate Unit</th>
				<th>Trips/Days</th>
				<th>Close Date/Time</th>
				<th>Min. Incr(%)</th>
				<th>EMD Required</th>
				<th>Turnover Required</th>
				<th>Whether ROFR Applicable?</th>
				<th>Lot Status</th>
				<th>Action</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="lot" items="${lotList}" varStatus="loop">
				<tr>
					<td>${loop.index + 1}</td>
					<td>${lot.lotNoCategory}</td>
					<td>${lot.lotDesc}</td>
					<td>${lot.RATE_UNIT}</td>
					<td>${lot.noOfTrips}</td>
					<td>${lot.closeDateTime}</td>
					<td>${lot.minIncrement}</td>
					<td>${lot.emd}</td>
					<td>${lot.turnoverRequired}</td>
					<td>${lot.rofrApplicable}</td>
					<td>${lot.lotStatus}</td>
					<td><a href="javascript:void(0);" class="action-button"
						onclick="displayLotDetailsAftrCatPub('${lot.LOT_ID}', '${lot.LOT_AUCTION_ID}')">
							<i class="bi bi-eye"></i>
					</a></td>
				</tr>
			</c:forEach>

		</tbody>
	</table>


	<!-- 5. Close Button -->
	<div class="close-btn-container">
		<button type="button" class="close-btn" onclick="closePopupModal()">
			Close</button>
	</div>

	<script>
		function closePopupModal() {
			// hide the modal
			const modal = window.parent.document.getElementById("popupModal");
			modal.style.display = "none";

			// clear modal data if needed
			window.parent.document.getElementById("modalData").innerHTML = "";
		}
	</script>

</body>
</html>
