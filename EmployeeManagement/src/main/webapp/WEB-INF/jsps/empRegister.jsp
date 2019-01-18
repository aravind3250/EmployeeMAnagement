<%@ taglib uri="http://www.springframework.org/tags/form" prefix="f"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
		$("#employeelink").addClass("active")

	});
	
	
	
	/****
	********                                                     ************
	********  Finction to show OR hide the input field based     ************
	********  on the USER TYPE from select field                 ************                           
	       													     ************
	*************       			*******/
	
	$(document).ready(function(){
		
		var resultValue= $('#showorhide').val();
		if(resultValue=="select")
		{
			$('#showorhide').on('change', function(){
				if(this.value=='employee')
				{
					
					$('#empskills').show();
					$('#salary').show();
				}
				else
				{
					$('#empskills').hide()
					$('#salary').hide();
					
				}
			})
		}
		else
		{

			if(resultValue=="employee")
			{
				$('#empskills').show();
				$('#salary').show();
				$('#showorhide').on('change', function(){
					if(this.value=='employee')
					{
						
						$('#empskills').show();
						$('#salary').show();
					}
					else
					{
						$('#empskills').hide()
						$('#salary').hide();
						
					}
				})
			}
			else
			{
				$('#showorhide').on('change', function(){
				if(this.value=='employee')
				{
					
					$('#empskills').show();
					$('#salary').show();
				}
				else
				{
					$('#empskills').hide()
					$('#salary').hide();
					
				}
			})
				
			}
			
		}
	})

	function validateform(){
	var employeetype=$('#showorhide').val();
	var fname=$('#firstname').val();
	var lname=$('#lastname').val();
	var employeeid=$('#employeeid').val();
	var emailid=$('#emailid').val();
	var designation=$('#designation').val();
	var employeeskills1=$('#java').prop('checked');
	var employeeskills2=$('#spring').prop('checked');
	var employeeskills3=$('#hibernate').prop('checked');
	var employeeskills4=$('#struts').prop('checked');
	
	var employeegender1=$('#male').prop('checked');
	var employeegender2=$('#female').prop('checked');
	var employeepassword=$('#password').val();
	var employeesalary=$('#employeefund').val();
	var employeedepartment=$('#departmentname').val();
	

	
	debugger;
	if(employeetype=="select")
	{
		alert("select proper user");
		return false;
	}
	else if(employeetype=="employee")
	{
		if(fname=="")
		{
			alert("First Name should not be empty");
			return false
		}
		if(lname=="")
		{
			alert("Last Name should not be empty");
			return false;
		}
		if(employeeid==null)
		{
			alert("Emloyeeid should not be empty");
			return false;
		}
		else if(!($.isNumeric(employeeid)))
		{
			alert("invalid Entry ! Employee-Id Should be a Numbers")
			return false;
		}
		if(emailid=="")
		{
			alert("Email should not be empty");
			return false;
		}
		if(designation=="select")
		{
			alert("Kindly select the Designation");
			return false;
		}
		if(employeeskills1==false && employeeskills2==false && employeeskills3==false && employeeskills4==false)
		{
			alert("Emloyee Skills should not be empty");
			return false;
		}
		if(employeegender1==false && employeegender2==false)
		{	
			alert("Kindly Select the Gender");
			return false;
		}
		if(employeepassword=="")
		{
			alert("Emloyee password should not be empty");
			return false;
		}
		
		if(employeesalary=="")
		{
			alert("salary should not be Emplty");
			return false;
			
		}
		else if(employeesalary==0)
		{
			alert("Kindly Provide Him/Her a salary !!should not be Zero")
			return false;
		}
		else if(!($.isNumeric(employeesalary)))
		{
			alert("invalid Entery ! salary should be in Numbers")
			return false;
		}
			
		if(employeedepartment=="")
		{
			alert("Kindly select the Department He/She belong to");
			return false;
		}
		
	}
	else if(employeetype=="admin")
	{
		if(fname=="")
		{
			alert("First Name should not be empty");
			return false;
		}
		if(lname=="")
		{
			alert("Last Name should not be empty");
			return false;
		}
		if(employeeid=="")
		{
			alert("Emloyeeid should not be empty");
			return false;
		}
		else if(!($.isNumeric(employeeid)))
		{
			alert("invalid Entry ! Employee-Id Should be a Numbers")
		}
		if(emailid=="")
		{
			alert("Email should not be empty");
			return false;
		}
		if(designation=="select")
		{
			alert("Kindly select the Designation");
			return false;
		}
		if(employeegender1==false && employeegender2==false)
		{	
			alert("Kindly Select the Gender");
			return false;
		}
		if(employeepassword=="")
		{
			alert("Emloyee password should not be empty");
			return false;
		}
		if(employeedepartment=="")
		{
			alert("Kindly select the Department He/She belong to");
			return false;
		}
	}
}
	
