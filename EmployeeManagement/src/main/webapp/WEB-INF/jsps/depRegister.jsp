<%@ taglib uri="http://www.springframework.org/tags/form" prefix="f"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link href="<c:url value="/resources/css/body.css" />" rel="stylesheet">
<style>
</style>
</head>
<body style="background-color:#f2f2f2;">
	<%@ include file="configure.jsp"%><br>
	<div class="formdiv1">
		<a href="departmentDetails"><button class="btnback" type="submit">back</button></a>
		<f:form action="addDepartment" modelAttribute="departmentdetails"
			method="post">
			<h1 align="left" style="color: #00004d">Department Details</h1>
			<br>
			<f:input class="depRegister-input" path="dName" type="text" placeholder="Department Name" />
			<f:textarea class="depRegister-textarea" path="description" rows="5" cols="50"
				placeholder="Department Description"></f:textarea>
			<br>

			<f:radiobutton path="status" value="Active" />Active<br />
			<f:radiobutton path="status" value="InActive" />InActive<br />
			<br>

			<!-- following are the hidden fields -->
			<f:hidden path="id" />

			<f:button class="btnadddetails"> Add Details</f:button>
			<f:button class="btnreset" type="reset">Reset</f:button>
			<br>
			<br>
			<br>
		</f:form>
	</div>
</body>
</html>