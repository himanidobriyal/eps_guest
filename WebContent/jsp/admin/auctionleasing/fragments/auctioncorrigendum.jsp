<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<style>
.corrigendum-container {
	background: linear-gradient(135deg, #f8f9fa 0%, #e9ecef 100%);
	border-radius: 12px;
	box-shadow: 0 4px 20px rgba(0, 0, 0, 0.08);
	max-width: 1200px;
	margin: 0 auto;
}

.corrigendum-header {
	background: linear-gradient(135deg, #0d6efd 0%, #0a58ca 100%);
	color: white;
	padding: 1.5rem;
	border-radius: 8px 8px 0 0;
	margin: -1rem -1rem 2rem -1rem;
	box-shadow: 0 2px 10px rgba(13, 110, 253, 0.3);
}

.corrigendum-header h3 {
	margin: 0;
	font-weight: 600;
	letter-spacing: 0.5px;
	text-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

.auction-info-table {
	background: white;
	border-radius: 8px;
	overflow: hidden;
	box-shadow: 0 2px 8px rgba(0, 0, 0, 0.05);
	margin-bottom: 2rem;
}

.auction-info-table th {
	background: linear-gradient(135deg, #e3f2fd 0%, #bbdefb 100%);
	color: #1565c0;
	font-weight: 600;
	padding: 12px 15px;
	border: none;
	vertical-align: middle;
}

.auction-info-table td {
	padding: 12px 15px;
	color: #495057;
	border: none;
	background: white;
	vertical-align: middle;
}

.auction-info-table tr {
	border-bottom: 1px solid #e9ecef;
}

.auction-info-table tr:last-child {
	border-bottom: none;
}

.corrigendum-list-table {
	background: white;
	border-radius: 8px;
	overflow: hidden;
	box-shadow: 0 2px 12px rgba(0, 0, 0, 0.06);
}

.corrigendum-list-table thead {
	background: linear-gradient(135deg, #0d6efd 0%, #0a58ca 100%);
}

.corrigendum-list-table thead th {
	color: white;
	font-weight: 600;
	padding: 14px 16px;
	border: none;
	text-transform: uppercase;
	font-size: 0.85rem;
	letter-spacing: 0.5px;
}

.corrigendum-list-table tbody td {
	padding: 14px 16px;
	color: #495057;
	border: none;
	vertical-align: middle;
}

.corrigendum-list-table tbody tr {
	border-bottom: 1px solid #e9ecef;
	transition: all 0.3s ease;
}

.corrigendum-list-table tbody tr:last-child {
	border-bottom: none;
}

.corrigendum-list-table tbody tr:hover {
	background: linear-gradient(135deg, #f8f9fa 0%, #e9ecef 100%);
	transform: translateY(-2px);
	box-shadow: 0 4px 12px rgba(0, 0, 0, 0.08);
}

.no-data-row {
	padding: 3rem 1rem !important;
	background: linear-gradient(135deg, #fff3cd 0%, #fff8e1 100%);
	color: #856404;
	font-style: italic;
	text-align: center;
}

.no-data-row::before {
	content: "ℹ️";
	display: block;
	font-size: 2rem;
	margin-bottom: 0.5rem;
}

.btn-close-modal {
	background: linear-gradient(135deg, #6c757d 0%, #5a6268 100%);
	border: none;
	padding: 10px 32px;
	font-weight: 600;
	border-radius: 6px;
	box-shadow: 0 4px 12px rgba(108, 117, 125, 0.3);
	transition: all 0.3s ease;
	color: white;
	text-transform: uppercase;
	letter-spacing: 0.5px;
	font-size: 0.9rem;
}

.btn-close-modal:hover {
	background: linear-gradient(135deg, #5a6268 0%, #495057 100%);
	transform: translateY(-2px);
	box-shadow: 0 6px 16px rgba(108, 117, 125, 0.4);
}

.btn-close-modal:active {
	transform: translateY(0);
	box-shadow: 0 2px 8px rgba(108, 117, 125, 0.3);
}

.action-footer {
	margin-top: 2rem;
	padding-top: 1.5rem;
	border-top: 2px solid #dee2e6;
}

/* Badge styling for IDs */
.corrigendum-list-table tbody tr td:first-child {
	font-weight: 600;
	color: #0d6efd;
}

/* Responsive design */
@media ( max-width : 768px) {
	.auction-info-table th, .auction-info-table td {
		padding: 8px 10px;
		font-size: 0.9rem;
	}
	.corrigendum-list-table thead th, .corrigendum-list-table tbody td {
		padding: 10px 12px;
		font-size: 0.85rem;
	}
	.corrigendum-header h3 {
		font-size: 1.3rem;
	}
}
</style>

<div class="corrigendum-container p-4">
	<div class="corrigendum-header">
		<h3 class="text-center">View Corrigendum</h3>
	</div>

	<!-- Auction Header Table -->
	<table class="table auction-info-table">
		<tbody>
			<tr>
				<th scope="row" style="width: 25%;">Railway Unit</th>
				<td>${schedule.DEPT_NAME}</td>
				<th scope="row" style="width: 25%;">Auction Start</th>
				<td>${schedule.AUCTION_START_DATETIME}</td>
			</tr>
			<tr>
				<th scope="row">Auction Schedule No.</th>
				<td colspan="3">${schedule.SCHEDULE_NO}</td>
			</tr>
		</tbody>
	</table>

	<!-- Corrigendum List Table -->
	<table class="table corrigendum-list-table">
		<thead>
			<tr>
				<th scope="col">Corrigendum ID</th>
				<th scope="col">Subject</th>
				<th scope="col">Description</th>
				<th scope="col">Date/Time</th>
			</tr>
		</thead>
		<tbody>
			<c:choose>
				<c:when test="${not empty corrigendumList}">
					<c:forEach var="corr" items="${corrigendumList}">
						<tr>
							<td>${corr.CORRIGENDUM_ID}</td>
							<td>${corr.CORRIGENDUM_SUBJECT}</td>
							<td>${corr.CORRIGENDUM_DESCRIPTION}</td>
							<td>${corr.CORRIGENDUM_DATE}</td>
						</tr>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<tr>
						<td colspan="4" class="no-data-row">No Corrigendum details
							found for this auction.</td>
					</tr>
				</c:otherwise>
			</c:choose>
		</tbody>
	</table>

	<!-- 5. Close Button -->
	<div class="action-footer text-center">
		<button type="button" class="btn btn-close-modal"
			onclick="closePopupModal()">Close</button>
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
</div>