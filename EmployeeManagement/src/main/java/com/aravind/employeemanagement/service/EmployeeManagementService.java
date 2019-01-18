package com.aravind.employeemanagement.service;

import java.util.List;
import java.util.Map;

import com.aravind.employeemanagement.model.DepartmentWiseEmpSalar;
import com.aravind.employeemanagement.model.EmployeeDepartment;
import com.aravind.employeemanagement.model.EmployeeDetails;
import com.aravind.employeemanagement.model.UserDetails;

public interface EmployeeManagementService {

	public List<EmployeeDetails> getEmployee();

	public List<EmployeeDepartment> getDepartment();

	public List<DepartmentWiseEmpSalar> getdetails();

	public boolean save(UserDetails userdetails);

	public EmployeeDetails getEmployee(int id);
	
	public EmployeeDetails getEmployee(String emailid);
	
	public EmployeeDetails getEmployee(EmployeeDetails employeedetails);

	public EmployeeDepartment getDepartment(int id);

	public UserDetails getUser(UserDetails userdetails);

	public boolean save(EmployeeDepartment departmentdetails);

	public boolean save(EmployeeDetails empdetails);

	public boolean update(EmployeeDetails empdetails);

	public boolean update(EmployeeDepartment departmentdetails);

	public boolean deleteEmployee(int id);

	public boolean deleteDepartment(int id);

	public Map<Integer, String> empDepartmentNames();
}
