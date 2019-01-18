<%@ taglib uri="http://www.springframework.org/tags/form" prefix="f"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css"/>
<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
<link href="${pageContext.request.contextPath}/resourcefile/css/Menu.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/resourcefile/css/body.css" rel="stylesheet" type="text/css">
<script type="text/javascript">

$(document).ready(function() {
	$("#departmentlink").addClass("active")

});

function validate()
{
	var departmentname=$('#depname').val();
	var departmentdescription=$('#depdescription').val();
	var departmentstatus1=$('#active').prop('checked');
	var departmentstatus2=$('#inactive').prop('checked');

	if(departmentname=="")
	{
		alert("Department Name Should not be empty");
		return false;
	}
	if(departmentdescription=="")
	{
		alert("Department Description Should not be empty");
		return false;
	}
	if(departmentstatus1==false && departmentstatus2==false )
	{
		alert("Kindly select Department Status");
		return false;
	}
}

function resetform(){
	debugger;
	$('#depname').val('');
	$('#depdescription').val('');
	$('#active').prop('checked',false);
	$('#inactive').prop('checked',false);
	
	
	
}
</script>
</head>
<body>
	<%@ include file="configure.jsp"%><br>
	<div class="formdiv1">
		<a href="departmentDetails"><button class="btnback" type="submit">back</button></a>
		<f:form action="addDepartment" modelAttribute="departmentdetails"
			method="post" onsubmit="return validate()">
			<h1 align="left" style="color: #00004d">Department Details</h1>
			<br>
			<f:input id="depname" class="depRegister-input" path="dName" type="text" placeholder="Department Name" />
			
			<f:textarea id="depdescription" class="depRegister-textarea" path="description" rows="5" cols="50"
				placeholder="Department Description" ></f:textarea>
			<br>

			<f:radiobutton id="active" path="status" value="Active" />Active<br />
			<f:radiobutton id="inactive" path="status" value="InActive" />InActive<br />
			<br>

			<!-- following are the hidden fields -->
			<f:hidden path="id" />
			<c:choose>
			<c:when test="${departmentdetails.status!=null}">
				<f:button class="btnadddetails"> Edit Details</f:button>
			</c:when>
			<c:otherwise>
				<f:button class="btnadddetails"> Add Details</f:button>
			</c:otherwise>
			</c:choose>
			<f:button class="btnreset" type="button" onclick="resetform()">Reset</f:button>
			<br>
			<br>
			<br>
		</f:form>
	</div>
</body>
</html>