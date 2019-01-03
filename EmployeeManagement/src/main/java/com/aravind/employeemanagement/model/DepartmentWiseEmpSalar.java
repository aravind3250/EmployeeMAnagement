package com.aravind.employeemanagement.model;

public class DepartmentWiseEmpSalar {

	private Integer departmentid;
	private Double salary;
	private Integer employeeid;
	private String depname;
	private Double averageSalary;

	public DepartmentWiseEmpSalar() {
		super();
	}

	public DepartmentWiseEmpSalar(Integer departmentid, Double salary, Integer employeeid, String depname) {
		super();
		this.departmentid = departmentid;
		this.salary = salary;
		this.employeeid = employeeid;
		this.depname = depname;
	}

	public Integer getDepartmentid() {
		return departmentid;
	}

	public void setDepartmentid(Integer departmentid) {
		this.departmentid = departmentid;
	}

	public Double getSalary() {
		return salary;
	}

	public void setSalary(Double salary) {
		this.salary = salary;
	}

	public Integer getEmployeeid() {
		return employeeid;
	}

	public void setEmployeeid(Integer employeeid) {
		this.employeeid = employeeid;
	}

	public String getDepname() {
		return depname;
	}

	public void setDepname(String depname) {
		this.depname = depname;
	}

	public Double getAverageSalary() {
		return averageSalary;
	}

	public void setAverageSalary(Double averageSalary) {
		this.averageSalary = averageSalary;
	}

	
	@Override
	public String toString() {
		return "DepartmentWiseEmpSalar [departmentid=" + departmentid + ", salary=" + salary + ", employeeid="
				+ employeeid + ", depname=" + depname + ", averageSalary=" + averageSalary + "]";
	}

}
