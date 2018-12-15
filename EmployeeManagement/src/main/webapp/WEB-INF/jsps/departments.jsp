<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<style>
.btn {
	position : absolute;
	margin-top:43px;
	margin-left  : 83%;
    background-color: #ff6600;
    color: white;
    font-size: 15px;
    padding: 8px 13px;
    border: none;
    cursor: pointer;
   	border-radius: 5px;
    text-align: center;
}

.btn:hover {
    background-color: #00004d;
    color: white;
}
</style>
</head>
<body>
<%@ include file="configure.jsp" %>
<a href="newDepartment"><button class="btn" type="submit">Add Department</button><br></a>

</body>
</html>