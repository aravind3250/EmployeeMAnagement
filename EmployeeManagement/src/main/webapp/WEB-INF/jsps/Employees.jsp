<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css"/>
<link href="${pageContext.request.contextPath}/resourcefile/css/body.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/resourcefile/css/bootstrap.min.css" rel="stylesheet" type="text/css">

<script type="text/javascript">
	$(document).ready(function() {
		$("#employeelink").addClass("active")

	})
</script>
<style>
td
{
    cursor: default;

}
</style>
<script type="text/javascript">
function myFunction() {
	var result = window
			.confirm("Are you sure to Delete this employee Details");
	if (result) {
		document.removeDepartment.submit();
		return true;
	} else {

		return false;
	}
}


function OpenDialog(id) {
	console.log(id);
        $.ajax({
        	type:"post",
        	url:"${pageContext.request.contextPath}/getEmployeedetailById",
        	data:{"id":id},
        	 success: function (data) { 
        		 var obj=JSON.parse(data);
        		 console.log(obj);
        		 document.getElementById("fname").innerHTML = obj.empname;
        		 document.getElementById("lname").innerHTML = obj.lname;
        		 document.getElementById("emailid").innerHTML = obj.emailid;
        		 document.getElementById("designation").innerHTML = obj.designation;
        		 document.getElementById("skills").innerHTML = obj.skills;
        		 document.getElementById("gender").innerHTML = obj.gender;
        		 document.getElementById("salary").innerHTML = obj.salary;
        		 document.getElementById("depname").innerHTML = obj.depname;
        		 document.getElementById("usertype").innerHTML = obj.userType;
        		 
        		 debugger;
        		 if(obj.userType!="employee")
       			 {
        			 $('#userskill').hide();
        			 $('#usermoney').hide();
        			 $('#usermail').hide();
       			 }
        		 else
       			 {
        			 $('#userskill').show();
        			 $('#usermoney').show();
       			 }
             }
        		 
        });
}

        
</script>
</head>
<body>
	<%@ include file="configure.jsp"%>

	<a href="newemployee"><button type="button" class="btn4 btn4-primary">AddEmployee</button></a>
	<div class="table2">
		<!-- here comes the table  -->
		<h1 style="margin-left: 20%; font-size: 20px; color: green">${msg}</h1>
		<h1 style="margin-left: 20%; font-size: 20px; color: green">${success}</h1>
		<h1 style="margin-left: 20%; font-size: 20px; color: #cc0000">${error}</h1>
		<table id="employeeTable"
			class="compact stripe hover table-border cell-border row-border order-column dt[-head|-body]-left dt-head-left"
			style="width: 100%; background-color:#0059b3; border-color: #dddddd;font-size:11pt;">
			<thead style="border-color: #ffffff; color: white;text-align: center;">
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
					<th>UserType</th>
					<th>Actions</th>
				</tr>
			</thead>
			<tbody style="border-color: #cccccc;">
				<c:forEach items="${list}" var="e">
					<tr>
						<td style="text-align: right;">${e.employeeid}</td>
						<td><a id="firstname" onclick="OpenDialog(${e.empid})" href="#" data-toggle="modal" data-target="#myemployeeModal" 
						style="text-decoration:none;color:#404040;"><b>${e.fname}</b></a></td>
						<td>${e.lname}</td>
						<td>${e.emailid}</td>
						<td>${e.designation}</td>
						<td>${e.skills}</td>
						<td>${e.gender}</td>
						<td style="text-align:right;">${e.salary}</td>
						<td>${e.depname}</td>
						<td >${e.userType}</td>
						<td style="text-align: center;">
						
							<a id="employeelink" href="updateEmployee?id=${e.empid}">
							<i class="material-icons">create</i></a>
							
							<b>|</b> 
							
							<a href="removeEmployee?id=${e.empid}" onclick="return myFunction()">
							<i class="material-icons">delete</i></a>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<div class="modal fade" id="myemployeeModal" role="dialog">
    	<div class="modal-dialog">
    
	      <!-- Modal content-->
	      <div class="modal-content" id="showtable">
	        <div class="modal-header" style="background-color:#0059b3; color:white;">
	          <h4 class="modal-title" style=>Employee Personal Data</h4>
	        </div>
	        <div class="modal-body">
	          <table class="table table-bordered" id="datacontent" style="margin-top:3%;">
					<tr>
						<th>First Name</th>
						<td id="fname"></td>
					</tr>
					<tr>
						<th>Last Name</th>
						<td id="lname"></td>
					</tr>
					<tr >
						<th>Email ID</th>
						<td id="emailid"></td>
					</tr>
					<tr>
						<th>Designation</th>
						<td id="designation"></td>
					</tr>
					<tr id="userskill">
						<th>Skills</th>
						<td id="skills"></td>
					</tr>
					<tr>
						<th>Gender</th>
						<td id="gender"></td>
					</tr>
					
					<tr id="usermoney">
						<th >Salary</th>
						<td id="salary" style="text-align:right;"></td>
					</tr>
					<tr>
						<th>Department</th>
						<td id="depname"></td>
					</tr>
					<tr>
						<th>User Type</th>
						<td id="usertype"></td>
					</tr>
					
			</table>
	        </div>
	        <div class="modal-footer" style="padding:4%;">
	          <button type="button" class="btn5 btn5-primary" data-dismiss="modal">Close</button>
	        </div>
	      </div>
	      
	    </div>
  	</div>

	
	
	
	<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.js"></script>
	<script type="text/javascript" src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
	<script type = "text/javascript">
		$(document).ready(function(){
			$('#employeeTable').DataTable();
		})
		
		$('#employeeTable').dataTable( {
  "lengthMenu": [5,10, 25, 50, 75, 100 ],searching:false, "pageLength": 10,
  columnDefs: [
	   { orderable: false, targets: -1 }
	],
} );
 
	</script>
</body>
</html>