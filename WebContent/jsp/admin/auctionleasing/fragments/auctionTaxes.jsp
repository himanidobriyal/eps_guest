<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<title>Applicable Taxes & Duties - Leasing Auction</title>
<style>
body {
	font-family: Arial, sans-serif;
	margin: 20px;
	color: #333;
	background-color: #f4f4f4;
}

.container {
	background-color: #fff;
	padding: 20px;
	border-radius: 8px;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

h2 {
	text-align: center;
	color: #007bff;
	padding: 10px 0;
	border-bottom: 2px solid #007bff;
	margin-bottom: 20px;
}

.header-controls {
	display: flex;
	gap: 30px;
	margin-bottom: 20px;
	align-items: center;
	justify-content: flex-start;
}

.header-controls label {
	font-weight: bold;
	color: #555;
	white-space: nowrap;
}

.header-controls select {
	padding: 8px 10px;
	border: 1px solid #ccc;
	border-radius: 4px;
	min-width: 200px;
}

.data-table-container {
	overflow-x: auto;
}

.taxes-table {
	width: 100%;
	border-collapse: collapse;
	margin-top: 20px;
	font-size: 0.9rem;
}

.taxes-table th {
	background-color: #0963a1;
	color: white;
	padding: 10px;
	text-align: left;
	font-weight: 500;
	white-space: nowrap;
}

.taxes-table td {
	padding: 8px 10px;
	border: 1px solid #eee;
	vertical-align: middle;
}

.taxes-table tr:nth-child(even) {
	background-color: #f9f9f9;
}

.checkbox-center {
	text-align: center;
}

.info-block {
	background-color: #f0f8ff;
	border: 1px solid #b3d9ff;
	padding: 15px;
	margin-top: 30px;
	border-radius: 4px;
	font-size: 0.9rem;
	line-height: 1.4;
}

.info-block strong {
	color: #0056b3;
}
</style>
</head>
<body>
	<div class="container">

		<c:set var="selectedZone" value="Northern Railway" scope="request" />
		<c:set var="selectedUnit" value="DELHI DIVISION-COMMERCIAL"
			scope="request" />



		<h2>Applicable Taxes & Duties - Leasing Auction</h2>

		<div class="header-controls">
			<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
			<!-- Zone Dropdown -->
			<label for="zone">Zone</label> <select id="zone" name="zone"
				class="form-control">

				<c:forEach var="zone" items="${zoneList}">
					<option value="${zone.int_code}"
						<c:if test="${zone.value eq selectedZone}">selected</c:if>>
						${zone.value}</option>
				</c:forEach>
			</select>

			<!-- Unit Dropdown -->
			<label for="unit">Unit</label> <select id="unit" name="unit"
				class="form-control">
				<option value="">-- Select Unit --</option>
			</select>
		</div>

		<script>
			$(document)
					.ready(
							function() {

								// Load units automatically if a zone is preselected
								var selectedZone = $('#zone').val();
								if (selectedZone)
									loadUnits(selectedZone);

								// On zone change, load units dynamically
								$('#zone')
										.change(
												function() {
													var zone = $(this).val();
													if (zone) {
														loadUnits(zone);
													} else {
														$('#unit')
																.html(
																		'<option value="">-- Select Unit --</option>');
													}
												});

								function loadUnits(zone) {
									$
											.ajax({
												url : '${pageContext.request.contextPath}/eps/auction/getUnitsByZone',
												type : 'GET',
												data : {
													orgZone : zone
												},
												success : function(units) {
													$('#unit')
															.empty()
															.append(
																	'<option value="">-- Select Unit --</option>');
													$
															.each(
																	units,
																	function(i,
																			unit) {
																		$(
																				'#unit')
																				.append(
																						$(
																								'<option>',
																								{
																									value : unit.INT_CODE,
																									text : unit.VALUE
																								}));
																	});
												},
												error : function() {
													alert('Error fetching units!');
												}
											});
								}
							});
		</script>


		<div class="data-table-container">
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
									<td class="checkbox-center"><input type="checkbox"
										<c:if test="${item.gstApplicable}">checked</c:if> disabled>
									</td>
									<td><c:choose>
											<c:when test="${item.gstRate ne null}">
												${item.gstRate}
											</c:when>
											<c:otherwise></c:otherwise>
										</c:choose></td>
									<td><c:choose>
											<c:when test="${item.cessRate ne null}">
												${item.cessRate}
											</c:when>
											<c:otherwise></c:otherwise>
										</c:choose></td>
									<td><c:choose>
											<c:when test="${item.sacCode ne null}">
												${item.sacCode}
											</c:when>
											<c:otherwise></c:otherwise>
										</c:choose></td>
									<td></td>
									<td><c:choose>
											<c:when test="${item.rcmApplicable}">Yes</c:when>
											<c:otherwise>No</c:otherwise>
										</c:choose></td>
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr>
								<td colspan="7"
									style="text-align: center; color: #6c757d; padding: 20px;">No
									applicable tax and duty details found.</td>
							</tr>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
		</div>
		<div class="info-block">
			<p>
				<strong>*RCM:</strong> Reverse charge mechanism applicable.
			</p>
			<p>In case of **Parcel Lots (SLR and VP)**, contractors will be
				liable to pay development charges @2% of license fee / leasing
				charges + GST (as applicable) for the lot. These charges will be
				applicable over and above the license fee/ leasing charges as
				specified in the contract.</p>
			<p>Other Charges as mentioned in the lot details or asset details
				shall also be borne by the contractor.</p>
		</div>

		<h3 style="margin-top: 30px; color: #555;">Attached Supporting
			Document</h3>
		<table class="taxes-table" style="margin-top: 10px;">
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
								<td><a href="${doc.fileLink}">${doc.fileName}</a></td>
								<td>${doc.uploadedOn}</td>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
							<td colspan="4"
								style="text-align: center; color: red; font-weight: bold;">
								No Documents Uploaded</td>
						</tr>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>
		<div style="text-align: center; margin-top: 30px;">
			<button onclick="closePopupModal()"
				style="padding: 10px 30px; background-color: #6c757d; color: white; border: none; border-radius: 4px; cursor: pointer;">
				Close</button>
		</div>

		<script>
			function closePopupModal() {
				// Access the modal on the parent page and close it
				const modal = window.parent.document
						.getElementById("popupModal");
				modal.style.display = "none";
				window.parent.document.getElementById("modalData").innerHTML = ""; // clear modal content
			}
		</script>



	</div>
	<script>
		//When unit dropdown changes, fetch tax duties
		$('#unit')
				.change(
						function() {
							var zone = $('#zone').val();
							var unit = $(this).val();

							if (zone && unit) {
								$
										.ajax({
											url : '${pageContext.request.contextPath}/eps/auction/getTaxDuties',
											type : 'GET',
											data : {
												orgZone : zone,
												departmentId : unit
											},
											success : function(data) {
												var tbody = '';
												if (data.length > 0) {
													$
															.each(
																	data,
																	function(i,
																			item) {
																		tbody += '<tr>'
																				+ '<td>'
																				+ (item.category || '')
																				+ '</td>'
																				+ '<td class="checkbox-center"><input type="checkbox" '
																				+ (item.gstApplicable ? 'checked'
																						: '')
																				+ ' disabled></td>'
																				+ '<td>'
																				+ (item.gstRate || '')
																				+ '</td>'
																				+ '<td>'
																				+ (item.cessRate || '')
																				+ '</td>'
																				+ '<td>'
																				+ (item.sacCode || '')
																				+ '</td>'
																				+ '<td>'
																				+ (item.reason0GST || '')
																				+ '</td>'
																				+ '<td>'
																				+ (item.rcmApplicable ? 'Yes'
																						: 'No')
																				+ '</td>'
																				+ '</tr>';
																	});
												} else {
													tbody = '<tr><td colspan="7" style="text-align:center;color:#6c757d;padding:20px;">No applicable tax and duty details found.</td></tr>';
												}
												$('#taxDutiesTable tbody')
														.html(tbody);
												F
											},
											error : function() {
												alert('Error fetching tax duties!');
											}
										});
							}
						});

		// Fetch Supporting Documents when unit changes
		$
				.ajax({
					url : '${pageContext.request.contextPath}/eps/auction/getSupportingDocuments',
					type : 'GET',
					data : {
						orgZone : zone,
						departmentId : unit
					},
					success : function(docs) {
						var tbody = '';
						if (docs.length > 0) {
							$.each(docs, function(i, doc) {
								tbody += '<tr>' + '<td>' + (doc.addedBy || '')
										+ '</td>' + '<td>'
										+ (doc.description || '') + '</td>'
										+ '<td><a href="'
										+ (doc.fileLink || '#') + '">'
										+ (doc.fileName || '') + '</a></td>'
										+ '<td>' + (doc.uploadedOn || '')
										+ '</td>' + '</tr>';
							});
						} else {
							tbody = '<tr><td colspan="4" style="text-align:center;color:red;font-weight:bold;">No Documents Uploaded</td></tr>';
						}
						$('table.taxes-table:last tbody').html(tbody); // update last table (supporting docs)
					},
					error : function() {
						alert('Error fetching supporting documents!');
					}
				});
	</script>

</body>
</html>