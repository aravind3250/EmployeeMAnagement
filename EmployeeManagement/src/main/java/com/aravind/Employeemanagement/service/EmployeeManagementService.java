package com.aravind.Employeemanagement.service;

import java.util.List;

import com.aravind.Employeemanagement.model.Departmentempsalbean;
import com.aravind.Employeemanagement.model.EmployeeDepartment;
import com.aravind.Employeemanagement.model.EmployeeDetails;
import com.aravind.Employeemanagement.model.UserDetails;


public interface EmployeeManagementService {
	
	public List<EmployeeDetails> getEmployee();
	
	public List<EmployeeDepartment> getDepartment();
	
	public List<EmployeeDetails> getdetails();
	
	public boolean save(UserDetails userdetails);

	public EmployeeDetails getEmployee(int id);
	
	public EmployeeDepartment getDepartment(int id);
	
	public boolean getUser(UserDetails userdetails);
	
	public boolean save(EmployeeDepartment departmentdetails);
	
	public boolean save(EmployeeDetails empdetails);
	
	public boolean update(EmployeeDetails empdetails);
	
	public boolean update(EmployeeDepartment departmentdetails);
	
	public boolean deleteEmployee(int id);
	
	public boolean deleteDepartment(int id);
	
	public List<String> empDepartmentNames();
}
