package com.aravind.Employeemanagement.DAO;

import java.util.List;

import com.aravind.Employeemanagement.model.EmployeeDetails;

public interface EmployeeManagementDAO {
	
public List<EmployeeDetails> get();
	
	public EmployeeDetails get(int id);
	
	public boolean getEmployee(EmployeeDetails empDetails);

	public boolean save(EmployeeDetails empDetails);
	
	public boolean update(EmployeeDetails empDetails);
	
	public boolean delete(int id);

}
