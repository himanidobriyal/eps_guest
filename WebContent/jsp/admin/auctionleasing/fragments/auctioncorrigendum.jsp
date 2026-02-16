<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

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
}

.corrigendum-container {
	background: linear-gradient(135deg, #f8f9fa 0%, #e9ecef 100%);
	border-radius: 12px;
	box-shadow: 0 4px 20px rgba(0, 0, 0, 0.08);
	max-width: 1400px;
	margin: 0 auto;
	padding: 1.5rem;
}

.corrigendum-header {
	background: white;
	color: #2c5aa0;
	padding: 1.5rem;
	border-radius: 12px 12px 0 0;
	margin: -1.5rem -1.5rem 2rem -1.5rem;
	box-shadow: 0 4px 15px rgba(44, 90, 160, 0.3);
	border-bottom: 3px solid #2c5aa0;
}

.corrigendum-header h3 {
	margin: 0;
	font-weight: 700;
	letter-spacing: 0.5px;
	text-shadow: none;
	font-size: 26px;
	text-align: center;
	color: #2c5aa0;
}

.auction-info-table {
	background: white;
	border-radius: 8px;
	overflow: hidden;
	box-shadow: 0 6px 20px rgba(0, 0, 0, 0.1);
	margin-bottom: 2rem;
	border-collapse: collapse;
	width: 100%;
}

.auction-info-table th {
	background: #f8f9fa;
	color: #2c5aa0;
	font-weight: 600;
	padding: 12px 15px;
	border: 1px solid #e9ecef;
	vertical-align: middle;
	width: 25%;
}

.auction-info-table td {
	padding: 12px 15px;
	color: #2d3436;
	border: 1px solid #e9ecef;
	background: white;
	vertical-align: middle;
}

.auction-info-table tr:hover {
	background: linear-gradient(45deg, #e3f2fd, #f0f8ff);
}

.corrigendum-list-section {
	margin-top: 2rem;
}

.section-header {
	background: linear-gradient(135deg, #2c5aa0 0%, #1a4480 100%);
	color: white;
	padding: 12px 20px;
	border-radius: 12px 12px 0 0;
	margin-bottom: 0;
	box-shadow: 0 4px 15px rgba(44, 90, 160, 0.3);
}

.section-header h4 {
	font-size: 18px;
	font-weight: 700;
	text-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
	letter-spacing: 0.5px;
	margin: 0;
	color: white;
}

.table-responsive {
	border-radius: 0 0 12px 12px;
	overflow: hidden;
	box-shadow: 0 6px 20px rgba(0, 0, 0, 0.1);
}

.corrigendum-list-table {
	background: white;
	width: 100%;
	border-collapse: collapse;
	margin: 0;
}

.corrigendum-list-table thead {
	background: linear-gradient(135deg, #2c5aa0 0%, #1a4480 100%);
}

.corrigendum-list-table thead th {
	color: white;
	font-weight: 600;
	padding: 14px 16px;
	border: none;
	text-align: left;
	font-size: 13px;
	letter-spacing: 0.3px;
	text-shadow: 0 1px 2px rgba(0, 0, 0, 0.1);
}

.corrigendum-list-table tbody td {
	padding: 14px 16px;
	color: #2d3436;
	border-bottom: 1px solid #e9ecef;
	vertical-align: middle;
	font-size: 13px;
}

.corrigendum-list-table tbody tr {
	background: white;
	transition: all 0.3s ease;
}

.corrigendum-list-table tbody tr:nth-child(even) {
	background: #f8f9fa;
}

.corrigendum-list-table tbody tr:hover {
	background: linear-gradient(45deg, #e3f2fd, #f0f8ff);
	transform: translateY(-1px);
	box-shadow: 0 4px 12px rgba(44, 90, 160, 0.15);
}

.corrigendum-list-table tbody tr:last-child td {
	border-bottom: none;
}

.no-data-row {
	padding: 3rem 1rem !important;
	background: linear-gradient(135deg, #fff3cd 0%, #fff8e1 100%);
	color: #856404;
	font-style: italic;
	text-align: center;
	border: 2px solid #ffc107 !important;
}

.no-data-row::before {
	content: "ℹ️";
	display: block;
	font-size: 2rem;
	margin-bottom: 0.5rem;
}

.corrigendum-list-table tbody tr td:first-child {
	font-weight: 600;
	color: #2c5aa0;
}

.action-footer {
	margin-top: 2rem;
	padding-top: 1.5rem;
	border-top: 2px solid #dee2e6;
	text-align: center;
}

.btn-close-modal {
	background: linear-gradient(135deg, #6c757d 0%, #545b62 100%);
	border: none;
	padding: 12px 40px;
	font-weight: 600;
	border-radius: 50px;
	box-shadow: 0 4px 15px rgba(108, 117, 125, 0.3);
	transition: all 0.3s ease;
	color: white;
	text-transform: uppercase;
	letter-spacing: 0.5px;
	font-size: 15px;
	cursor: pointer;
	font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
}

.btn-close-modal:hover {
	background: linear-gradient(135deg, #545b62 0%, #3d4349 100%);
	transform: translateY(-2px);
	box-shadow: 0 8px 25px rgba(108, 117, 125, 0.4);
}

.btn-close-modal:active {
	transform: translateY(0);
	box-shadow: 0 2px 8px rgba(108, 117, 125, 0.3);
}

/* Responsive design */
@media (max-width: 768px) {
	.corrigendum-container {
		padding: 1rem;
	}

	.auction-info-table th,
	.auction-info-table td {
		padding: 8px 10px;
		font-size: 0.9rem;
	}

	.corrigendum-list-table thead th,
	.corrigendum-list-table tbody td {
		padding: 10px 12px;
		font-size: 0.85rem;
	}

	.corrigendum-header h3 {
		font-size: 22px;
	}

	.section-header h4 {
		font-size: 16px;
	}
}
</style>

<div class="corrigendum-container">
	<div class="corrigendum-header">
		<h3>View Corrigendum</h3>
	</div>

	<!-- Auction Header Table -->
	<table class="auction-info-table">
		<tbody>
			<tr>
				<th scope="row">Railway Unit</th>
				<td>${schedule.DEPT_NAME}</td>
				<th scope="row">Auction Start</th>
				<td>${schedule.AUCTION_START_DATETIME}</td>
			</tr>
			<tr>
				<th scope="row">Auction Schedule No.</th>
				<td colspan="3">${schedule.SCHEDULE_NO}</td>
			</tr>
		</tbody>
	</table>

	<!-- Corrigendum List Section -->
	<div class="corrigendum-list-section">
		<div class="section-header">
			<h4>Corrigendum Details</h4>
		</div>
		<div class="table-responsive">
			<table class="corrigendum-list-table">
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
		</div>
	</div>

	<!-- Close Button -->
	<div class="action-footer">
		<button type="button" class="btn btn-close-modal"
			onclick="closePopupModal()">Close</button>
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
</div>