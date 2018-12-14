package com.aravind.Employeemanagement.model;

public class UserDetails {
	
	private String uname;
	private String emailid;
	private String pasword;
	private String rpassword;
	
	public UserDetails() {
		super();
	}

	public UserDetails(String uname, String emailid, String pasword, String rpassword) {
		super();
		this.uname = uname;
		this.emailid = emailid;
		this.pasword = pasword;
		this.rpassword = rpassword;
	}

	public UserDetails(String uname, String emailid, String pasword) {
		super();
		this.uname = uname;
		this.emailid = emailid;
		this.pasword = pasword;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((emailid == null) ? 0 : emailid.hashCode());
		result = prime * result + ((pasword == null) ? 0 : pasword.hashCode());
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
		if (pasword == null) {
			if (other.pasword != null)
				return false;
		} else if (!pasword.equals(other.pasword))
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
		return "UserDetails [uname=" + uname + ", emailid=" + emailid + ", pasword=" + pasword + ", rpassword="
				+ rpassword + "]";
	}
	
}
