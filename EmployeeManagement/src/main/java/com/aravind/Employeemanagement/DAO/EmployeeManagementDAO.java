package com.aravind.Employeemanagement.DAO;

import java.util.List;

import com.aravind.Employeemanagement.model.Departmentempsalbean;
import com.aravind.Employeemanagement.model.EmployeeDepartment;
import com.aravind.Employeemanagement.model.EmployeeDetails;
import com.aravind.Employeemanagement.model.UserDetails;

public interface EmployeeManagementDAO {
	
	public List<EmployeeDetails> get();
	
	public List<EmployeeDepartment> getDepartment();
	
	public EmployeeDetails get(int id);
	
	public List<EmployeeDetails> getdetails();
	
	public EmployeeDepartment getDepartment(int id);
	
	public boolean getUser(UserDetails userdetails);
	
	public boolean save(UserDetails userdetails);

	public boolean save(EmployeeDetails empDetails);
	
	public boolean save(EmployeeDepartment departmentdetails);
	
	public boolean update(EmployeeDetails empDetails);
	
	public boolean update(EmployeeDepartment departmentdetails);
	
	public boolean deleteEmployee(int id);
	
	public boolean deleteDepartment(int id);

}
