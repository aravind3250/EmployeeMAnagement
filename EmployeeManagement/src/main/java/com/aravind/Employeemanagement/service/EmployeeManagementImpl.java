package com.aravind.Employeemanagement.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.aravind.Employeemanagement.DAO.EmployeeManagementDAO;
import com.aravind.Employeemanagement.model.EmployeeDetails;

@Service
public class EmployeeManagementImpl implements EmployeeManagementService {

	@Autowired
	EmployeeManagementDAO emloyeemanagementDAO;
	
	@Transactional
	@Override
	public List<EmployeeDetails> getEmployee() {
		// TODO Auto-generated method stub
		return emloyeemanagementDAO.get();
	}

	@Transactional
	@Override
	public EmployeeDetails getEmployee(int id) {
		// TODO Auto-generated method stub
		return emloyeemanagementDAO.get(id);
	}
	@Transactional
	@Override
	public boolean getEmployee(EmployeeDetails employeeDetails) {
		// TODO Auto-generated method stub
		return emloyeemanagementDAO.getEmployee(employeeDetails);
	}
	
	@Transactional
	@Override
	public boolean save(EmployeeDetails empdetails) {
		// TODO Auto-generated method stub
		return emloyeemanagementDAO.save(empdetails);
	}

	@Transactional
	@Override
	public boolean update(EmployeeDetails empdetails) {
		// TODO Auto-generated method stub
		return emloyeemanagementDAO.update(empdetails);
	}

	@Transactional
	@Override
	public boolean delete(int id) {
		// TODO Auto-generated method stub
		return emloyeemanagementDAO.delete(id);
	}

	

}
