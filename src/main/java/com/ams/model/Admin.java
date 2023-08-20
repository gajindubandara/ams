package com.ams.model;

public class Admin extends User {
	
	private String country;
	private String field;
	private String state;

	
	public Admin() {}

	public Admin(String country, String field, String state) {
		super();
		this.country = country;
		this.field = field;
		this.state = state;
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



	public String getState() {
		return state;
	}



	public void setState(String state) {
		this.state = state;
	}

	

}
