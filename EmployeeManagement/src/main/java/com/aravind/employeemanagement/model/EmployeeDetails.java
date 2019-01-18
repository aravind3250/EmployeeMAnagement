package com.aravind.employeemanagement.model;

public class EmployeeDetails {

	private Integer empid;

	private String  fname;

	private String  lname;

	private String  userType;
	
	private String  emailid;

	private Integer employeeid;

	private String  designation;

	private String  gender;

	private String  skills;

	private String  password;

	private Integer salary;

	private Double  avgsalary;

	private double  percentage;

	private Integer departmentid;

	private String  depname;

	public EmployeeDetails() {
		super();
	}

	public EmployeeDetails(Integer empid, String fname, String lname, String userType, String emailid,
			Integer employeeid, String designation, String gender, String skills, String password, Integer salary,
			Double avgsalary, double percentage, Integer departmentid, String depname) {
		super();
		this.empid = empid;
		this.fname = fname;
		this.lname = lname;
		this.userType = userType;
		this.emailid = emailid;
		this.employeeid = employeeid;
		this.designation = designation;
		this.gender = gender;
		this.skills = skills;
		this.password = password;
		this.salary = salary;
		this.avgsalary = avgsalary;
		this.percentage = percentage;
		this.departmentid = departmentid;
		this.depname = depname;
	}

	public Integer getEmpid() {
		return empid;
	}

	public void setEmpid(Integer empid) {
		this.empid = empid;
	}

	public String getFname() {
		return fname;
	}

	public void setFname(String fname) {
		this.fname = fname;
	}

	public String getLname() {
		return lname;
	}

	public void setLname(String lname) {
		this.lname = lname;
	}

	public String getUserType() {
		return userType;
	}

	public void setUserType(String userType) {
		this.userType = userType;
	}

	public String getEmailid() {
		return emailid;
	}

	public void setEmailid(String emailid) {
		this.emailid = emailid;
	}

	public Integer getEmployeeid() {
		return employeeid;
	}

	public void setEmployeeid(Integer employeeid) {
		this.employeeid = employeeid;
	}

	public String getDesignation() {
		return designation;
	}

	public void setDesignation(String designation) {
		this.designation = designation;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getSkills() {
		return skills;
	}

	public void setSkills(String skills) {
		this.skills = skills;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Integer getSalary() {
		return salary;
	}

	public void setSalary(Integer salary) {
		this.salary = salary;
	}

	public Double getAvgsalary() {
		return avgsalary;
	}

	public void setAvgsalary(Double avgsalary) {
		this.avgsalary = avgsalary;
	}

	public double getPercentage() {
		return percentage;
	}

	public void setPercentage(double percentage) {
		this.percentage = percentage;
	}

	public Integer getDepartmentid() {
		return departmentid;
	}

	public void setDepartmentid(Integer departmentid) {
		this.departmentid = departmentid;
	}

	public String getDepname() {
		return depname;
	}

	public void setDepname(String depname) {
		this.depname = depname;
	}

	@Override
	public String toString() {
		return "EmployeeDetails [empid=" + empid + ", fname=" + fname + ", lname=" + lname + ", userType=" + userType
				+ ", emailid=" + emailid + ", employeeid=" + employeeid + ", designation=" + designation + ", gender="
				+ gender + ", skills=" + skills + ", password=" + password + ", salary=" + salary + ", avgsalary="
				+ avgsalary + ", percentage=" + percentage + ", departmentid=" + departmentid + ", depname=" + depname
				+ "]";
	}


}
