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
  background-color: #ffffff	;
}

.header{
  	background-color:#66b3ff;
  	padding: 1px ;
}

h1{
	margin-top:0px;
	color : #ffffff;
	text-align: left;
	font-size: 30px;
	font-family: sans-serif;	
	font-style: normal;
	font-weight: 300
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

	font-family:sans-serif;
	text-align:justify;
	margin-top:10px;
	margin-left: 100px;
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
    width: 300px;
    margin-top:20px;
    margin-left:350px;
    padding:40px;
    box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
    
   }

  
input[type=text],[type=email], input[type=password] {
	
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
input[type="password"]:focus {  
 
  	border-bottom: 2px solid #16a085;
  	color: #16a085;
  	transition: 0.2s ease;
  	outline: none;
}

.btn {
	position : absolute;
	margin-top:5px;
	margin-left:108px;
    background-color:  #ff6600;
    color: white;
    font-size: 15px;
    padding: 8px 10px;
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
	margin-left:45px;
    background-color: #ff6600;
    color: white;
    font-size: 15px;
    padding: 8px 15px;
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
	margin-left:185px;
    background-color:  #ff6600;
    color: white;	 
    font-size: 14px;
    padding: 9px 23px;
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

}  
</script>  
</head>
<body>
<div class="div1">
 	<f:form action="validateemployee" modelAttribute="userdetails" method="post" name="vform" onsubmit="return validateform()" >
	<h1  align="left" style="color:#00004d">Employee Login</h1><br>
	<h1 style="margin-left: 20%; font-size: 20px; color: #cc0000">${error}</h1>
	<f:input path="emailid" type="text" placeholder="Enter Email" name="email" required="true"/><br>
    <f:input path="password" type="password" placeholder="Enter Password" name="password" required="true"/><br>
    <button class="btn1">Sign in</button>	
    <f:button class="btn2" type="reset">Reset</f:button><br><br><br>
    </f:form>   
     
</div><br>

</body>
</html>