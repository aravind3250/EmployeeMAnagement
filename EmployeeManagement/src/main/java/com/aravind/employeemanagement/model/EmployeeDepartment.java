package com.aravind.employeemanagement.model;

public class EmployeeDepartment {

	private Integer id;

	private String dName;

	private String description;

	private String status;

	public EmployeeDepartment() {
		super();
	}

	public EmployeeDepartment(Integer id, String dName, String description, String status) {
		super();
		this.id = id;
		this.dName = dName;
		this.description = description;
		this.status = status;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getdName() {
		return dName;
	}

	public void setdName(String dName) {
		this.dName = dName;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	

	@Override
	public String toString() {
		return "EmployeeDepartment [id=" + id + ", dName=" + dName + ", description=" + description + ", status="
				+ status + "]";
	}
}
