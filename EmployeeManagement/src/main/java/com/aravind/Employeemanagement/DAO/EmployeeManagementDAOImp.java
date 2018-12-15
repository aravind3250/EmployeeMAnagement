package com.aravind.Employeemanagement.DAO;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.aravind.Employeemanagement.model.EmployeeDetails;
import com.aravind.Employeemanagement.model.UserDetails;

@Repository
public class EmployeeManagementDAOImp implements EmployeeManagementDAO {

	@Autowired
	SessionFactory sessionfactory;
	@Override
	public List<EmployeeDetails> get() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public EmployeeDetails get(int id) {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public boolean getEmployee(EmployeeDetails empDetails) 
	{
		
		String email=empDetails.getEmailid();
		String password=empDetails.getPassword();
		
		try {
				Query<EmployeeDetails> result =sessionfactory.getCurrentSession().createQuery("from EmployeeDetails where emailid=:email and password=:password");
				result.setParameter("email", email);
				result.setParameter("password", password);
				if(result.uniqueResult()!=null)
				{
					return true;
				}
		}catch (HibernateException e) {
			e.printStackTrace();
		}
			return false;
	}

	@Override
	public boolean save(EmployeeDetails empDetails) {
		boolean flag = false;
		try {
			sessionfactory.getCurrentSession().save(empDetails);
			flag = true;
		}catch(HibernateException e) {
			e.printStackTrace();
		}
		return flag;
	}

	@Override
	public boolean update(EmployeeDetails empDetails) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean delete(int id) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean save(UserDetails userdetails) {
		boolean flag = false;
		try {
			sessionfactory.getCurrentSession().save(userdetails);
			flag = true;
		}catch(HibernateException e) {
			e.printStackTrace();
		}
		return flag;
	}

	
}
