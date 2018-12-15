package com.aravind.Employeemanagement.controller;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.aravind.Employeemanagement.model.EmployeeDepartment;
import com.aravind.Employeemanagement.model.EmployeeDetails;
import com.aravind.Employeemanagement.model.UserDetails;
import com.aravind.Employeemanagement.service.EmployeeManagementService;

@Controller
public class Homecontroller {
	
	@Autowired
	EmployeeManagementService employeemanagementservice;
	
	/*Render Login Page*/
	
	@RequestMapping(value = {"/", "/home", "/index"})
	public ModelAndView emphome()
	{
		System.out.println("in controller");
		ModelAndView mav = new ModelAndView("emplogin");
		mav.addObject("employee", new EmployeeDetails());
		return mav;
	}
	
/*	validate login page */
	
	@RequestMapping(value="/validateemployee")
	public ModelAndView Login(@ModelAttribute("empdetails") @Validated EmployeeDetails empdetails) {
		
		System.out.println("in login controller");
		ModelAndView mav=null;
		try {
			if(employeemanagementservice.getEmployee(empdetails)) {
				mav = new ModelAndView("mainmenu");
				return mav;
			}else {
				mav = new ModelAndView("error");
				/*mav.addObject("msg", "incorrect credentials");*/
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return mav;
	
	}
	
	/*Render User Registration Page*/
	
	@RequestMapping(value="/register")
	public ModelAndView register()
	{
		System.out.println("in register controller");
		ModelAndView mav = new ModelAndView("Register");
		mav.addObject("userdetails", new UserDetails());
		return mav;
	}

	/*create And add user details(registration) to database*/
	
	@RequestMapping(value="/registeruser")
	public ModelAndView Login(@ModelAttribute("userdetails") @Validated UserDetails userdetails) {
		
		System.out.println("in register user controller");
		ModelAndView mav = null;
		try {
			if(employeemanagementservice.save(userdetails)) {
				mav=new ModelAndView("success");
			}else {
				mav=new ModelAndView("error");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return mav;
	
	}
	
	/* Render Configuration Page */
	
	@RequestMapping(value="/configure")
	public ModelAndView congigurepage()
	{
		System.out.println("in configure controller");
		ModelAndView mav = new ModelAndView("configure");
		mav.addObject("userdetails", new UserDetails());
		return mav;
	}
	
	/* Render Analytics Page*/
	
	@RequestMapping(value="/analytics")
	public ModelAndView analyticspage()
	{
		System.out.println("in configure controller");
		ModelAndView mav = new ModelAndView("Analytics");
		mav.addObject("userdetails", new UserDetails());
		return mav;
	}
	
	/* Render Configuration-Employee Page*/
	
	@RequestMapping(value="/employeeDetails")
	public ModelAndView employeedetails()
	{
		System.out.println("in configure controller");
		ModelAndView mav = new ModelAndView("Employees");
		mav.addObject("employeedetails", new EmployeeDetails());
		return mav;
	}
	
	/* Render Configuration-Department Page*/
	@RequestMapping(value="/departmentDetails")
	public ModelAndView departmentDetails()
	{
		System.out.println("in configure controller");
		ModelAndView mav = new ModelAndView("departments");
		mav.addObject("departmentdetails", new EmployeeDepartment());
		return mav;
	}
	
	/*Render Employee Details Page*/
	
	@RequestMapping(value="/newemployee")
	public ModelAndView employeeRegister()
	{
		System.out.println("in Employeeregister controller");
		ModelAndView mav = new ModelAndView("empRegister");
		mav.addObject("employeedetails", new EmployeeDetails());
		return mav;
	}
	
	/*Render Department Details Page*/
	
	@RequestMapping(value="/newDepartment")
	public ModelAndView departmentRegister()
	{
		System.out.println("in Employeeregister controller");
		ModelAndView mav = new ModelAndView("depRegister");
		mav.addObject("departmentdetails", new EmployeeDepartment() );
		return mav;
	}
	
	
	/*add employeeDetails to database*/
	
	
	@RequestMapping(value="/addemployee")
	public ModelAndView addEmployee(@ModelAttribute("employeedetails") @Validated EmployeeDetails employeedetails) {
		
		System.out.println("in register user controller");
		ModelAndView mav = null;
		try {
			if(employeemanagementservice.save(employeedetails)) {
				mav=new ModelAndView("success");
			}else {
				mav=new ModelAndView("error");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return mav;
	
	}
	
	
	
}
	
