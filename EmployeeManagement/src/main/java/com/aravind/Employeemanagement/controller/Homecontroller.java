package com.aravind.Employeemanagement.controller;

import java.net.MalformedURLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.aravind.Employeemanagement.model.Departmentempsalbean;
import com.aravind.Employeemanagement.model.EmployeeDepartment;
import com.aravind.Employeemanagement.model.EmployeeDetails;
import com.aravind.Employeemanagement.model.UserDetails;
import com.aravind.Employeemanagement.service.EmployeeManagementService;

@Controller
public class Homecontroller {

	@Autowired
	EmployeeManagementService employeemanagementservice;

	/* Render Login Page */

	@RequestMapping(value = { "/", "/home", "/index" })
	public ModelAndView emphome() {
		System.out.println("in controller");
		ModelAndView mav = new ModelAndView("emplogin");
		mav.addObject("userdetails", new UserDetails());
		return mav;
	}

	/* validate login page */

	@RequestMapping(value = "/validateemployee")
	public ModelAndView Login(@ModelAttribute("userdetails") @Validated UserDetails userdetails) {
		System.out.println("in login controller");
		ModelAndView mav = null;
		try {
			if (employeemanagementservice.getUser(userdetails)) {
				mav = new ModelAndView("Analytics");
				List<EmployeeDetails> list = employeemanagementservice.getdetails();
				System.out.println(list.toString()+"--------------->");
				mav.addObject("depempsal", list);
				mav.addObject(userdetails.getEmailid(), userdetails.getpassword());
				return mav;
			} 
			else {
				mav = new ModelAndView("emplogin");
				mav.addObject("error", "Incorrect credentials");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;

	}

	/* Render User Registration Page */

	@RequestMapping(value = "/register")
	public ModelAndView register() {
		System.out.println("in register controller");
		ModelAndView mav = new ModelAndView("Register");
		mav.addObject("userdetails", new UserDetails());
		return mav;
	}

	/* create And add user details(registration) to database */

	@RequestMapping(value = "/registeruser")
	public ModelAndView RegisterUSer(@ModelAttribute("userdetails") @Validated UserDetails userdetails) {

		System.out.println("in register user controller");
		ModelAndView mav = null;
		try {
			if (employeemanagementservice.save(userdetails)) {
				mav = new ModelAndView("success");
			} else {
				mav = new ModelAndView("error");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;

	}

	/* Render Configuration Page */

	@RequestMapping(value = "/configure")
	public ModelAndView congigurepage() {
		System.out.println("in configure controller");
		ModelAndView mav = new ModelAndView("departments");
		mav.addObject("departmentdetails", new EmployeeDepartment());
		mav.addObject("list", employeemanagementservice.getDepartment());
		return mav;
	}

	/* Render Analytics Page */

	@RequestMapping(value = "/analytics")
	public ModelAndView analyticspage() {
		System.out.println("in configure controller");
		ModelAndView mav = new ModelAndView("Analytics");
		List<EmployeeDetails> list = employeemanagementservice.getdetails();
		System.out.println(list.toString()+"--------------->");
		mav.addObject("depempsal", list);
		return mav;
		}

	/* Render Configuration-Employee Page */

	@RequestMapping(value = "/employeeDetails")
	public ModelAndView employeedetails() {
		System.out.println("in configure controller");
		ModelAndView mav = new ModelAndView("Employees");
		mav.addObject("employeedetails", new EmployeeDetails());
		// fetch the details from the database and add it to model
		mav.addObject("list", employeemanagementservice.getEmployee());
		return mav;
	}

	/* Render Configuration-Department Page */
	@RequestMapping(value = "/departmentDetails")
	public ModelAndView departmentDetails() {
		System.out.println("in configure controller");
		ModelAndView mav = new ModelAndView("departments");
		mav.addObject("departmentdetails", new EmployeeDepartment());
		// fetch the details from the database and add it to model
		mav.addObject("list", employeemanagementservice.getDepartment());
		return mav;
	}

	/* Render Employee Details Page */

	@RequestMapping(value = "/newemployee")
	public ModelAndView employeeRegister() {
		System.out.println("in congigure employee controller");
		ModelAndView mav = new ModelAndView("empRegister");
		ModelAndView mav1=new ModelAndView("Employees");
		if(employeemanagementservice.empDepartmentNames()!=null)
		{
			List<String> depnames=employeemanagementservice.empDepartmentNames();
			
			mav.addObject("depNameslist", depnames);
			mav.addObject("employeedetails", new EmployeeDetails());
			return mav;
		}else
		{
			mav1.addObject("error", "Add Department List first");
			return mav1;
		}
		
	}

	/* Render Department Details Page */

	@RequestMapping(value = "/newDepartment")
	public ModelAndView departmentRegister() {
		System.out.println("in congigure department controller");
		ModelAndView mav = new ModelAndView("depRegister");
		mav.addObject("departmentdetails", new EmployeeDepartment());
		return mav;
	}

	/* add employeeDetails to database */

	@RequestMapping(value = "/addemployee")
	public ModelAndView addEmployee(@ModelAttribute("employeedetails") @Validated EmployeeDetails employeedetails) {

		System.out.println("in register user controller");
		
		ModelAndView mav = new ModelAndView("Employees");
		try {
			if(employeedetails.getId() == null) {
				if (employeemanagementservice.save(employeedetails)) {
					
					mav.addObject("list", employeemanagementservice.getEmployee());
					mav.addObject("success", "Employe records successfully created");
				} else {
					mav.addObject("list", employeemanagementservice.getEmployee());
					mav.addObject("error", "Employee Id and email ID should be unique");
					
				}
			}else {
				if(employeemanagementservice.update(employeedetails)) {
					
					mav.addObject("list", employeemanagementservice.getEmployee());
					mav.addObject("success", "Employe records successfully updated");
				} else {
					mav.addObject("error", "unable to update Employee records");
				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;

	}
	

	/* add Department details to database */

	@RequestMapping(value = "/addDepartment")
	public ModelAndView addDepartment(@ModelAttribute("departmentdetails") @Validated EmployeeDepartment departmentdetails) {

		System.out.println("in department user controller");
		ModelAndView mav= new ModelAndView("departments");;
		try {
			if(departmentdetails.getId() == null) {
				if (employeemanagementservice.save(departmentdetails)) {
					mav.addObject("list", employeemanagementservice.getDepartment());
					mav.addObject("success", "Department records successfully created");
				} else {
					mav.addObject("list", employeemanagementservice.getDepartment());
					mav.addObject("error", "Department name unique");
					}
			}else {
				
				if(employeemanagementservice.update(departmentdetails)) {
					mav.addObject("list", employeemanagementservice.getDepartment());
					mav.addObject("success", "Employe records successfully updated");
				} else {
					mav.addObject("error", "Unable to update Department records");
				}
			}
				
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;

	}

	@RequestMapping(value = "/list")
	@ResponseBody
	public String list() {
		Map<String, Integer> m = new HashMap<String, Integer>();
		String depname = null;
		List<EmployeeDetails> list = employeemanagementservice.getEmployee();
		for (EmployeeDetails e : list) {
			depname = e.getDepartment();
			if (m.containsKey(depname)) {
				m.put(depname, m.get(depname) + 1);
			} else {
				m.put(depname, 1);
			}
		}
		JSONArray jsonArray = new JSONArray();
		double size = list.size();

		JSONObject formDetailsJson = null;
		for (Entry<String, Integer> map : m.entrySet()) {
			formDetailsJson = new JSONObject();
			formDetailsJson.put("name", map.getKey());
			formDetailsJson.put("y", (map.getValue() / size) * 100);
			jsonArray.put(formDetailsJson);
		}
		return jsonArray.toString();
	}
	
	@RequestMapping(value = "/list1")
	@ResponseBody
	public String list1() {
		Map<String, Integer> m = new HashMap<String, Integer>();
		List<EmployeeDetails> list = employeemanagementservice.getEmployee();
		for (EmployeeDetails e : list) {
			String[] skills=e.getSkills().split(",");
			for(String skill:skills)
			{
				if(m.containsKey(skill))
				{
					m.put(skill, m.get(skill)+1);
				}
				else
				{
					m.put(skill, 1);
				}
			}
		}
		JSONArray jsonArray = new JSONArray();
		JSONObject formDetailsJson = null;
		System.out.println(m);
		for (Entry<String, Integer> map : m.entrySet()) {
			formDetailsJson = new JSONObject();
			System.out.println(map.getKey()+"----------->");
			formDetailsJson.put("name", map.getKey());
			formDetailsJson.put("y", map.getValue());
			jsonArray.put(formDetailsJson);
		}
		
		return jsonArray.toString();
		
	}
	
	@RequestMapping(value = "/list2")
	@ResponseBody
	public String list2() 
	{
		Map<String, Map<String,Integer>> dep = new HashMap<String, Map<String,Integer>>();
		
		
		String[] skills=null;
		String depname = null;
		List<EmployeeDetails> list = employeemanagementservice.getEmployee();
		
		for (EmployeeDetails e : list) 
		{
			Map<String,Integer> skillset=new HashMap<String,Integer>();
			
			
			depname = e.getDepartment();
			skills=e.getSkills().split(",");
			if (dep.containsKey(depname)) 
			{
				 skillset=dep.get(depname);
				for(String skill:skills)
				{
					if(skillset.containsKey(skill))
					{
						skillset.put(skill, skillset.get(skill)+1);
					}
					else
					{
						skillset.put(skill, 1);
					}
				}
				dep.put(depname, skillset);
				
			}
			else
			{
				for(String skill:skills)
				{
					skillset.put(skill, 1);
				}
				dep.put(depname, skillset);
			}
		}
		System.out.println(dep);
		
		JSONArray jsonArray = new JSONArray();

		JSONObject formDetailsJson = null;
		for (Entry<String, Map<String,Integer>> map : dep.entrySet()) {
			formDetailsJson = new JSONObject();
			formDetailsJson.put("name",map.getKey());
			formDetailsJson.put("y", map.getValue());
			jsonArray.put(formDetailsJson);
		}
		return jsonArray.toString();
	}
	
	
		

	/*Updating employee Data Table*/
	
	@RequestMapping(value = "/updateForm")
	public ModelAndView showUpdatePage(@RequestParam("id") int id) {
		ModelAndView mav = new ModelAndView("empRegister");
		try {
			EmployeeDetails ed = employeemanagementservice.getEmployee(id);
			
			if(ed.getDepartment().equals("select"))
			{
				List<String> depNames=employeemanagementservice.empDepartmentNames();
				mav.addObject("depNameslist", depNames);
				mav.addObject("employeedetails", ed);
				return mav;
			}
			else {
				EmployeeDetails ed1 = employeemanagementservice.getEmployee(id);
				mav.addObject("depNameslist", ed1.getDepartment());
				List<String> depNames=employeemanagementservice.empDepartmentNames();
				mav.addObject("depNameslist", depNames);
				mav.addObject("employeedetails", employeemanagementservice.getEmployee(id));
			
			}
		} catch (Exception e) {
			e.printStackTrace();
			}
		
		return mav;
	}
	
	/*updating Department table*/
	
	@RequestMapping(value = "/updatedepartment")
	public ModelAndView showdepUpdatePage(@RequestParam("id") int id) {
		ModelAndView mav = new ModelAndView("depRegister");
		try {
			mav.addObject("departmentdetails", employeemanagementservice.getDepartment(id));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}
	
	/*Delete single Employee Details by id*/
	
	@RequestMapping(value = "/removeEmployee")
	public ModelAndView deleteEmployeeById(@RequestParam("id") int id) {
		ModelAndView mav = new ModelAndView("Employees");
		try {
			if(employeemanagementservice.deleteEmployee(id));
			{
				mav.addObject("list", employeemanagementservice.getEmployee());
				mav.addObject("msg", "Employee Deleted Successfully");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}
	
	/*Delete single Department Details by id*/
	
	@RequestMapping(value = "/removeDepartment")
	public ModelAndView deleteDepartmentById(@RequestParam("id") int id) {
		ModelAndView mav = new ModelAndView("departments");
		try {
			if(employeemanagementservice.deleteDepartment(id));
			{
				mav.addObject("list", employeemanagementservice.getDepartment());
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}
}
