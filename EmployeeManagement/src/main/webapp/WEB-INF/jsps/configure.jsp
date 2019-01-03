<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/Menu.css">
</head>
<body class="congfigur-body">
	<%@ include file="header.jsp"%><br>
	<div class="sidenav">
		<a style="color: white; text-decoration: none; border-top: 2px solid white; 
		   border-bottom: 2px solid white;" id="departmentlink" 
		   href="departmentDetails">Department</a> 
		<a style="color: white; text-decoration: none; border-bottom: 2px solid white;"
			id="employeelink" href="employeeDetails">Employees</a>
	</div>
</body>
</html>