package com.aravind.Employeemanagement.model;

import java.text.DecimalFormat;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@Table(name = "employee")
public class EmployeeDetails {
	
	
	
	@Column
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	@Column(name = "fname")
	private String fname;
	@Column(name = "lname")
	private String lname;
	@Column(name = "emailid")
	private String emailid;
	@Column(name = "employeeid")
	private Integer employeeid;
	@Column(name = "designation")
	private String designation;
	@Column(name = "gender")
	private String gender;
	@Column(name = "skills")
	private String skills;
	@Column(name = "password")
	private String password;
	@Column(name="department")
	private String department;
	@Column(name = "salary")
	private Double salary;
	
	@Transient
	private Double avgsalary;
	
	@Transient
	private double percentage;

	public EmployeeDetails() {
		super();
	}

	public EmployeeDetails(Integer id, String fname, String lname, String emailid, Integer employeeid,
			String designation, String gender, String skills, String password, String department, Double salary,
			Double avgsalary, double percentage) {
		super();
		this.id = id;
		this.fname = fname;
		this.lname = lname;
		this.emailid = emailid;
		this.employeeid = employeeid;
		this.designation = designation;
		this.gender = gender;
		this.skills = skills;
		this.password = password;
		this.department = department;
		this.salary = salary;
		this.avgsalary = avgsalary;
		this.percentage = percentage;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
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

	public String getDepartment() {
		return department;
	}

	public void setDepartment(String department) {
		this.department = department;
	}

	public Double getSalary() {
		return salary;
	}

	public void setSalary(Double salary) {
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

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((avgsalary == null) ? 0 : avgsalary.hashCode());
		result = prime * result + ((department == null) ? 0 : department.hashCode());
		result = prime * result + ((designation == null) ? 0 : designation.hashCode());
		result = prime * result + ((emailid == null) ? 0 : emailid.hashCode());
		result = prime * result + ((employeeid == null) ? 0 : employeeid.hashCode());
		result = prime * result + ((fname == null) ? 0 : fname.hashCode());
		result = prime * result + ((gender == null) ? 0 : gender.hashCode());
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		result = prime * result + ((lname == null) ? 0 : lname.hashCode());
		result = prime * result + ((password == null) ? 0 : password.hashCode());
		long temp;
		temp = Double.doubleToLongBits(percentage);
		result = prime * result + (int) (temp ^ (temp >>> 32));
		result = prime * result + ((salary == null) ? 0 : salary.hashCode());
		result = prime * result + ((skills == null) ? 0 : skills.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		EmployeeDetails other = (EmployeeDetails) obj;
		if (avgsalary == null) {
			if (other.avgsalary != null)
				return false;
		} else if (!avgsalary.equals(other.avgsalary))
			return false;
		if (department == null) {
			if (other.department != null)
				return false;
		} else if (!department.equals(other.department))
			return false;
		if (designation == null) {
			if (other.designation != null)
				return false;
		} else if (!designation.equals(other.designation))
			return false;
		if (emailid == null) {
			if (other.emailid != null)
				return false;
		} else if (!emailid.equals(other.emailid))
			return false;
		if (employeeid == null) {
			if (other.employeeid != null)
				return false;
		} else if (!employeeid.equals(other.employeeid))
			return false;
		if (fname == null) {
			if (other.fname != null)
				return false;
		} else if (!fname.equals(other.fname))
			return false;
		if (gender == null) {
			if (other.gender != null)
				return false;
		} else if (!gender.equals(other.gender))
			return false;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		if (lname == null) {
			if (other.lname != null)
				return false;
		} else if (!lname.equals(other.lname))
			return false;
		if (password == null) {
			if (other.password != null)
				return false;
		} else if (!password.equals(other.password))
			return false;
		if (Double.doubleToLongBits(percentage) != Double.doubleToLongBits(other.percentage))
			return false;
		if (salary == null) {
			if (other.salary != null)
				return false;
		} else if (!salary.equals(other.salary))
			return false;
		if (skills == null) {
			if (other.skills != null)
				return false;
		} else if (!skills.equals(other.skills))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "EmployeeDetails [id=" + id + ", fname=" + fname + ", lname=" + lname + ", emailid=" + emailid
				+ ", employeeid=" + employeeid + ", designation=" + designation + ", gender=" + gender + ", skills="
				+ skills + ", password=" + password + ", department=" + department + ", salary=" + salary
				+ ", avgsalary=" + avgsalary + ", percentage=" + percentage + "]";
	}
	

	
	

}
