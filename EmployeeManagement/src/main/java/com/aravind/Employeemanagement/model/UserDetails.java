package com.aravind.Employeemanagement.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.validation.constraints.NotEmpty;

@Entity
@Table(name="user")
public class UserDetails {
	
	@Column
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	@NotEmpty
	@Column(name="username")
	private String uname;
	@NotEmpty
	@Column(name="email")
	private String emailid;
	@NotEmpty
	@Column(name="password")
	private String password;
	@Transient
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
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((emailid == null) ? 0 : emailid.hashCode());
		result = prime * result + ((password == null) ? 0 : password.hashCode());
		result = prime * result + ((rpassword == null) ? 0 : rpassword.hashCode());
		result = prime * result + ((uname == null) ? 0 : uname.hashCode());
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
		UserDetails other = (UserDetails) obj;
		if (emailid == null) {
			if (other.emailid != null)
				return false;
		} else if (!emailid.equals(other.emailid))
			return false;
		if (password == null) {
			if (other.password != null)
				return false;
		} else if (!password.equals(other.password))
			return false;
		if (rpassword == null) {
			if (other.rpassword != null)
				return false;
		} else if (!rpassword.equals(other.rpassword))
			return false;
		if (uname == null) {
			if (other.uname != null)
				return false;
		} else if (!uname.equals(other.uname))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "UserDetails [uname=" + uname + ", emailid=" + emailid + ", password=" + password + ", rpassword="
				+ rpassword + "]";
	}
	
}
