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
			$('#employeeTable').DataTable();
		})

		$('#employeeTable').dataTable({
			"lengthMenu" : [ 5, 10, 25, 50, 75, 100 ]
		});
</script>
<script>
	$(document).ready(function() {
		$("#employeelink").addClass("active")

	})
</script>
</head>
<body style="background-color: #f2f2f2;">
	<%@ include file="configure.jsp"%>

	<a href="newemployee"><button type="button" class="btn4 btn4-primary">Add
			Employee</button></a>
	<div class="table2">
		<!-- here comes the table  -->
		<h1 style="margin-left: 20%; font-size: 20px; color: green">${msg}</h1>
		<h1 style="margin-left: 20%; font-size: 20px; color: green">${success}</h1>
		<h1 style="margin-left: 20%; font-size: 20px; color: #cc0000">${error}</h1>
		<table id="employeeTable"
			class="compact stripe hover table-border cell-border row-border order-column dt[-head|-body]-left dt-head-left"
			style="width: 100%; background-color: #3399ff; border-color: #dddddd;">
			<thead style="border-color: #dddddd; color: white;">
				<tr>
					<th>Employee ID</th>
					<th>First Name</th>
					<th>Last Name</th>
					<th>Email ID</th>
					<th>Designation</th>
					<th>Skills</th>
					<th>Gender</th>
					<th>Salary</th>
					<th>Department</th>
					<th>Actions</th>
				</tr>
			</thead>
			<tbody style="border-color: #dddddd;">
				<c:forEach items="${list}" var="e">
					<tr>
						<td style="text-align: right;">${e.employeeid}</td>
						<td>${e.fname}</td>
						<td>${e.lname}</td>
						<td>${e.emailid}</td>
						<td>${e.designation}</td>
						<td>${e.skills}</td>
						<td>${e.gender}</td>
						<td style="text-align: right;">${e.salary}</td>
						<td>${e.depname}</td>
						<td style="text-align: center;"><a href="updateEmployee?id=${e.empid}">
							<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24">
							<pathd="M3 17.25V21h3.75L17.81 9.94l-3.75-3.75L3 17.25zM20.71 7.04c.39-.39.39-1.02 0-1.41l-2.34-2.34c-.39-.39-1.02-.39-1.41 0l-1.83 1.83 3.75 3.75 1.83-1.83z" />
							<path d="M0 0h24v24H0z" fill="none" /></svg></a>
							
							<b>|</b> 
							
							<a href="removeEmployee?id=${e.empid}">
							<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24">
							<path d="M6 19c0 1.1.9 2 2 2h8c1.1 0 2-.9 2-2V7H6v12zM19 4h-3.5l-1-1h-5l-1 1H5v2h14V4z" />
							<path d="M0 0h24v24H0z" fill="none" /></svg></a>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>