<%@ taglib uri="http://www.springframework.org/tags/form" prefix="f"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<style>
.div1 {
    background-color: #ffffff;
    width: 300px;
    margin-top:20px;
    margin-left:350px;
    padding:40px;
    box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
    
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
	margin-top:-15px;
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
	position : absolute;
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
	margin-left  : 180px;
    background-color: #ff6600;
    color: white;
    font-size: 15px;
    padding: 8px 22px;
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
<div class="div1">
<a href="employeeDetails"><button class="btn" type="submit">back</button></a>
<f:form action="addemployee" modelAttribute="employeedetails" method="post"  >
<h1  align="left" style="color:#00004d">Employee Details</h1>
	<f:input path="fname" type="text" placeholder="Enter First Name"/><br/>
    <f:input path="lname" type="text" placeholder="Enter Last Name"/><br/>
	<f:input path="employeeid" type="text" placeholder="Enter EmailID"/><br/>
	<f:input path="emailid" type="email" placeholder="Enter E-mail"/>
	<f:select path="designation">
		<f:option value="Software Engineer">Select</f:option>
		<f:option value="Software Engineer">Software Engineer</f:option>
		<f:option value="Trainee">Trainee</f:option>
		<f:option value="Associate Software Engineer">Associate Software Engineer</f:option>
		<f:option value="Senior Software Engineer">Senior Software Engineer</f:option>
		<f:option value="Team Lead">Team Lead</f:option>		
	</f:select><br/>
	
	<f:checkbox path="skills" value = "Java"/>Java<br/>
	<f:checkbox path="skills" value = "Spring"/>Spring<br/>
	<f:checkbox path="skills" value = "Hibernate"/>Hibernate<br/>
	<f:checkbox path="skills" value = "Struts"/>Struts<br/><br>
	
	<f:radiobutton path="gender" value = "Male"/>Male<br/>
	<f:radiobutton path="gender" value = "Female"/>Female<br/><br>
	<f:input path="password" type="password" placeholder="Employee password"/><br/>
	<f:input path="salary" type="text" placeholder="Employee salary"/><br/>
	<f:input path="department" type="text" placeholder="Employee Department"/><br/>
		
	<f:button class="btn1"> Sign Up</f:button>
    <f:button class="btn2" type="reset">Reset</f:button><br><br><br>
</f:form>
</div>
</body>
</html>