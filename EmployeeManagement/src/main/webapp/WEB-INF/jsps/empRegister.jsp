<%@ taglib uri="http://www.springframework.org/tags/form" prefix="f"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link href="<c:url value="/resources/css/body.css" />" rel="stylesheet">
<script type="text/javascript">
		$(document).ready(function() {
			var skills = $("#skills").val().split(",");
			var $checkboxes = $("input[type=checkbox]");
			$checkboxes.each(function(idx, element) {
				if (skills.indexOf(element.value) != -1) {
					element.setAttribute("checked", "checked");
					$("#skills").val("");
				} else {
					element.removeAttribute("checked");
				}
			});

		})
	</script>
</head>
<body>
	<%@ include file="configure.jsp"%><br>
	<div class="divaddemployee">
		<br> <a href="employeeDetails"><button class="empRegisterbtnback" type="submit">back</button></a><br>
		<f:form action="addemployee" modelAttribute="employeedetails"
			method="post">
			<h1 align="left" style="color: #00004d; margin-top: -15px">Employee
				Details</h1>
			<f:input class="employeeRegister-input" path="fname" type="text"
				placeholder="Enter First Name" required="true" />
			<f:input class="employeeRegister-input" path="lname" type="text"
				placeholder="Enter Last Name" required="true" />
			<f:input class="employeeRegister-input" path="employeeid" type="text"
				placeholder="Enter Employee-ID" pattern="[0-9]+"
				title="!!EmployeeId should be a +ve number from 1 to 9"
				required="true" />
			<f:input class="employeeRegister-input" path="emailid" type="email"
				placeholder="Enter E-mail" required="true" />
			<f:select class="employeeRegister-select" path="designation"
				placeholder="designation" required="true">
				<f:option value="select">Select</f:option>
				<f:option value="Software Engineer">Software Engineer</f:option>
				<f:option value="Trainee">Trainee</f:option>
				<f:option value="Associate Software Engineer">Associate Software Engineer</f:option>
				<f:option value="Senior Software Engineer">Senior Software Engineer</f:option>
				<f:option value="Team Lead">Team Lead</f:option>
			</f:select>
			<br />

			<f:checkbox class="employeeRegister-checkbox" path="skills"
				value="Java" />Java 
				<f:checkbox path="skills" value="Spring" />Spring
				<f:checkbox path="skills" value="Hibernate" />Hibernate
				<f:checkbox path="skills" value="Struts" />Struts<br />
			<br>


			<f:radiobutton path="gender" value="Male" />Male<br />
			<f:radiobutton path="gender" value="Female" />Female<br />
			<br>


			<f:input class="employeeRegister-input" path="password" type="password"
				placeholder="Employee password" required="true" />
			<f:input class="employeeRegister-input" path="salary" type="text" placeholder="Employee salary"
				required="true" pattern="[0-9]+"
				title="!!salary should be a +ve number from 1 to 9" />
			<f:select class="employeeRegister-select" path="departmentid" placeholder="Department"
				required="true">
				<c:forEach var="list" items="${depNameslist}">
					<f:option value="${list.key}">${list.value}</f:option>
				</c:forEach>
			</f:select>

			<!-- following are the hidden fields -->
			<f:hidden path="empid" />
			<input type="hidden" value="${employeedetails.skills}" id="skills" />
			<br>

			<f:button class="empRegisterbtn5"> Add Details</f:button>
			<f:button class="empRegisterbtn6" type="reset">Reset</f:button>
			<br>
			<br>
		</f:form>
	</div>
	<br>
	<br>
</body>
</html>