package com.aravind.Employeemanagement.DAO;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.aravind.Employeemanagement.model.Departmentempsalbean;
import com.aravind.Employeemanagement.model.EmployeeDepartment;
import com.aravind.Employeemanagement.model.EmployeeDetails;
import com.aravind.Employeemanagement.model.UserDetails;

@Repository
public class EmployeeManagementDAOImp implements EmployeeManagementDAO {

	@Autowired
	SessionFactory sessionfactory;
	
	@Override
	public List<EmployeeDetails> get() {
		List<EmployeeDetails> list = null;
		try {
			Query<EmployeeDetails> query = sessionfactory.getCurrentSession().createQuery("from EmployeeDetails ");
			list = query.getResultList();
		}catch(HibernateException e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<EmployeeDepartment> getDepartment() {
		List<EmployeeDepartment> list=null;
		try {
				Query<EmployeeDepartment> query=sessionfactory.getCurrentSession().createQuery("from EmployeeDepartment ");
				list=query.getResultList();
				System.out.println("in DAO department featch method");
				System.out.println(list.toString());
			
		}catch(HibernateException e)
		{
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public EmployeeDetails get(int id) {
		Session session = sessionfactory.getCurrentSession();
		EmployeeDetails emp = null;
		try {
			emp = (EmployeeDetails)session.get(EmployeeDetails.class, id);
		}catch(HibernateException e) {
			e.printStackTrace();
		}
		return emp;
	}
	
	@Override
	public EmployeeDepartment getDepartment(int id) {
		Session session = sessionfactory.getCurrentSession();
		EmployeeDepartment empdepartment = null;
		try {
				empdepartment = (EmployeeDepartment)session.get(EmployeeDepartment.class, id);
		}catch(HibernateException e) {
			e.printStackTrace();
		}
		return empdepartment;
	}
	
	@Override
	public boolean getUser(UserDetails userdetails) 
	{
		
		String email=userdetails.getEmailid();
		String password=userdetails.getpassword();
		
		try {
				Query<EmployeeDetails> result =sessionfactory.getCurrentSession().createQuery("from UserDetails where emailid=:email and password=:password");
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
		Integer empid=empDetails.getEmployeeid();
		String email=empDetails.getEmailid();
		
		try {
			Query<EmployeeDetails> result =sessionfactory.getCurrentSession().createQuery("from EmployeeDetails where employeeid=:empid and emailid=:email");
			result.setParameter("empid", empid);
			result.setParameter("email", email);
			if(result.list().size()>0)
			{
				return false;
			}else {
				
			sessionfactory.getCurrentSession().save(empDetails);
			flag = true;
			}
		}catch(HibernateException e) {
			e.printStackTrace();
		}
		return flag;
	}

	@Override
	public boolean save(EmployeeDepartment departmentdetails) {
		boolean flag = false;
		try {
			sessionfactory.getCurrentSession().save(departmentdetails);
			flag = true;
		}catch(HibernateException e) {
			e.printStackTrace();
		}
		return flag;
	}
	
	@Override
	public boolean update(EmployeeDetails empDetails) {
		boolean flag = false;
		try {
			sessionfactory.getCurrentSession().update(empDetails);
			flag = true;
		}catch(HibernateException e) {
			e.printStackTrace();
		}
		return flag;
	}
	
	@Override
	public boolean update(EmployeeDepartment departmentdetails) {
		boolean flag = false;
		try {
			sessionfactory.getCurrentSession().update(departmentdetails);
			flag = true;
		}catch(HibernateException e) {
			e.printStackTrace();
		}
		return flag;
	}
	@Override
	public boolean deleteEmployee(int id) {
		Session session = sessionfactory.getCurrentSession();
		boolean flag = false;
		try {
			EmployeeDetails emp = (EmployeeDetails)session.get(EmployeeDetails.class, id);
			session.delete(emp);
			flag = true;
		}catch(HibernateException e) {
			e.printStackTrace();
		}
		return flag;
	}
	
	
	@Override
	public boolean deleteDepartment(int id) {
		Session session = sessionfactory.getCurrentSession();
		boolean flag = false;
		try {
			EmployeeDepartment empdepartment = (EmployeeDepartment)session.get(EmployeeDepartment.class, id);
			session.delete(empdepartment);
			flag = true;
		}catch(HibernateException e) {
			e.printStackTrace();
		}
		return flag;
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

	@Override
	public List<EmployeeDetails> getdetails() {
		List<EmployeeDetails> finalList = new ArrayList<EmployeeDetails>();
		DecimalFormat df2 = new DecimalFormat(".##");
		try {
			List<Object[]> list=sessionfactory.getCurrentSession().createNativeQuery("select e.department, sum(e.salary), count(e.employeeid) from employee e group by e.department").list();
			EmployeeDetails eNew = null;
			
			for(Object[] row : list) {
				
				eNew = new EmployeeDetails();
				eNew.setDepartment(row[0].toString());
				eNew.setSalary(Double.parseDouble(row[1].toString()));
				eNew.setEmployeeid(Integer.parseInt(row[2].toString()));
				Double avgsal=(eNew.getSalary()/eNew.getEmployeeid());
/*				Double finalavgsal=df2.for;*/
				eNew.setAvgsalary(avgsal);
				finalList.add(eNew);
			}
		}catch(HibernateException e)
		{
			e.printStackTrace();
		}
		return finalList;
	}
	
	
	
	
}
