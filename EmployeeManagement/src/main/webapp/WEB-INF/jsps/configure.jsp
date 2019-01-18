<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>

<script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
<link href="${pageContext.request.contextPath}/resourcefile/css/Menu.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/resourcefile/css/body.css" rel="stylesheet" type="text/css">

<script type="text/javascript">

$(document).ready(function() {
	$("#config").addClass("active")

});

</script>
</head>
<%@ include file="header.jsp"%><br>
<body class="congfigur-body">
	<div class="sidenav">
		<a style="color: white; text-decoration: none; border-top: 1px solid white; border-bottom: 1px solid white;" 
		id="departmentlink" href="departmentDetails">Department</a> 
		
		<a style="color: white; text-decoration: none; border-bottom: 1px solid white;"
			id="employeelink" href="employeeDetails">Employees</a>
			
	</div>
</body>
</html>
