package com.ams.model;

public class Admin extends User {
	
	private String country;
	private String field;
	private String dates;
	private String slots;
	
	
	public Admin() {}
	
	public Admin(String country, String field, String dates, String slots) {
		super();
		this.country = country;
		this.field = field;
		this.dates = dates;
		this.slots = slots;
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

	public String getDates() {
		return dates;
	}

	public void setDates(String dates) {
		this.dates = dates;
	}

	public String getSlots() {
		return slots;
	}

	public void setSlots(String slots) {
		this.slots = slots;
	}
	
	
	

}
