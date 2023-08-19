package com.ams.model;

public class Appointment {
	private int id;
	private String date;
	private String assigned_date;
	private int adminId;
	private int seekerId;
	private String adminName;
	private String seekerName;
	private String slot;
	private String country;
	private String field;
	private String state;
	
	
	public Appointment() {
		
	}
	
	public Appointment(int id, String date, int adminId, int seekerId, String adminName, String seekerName, String slot,
			String country, String field, String state) {
		super();
		this.id = id;
		this.date = date;
		this.adminId = adminId;
		this.seekerId = seekerId;
		this.adminName = adminName;
		this.seekerName = seekerName;
		this.slot = slot;
		this.country = country;
		this.field = field;
		this.state = state;
	}

	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public int getAdminId() {
		return adminId;
	}
	public void setAdminId(int adminId) {
		this.adminId = adminId;
	}
	public int getSeekerId() {
		return seekerId;
	}
	public void setSeekerId(int seekerId) {
		this.seekerId = seekerId;
	}
	public String getSlot() {
		return slot;
	}
	public void setSlot(String slot) {
		this.slot = slot;
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

	public String getAdminName() {
		return adminName;
	}

	public void setAdminName(String adminName) {
		this.adminName = adminName;
	}

	public String getSeekerName() {
		return seekerName;
	}

	public void setSeekerName(String seekerName) {
		this.seekerName = seekerName;
	}





	public String getAssigned_date() {
		return assigned_date;
	}





	public void setAssigned_date(String assigned_date) {
		this.assigned_date = assigned_date;
	}
	
	
	
	
	
}
