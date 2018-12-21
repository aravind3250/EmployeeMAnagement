<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdn.datatables.net/v/dt/dt-1.10.18/datatables.min.css"/>
<style>

.table1{
position:absolute;
margin-top:100px;
margin-left:175px;
font-size:15px;
cursor:pointer;
width:85%;
z-index:-10;
}  

.btn {
	position : absolute;
	margin-top:50px;
	margin-left:82%;
    background-color: #ff6600;
    color: white;
    font-size: 15px;
    padding: 8px 18px;
    border: none;
    cursor: pointer;
   	border-radius: 5px;
    text-align: center;
    z-index: -10;

    
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
    font-size: 5px;
    padding: 8px -1px;
    border: none;
    cursor: pointer;
   	border-radius: 5px;
    text-align: center;
    text-decoration: none;
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
<%@ include file="configure.jsp" %>
<a href="newemployee"><button class="btn" type="submit">Add Employee</button><br></a>
	<div class="table1">
	<!-- here comes the table  -->
	<h1 style="margin-left: 20%; font-size: 20px; color:green">${msg}</h1>	
	<h1 style="margin-left: 20%; font-size: 20px; color:green">${success}</h1>	
	<h1 style="margin-left: 20%; font-size: 20px; color: #cc0000">${error}</h1>
		<table id = "employeeTable" border = "1" class="compact stripe hover table-border row-border order-column dt[-head|-body]-left dt-head-left" style="width:100%;">
		<thead >
			<tr>
				<th>Employee ID</th>
				<th>First Name</th>
				<th>Last Name</th>
				<th>Email ID</th>
				<th>Designation</th>
				<th>Skills</th>
				<th>Gender</th>
				<th>Salary</th>
				<th>Department</th>
				<th>Actions</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${list}" var = "e">
				<tr>
					<td style="text-align: right;">${e.employeeid}</td>
					<td>${e.fname}</td>
					<td>${e.lname}</td>
					<td >${e.emailid}</td>
					<td>${e.designation}</td>
					<td>${e.skills}</td>
					<td>${e.gender}</td>
					<td style="text-align: right;">${e.salary}</td>
					<td>${e.department}</td>
					<td>
						
			<a href = "updateForm.html?id=${e.id}"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"><path d="M3 17.25V21h3.75L17.81 9.94l-3.75-3.75L3 17.25zM20.71 7.04c.39-.39.39-1.02 0-1.41l-2.34-2.34c-.39-.39-1.02-.39-1.41 0l-1.83 1.83 3.75 3.75 1.83-1.83z"/><path d="M0 0h24v24H0z" fill="none"/></svg></a> 
			<a href="removeEmployee?id=${e.id}"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"><path d="M6 19c0 1.1.9 2 2 2h8c1.1 0 2-.9 2-2V7H6v12zM19 4h-3.5l-1-1h-5l-1 1H5v2h14V4z"/><path d="M0 0h24v24H0z" fill="none"/></svg></a>
					
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	</div>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script type="text/javascript" src="https://cdn.datatables.net/v/dt/dt-1.10.18/datatables.min.js"></script>
	<script type = "text/javascript">
		$(document).ready(function(){
			$('#employeeTable').DataTable();
		})
 
		$('#employeeTable').dataTable( {
  "lengthMenu": [ 5,10, 25, 50, 75, 100 ]
} );
	</script>
</body>
</html>