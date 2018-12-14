<%@ taglib uri="http://www.springframework.org/tags/form" prefix="f"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
body { 
  margin:100px 160px;
  font-family: Arial;
}
body{
	background-color: #ffffff	;
}

.header{
  	background-color:#66b3ff;
  	padding: 1px ;
}

h1{
	margin-top:5px;
	margin-left:30px;
	color : #ffffff;
	text-align: left;
	font-size: 50px;
	font-family: Rockwell Condensed;
	font-style: normal;
}

img {
    float: left
}

label{
	color:#4d4d4d;
	margin-left: 15px;
}

.div1 {

    background-color: #ffffff;
    border-color: blur #e6e6e6;
    width: 350px;
    border: 5px #66b3ff;
    margin-left:350px;
    margin-right: 100px; 
    box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
    
   }

  
input[type=text],[type=email], input[type=password] {
	
    width: 85%;
    padding: 11px;
    margin: 10px 13px;
    display: inline-block;
    border: none;
    background: #d9d9d9;
    border-radius: 12px;
}
.btn2 {
	position : absolute;
	margin-top:10px;
	margin-left:279px;
    background-color:  #ff6600;
    color: white;	 
    font-size: 14px;
    padding: 13px -1px;
    border: none;
    cursor: pointer;
    border-radius: 5px;
    text-align: center;
}

.btn2:hover {
    background-color: #00004d;
    color: white;
    }
.btn {
	position : absolute;
	margin-top:5px;
	margin-left:120px;
    background-color:  #ff6600;
    color: white;
    font-size: 15px;
    padding: 8px 20px;
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
	margin-left  : 14px;
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

h2{
	text-align:center;
	color: #808000;
	font-size: 25px ;
	font-family : Square721 BT ;
	margin-top: 5px;
	margin
}

.hh1{

	text-align:justify;
	margin-top:10px;
	margin-left: 230px;
}

</style>
<script>  
function validateform(){  
var email=document.vform.email.value;  
var password=document.vform.password.value;  
  
 if(!(email.match(/[a-z]/g))){
  alert("email doesnot contain lowercase letters");
  return false;
}else if(!(email.match(/[A-Z]/g))){
	alert("email doesnot contain uppercase letters");
	return false;
}else if(!(email.match([0-9]/g))){
	alert("email does not contain numbers");
	return false;
}
 if(password.length<6){  
	  alert("Password must be at least 6 charalecters long.");  
	  return false;  
	}
 if()

}  
</script>  
</head>
<body>
<div class="div1">
 	<f:form action="registeruser" modelAttribute="employee" method="post" name="vform" onsubmit="return validateform()" >
 	<div class="header">
	<h2  align="left" style="color:#00004d">User Registration</h2></div>
	<f:button class="btn2" type="reset">Reset</f:button><br>
	 <label for="uname"><b>User Name :</b></label>
	<f:input path="uname" type="text" placeholder="Enter UserName" name="uname" required="true"/><br>
    <label for="email"><b>User Email :</b></label>
	<f:input path="emailid" type="email" placeholder="Enter Email" name="email" required="true"/><br>
    <label for="psw"><b> Password :</b></label>
    <f:input path="password" type="password" placeholder="Enter Password" name="password" required="true" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}"
    title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters"/><br><br>
     <label for="psw"><b> Password :</b></label>
    <f:input path="rpassword" type="password" placeholder="Repeat Password" name="password" required="true" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}"
    title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters"/><br><br>
     </f:form>
    <a href="register"><button class="btn1"> Register</button></a>
   		
    <h2 class="hh1"><a href="forgotPass.jsp" style="color: #00004d;font-size: 10px;">Forgot Password</a></h2><br>
</div><br>

</body>
</html>