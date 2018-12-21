
package com.aravind.Employeemanagement.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.aravind.Employeemanagement.DAO.EmployeeManagementDAO;
import com.aravind.Employeemanagement.model.Departmentempsalbean;
import com.aravind.Employeemanagement.model.EmployeeDepartment;
import com.aravind.Employeemanagement.model.EmployeeDetails;
import com.aravind.Employeemanagement.model.UserDetails;

@Service
public class EmployeeManagementImpl implements EmployeeManagementService {

	@Autowired
	EmployeeManagementDAO emloyeemanagementDAO;
	
	@Transactional
	@Override
	public List<EmployeeDetails> getEmployee() {
		return emloyeemanagementDAO.get();
	}
	
	@Transactional
	@Override
	public List<EmployeeDetails> getdetails() {
		return emloyeemanagementDAO.getdetails();
	}	
	
	@Transactional
	@Override
	public List<EmployeeDepartment> getDepartment() {
		return emloyeemanagementDAO.getDepartment();
	}
	
	@Transactional
	@Override
	public EmployeeDetails getEmployee(int id) {
		return emloyeemanagementDAO.get(id);
	}
	
	@Transactional
	@Override
	public EmployeeDepartment getDepartment(int id) {
		return emloyeemanagementDAO.getDepartment(id);
	}
		
	@Transactional
	@Override
	public boolean save(EmployeeDetails empdetails) {
		return emloyeemanagementDAO.save(empdetails);
	}

	@Transactional
	@Override
	public boolean update(EmployeeDetails empdetails) {
		return emloyeemanagementDAO.update(empdetails);
	}
	
	@Transactional
	@Override
	public boolean update(EmployeeDepartment departmentdetails) {
		// TODO Auto-generated method stub
		return emloyeemanagementDAO.update(departmentdetails);
	}
	
	@Transactional
	@Override
	public boolean deleteEmployee(int id) {
		return emloyeemanagementDAO.deleteEmployee(id);
	}
	
	@Transactional
	@Override
	public boolean deleteDepartment(int id) {
		return emloyeemanagementDAO.deleteDepartment(id);
	}

	@Transactional
	@Override
	public boolean save(UserDetails userdetails) {
		return emloyeemanagementDAO.save(userdetails);
	}

	@Transactional
	@Override
	public boolean save(EmployeeDepartment departmentdetails) {
		return emloyeemanagementDAO.save(departmentdetails);
	}

	@Transactional
	@Override
	public boolean getUser(UserDetails userdetails) {
		// TODO Auto-generated method stub
		return emloyeemanagementDAO.getUser(userdetails);
	}

	@Transactional
	@Override
	public List<String> empDepartmentNames() {
		List<EmployeeDepartment> ed=emloyeemanagementDAO.getDepartment();
		List<String> depNames=new ArrayList<String>();
		for(EmployeeDepartment ED: ed)
		{
			depNames.add(ED.getdName());
		}
		return depNames;
	}

}
