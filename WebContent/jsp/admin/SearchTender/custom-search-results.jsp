<h4>Custom Search Results (Total: ${total})</h4>
<table class="table table-bordered table-striped">
    <thead>
        <tr>
            <th>Tender No</th>
            <th>Title</th>
            <th>Work Area</th>
            <th>Status</th>
            <th>Due Date</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach var="t" items="${tenders}">
            <tr>
                <td>${t.tenderNo}</td>
                <td>${t.tenderTitle}</td>
                <td>${t.workArea}</td>
                <td>${t.status}</td>
                <td>${t.dueDate}</td>
            </tr>
        </c:forEach>
    </tbody>
</table>
