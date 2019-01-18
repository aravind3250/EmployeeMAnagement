<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script src="${pageContext.request.contextPath}/resourcefile/js/bootstrap.min.js"></script>
 <link href="${pageContext.request.contextPath}/resourcefile/css/bootstrap.min.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/resourcefile/css/Menu.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script>

function showtable(id){
	if(id=="employee")
	{
		$('#userskills').show();
		$('#usersalary').show();
	}
	else
	{
		$('#userskills').hide();
		$('#usersalary').hide();
	}
	 
} 

</script>
</head>
<body>
	<div class="navbar navbar-default navbar-fixed-top">
		<div class="container-fluid">
			<ul class="nav navbar-nav">
			<c:choose>
				<c:when test="${sessionScope.usertype!='employee'}">
					<li >
						<a style="color: white; border-right: 1px solid white;" id="analitics" href="analytics">Analytics</a>
					</li>
					<li>
						<a style="color: white; border-right: 1px solid white;" id="config" href="configure">Configuration</a>
					</li>
					</c:when>
				<c:otherwise>
					<li>
						<a style="color: white; border-right: 1px solid white;" id="analitics" href="analytics">Analytics</a>
					</li>
				</c:otherwise>
			</c:choose>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li>
						<!-- USER ICON DISPLAY -->
						
				<a style="color: white;" id="userlogout" 
					href="#" onclick="return showtable('${sessionScope.usertype}');" data-toggle="modal" data-target="#myModal">
					<i id="hidetable" class=" fauser fa fa-user" style="font-size:19px;color:white;"></i></a>
				</li>
				<li>
					<a style="color: white;" id="userlogout" href="logoutuser">
					   <i class="fa fa-sign-out" style="font-size:19px"></i> Logout</a>
				</li>
			</ul>
		</div>
	</div>
	
	<c:choose>
	<c:when test="${sessionScope.empname != null }">
	<div class="modal fade" id="myModal" role="dialog">
	<div class="modal-dialog">
	      <div class="modal-content" id="showtable">
	        <div class="modal-header" style="background-color:#0059b3; color:white;">
	          <h4 class="modal-title" style=>Employee Personal Data</h4>
	        </div>
	        <div class="modal-body">
	          <table class="table table-bordered" id="datacontent" style="margin-top:3%;">
					<tr>
						<th>First Name</th>
						<td>${sessionScope.empname}</td>
					</tr>
					<tr>
						<th>Last Name</th>
						<td>${sessionScope.lname}</td>
					</tr>
					<tr>
						<th>Email ID</th>
						<td>${sessionScope.emailid}</td>
					</tr>
					<tr>
						<th>Designation</th>
						<td>${sessionScope.designation}</td>
					</tr>
					<tr id="userskills">
						<th >Skills</th>
						<td>${sessionScope.skills}</td>
					</tr>
					<tr>
						<th>Gender</th>
						<td>${sessionScope.gender}</td>
					</tr>
					<tr id="usersalary">
						<th >Salary</th>
						<td>${sessionScope.salary}</td>
					</tr>
					<tr>
						<th>Department</th>
						<td>${sessionScope.depname}</td>
					</tr>
					<tr>
						<th>Department</th>
						<td>${sessionScope.usertype}</td>
					</tr>
			</table>
	        </div>
	        <div class="modal-footer" style="padding:4%;">
	          <button type="button" class="btn5 btn5-primary" data-dismiss="modal">Close</button>
	        </div>
	      </div>
	      
	    </div>
  	</div>
  	</c:when>
  	<c:otherwise>
  		<div class="modal fade" id="myModal" role="dialog">
			<div class="modal-dialog">
	      <div class="modal-content" id="showtable">
	        <div class="modal-header" style="background-color:#0059b3; color:white;">
	          <h4 class="modal-title" style=>Employee Personal Data</h4>
	        </div>
	        <div class="modal-body">
	          <table class="table table-bordered" id="datacontent" style="margin-top:3%;">
					<tr>
						<th>Name</th>
						<td style="color:green;">${sessionScope.uname}</td>
					</tr>
					<tr>
						<th>Email ID</th>
						<td style="color:green;">${sessionScope.username}</td>
					</tr>
			</table>
	        </div>
	        <div class="modal-footer" style="padding:4%;">
	          <button type="button" class="btn5 btn5-primary" data-dismiss="modal">Close</button>
	        </div>
	      </div>
	      
	    </div>
  	</div>
  	</c:otherwise>
  	</c:choose>
</body>
</html>