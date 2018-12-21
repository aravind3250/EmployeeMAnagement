<%@ taglib uri="http://www.springframework.org/tags/form" prefix="f"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<style>
.div1 {
    background-color: #ffffff;
    width: 280px;
    margin-top:40px;
    margin-left:40%;
    padding:40px;
    box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
    z-index: 0;
   }

  
input[type=text],
input[type=email], 
input[type=password],
select {
	
	display: block;
  	box-sizing: border-box;
  	margin-bottom: 20px;	
  	padding: 4px;
  	width: 300px;
  	height: 32px;
 	border: none;
  	border-bottom: 1px solid #AAA;
  	font-family: 'Roboto', sans-serif;
  	font-weight: 400;
  	font-size: 15px;
  	transition: 0.2s ease;
  }
  
 input[type="text"]:focus,
 input[type="email"]:focus,
 input[type="password"]:focus,
 select:focus{  
 
  	border-bottom: 2px solid #16a085;
  	color: #16a085;
  	transition: 0.2s ease;
  	outline: none;
}

 .btn {
	position : absolute;
	margin-top:-35px;
	margin-left:256px;
    background-color:  #ff6600;
    color: white;
    font-size: 15px;
    padding: 8px -1px;
    border: none;
    cursor: pointer;
    border-radius: 5px;
    text-align: center;
 

}

.btn:hover {
    background-color: #00004d;
    color: white;
}

.btn1 {
	position : relative;
	margin-top:5px;
	margin-left  : 0px;
    background-color: #ff6600;
    color: white;
    font-size: 15px;
    padding: 8px 13px;
    border: none;
    cursor: pointer;
   	border-radius: 5px;
    text-align: center;
}

.btn1:hover {
    background-color: #00004d;
    color: white;
}

.btn2 {
	position : absolute;
	margin-top:5px;
	margin-left  : 84px;	
    background-color: #ff6600;
    color: white;
    font-size: 15px;
    padding: 8px 35px;
    border: none;
    cursor: pointer;
   	border-radius: 5px;
    text-align: center;
}

.btn2:hover {
    background-color: #00004d;
    color: white;
    }

</style>

</head>
<body>
<%@ include file="configure.jsp" %><br>
<div class="div1">
<a href="employeeDetails"><button class="btn" type="submit">back</button></a>
<f:form action="addemployee" modelAttribute="employeedetails" method="post"  >
<h1  align="left" style="color:#00004d;margin-top:-15px">Employee Details</h1>
	<f:input path="fname" type="text" placeholder="Enter First Name" required="true"/>
    <f:input path="lname" type="text" placeholder="Enter Last Name" required="true"/>
	<f:input path="employeeid" type="text" placeholder="Enter Employee-ID" required="true"/>
	<f:input path="emailid" type="email" placeholder="Enter E-mail" required="true"/>
	<f:select path="designation" placeholder="designation" required="true">
		<f:option value="select">Select</f:option>
		<f:option value="Software Engineer">Software Engineer</f:option>
		<f:option value="Trainee">Trainee</f:option>
		<f:option value="Associate Software Engineer">Associate Software Engineer</f:option>
		<f:option value="Senior Software Engineer">Senior Software Engineer</f:option>
		<f:option value="Team Lead">Team Lead</f:option>		
	</f:select><br/>
	
	<f:checkbox path="skills" value = "Java"/>Java<br/>
	<f:checkbox path="skills" value = "Spring"/>Spring<br/>
	<f:checkbox path="skills" value = "Hibernate"/>Hibernate<br>
	<f:checkbox path="skills" value = "Struts"/>Struts<br/><br> 
	
	
	<f:radiobutton path="gender" value = "Male" />Male<br/>
	<f:radiobutton path="gender" value = "Female" />Female<br/><br>
	
	
	<f:input path="password" type="password" placeholder="Employee password" required="true"/>
	<f:input path="salary" type="text" placeholder="Employee salary" required="true"/>
	<f:select path="department" placeholder="Department" required="true">
	<c:forEach var="list" items="${depNameslist}">
		<f:option value="${list}">${list}</f:option>
	</c:forEach>
	</f:select>
		
	<!-- following are the hidden fields -->
	<f:hidden path="id"/>
	<input type = "hidden" value = "${employeedetails.skills}" id = "skills" />
	
	<f:button class="btn1"> Add Details</f:button>
    <f:button class="btn2" type="reset">Reset</f:button><br><br>

</f:form>
 	
</div><br><br>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script type = "text/javascript">
		$(document).ready(function(){
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
</body>
</html>