<%@ taglib uri="http://www.springframework.org/tags/form" prefix="f"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<link href="${pageContext.request.contextPath}/resourcefile/css/body.css" rel="stylesheet" type="text/css">
	<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script>
function validateform(){
	var email = document.getElementById("email").value;
	var password = document.getElementById("password").value;
	if ((email =="")) {
		alert("email should not be Emplty");
		return false;
	}else if (!(email.match(/[a-z]/g))) {
		alert("email doesnot contain lowercase letters");
		return false;
	}
	
	if ((password=="")) {
		alert("password should not be Emplty");
		return false;
	}
}


function resetform(){
	debugger;
	$('#email').val('');
	$('#password').val('');
	
}

	
</script>
</head>
<body class="employee-body-style ">
	<div class="div1">
		<f:form id="loginreset" action="validateemployee" modelAttribute="userdetails"
			method="post" onsubmit="return validateform()">
			<h1 class="employee-loginh1" align="left" style="color: #00004d">Employee Login</h1>
			<br>
			
			<h1 id="messagedisplay" class="employee-loginh1" style="margin-left: 20%; font-size: 20px; color:  #00b359;">${success}</h1>
			<h1 id="messagedisplay" class="employee-loginh1" style="margin-left: 20%; font-size: 20px; color: #cc0000;">${error}</h1>
			
			
			<f:input class="employeelogininput" path="emailid" type="text" placeholder="Enter Email" id="email" value=""
				autofocus="autofocus"/><br>
			
			<f:input class="employeelogininput" path="password" type="password" placeholder="Enter Password" id="password" /><br>
			
			<button class="btn1">Sign in</button>
			<f:button type="button" name="reset" value="reset" class="btn2" onclick="resetform()">Reset</f:button>
			<br>
			<br>
			<br>
		</f:form>

	</div>
	<br>

</body>
</html>