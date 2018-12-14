package com.aravind.Employeemanagement.controller;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import com.aravind.Employeemanagement.model.EmployeeDetails;
import com.aravind.Employeemanagement.model.UserDetails;
import com.aravind.Employeemanagement.service.EmployeeManagementService;

@Controller
public class Homecontroller {
	
	@Autowired
	EmployeeManagementService employeemanagementservice;
	
	@RequestMapping(value = {"/", "/home", "/index"})
	public ModelAndView emphome()
	{
		System.out.println("in controller");
		ModelAndView mav = new ModelAndView("emplogin");
		mav.addObject("employee", new EmployeeDetails());
		return mav;
	}
	
	@RequestMapping(value="/register")
	public ModelAndView register()
	{
		System.out.println("in register controller");
		ModelAndView mav = new ModelAndView("Register");
		mav.addObject("employee", new UserDetails());
		return mav;
	}
	
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
	
	@RequestMapping(value="/registeruser")
	public ModelAndView Login(@ModelAttribute("userdetails") @Validated UserDetails userdetails) {
		
		System.out.println("in login controller");
		ModelAndView mav=null;
		/*try {
			if(employeemanagementservice.getEmployee(userdetails)) {
				mav = new ModelAndView("mainmenu");
				return mav;
			}else {
				mav = new ModelAndView("error");
				mav.addObject("msg", "incorrect credentials");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}*/
		return mav;
	
	}
}
	
