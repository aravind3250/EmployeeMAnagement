<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<script src="<c:url value="/resources/js/datatables.min.js" />"></script>
<link href="<c:url value="/resources/css/jquery-ui.css" />" rel="stylesheet">
<link href="<c:url value="/resources/css/datatables.min.css" />" rel="stylesheet">
<link href="<c:url value="/resources/css/dataTables.jqueryui.min.css" />" rel="stylesheet">
<link href="<c:url value="/resources/css/body.css" />" rel="stylesheet">
<script type="text/javascript">
	$(document).ready(function() {
		$('#departmenttable').DataTable();
	})

	$('#departmenttable').dataTable({
		"lengthMenu" : [ 10, 25, 50, 75, 100 ]
	});
	</script>
<style>

</style>
<script>
	$(document).ready(function() {
		$("#departmentlink").addClass("active")

	});

	function myFunction() {
		var result = window
				.confirm("Are yu sure to Delet this employee Details");
		if (result) {
			document.removeDepartment.submit();
			return true;
		} else {

			return false;
		}
	}
</script>
</head>
<body style="background-color: #f2f2f2;">
	<%@ include file="configure.jsp"%><br>
	<a href="newDepartment"><button type="button"
			class="btn3 btn3-primary">Add Department</button></a>

	<!-- here comes the table  -->
	<div class="table1">
		<h1 style="margin-left: 20%; font-size: 20px; color: green">${success}</h1>
		<h1 style="margin-left: 20%; font-size: 20px; color: #cc0000">${error}</h1>
		<table border="1" id="departmenttable"
			class="compact stripe hover table-border cell-border row-border order-column dt[-head|-body]-left dt-head-left"
			style="width: 100%; background-color: #3399ff; border-color: #dddddd;">
			<thead style="color: white;">
				<tr>
					<th>Department Name</th>
					<th>Department Description</th>
					<th>Department Status</th>
					<th>Action</th>
				</tr>
			</thead>
			<tbody  style="border-color: #dddddd;">
				<c:forEach items="${list}" var="d">
					<tr>
						<td>${d.dName}</td>
						<td>${d.description}</td>
						<td>${d.status}</td>
						<td style="text-align: center;"><a href="updatedepartment.html?id=${d.id}"><svg
							xmlns="http://www.w3.org/2000/svg" width="24" height="24"
							viewBox="0 0 24 24">
							<path
								d="M3 17.25V21h3.75L17.81 9.94l-3.75-3.75L3 17.25zM20.71 7.04c.39-.39.39-1.02 0-1.41l-2.34-2.34c-.39-.39-1.02-.39-1.41 0l-1.83 1.83 3.75 3.75 1.83-1.83z" />
							<path d="M0 0h24v24H0z" fill="none" /></svg></a>
							
							<b>|</b> 
							
							<a href="removeDepartment?id=${d.id}" onclick="return myFunction()"><svg
							xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24">
							<path d="M6 19c0 1.1.9 2 2 2h8c1.1 0 2-.9 2-2V7H6v12zM19 4h-3.5l-1-1h-5l-1 1H5v2h14V4z" />
							<path d="M0 0h24v24H0z" fill="none" /></svg> <!-- Delete --></a>
						</td>
					</tr>
				</c:forEach>
			<tbody>
		</table>
	</div>
</body>
</html>