package com.aravind.employeemanagement.model;


import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table(name="user")
public class UserDetails {
	
	

	private Integer id;


	private String uname;

	private String emailid;

	private String password;

	private String rpassword;
	
	public UserDetails() {
		super();
	}
	
	public UserDetails(Integer id, String uname, String emailid, String password) {
		super();
		this.id = id;
		this.uname = uname;
		this.emailid = emailid;
		this.password = password;
	}

	public UserDetails(Integer id, String uname, String emailid, String password, String rpassword) {
		super();
		this.id = id;
		this.uname = uname;
		this.emailid = emailid;
		this.password = password;
		this.rpassword = rpassword;
	}

	
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getUname() {
		return uname;
	}

	public void setUname(String uname) {
		this.uname = uname;
	}

	public String getEmailid() {
		return emailid;
	}

	public void setEmailid(String emailid) {
		this.emailid = emailid;
	}

	public String getpassword() {
		return password;
	}

	public void setpassword(String password) {
		this.password = password;
	}

	public String getRpassword() {
		return rpassword;
	}

	public void setRpassword(String rpassword) {
		this.rpassword = rpassword;
	}
	


	@Override
	public String toString() {
		return "UserDetails [uname=" + uname + ", emailid=" + emailid + ", password=" + password + ", rpassword="
				+ rpassword + "]";
	}
	
}
