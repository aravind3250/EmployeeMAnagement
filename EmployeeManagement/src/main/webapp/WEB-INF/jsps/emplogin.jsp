<%@ taglib uri="http://www.springframework.org/tags/form" prefix="f"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="/css/body.css">
<script>
function validateform(){
	var email = document.vform.email.value;
	var password = document.vform.password.value;

	if (!(email.match(/[a-z]/g))) {
		alert("email doesnot contain lowercase letters");
		return false;
	} else if (!(email.match(/[A-Z]/g))) {
		alert("email doesnot contain uppercase letters");
		return false;
	} else if (!(email.match([ 0 - 9 ] / g))) {
		alert("email does not contain numbers");
		return false;
	}
	
	if (password.length < 6) {
		alert("Password must be at least 6 charalecters long.");
		return false;
	}
}
</script>
<link type=text/css href="/webapp/css/body.css">
</head>
<body class="employee-body-style ">
	<div class="div1">
		<f:form action="validateemployee" modelAttribute="userdetails"
			method="post" name="vform" onsubmit="return validateform()">
			<h1 class="employee-loginh1" align="left" style="color: #00004d">Employee Login</h1>
			<br>
			<h1 class="employee-loginh1" style="margin-left: 20%; font-size: 20px; color:  #00b359;">${success}</h1>
			<h1 class="employee-loginh1" style="margin-left: 20%; font-size: 20px; color: #cc0000;">${error}</h1>
			<f:input class="employeelogininput" path="emailid" type="text" placeholder="Enter Email"
				name="email" required="true" /><br>
			<f:input class="employeelogininput" path="password" type="password" placeholder="Enter Password"
				name="password" required="true" /><br>
			<button class="btn1">Sign in</button>
			<f:button type="reset" class="btn2">Reset</f:button>
			<br>
			<br>
			<br>
		</f:form>

	</div>
	<br>

</body>
</html>