<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<title>Applicable Taxes & Duties - Leasing Auction</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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
	padding: 20px;
}

.container {
	background: linear-gradient(135deg, #f8f9fa 0%, #e9ecef 100%);
	border-radius: 12px;
	box-shadow: 0 4px 20px rgba(0, 0, 0, 0.08);
	max-width: 1400px;
	margin: 0 auto;
	padding: 1.5rem;
}

.page-header {
	background: white;
	color: #2c5aa0;
	padding: 1.5rem;
	border-radius: 12px 12px 0 0;
	margin: -1.5rem -1.5rem 2rem -1.5rem;
	box-shadow: 0 4px 15px rgba(44, 90, 160, 0.3);
	border-bottom: 3px solid #2c5aa0;
}

.page-header h2 {
	margin: 0;
	font-weight: 700;
	letter-spacing: 0.5px;
	font-size: 26px;
	text-align: center;
	color: #2c5aa0;
}

.header-controls {
	display: flex;
	gap: 20px;
	margin-bottom: 25px;
	align-items: center;
	padding: 15px;
	background: linear-gradient(135deg, #f8fbff 0%, #e8f2ff 100%);
	border-radius: 12px;
	border: 2px solid rgba(42, 82, 152, 0.1);
	flex-wrap: wrap;
}

.header-controls label {
	font-weight: 600;
	color: #2c5aa0;
	white-space: nowrap;
	font-size: 0.95rem;
}

.header-controls select {
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
	min-width: 250px;
}

.header-controls select:focus {
	outline: none;
	border-color: #1a4480;
	box-shadow: 0 0 0 3px rgba(44, 90, 160, 0.1);
}

.data-table-container {
	overflow-x: auto;
	margin-bottom: 30px;
}

.table-responsive {
	border-radius: 12px;
	overflow: hidden;
	box-shadow: 0 6px 20px rgba(0, 0, 0, 0.1);
}

.taxes-table {
	width: 100%;
	border-collapse: collapse;
	background: white;
	margin: 0;
}

.taxes-table thead {
	background: linear-gradient(135deg, #2c5aa0 0%, #1a4480 100%);
}

.taxes-table th {
	color: white;
	font-weight: 600;
	padding: 14px 12px;
	text-align: left;
	font-size: 13px;
	letter-spacing: 0.3px;
	text-shadow: 0 1px 2px rgba(0, 0, 0, 0.1);
	white-space: nowrap;
	border: none;
}

.taxes-table tbody tr {
	background: white;
	transition: all 0.3s ease;
}

.taxes-table tbody tr:nth-child(even) {
	background: #f8f9fa;
}

.taxes-table tbody tr:hover {
	background: linear-gradient(45deg, #e3f2fd, #f0f8ff);
	transform: translateY(-1px);
	box-shadow: 0 4px 12px rgba(44, 90, 160, 0.15);
}

.taxes-table td {
	padding: 12px;
	border-bottom: 1px solid #e9ecef;
	vertical-align: middle;
	font-size: 13px;
	color: #2d3436;
}

.taxes-table tbody tr:last-child td {
	border-bottom: none;
}

.checkbox-center {
	text-align: center;
}

.checkbox-center input[type="checkbox"] {
	width: 18px;
	height: 18px;
	cursor: pointer;
}

.no-data-row {
	text-align: center;
	color: #856404;
	padding: 40px 20px !important;
	background: linear-gradient(135deg, #fff3cd 0%, #fff8e1 100%);
	border: 2px solid #ffc107 !important;
	font-style: italic;
}

.info-block {
	background: linear-gradient(135deg, #e3f2fd 0%, #f0f8ff 100%);
	border: 2px solid rgba(44, 90, 160, 0.2);
	padding: 20px;
	margin-top: 30px;
	border-radius: 12px;
	font-size: 0.9rem;
	line-height: 1.6;
	box-shadow: 0 4px 12px rgba(44, 90, 160, 0.1);
}

.info-block p {
	margin-bottom: 12px;
	color: #2d3436;
}

.info-block p:last-child {
	margin-bottom: 0;
}

.info-block strong {
	color: #2c5aa0;
	font-weight: 600;
}

.section-header {
	padding: 12px 0px;
	margin-top: 30px;
	margin-bottom: 15px;
}

.section-header h3 {
	font-size: 20px;
	font-weight: 700;
	letter-spacing: 0.5px;
	margin: 0;
	color: #333;
}

.btn-container {
	text-align: center;
	margin-top: 30px;
	padding-top: 20px;
	border-top: 2px solid #dee2e6;
}

.btn-close-modal {
	background: linear-gradient(135deg, #6c757d 0%, #545b62 100%);
	color: white;
	padding: 12px 40px;
	border: none;
	border-radius: 50px;
	font-size: 15px;
	font-weight: 600;
	cursor: pointer;
	transition: all 0.3s ease;
	box-shadow: 0 4px 15px rgba(108, 117, 125, 0.3);
	text-transform: uppercase;
	letter-spacing: 0.5px;
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
	.container {
		padding: 1rem;
	}

	.header-controls {
		flex-direction: column;
		align-items: stretch;
	}

	.header-controls select {
		width: 100%;
		min-width: auto;
	}

	.taxes-table th,
	.taxes-table td {
		padding: 8px 6px;
		font-size: 12px;
	}

	.page-header h2 {
		font-size: 22px;
	}
}
</style>
</head>
<body>
	<div class="container">
		<c:set var="selectedZone" value="Northern Railway" scope="request" />
		<c:set var="selectedUnit" value="DELHI DIVISION-COMMERCIAL" scope="request" />

		<div class="page-header">
			<h2>Applicable Taxes & Duties - Leasing Auction</h2>
		</div>

		<div class="header-controls">
			<label for="zone">Zone:</label>
			<select id="zone" name="zone">
				<c:forEach var="zone" items="${zoneList}">
					<option value="${zone.int_code}"
						<c:if test="${zone.value eq selectedZone}">selected</c:if>>
						${zone.value}
					</option>
				</c:forEach>
			</select>

			<label for="unit">Unit:</label>
			<select id="unit" name="unit">
				<option value="">-- Select Unit --</option>
			</select>
		</div>

		<div class="table-responsive">
			<table class="taxes-table" id="taxDutiesTable">
				<thead>
					<tr>
						<th>Category / Sub-Category</th>
						<th>GST Applicable</th>
						<th>GST (%)</th>
						<th>Cess (%)</th>
						<th>SAC Code</th>
						<th>Reason (0 GST)</th>
						<th>RCM Applicable*</th>
					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${not empty taxDutiesList}">
							<c:forEach var="item" items="${taxDutiesList}">
								<tr>
									<td>${item.category}</td>
									<td class="checkbox-center">
										<input type="checkbox" <c:if test="${item.gstApplicable}">checked</c:if> disabled>
									</td>
									<td>
										<c:choose>
											<c:when test="${item.gstRate ne null}">${item.gstRate}</c:when>
											<c:otherwise></c:otherwise>
										</c:choose>
									</td>
									<td>
										<c:choose>
											<c:when test="${item.cessRate ne null}">${item.cessRate}</c:when>
											<c:otherwise></c:otherwise>
										</c:choose>
									</td>
									<td>
										<c:choose>
											<c:when test="${item.sacCode ne null}">${item.sacCode}</c:when>
											<c:otherwise></c:otherwise>
										</c:choose>
									</td>
									<td></td>
									<td>
										<c:choose>
											<c:when test="${item.rcmApplicable}">Yes</c:when>
											<c:otherwise>No</c:otherwise>
										</c:choose>
									</td>
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr>
								<td colspan="7" class="no-data-row">
									No applicable tax and duty details found.
								</td>
							</tr>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
		</div>

		<div class="info-block">
			<p><strong>*RCM:</strong> Reverse charge mechanism applicable.</p>
			<p>In case of **Parcel Lots (SLR and VP)**, contractors will be liable to pay development charges @2% of license fee / leasing charges + GST (as applicable) for the lot. These charges will be applicable over and above the license fee/ leasing charges as specified in the contract.</p>
			<p>Other Charges as mentioned in the lot details or asset details shall also be borne by the contractor.</p>
		</div>

		<div class="section-header">
			<h3>Attached Supporting Document</h3>
		</div>
		<div class="table-responsive" style="margin-top: 0;">
			<table class="taxes-table">
				<thead>
					<tr>
						<th>Added by</th>
						<th>Description</th>
						<th>File Name</th>
						<th>Uploaded On</th>
					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${not empty supportingDocumentsList}">
							<c:forEach var="doc" items="${supportingDocumentsList}">
								<tr>
									<td>${doc.addedBy}</td>
									<td>${doc.description}</td>
									<td><a href="${doc.fileLink}" style="color: #2c5aa0; text-decoration: none; font-weight: 600;">${doc.fileName}</a></td>
									<td>${doc.uploadedOn}</td>
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr>
								<td colspan="4" class="no-data-row">
									No Documents Uploaded
								</td>
							</tr>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
		</div>

		<div class="btn-container">
			<button type="button" class="btn-close-modal" onclick="closePopupModal()">Close</button>
		</div>
	</div>

	<script>
		$(document).ready(function() {
			// Load units automatically if a zone is preselected
			var selectedZone = $('#zone').val();
			if (selectedZone) loadUnits(selectedZone);

			// On zone change, load units dynamically
			$('#zone').change(function() {
				var zone = $(this).val();
				if (zone) {
					loadUnits(zone);
				} else {
					$('#unit').html('<option value="">-- Select Unit --</option>');
				}
			});

			function loadUnits(zone) {
				$.ajax({
					url: '${pageContext.request.contextPath}/eps/auction/getUnitsByZone',
					type: 'GET',
					data: { orgZone: zone },
					success: function(units) {
						$('#unit').empty().append('<option value="">-- Select Unit --</option>');
						$.each(units, function(i, unit) {
							$('#unit').append($('<option>', {
								value: unit.INT_CODE,
								text: unit.VALUE
							}));
						});
					},
					error: function() {
						alert('Error fetching units!');
					}
				});
			}

			// When unit dropdown changes, fetch tax duties
			$('#unit').change(function() {
				var zone = $('#zone').val();
				var unit = $(this).val();

				if (zone && unit) {
					$.ajax({
						url: '${pageContext.request.contextPath}/eps/auction/getTaxDuties',
						type: 'GET',
						data: {
							orgZone: zone,
							departmentId: unit
						},
						success: function(data) {
							var tbody = '';
							if (data.length > 0) {
								$.each(data, function(i, item) {
									tbody += '<tr>' +
										'<td>' + (item.category || '') + '</td>' +
										'<td class="checkbox-center"><input type="checkbox" ' + (item.gstApplicable ? 'checked' : '') + ' disabled></td>' +
										'<td>' + (item.gstRate || '') + '</td>' +
										'<td>' + (item.cessRate || '') + '</td>' +
										'<td>' + (item.sacCode || '') + '</td>' +
										'<td>' + (item.reason0GST || '') + '</td>' +
										'<td>' + (item.rcmApplicable ? 'Yes' : 'No') + '</td>' +
										'</tr>';
								});
							} else {
								tbody = '<tr><td colspan="7" class="no-data-row">No applicable tax and duty details found.</td></tr>';
							}
							$('#taxDutiesTable tbody').html(tbody);
						},
						error: function() {
							alert('Error fetching tax duties!');
						}
					});

					// Fetch Supporting Documents
					$.ajax({
						url: '${pageContext.request.contextPath}/eps/auction/getSupportingDocuments',
						type: 'GET',
						data: {
							orgZone: zone,
							departmentId: unit
						},
						success: function(docs) {
							var tbody = '';
							if (docs.length > 0) {
								$.each(docs, function(i, doc) {
									tbody += '<tr>' +
										'<td>' + (doc.addedBy || '') + '</td>' +
										'<td>' + (doc.description || '') + '</td>' +
										'<td><a href="' + (doc.fileLink || '#') + '" style="color: #2c5aa0; text-decoration: none; font-weight: 600;">' + (doc.fileName || '') + '</a></td>' +
										'<td>' + (doc.uploadedOn || '') + '</td>' +
										'</tr>';
								});
							} else {
								tbody = '<tr><td colspan="4" class="no-data-row">No Documents Uploaded</td></tr>';
							}
							$('table.taxes-table:last tbody').html(tbody);
						},
						error: function() {
							alert('Error fetching supporting documents!');
						}
					});
				}
			});
		});

		function closePopupModal() {
			const modal = window.parent.document.getElementById("popupModal");
			if (modal) {
				modal.style.display = "none";
			}
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