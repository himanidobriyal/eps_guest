<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<title>Auction Catalogue</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css">
<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

body {
	font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
	background: white;
	color: #333;
	height: auto;
	overflow-y: auto;
	padding: 20px;
}

/* Main Title */
.page-title {
	text-align: center;
	font-size: 30px;
	font-weight: 600;
	color: #2c5aa0;
	margin-bottom: 25px;
	padding-bottom: 15px;
	border-bottom: 3px solid #2c5aa0;
}

/* Header Table Section */
.section-header {
	background: linear-gradient(135deg, #2c5aa0 0%, #1a4480 100%);
	color: white;
	padding: 12px 20px;
	border-radius: 12px 12px 0 0;
	margin-top: 25px;
	margin-bottom: 0;
	box-shadow: 0 4px 15px rgba(44, 90, 160, 0.3);
}

.section-header h3 {
	font-size: 18px;
	font-weight: 700;
	text-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
	letter-spacing: 0.5px;
	margin: 0;
	color: white;
}

.header-table {
	width: 100%;
	border-collapse: collapse;
	background: white;
	box-shadow: 0 6px 20px rgba(0, 0, 0, 0.1);
	border-radius: 0 0 12px 12px;
	overflow: hidden;
}

.header-table th,
.header-table td {
	padding: 12px 15px;
	border: 1px solid #e9ecef;
	text-align: left;
	font-size: 0.9rem;
}

.header-table th {
	background-color: #f8f9fa;
	font-weight: 600;
	width: 25%;
	color: #2c5aa0;
}

.header-table td {
	color: #2d3436;
}

.header-table tr:hover {
	background: linear-gradient(45deg, #e3f2fd, #f0f8ff);
}

/* Important Block */
.important-block {
	border: 2px solid #ffc107;
	background: linear-gradient(135deg, #fff8e1 0%, #fffbf0 100%);
	padding: 20px;
	margin-top: 25px;
	border-radius: 12px;
	box-shadow: 0 4px 15px rgba(255, 193, 7, 0.2);
}

.important-block h2 {
	color: #dc3545;
	font-size: 22px;
	font-weight: 700;
	margin-bottom: 15px;
	text-transform: uppercase;
	letter-spacing: 0.5px;
}

.important-block p {
	margin-bottom: 12px;
	line-height: 1.6;
	color: #2d3436;
	font-size: 0.9rem;
}

.important-block p strong {
	color: #2c5aa0;
}

/* Standard Conditions Link */
.conditions-link {
	margin-top: 20px;
	padding: 15px;
	background: linear-gradient(135deg, #e3f2fd 0%, #f0f8ff 100%);
	border-radius: 12px;
	border: 2px solid rgba(44, 90, 160, 0.2);
}

.conditions-link a {
	color: #2c5aa0;
	text-decoration: none;
	font-weight: 600;
	font-size: 1rem;
	transition: all 0.3s ease;
}

.conditions-link a:hover {
	color: #1a4480;
	text-decoration: underline;
}

/* Lot Details Section */
.lot-details-section {
	margin-top: 30px;
}

.category-filter {
	display: flex;
	gap: 10px;
	align-items: center;
	margin-bottom: 20px;
	padding: 15px;
	background: linear-gradient(135deg, #f8fbff 0%, #e8f2ff 100%);
	border-radius: 12px;
	border: 2px solid rgba(42, 82, 152, 0.1);
}

.category-filter label {
	font-weight: 600;
	color: #2c5aa0;
	white-space: nowrap;
	font-size: 0.95rem;
}

.category-filter select {
	padding: 8px 14px;
	border: 2px solid #2c5aa0;
	border-radius: 10px;
	font-size: 0.9rem;
	font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
	font-weight: 500;
	background: white;
	color: #2d3436;
	cursor: pointer;
	transition: all 0.3s ease;
	appearance: none;
	background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='12' height='12' viewBox='0 0 12 12'%3E%3Cpath fill='%232c5aa0' d='M10.293 3.293L6 7.586 1.707 3.293A1 1 0 00.293 4.707l5 5a1 1 0 001.414 0l5-5a1 1 0 10-1.414-1.414z'/%3E%3C/svg%3E");
	background-repeat: no-repeat;
	background-position: right 12px center;
	background-size: 12px;
	padding-right: 40px;
}

.category-filter select:focus {
	outline: none;
	border-color: #1a4480;
	box-shadow: 0 0 0 3px rgba(44, 90, 160, 0.1);
}

/* Lot List Table */
.table-responsive {
	border-radius: 12px;
	overflow: hidden;
	box-shadow: 0 6px 20px rgba(0, 0, 0, 0.1);
	margin-top: 0;
}

.lot-list-table {
	width: 100%;
	border-collapse: collapse;
	background: white;
}

.lot-list-table thead {
	background: linear-gradient(135deg, #2c5aa0 0%, #1a4480 100%);
}

.lot-list-table th {
	padding: 14px 10px;
	color: white;
	font-weight: 600;
	font-size: 0.85rem;
	text-align: left;
	border: none;
	text-shadow: 0 1px 2px rgba(0, 0, 0, 0.1);
	letter-spacing: 0.3px;
}

.lot-list-table tbody tr {
	background: white;
	transition: all 0.3s ease;
}

.lot-list-table tbody tr:nth-child(even) {
	background: #f8f9fa;
}

.lot-list-table tbody tr:hover {
	background: linear-gradient(45deg, #e3f2fd, #f0f8ff);
	transform: translateY(-1px);
	box-shadow: 0 4px 12px rgba(44, 90, 160, 0.15);
}

.lot-list-table td {
	padding: 12px 10px;
	border-bottom: 1px solid #e9ecef;
	font-size: 0.8rem;
	color: #2d3436;
	vertical-align: middle;
}

.lot-list-table td:first-child {
	font-weight: 600;
	text-align: center;
}

/* Action Button */
.action-button {
	display: inline-flex;
	align-items: center;
	justify-content: center;
	width: 32px;
	height: 32px;
	background-color: transparent;
	border: 1px solid #28a745;
	border-radius: 6px;
	text-decoration: none;
	transition: all 0.3s cubic-bezier(0.25, 0.8, 0.25, 1);
	cursor: pointer;
	position: relative;
	overflow: hidden;
}

.action-button::before {
	content: '';
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background-color: #28a745;
	transform: scaleX(0);
	transform-origin: left;
	transition: transform 0.3s cubic-bezier(0.25, 0.8, 0.25, 1);
	z-index: 1;
}

.action-button:hover::before {
	transform: scaleX(1);
}

.action-button i {
	position: relative;
	z-index: 2;
	color: #28a745;
	font-size: 1.2rem;
	transition: color 0.3s ease;
}

.action-button:hover {
	border-color: #28a745;
	box-shadow: 0 4px 8px rgba(40, 167, 69, 0.3);
}

.action-button:hover i {
	color: white;
}

/* Close Button */
.close-btn-container {
	text-align: center;
	margin: 30px 0 10px 0;
}

.close-btn {
	background: linear-gradient(135deg, #6c757d 0%, #545b62 100%);
	color: white;
	padding: 12px 40px;
	border: none;
	border-radius: 50px;
	font-size: 1rem;
	font-weight: 600;
	cursor: pointer;
	transition: all 0.3s ease;
	box-shadow: 0 4px 15px rgba(108, 117, 125, 0.3);
	font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
}

.close-btn:hover {
	transform: translateY(-2px);
	box-shadow: 0 8px 25px rgba(108, 117, 125, 0.4);
	background: linear-gradient(135deg, #545b62 0%, #3d4349 100%);
}

/* Responsive Design */
@media (max-width: 768px) {
	.header-table th,
	.header-table td {
		padding: 8px 10px;
		font-size: 0.8rem;
	}

	.lot-list-table th,
	.lot-list-table td {
		padding: 8px 6px;
		font-size: 0.75rem;
	}

	.page-title {
		font-size: 24px;
	}

	.category-filter {
		flex-direction: column;
		align-items: flex-start;
	}

	.category-filter select {
		width: 100%;
	}
}
</style>
</head>
<body>

	<!-- Main Title -->
	<h2 class="page-title">Auction Catalogue</h2>

	<!-- Header Information Section -->
	<div class="section-header">
		<h3>Auction Information</h3>
	</div>
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

	<!-- Important Conditions Block -->
	<div class="important-block">
		<h2>Important:</h2>
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
		
		<c:forEach var="condition" items="${conditions.importantPoints}" varStatus="loop">
			<p>
				<strong>${loop.index + 3})</strong> ${condition}
			</p>
		</c:forEach>
	</div>

	<!-- Standard Conditions Link -->
	<div class="conditions-link">
		<a href="${conditions.standardConditionsLink}" target="_blank">
			<i class="bi bi-file-earmark-text"></i>
			Standard Conditions of Contract (Version ${conditions.standardConditionsVersion})
		</a>
	</div>

	<!-- Lot Details Section -->
	<div class="lot-details-section">
		<div class="section-header">
			<h3>Lot Details</h3>
		</div>
		
		<div class="category-filter">
			<label for="categorySubCategoryDropdown">
				Category / Sub Category:
			</label>
			<select id="categorySubCategoryDropdown" name="categorySubCategory">
				<c:forEach var="entry" items="${categoryMap}">
					<option value="${entry.key}">${entry.value}</option>
				</c:forEach>
			</select>
		</div>

		<div class="table-responsive">
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
							<td style="text-align: center;">
								<a href="javascript:void(0);" class="action-button"
									onclick="displayLotDetailsAftrCatPub('${lot.LOT_ID}', '${lot.LOT_AUCTION_ID}')">
									<i class="bi bi-eye-fill"></i>
								</a>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>

	<!-- Close Button -->
	<div class="close-btn-container">
		<button type="button" class="close-btn" onclick="closePopupModal()">
			Close
		</button>
	</div>

	<script>
		function closePopupModal() {
			// hide the modal
			const modal = window.parent.document.getElementById("popupModal");
			if (modal) {
				modal.style.display = "none";
			}

			// clear modal data if needed
			const modalData = window.parent.document.getElementById("modalData");
			if (modalData) {
				modalData.innerHTML = "";
			}
		}
	</script>
<script 
    src="https://translation-plugin.bhashini.co.in/v3/website_translation_utility.js"
    language-icon-color="#ffffff">
</script>
<script src="${pageContext.request.contextPath}/assets/bhashini/bhashini-init.js"></script>
</body>
</html>