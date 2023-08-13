package com.ams.model;

public class JobSeeker extends User {
	private String field;

	public JobSeeker() {
	}

	public JobSeeker(String field) {
		super();
		this.field = field;
	}

	public String getField() {
		return field;
	}

	public void setField(String field) {
		this.field = field;
	}

}
