package com.aravind.Employeemanagement.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.aravind.Employeemanagement.model.EmployeeDetails;

public class Homecontroller {
	
	@RequestMapping(value= {"/","/home","/index"})
	public ModelAndView emphome()
	{
		ModelAndView mav = new ModelAndView("emplogin");
		mav.addObject("employee", new EmployeeDetails());
		return mav;
	}
}
