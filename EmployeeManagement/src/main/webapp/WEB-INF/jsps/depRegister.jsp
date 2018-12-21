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
    margin-top:100px;
    margin-left:500px;
    padding:40px;
    box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
    
   }

  
input[type=text],
input[type=email], 
input[type=password],
select ,
textarea{
	
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
 select:focus,
 textarea:focus{  
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
	margin-top:30px;
	margin-left : 82%;
    background-color: #ff6600;
    color: white;
    font-size: 15px;
    padding: 8px 13px;
    border: none;
    cursor: pointer;
   	border-radius: 5px;
    text-align: center;
    z-index:-10;
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
<%@ include file="configure.jsp" %><br>
<div class="div1">
<a href="departmentDetails"><button class="btn" type="submit">back</button></a>
<f:form action="addDepartment" modelAttribute="departmentdetails" method="post"  >
<h1  align="left" style="color:#00004d">Department Details</h1>
	<f:input path="dName" type="text" placeholder="Department Name"/>
	<f:textarea path="description" rows="5" cols="50" placeholder="Department Description"></f:textarea>
	
	<f:radiobutton path="status" value="Active"/>Active<br/>
	<f:radiobutton path="status" value="InActive"/>InActive<br/><br>
	
	<!-- following are the hidden fields -->
	<f:hidden path="id"/>
	
	<f:button class="btn1"> Add Details</f:button>
    <f:button class="btn2" type="reset">Reset</f:button><br><br><br>
</f:form>
</div>
</body>
</html>