function resetform(){
	debugger;
	$('#showorhide').val('select');
	$('#firstname').val('');
	$('#lastname').val('');
	$('#employeeid').val('');
	$('#emailid').val('');
	$('#designation').val('select');
	$('#java').prop('checked',false);
	$('#spring').prop('checked',false);
	$('#hibernate').prop('checked',false);
	$('#struts').prop('checked',false);
	$('#male').prop('checked',false);
	$('#female').prop('checked',false);
	$('#employeefund').val('');
	$('#password').val('');
	$('#employeefund').val('');
	$('#departmentname').val('select');
	
	
}

</script>
</head>
<body>
	<%@ include file="configure.jsp"%><br>
	<div class="divaddemployee">
		<br> <a href="employeeDetails"><button class="empRegisterbtnback" type="submit">back</button></a><br>
		<f:form action="addemployee" modelAttribute="employeedetails" method="post" onsubmit="return validateform()">
			<h1 align="left" style="color: #00004d; margin-top:-15px;">EmployeeDetails</h1>
			
			<f:select id="showorhide" class="employeeRegister-select" path="userType">
				<f:option value="select">Select Employee Type</f:option>
				<f:option value="admin">Admin</f:option>
				<f:option value="employee">Employee</f:option>
			</f:select>
			
			<f:input id="firstname" class="employeeRegister-input" path="fname" type="text"
				placeholder="Enter First Name"  />
				
			<f:input id="lastname" class="employeeRegister-input" path="lname" type="text"
				placeholder="Enter Last Name"  />
				
			<f:input id="employeeid" class="employeeRegister-input" path="employeeid" type="text"
				placeholder="Enter Employee-ID" />
				
			<f:input id="emailid" class="employeeRegister-input" path="emailid" type="email"
				placeholder="Enter E-mail" />
				
			<f:select id="designation" class="employeeRegister-select" path="designation"
				placeholder="designation" >
				<f:option value="select">Select Designation</f:option>
				<f:option value="Software Engineer">Software Engineer</f:option>
				<f:option value="Trainee">Trainee</f:option>
				<f:option value="Associate Software Engineer">Associate Software Engineer</f:option>
				<f:option value="Senior Software Engineer">Senior Software Engineer</f:option>
				<f:option value="Team Lead">Team Lead</f:option>
				<f:option value="Admin">Administrator</f:option>
			</f:select>
			<div id="empskills" style="display:none;">
			<br>
			<f:checkbox id="java" class="employeeRegister-checkbox" path="skills" value="Java" />Java 
			<f:checkbox id="spring" path="skills" value="Spring" />Spring
			<f:checkbox id="hibernate" path="skills" value="Hibernate" />HiberNate
			<f:checkbox id="struts" path="skills" value="Struts" />Struts<br />
			<br>
			</div>
			<f:radiobutton id="male" path="gender" value="Male" />Male<br />
			<f:radiobutton id="female" path="gender" value="Female" />Female<br />
			<br>


			<f:input id="password" class="employeeRegister-input" path="password" type="password" placeholder="Employee password" />
			
			<div id="salary" style="display:none;">	
			<f:input id="employeefund" class="employeeRegister-input" path="salary" type="text" placeholder="Employee salary"/>
			</div>
			
			<f:select id="departmentname" class="employeeRegister-select" path="departmentid" placeholder="Department">
				<f:option value="">Select Department</f:option>
				<c:forEach var="list" items="${depNameslist}">
					<f:option value="${list.key}">${list.value}</f:option>
				</c:forEach>
			</f:select>

			<!-- following are the hidden fields -->
			<f:hidden path="empid" />
			<input type="hidden" value="${employeedetails.skills}" id="skills" />
			<br>
			<c:choose>
			<c:when test="${employeedetails.employeeid!=null }">
			<f:button class="empRegisterbtn5"> Edit Details</f:button>
			</c:when>
			<c:otherwise>
			<f:button class="empRegisterbtn5"> Add Details</f:button>
			</c:otherwise>
			</c:choose>
			
			<f:button class="empRegisterbtn6" type="button" onclick="resetform()">Reset</f:button>
			<br>
			<br>
		</f:form>
	</div>
	<br>
	<br>
</body>
<script type="text/javascript">
		$(document).ready(function() {
			var skills = $("#skills").val().split(",");
			var $checkboxes = $("input[type=checkbox]");
			$checkboxes.each(function(idx, element) {
				if (skills.indexOf(element.value) != -1) {
					element.setAttribute("checked", "checked");
					$("#skills").val("");
				} else {
					element.removeAttribute("checked");
				}
			});

		})
	</script>
</html>