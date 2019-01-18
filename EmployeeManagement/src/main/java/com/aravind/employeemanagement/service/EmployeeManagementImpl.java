
package com.aravind.employeemanagement.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aravind.employeemanagement.DAO.EmployeeManagementDAO;
import com.aravind.employeemanagement.model.DepartmentWiseEmpSalar;
import com.aravind.employeemanagement.model.EmployeeDepartment;
import com.aravind.employeemanagement.model.EmployeeDetails;
import com.aravind.employeemanagement.model.UserDetails;

@Service
public class EmployeeManagementImpl implements EmployeeManagementService {

	@Autowired
	EmployeeManagementDAO emloyeemanagementDAO;

	@Override
	public List<EmployeeDetails> getEmployee() {
		return emloyeemanagementDAO.get();
	}

	@Override
	public List<DepartmentWiseEmpSalar> getdetails() {
		return emloyeemanagementDAO.getdetails();
	}

	@Override
	public List<EmployeeDepartment> getDepartment() {
		return emloyeemanagementDAO.getDepartment();
	}

	@Override
	public EmployeeDetails getEmployee(int id) {
		return emloyeemanagementDAO.get(id);
	}
	
	@Override
	public EmployeeDetails getEmployee(String emailid) {
		return emloyeemanagementDAO.get(emailid);
	}
	
	public EmployeeDetails getEmployee(EmployeeDetails employeedetails) {
		return emloyeemanagementDAO.get(employeedetails);
	}

	@Override
	public EmployeeDepartment getDepartment(int id) {
		return emloyeemanagementDAO.getDepartment(id);
	}

	@Override
	public boolean save(EmployeeDetails empdetails) {
		return emloyeemanagementDAO.save(empdetails);
	}

	@Override
	public boolean update(EmployeeDetails empdetails) {
		return emloyeemanagementDAO.update(empdetails);
	}

	@Override
	public boolean update(EmployeeDepartment departmentdetails) {
		return emloyeemanagementDAO.update(departmentdetails);
	}

	@Override
	public boolean deleteEmployee(int id) {
		return emloyeemanagementDAO.deleteEmployee(id);
	}

	@Override
	public boolean deleteDepartment(int id) {
		return emloyeemanagementDAO.deleteDepartment(id);
	}

	@Override
	public boolean save(UserDetails userdetails) {
		return emloyeemanagementDAO.save(userdetails);
	}

	@Override
	public boolean save(EmployeeDepartment departmentdetails) {
		return emloyeemanagementDAO.save(departmentdetails);
	}

	@Override
	public UserDetails getUser(UserDetails userdetails) {
		return emloyeemanagementDAO.getUser(userdetails);
	}

	@Override
	public Map<Integer, String> empDepartmentNames() {
		Map<Integer, String> employeeDepartmentdetails = new HashMap<>();
		List<EmployeeDepartment> ed = emloyeemanagementDAO.getDepartment();
		for (EmployeeDepartment employeeDepartment : ed) {
			Integer departmentId = employeeDepartment.getId();
			String departmentName = employeeDepartment.getdName();
			employeeDepartmentdetails.put(departmentId, departmentName);
		}
		return employeeDepartmentdetails;
	}

}
