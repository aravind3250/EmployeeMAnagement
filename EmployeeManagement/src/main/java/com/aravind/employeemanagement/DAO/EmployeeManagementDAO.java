package com.aravind.employeemanagement.DAO;

import java.util.List;

import com.aravind.employeemanagement.model.DepartmentWiseEmpSalar;
import com.aravind.employeemanagement.model.EmployeeDepartment;
import com.aravind.employeemanagement.model.EmployeeDetails;
import com.aravind.employeemanagement.model.UserDetails;

public interface EmployeeManagementDAO {

	public List<EmployeeDetails> get();

	public List<EmployeeDepartment> getDepartment();

	public EmployeeDetails get(int id);
	
	public EmployeeDetails get(String emailid);
	
	public EmployeeDetails get(EmployeeDetails employeedetails);

	public List<DepartmentWiseEmpSalar> getdetails();

	public EmployeeDepartment getDepartment(int id);

	public UserDetails getUser(UserDetails userdetails);

	public boolean save(UserDetails userdetails);

	public boolean save(EmployeeDetails empDetails);

	public boolean save(EmployeeDepartment departmentdetails);

	public boolean update(EmployeeDetails empDetails);

	public boolean update(EmployeeDepartment departmentdetails);

	public boolean deleteEmployee(int id);

	public boolean deleteDepartment(int id);

}
