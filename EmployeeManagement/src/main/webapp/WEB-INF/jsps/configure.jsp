<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<style>
.sidenav {
  margin-top:56px;
  height: 100%;
  width: 160px;
  position: fixed;
  z-index: 1;
  top: 0;
  left: 0;
  background-color: #3399ff;
  overflow-x: hidden;
  padding-top: 20px;
}

.sidenav a {
  padding: 6px 8px 6px 16px;
  text-decoration: none;
  font-size: 20px;
  color: #ffffff;
  display: block;
}


.main {
  margin-left: 160px; /* Same as the width of the sidenav */
  font-size: 28px; /* Increased text to enable scrolling */
  padding: 0px 10px;
}

</style>
</head>
<body>
<%@ include file="header.jsp" %><br>
<div class="sidenav">
  <a href="departmentDetails">Department</a>
  <hr style="color:white;border-width: 2px;">
  <a href="employeeDetails">Employees</a>
  <hr style="color:white;border-width: 2px;">
</div>
</body>
</html>