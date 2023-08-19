package com.ams.model;

public class Admin extends User {
	
	private String country;
	private String field;

	
	public Admin() {}
	
	public Admin(String country, String field) {
		super();
		this.country = country;
		this.field = field;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public String getField() {
		return field;
	}

	public void setField(String field) {
		this.field = field;
	}


}
