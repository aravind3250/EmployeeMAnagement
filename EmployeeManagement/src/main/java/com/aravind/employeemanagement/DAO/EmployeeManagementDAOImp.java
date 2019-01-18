package com.aravind.employeemanagement.DAO;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.hibernate.HibernateException;
import org.springframework.stereotype.Repository;

import com.aravind.employeemanagement.model.DepartmentWiseEmpSalar;
import com.aravind.employeemanagement.model.EmployeeDepartment;
import com.aravind.employeemanagement.model.EmployeeDetails;
import com.aravind.employeemanagement.model.UserDetails;
import com.aravind.employeemanagement.service.EmployeeManagementUtil;

@Repository
public class EmployeeManagementDAOImp implements EmployeeManagementDAO {

	@Override
	public List<EmployeeDetails> get() {
		List<EmployeeDetails> list = null;
		SqlSession sqlSession = EmployeeManagementUtil.getSqlSessionFactory().openSession();
		try {
			list = sqlSession.selectList("getEmployeetList");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {

			sqlSession.commit();
			sqlSession.close();
		}
		return list;
	}

	@Override
	public List<EmployeeDepartment> getDepartment() {
		List<EmployeeDepartment> list = null;
		SqlSession sqlSession = EmployeeManagementUtil.getSqlSessionFactory().openSession();
		try {
			list = sqlSession.selectList("getDepartmentList");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.commit();
			sqlSession.close();
		}
		return list;
	}

	@Override
	public EmployeeDetails get(int id) {
		EmployeeDetails oneEmployeeResult = null;
		SqlSession sqlSession = EmployeeManagementUtil.getSqlSessionFactory().openSession();
		try {
			oneEmployeeResult = sqlSession.selectOne("getOneEmployee", id);

		} catch (HibernateException e) {
			e.printStackTrace();
		} finally {

			sqlSession.close();
		}
		return oneEmployeeResult;
	}
	
	@Override
	public EmployeeDetails get(String emailid) {
		EmployeeDetails oneEmployeeResult = null;
		SqlSession sqlSession = EmployeeManagementUtil.getSqlSessionFactory().openSession();
		try {
			oneEmployeeResult = sqlSession.selectOne("getEmployeeonEmailid", emailid);

		} catch (HibernateException e) {
			e.printStackTrace();
		} finally {

			sqlSession.close();
		}
		return oneEmployeeResult;
	}
	
	public EmployeeDetails get(EmployeeDetails employeedetails) {
		
		EmployeeDetails oneEmployeeResult=null;
		String emailid=employeedetails.getEmailid();
		String password=employeedetails.getPassword();
		Map<String, String> employelogin = new HashMap<>();
		employelogin.put("emailid", emailid);
		employelogin.put("password", password);
		SqlSession sqlSession = EmployeeManagementUtil.getSqlSessionFactory().openSession();
		try {
			oneEmployeeResult = sqlSession.selectOne("getEmployee", employelogin);

		} catch (HibernateException e) {
			e.printStackTrace();
		} finally {
			sqlSession.commit();
			sqlSession.close();
		}
		return oneEmployeeResult;
	}

	@Override
	public EmployeeDepartment getDepartment(int id) {
		EmployeeDepartment oneDepartment = null;
		SqlSession sqlSession = EmployeeManagementUtil.getSqlSessionFactory().openSession();
		try {
			oneDepartment = sqlSession.selectOne("getOneDepartment", id);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {

			sqlSession.close();
		}
		return oneDepartment;
	}

	@Override
	public UserDetails getUser(UserDetails userdetails) {
		UserDetails user = null;
		String email = userdetails.getEmailid();
		String password = userdetails.getPassword();
		Map<String, String> userLogin = new HashMap<>();
		userLogin.put("username", email);
		userLogin.put("password", password);
		SqlSession sqlSession = EmployeeManagementUtil.getSqlSessionFactory().openSession();
		try {

			user = sqlSession.selectOne("getUser", userLogin);

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.commit();
			sqlSession.close();
		}
		return user;
	}

	@Override
	public boolean save(EmployeeDetails empDetails) {
		boolean flag = false;
		Map<String, Object> checkEmployeeMap = new HashMap<>();
		Integer empid = empDetails.getEmployeeid();
		String email = empDetails.getEmailid();
		if(empDetails.getSalary()==null)
		{
			empDetails.setSalary(0);
		}
		if(empDetails.getSkills()==null)
		{
			empDetails.setSkills("null");
		}
		System.out.println(empDetails);
		checkEmployeeMap.put("empid", empid);
		checkEmployeeMap.put("email", email);

		SqlSession sqlSession = EmployeeManagementUtil.getSqlSessionFactory().openSession();
		try {
			EmployeeDetails result = sqlSession.selectOne("checkEmployee", checkEmployeeMap);
			if (result != null) {
				return false;
			} else {
				int insertResult = sqlSession.insert("insertEmployeeDetails", empDetails);
				if (insertResult > 0) {
					flag = true;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {

			sqlSession.commit();
			sqlSession.close();
		}
		return flag;
	}

	@Override
	public boolean save(EmployeeDepartment departmentdetails) {
		boolean flag = false;
		Map<String, String> checkDepartment = new HashMap<>();
		String departmentname = departmentdetails.getdName();
		checkDepartment.put("dname", departmentname);
		SqlSession sqlSession = EmployeeManagementUtil.getSqlSessionFactory().openSession();
		try {
			EmployeeDepartment result = sqlSession.selectOne("checkDepartment", checkDepartment);
			if (result != null) {
				return flag;
			} else {
				int rowsUpdated = sqlSession.insert("insertDepartmentDetails", departmentdetails);
				if (rowsUpdated >= 1) {
					flag = true;
				} else {
					flag = false;
				}
			}
		} catch (Exception e) {

			e.printStackTrace();
		} finally {

			sqlSession.commit();
			sqlSession.close();

		}
		return flag;
	}

	@Override
	public boolean update(EmployeeDetails empDetails) {
		boolean flag = false;
		SqlSession sqlSession = EmployeeManagementUtil.getSqlSessionFactory().openSession();
		try {
			if(empDetails.getUserType().equals("admin"))
			{
				empDetails.setSkills("null");
				empDetails.setSalary(0);
			}
			int updateResult = sqlSession.update("updateEmployee", empDetails);
			if (updateResult > 0) {
				flag = true;
			} else {
				flag = false;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {

			sqlSession.commit();
			sqlSession.close();
		}
		return flag;
	}

	@Override
	public boolean update(EmployeeDepartment departmentdetails) {
		boolean flag = false;
		SqlSession sqlSession = EmployeeManagementUtil.getSqlSessionFactory().openSession();
		try {
			int updateResult = sqlSession.update("updateDepartment", departmentdetails);
			if (updateResult > 0) {
				flag = true;
			} else {
				flag = false;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.commit();
			sqlSession.close();
		}
		return flag;
	}

	@Override
	public boolean deleteEmployee(int id) {
		boolean flag = false;
		SqlSession sqlSession = EmployeeManagementUtil.getSqlSessionFactory().openSession();
		try {
			int deletedEmployeeResult = sqlSession.delete("deleteOneEmployee", id);
			if (deletedEmployeeResult > 0) {
				flag = true;
			} else {
				flag = false;
			}
		} catch (HibernateException e) {
			e.printStackTrace();
		} finally {

			sqlSession.commit();
			sqlSession.close();
		}
		return flag;
	}

	@Override
	public boolean deleteDepartment(int id) {
		boolean flag = false;
		List<EmployeeDetails> employeedetails=null;
		SqlSession sqlSession = EmployeeManagementUtil.getSqlSessionFactory().openSession();
		try {
			employeedetails = sqlSession.selectList("getDepartmentIdList", id);
			if(!(employeedetails.isEmpty()))
			{
				return flag;
			}
			else
			{
				int deletedDepartmentResult = sqlSession.delete("deleteOneDepartment", id);
				if (deletedDepartmentResult > 0) {
					flag = true;
				} else {
					flag = false;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.commit();
			sqlSession.close();
		}
		return flag;
	}

	

	@Override
	public List<DepartmentWiseEmpSalar> getdetails() {
		List<DepartmentWiseEmpSalar> list = null;
		List<DepartmentWiseEmpSalar> finalList = new ArrayList<>();
		DepartmentWiseEmpSalar departmentWiseDetailsList = null;
		SqlSession sqlSession = EmployeeManagementUtil.getSqlSessionFactory().openSession();
		try {
			list = sqlSession.selectList("getDepartmentTotalsalary");

			for (DepartmentWiseEmpSalar row : list) {

				departmentWiseDetailsList = new DepartmentWiseEmpSalar();
				departmentWiseDetailsList.setDepartmentid(row.getDepartmentid());
				departmentWiseDetailsList.setEmployeeid(row.getEmployeeid());
				departmentWiseDetailsList.setSalary(row.getSalary());
				departmentWiseDetailsList.setDepname(row.getDepname());
				Double averagesalary = (departmentWiseDetailsList.getSalary() / departmentWiseDetailsList.getEmployeeid());
				departmentWiseDetailsList.setAverageSalary(averagesalary);
				finalList.add(departmentWiseDetailsList);

			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {

			sqlSession.close();
		}
		return finalList;
	}

	@Override
	public boolean save(UserDetails userdetails) {
		return false;
	}

}
