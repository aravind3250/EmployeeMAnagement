package com.aravind.Employeemanagement.model;

public class Departmentempsalbean {
	
	private Integer totalemployee;
	private Integer totalsalary;
	private String departments;
	
	public Departmentempsalbean() {
		super();
	}

	public Departmentempsalbean(Integer totalemployee, Integer totalsalary, String departments) {
		super();
		this.totalemployee = totalemployee;
		this.totalsalary = totalsalary;
		this.departments = departments;
	}

	public Integer getTotalemployee() {
		return totalemployee;
	}

	public void setTotalemployee(Integer totalemployee) {
		this.totalemployee = totalemployee;
	}

	public Integer getTotalsalary() {
		return totalsalary;
	}

	public void setTotalsalary(Integer totalsalary) {
		this.totalsalary = totalsalary;
	}

	public String getDepartments() {
		return departments;
	}

	public void setDepartments(String departments) {
		this.departments = departments;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((departments == null) ? 0 : departments.hashCode());
		result = prime * result + ((totalemployee == null) ? 0 : totalemployee.hashCode());
		result = prime * result + ((totalsalary == null) ? 0 : totalsalary.hashCode());
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
		Departmentempsalbean other = (Departmentempsalbean) obj;
		if (departments == null) {
			if (other.departments != null)
				return false;
		} else if (!departments.equals(other.departments))
			return false;
		if (totalemployee == null) {
			if (other.totalemployee != null)
				return false;
		} else if (!totalemployee.equals(other.totalemployee))
			return false;
		if (totalsalary == null) {
			if (other.totalsalary != null)
				return false;
		} else if (!totalsalary.equals(other.totalsalary))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "Departmentempsalbean [totalemployee=" + totalemployee + ", totalsalary=" + totalsalary
				+ ", departments=" + departments + "]";
	}
	
	
	

}
