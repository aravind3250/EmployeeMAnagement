package com.aravind.Employeemanagement.service;

import java.util.List;

import com.aravind.Employeemanagement.model.EmployeeDetails;


public interface EmployeeManagementService {
	
public List<EmployeeDetails> getEmployee();
	
	public EmployeeDetails getEmployee(int id);
	
	public boolean getEmployee(EmployeeDetails employeeDetails);
	
	public boolean save(EmployeeDetails empdetails);
	
	public boolean update(EmployeeDetails empdetails);
	
	public boolean delete(int id);

}
