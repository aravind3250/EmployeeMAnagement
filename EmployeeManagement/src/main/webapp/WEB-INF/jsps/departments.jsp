<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
<link href="${pageContext.request.contextPath}/resourcefile/css/jquery.dataTables.min.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/resourcefile/css/Menu.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/resourcefile/css/body.css" rel="stylesheet" type="text/css">
<script>
	$(document).ready(function() {
		$("#departmentlink").addClass("active")

	});
	
	$('#departmenttable').css("cursor", "default");
	
</script>
<script>
	
	function myFunction() {
		var result = window
				.confirm("Are you sure to Delete this Department Details");
		if (result) {
			document.removeDepartment.submit();
			return true;
		} else {

			return false;
		}
	}
</script>
<style>
td
{
    cursor: default;

}
</style>
</head>
<body>
<%
	if(session.getAttribute("username")!=null)
	{
		Cookie[] cookies=request.getCookies();
		String sessionId=null;
		if(cookies!=null)
		{
			for(Cookie cookie:cookies)
			{
				sessionId=cookie.getValue();
			}
		}
	}
%>
	<%@ include file="configure.jsp"%><br>	
<%-- 	<c:out value="${pageContext.session.id}"/> --%>
	<h4 style="margin-left:65%;color:green;">Session Id:<%=session.getId() %></h4>
	<a href="newDepartment"><button type="button" class="btn3 btn3-primary">Add Department</button></a>

	<!-- here comes the table  -->
	<div class="table1">
		<h1 style="margin-left: 20%; font-size: 20px; color: green">${success}</h1>
		<h1 style="margin-left: 20%; font-size: 20px; color: #cc0000">${error}</h1>
		<table id="departmenttable"
			class="sortable  compact stripe hover table-border cell-border row-border order-column dt[-head|-body]-left dt-head-left" 
			style="width: 100%;background-color: #0059b3; border-color: #dddddd;cursor:default;">
			<thead style="color:white;text-align: center">
				<tr>
					<th>Department Name</th>
					<th>Department Description</th>
					<th>Department Status</th>
					<th>Action</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${list}" var="d">
					<tr>
						<td>${d.dName}</td>
						<td>${d.description}</td>
						<td>${d.status}</td>
						<td style="text-align: center;">
						
							<a id="departmentlink" href="updatedepartment.html?id=${d.id}">
							<i class="material-icons">create</i></a>
							
							<b>|</b> 
							
							<a href="removeDepartment?id=${d.id}" onclick="return myFunction()">
							<i class="material-icons">delete</i></a>
						</td>
					</tr>
				</c:forEach>
			<tbody>
		</table>
	</div>
	<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.js"></script>
	<script type="text/javascript" src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
		<script>
		$(document).ready(function(){
			$('#departmenttable').DataTable();
		})
	
		
			
		
		
		$('#departmenttable').dataTable( {
  "lengthMenu": [5,10, 20, 50, 75, 100 ],searching:false, "pageLength": 10,
  columnDefs: [
	   { orderable: false, targets: -1 }
	],
  
} );
 
	</script>
</body>
</html>