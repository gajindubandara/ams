package com.ams.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.ams.model.Appointment;

public interface AppointmentManager {
	public boolean addAppointment(Appointment app) throws SQLException, ClassNotFoundException;
	
	public boolean bookAppointment(Appointment app) throws SQLException, ClassNotFoundException;
	
	public boolean changeAppointmentState(Appointment app) throws SQLException, ClassNotFoundException;
	
	public boolean deleteAppointment(int id) throws SQLException, ClassNotFoundException;
	
	public boolean cancelAppointment(int id) throws SQLException, ClassNotFoundException;
	
	public Appointment fetchSingleAppointment(int id) throws SQLException, ClassNotFoundException;
	
	public List<Appointment> fetchAllAppointment() throws SQLException, ClassNotFoundException;
	
	public List<Appointment> fetchAllAppointmentForReports() throws SQLException, ClassNotFoundException;
}
