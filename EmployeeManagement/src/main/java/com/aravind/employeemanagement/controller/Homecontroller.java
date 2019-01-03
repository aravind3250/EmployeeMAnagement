package com.aravind.employeemanagement.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;


import javax.servlet.http.HttpSession;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.aravind.employeemanagement.model.DepartmentWiseEmpSalar;
import com.aravind.employeemanagement.model.EmployeeDepartment;
import com.aravind.employeemanagement.model.EmployeeDetails;
import com.aravind.employeemanagement.model.UserDetails;
import com.aravind.employeemanagement.service.EmployeeManagementService;

@Controller
public class Homecontroller {

	@Autowired
	EmployeeManagementService employeemanagementservice;

	/****
	 	*  Render Login Page *
	 						 ****/

	@RequestMapping(value = { "/", "/index" })
	public ModelAndView emphome() {
		ModelAndView mav = new ModelAndView("emplogin");
		mav.addObject("userdetails", new UserDetails());
		return mav;
	}

	/* validate login page */

	@RequestMapping(value = "/validateemployee")
	public ModelAndView login(@ModelAttribute("userdetails") @Validated UserDetails userdetails, HttpSession session) {
		ModelAndView mav = null;
		try {
			UserDetails user = employeemanagementservice.getUser(userdetails);
			if (user != null) {
				mav = new ModelAndView("Analytics");
				List<DepartmentWiseEmpSalar> list = employeemanagementservice.getdetails();

				mav.addObject("depempsal", list);
				session.setAttribute("username", user.getUname());
				session.setAttribute("password", user.getpassword());
				return mav;
			} else {
				mav = new ModelAndView("emplogin");
				mav.addObject("error", "Incorrect credentials");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;

	}

	/**** 
	 	* Render Configuration Page * 
	 								****/

	@RequestMapping(value = "/configure")
	public ModelAndView congigurepage(HttpSession session) {
		if (session.getAttribute("username") != null || session.getAttribute("password") != null) {
			ModelAndView mav = new ModelAndView("departments");
			List<EmployeeDepartment> departmentsList = employeemanagementservice.getDepartment();
			if (departmentsList != null) {
				mav.addObject("list", departmentsList);
			} else {
				mav.addObject("error", "No records to Display!, Create the Records first");
			}
			return mav;
		} else {
			ModelAndView mav = new ModelAndView("emplogin");
			mav.addObject("error","Error in login");
			mav.addObject("userdetails", new UserDetails());
			return mav;
		}
	}

	/****
	 	* Render Analytics Page * 
	 							****/

	@RequestMapping(value = "/analytics")
	public ModelAndView analyticspage(HttpSession session) {

		if (session.getAttribute("username") != null || session.getAttribute("password") != null) {
			ModelAndView mav = new ModelAndView("Analytics");
			List<DepartmentWiseEmpSalar> list = employeemanagementservice.getdetails();
			mav.addObject("depempsal", list);
			return mav;
		} else {
			ModelAndView mav = new ModelAndView("emplogin");
			mav.addObject("error","Error in login");
			mav.addObject("userdetails", new UserDetails());
			return mav;
		}
	}

	/**** Render Configuration-Employee Page ****/

	@RequestMapping(value = "/employeeDetails")
	public ModelAndView employeedetails(HttpSession session) {
		if (session.getAttribute("username") != null || session.getAttribute("password") != null) {
			ModelAndView mav = new ModelAndView("Employees");
			mav.addObject("employeedetails", new EmployeeDetails());
			// fetch the details from the database and add it to model
			List<EmployeeDetails> ed = employeemanagementservice.getEmployee();
			mav.addObject("list", ed);
			return mav;
		} else {
			ModelAndView mav = new ModelAndView("emplogin");
			mav.addObject("error","Error in login");
			mav.addObject("userdetails", new UserDetails());
			return mav;
		}
	}

	/**** Render Configuration-Department Page ****/

	@RequestMapping(value = "/departmentDetails")
	public ModelAndView departmentDetails(HttpSession session) {

		
		if (session.getAttribute("username") != null || session.getAttribute("password") != null) {
			ModelAndView mav = new ModelAndView("departments");
			mav.addObject("departmentdetails", new EmployeeDepartment());
			/**
			 * fetch the details from the database and add it to model
			 **/
			List<EmployeeDepartment> departmentsList = employeemanagementservice.getDepartment();
			if (departmentsList != null) {
				mav.addObject("list", departmentsList);
			} else {
				mav.addObject("error", "No records to Display!, Create the Records first");
			}
			return mav;
		} else {
			ModelAndView mav = new ModelAndView("emplogin");
			mav.addObject("error","Error in login");
			mav.addObject("userdetails", new UserDetails());
			return mav;
		}
	}

	/****
	 * Render Employee Details Page *
	 ****/

	@RequestMapping(value = "/newemployee")
	public ModelAndView employeeRegister(HttpSession session) {
		
		if (session.getAttribute("username") != null || session.getAttribute("password") != null) {
			ModelAndView mav = new ModelAndView("empRegister");
			ModelAndView mav1 = new ModelAndView("Employees");
			if (employeemanagementservice.empDepartmentNames() != null) {
				Map<Integer, String> depNamesAndId = employeemanagementservice.empDepartmentNames();
				mav.addObject("depNameslist", depNamesAndId);
				mav.addObject("employeedetails", new EmployeeDetails());
				return mav;
			} else {
				mav1.addObject("error", "Add Department List first");
				return mav1;
			}
		} else {
			ModelAndView mav = new ModelAndView("emplogin");
			mav.addObject("error","Error in login");
			mav.addObject("userdetails", new UserDetails());
			return mav;
		}

	}

	/****
	 * 
	 * Render Department Details Page
	 * 
	 ****/

	@RequestMapping(value = "/newDepartment")
	public ModelAndView departmentRegister(HttpSession session) {
		
		if (session.getAttribute("username") != null || session.getAttribute("password") != null) {
			ModelAndView mav = new ModelAndView("depRegister");
			mav.addObject("departmentdetails", new EmployeeDepartment());
			return mav;
		} else {
			ModelAndView mav = new ModelAndView("emplogin");
			mav.addObject("error","Error in login");
			mav.addObject("userdetails", new UserDetails());
			return mav;
		}
	}

	/****
	 * add employeeDetails to database
	 ****/

	@RequestMapping(value = "/addemployee")
	public ModelAndView addEmployee(@ModelAttribute("employeedetails") EmployeeDetails employeedetails,
			HttpSession session) {
		
		if (session.getAttribute("username") != null || session.getAttribute("password") != null) {
			ModelAndView mav = new ModelAndView("Employees");
			try {
				if (employeedetails.getEmpid() == null) {
					if (employeemanagementservice.save(employeedetails)) {

						mav.addObject("list", employeemanagementservice.getEmployee());
						mav.addObject("success", "Employe records successfully created");
					} else {
						mav.addObject("list", employeemanagementservice.getEmployee());
						mav.addObject("error", "Employee Id and email ID Exist!! should be unique");

					}
				} else {
					if (employeemanagementservice.update(employeedetails)) {

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
		} else {
			ModelAndView mav = new ModelAndView("emplogin");
			mav.addObject("error","Error in login");
			mav.addObject("userdetails", new UserDetails());
			return mav;
		}

	}

	/****
	 * 
	 * Add Department details to database
	 * 
	 ****/

	@RequestMapping(value = "/addDepartment")
	public ModelAndView addDepartment(
			@ModelAttribute("departmentdetails") @Validated EmployeeDepartment departmentdetails, HttpSession session) {
		if (session.getAttribute("username") != null || session.getAttribute("password") != null) {
			ModelAndView mav = new ModelAndView("departments");
			try {
				if (departmentdetails.getId() == null) {
					if (employeemanagementservice.save(departmentdetails)) {
						mav.addObject("list", employeemanagementservice.getDepartment());
						mav.addObject("success", "Department records successfully created");
					} else {
						mav.addObject("list", employeemanagementservice.getDepartment());
						mav.addObject("error", "Department name already exists");
					}
				} else {

					if (employeemanagementservice.update(departmentdetails)) {
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
		} else {
			ModelAndView mav = new ModelAndView("emplogin");
			mav.addObject("error","Error in login");
			mav.addObject("userdetails", new UserDetails());
			return mav;
		}

	}

	/****
	 * Department Wise Employee Pie Chart request Method *
	 * 
	 ****/

	@RequestMapping(value = "/list")
	@ResponseBody
	public String list(HttpSession session) {

		if (session.getAttribute("username") != null || session.getAttribute("password") != null) {
			Map<String, Integer> m = new HashMap<>();
			String depname = null;
			List<EmployeeDetails> list = employeemanagementservice.getEmployee();
			for (EmployeeDetails e : list) {
				depname = e.getDepname();
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
		} else {
			return "emplogin";
		}
	}

	/****
	 * Department Wise Skill set View Stack bar Chart *
	 * 
	 ****/

	@RequestMapping(value = "/list1")
	@ResponseBody
	public String list1(HttpSession session) {
		if (session.getAttribute("username") != null || session.getAttribute("password") != null) {
			Map<String, Integer> m = new HashMap<>();
			List<EmployeeDetails> list = employeemanagementservice.getEmployee();
			for (EmployeeDetails e : list) {
				String[] skills = e.getSkills().split(",");
				for (String skill : skills) {
					if (m.containsKey(skill)) {
						m.put(skill, m.get(skill) + 1);
					} else {
						m.put(skill, 1);
					}
				}
			}
			JSONArray jsonArray = new JSONArray();
			JSONObject formDetailsJson = null;

			for (Entry<String, Integer> map : m.entrySet()) {
				formDetailsJson = new JSONObject();
				formDetailsJson.put("name", map.getKey());
				formDetailsJson.put("y", map.getValue());
				jsonArray.put(formDetailsJson);
			}

			return jsonArray.toString();
		} else {
			return "emplogin";
		}

	}

	@RequestMapping(value = "/list2")
	@ResponseBody
	public String list2(HttpSession session) {
		if (session.getAttribute("username") != null || session.getAttribute("password") != null) {
			Map<String, Map<String, Integer>> dep = new HashMap<>();
			String[] skills = null;
			String depname = null;
			List<EmployeeDetails> list = employeemanagementservice.getEmployee();

			for (EmployeeDetails e : list) {
				Map<String, Integer> skillset = new HashMap<>();

				depname = e.getDepname();
				skills = e.getSkills().split(",");
				if (dep.containsKey(depname)) {
					skillset = dep.get(depname);
					for (String skill : skills) {
						if (skillset.containsKey(skill)) {
							skillset.put(skill, skillset.get(skill) + 1);
						} else {
							skillset.put(skill, 1);
						}
					}
					dep.put(depname, skillset);

				} else {
					for (String skill : skills) {
						skillset.put(skill, 1);
					}
					dep.put(depname, skillset);
				}
			}

			JSONArray jsonArray = new JSONArray();

			JSONObject formDetailsJson = null;
			for (Entry<String, Map<String, Integer>> map : dep.entrySet()) {
				formDetailsJson = new JSONObject();
				formDetailsJson.put("name", map.getKey());
				formDetailsJson.put("y", map.getValue());
				jsonArray.put(formDetailsJson);
			}
			return jsonArray.toString();
		} else {
			return "emplogin";
		}
	}

	/***
	 * Updating employee Data Table *
	 ****/

	@RequestMapping(value = "/updateEmployee")
	public ModelAndView showUpdatePage(@RequestParam("id") int id, HttpSession session) {
		
		if (session.getAttribute("username") != null || session.getAttribute("password") != null) {
			ModelAndView mav = new ModelAndView("empRegister");
			try {
				EmployeeDetails employeedetail = employeemanagementservice.getEmployee(id);

				if (employeedetail.getDepname().equals("select")) {
					Map<Integer, String> depNamesAndId = employeemanagementservice.empDepartmentNames();
					mav.addObject("depNameslist", depNamesAndId);
					mav.addObject("employeedetails", employeedetail);
					return mav;
				} else {
					EmployeeDetails employeedetail1 = employeemanagementservice.getEmployee(id);
					mav.addObject("departmentName", employeedetail1.getDepname());
					mav.addObject("departmentId", employeedetail1.getDepartmentid());
					Map<Integer, String> depNamesAndId = employeemanagementservice.empDepartmentNames();
					mav.addObject("depNameslist", depNamesAndId);
					mav.addObject("employeedetails", employeemanagementservice.getEmployee(id));

				}
			} catch (Exception e) {
				e.printStackTrace();
			}

			return mav;
		} else {
			ModelAndView mav = new ModelAndView("emplogin");
			mav.addObject("error","Error in login");
			mav.addObject("userdetails", new UserDetails());
			return mav;
		}
	}

	/****
	 * updating Department table
	 * 
	 ****/

	@RequestMapping(value = "/updatedepartment")
	public ModelAndView showdepUpdatePage(@RequestParam("id") int id, HttpSession session) {
		if (session.getAttribute("username") != null || session.getAttribute("password") != null) {
			ModelAndView mav = new ModelAndView("depRegister");
			try {
				mav.addObject("departmentdetails", employeemanagementservice.getDepartment(id));
			} catch (Exception e) {
				e.printStackTrace();
			}
			return mav;
		} else {
			ModelAndView mav = new ModelAndView("emplogin");
			mav.addObject("error","Error in login");
			mav.addObject("userdetails", new UserDetails());
			return mav;
		}
	}

	/****
	 * Delete single Employee Details by id *
	 ****/

	@RequestMapping(value = "/removeEmployee")
	public ModelAndView deleteEmployeeById(@RequestParam("id") int id, HttpSession session) {
	
		if (session.getAttribute("username") != null || session.getAttribute("password") != null) {
			ModelAndView mav = new ModelAndView("Employees");
			try {
				if (employeemanagementservice.deleteEmployee(id)) {
					mav.addObject("list", employeemanagementservice.getEmployee());
					mav.addObject("msg", "Employee Deleted Successfully");
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			return mav;
		} else {
			ModelAndView mav = new ModelAndView("emplogin");
			mav.addObject("error","Error in login");
			mav.addObject("userdetails", new UserDetails());
			return mav;
		}
	}

	/****
	 * Delete single Department Details by id
	 * 
	 ****/

	@RequestMapping(value = "/removeDepartment")
	public ModelAndView deleteDepartmentById(@RequestParam("id") int id, HttpSession session) {
		if (session.getAttribute("username") != null || session.getAttribute("password") != null) {
			ModelAndView mav = new ModelAndView("departments");
			try {
				if (employeemanagementservice.deleteDepartment(id)) {
					mav.addObject("list", employeemanagementservice.getDepartment());
					return mav;
				} else {

					mav.addObject("error", "Unable to Delete the Department");
					mav.addObject("list", employeemanagementservice.getDepartment());
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			return mav;
		} else {
			ModelAndView mav = new ModelAndView("emplogin");
			mav.addObject("error","Error in login");
			mav.addObject("userdetails", new UserDetails());
			return mav;
		}
	}

	@RequestMapping(value = "/logoutuser")
	public ModelAndView logOutUser(HttpSession session) {
		ModelAndView mav = new ModelAndView("emplogin");
			session.invalidate();
			mav.addObject("success", "Logout Successfull");
			mav.addObject("userdetails", new UserDetails());
			return mav;
	
	}
}
