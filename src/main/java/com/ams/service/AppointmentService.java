package com.ams.service;

import java.sql.SQLException;
import java.util.List;
import com.ams.dao.AppointmentManager;
import com.ams.dao.AppointmentManagerImpl;
import com.ams.model.Appointment;

public class AppointmentService {

	private static AppointmentService appServiceObj;

	private AppointmentService() {
		
	}
	
	public synchronized static AppointmentService getAppService() {
		
		if(appServiceObj == null) {
			appServiceObj = new AppointmentService();
		}
		
		return appServiceObj;
	}
	
	private AppointmentManager getAppManager() {
		return new AppointmentManagerImpl();
	}
	
	public boolean addApp(Appointment app) throws ClassNotFoundException, SQLException {
		return getAppManager().addAppointment(app);
	}
	
	public boolean bookApp(Appointment app) throws ClassNotFoundException, SQLException {
		return getAppManager().bookAppointment(app);
	}
	
	public boolean changeAppState(Appointment app) throws ClassNotFoundException, SQLException {
		return getAppManager().changeAppointmentState(app);
	}
	
	public Appointment fetchSingleApp(int id) throws ClassNotFoundException, SQLException {
		return getAppManager().fetchSingleAppointment(id);
	}
	
	public Appointment fetchSingleAppForTestng(String slot) throws ClassNotFoundException, SQLException {
		return getAppManager().fetchSingleAppForTesting(slot);
	}
	
	public boolean deleteApp(int id) throws ClassNotFoundException, SQLException {
		return getAppManager().deleteAppointment(id);
	}
	
	public List<Appointment> fetchAllApps() throws ClassNotFoundException, SQLException {
		return getAppManager().fetchAllAppointment();
	}
	
	public List<Appointment> fetchAllAppsForReports() throws ClassNotFoundException, SQLException {
		return getAppManager().fetchAllAppointmentForReports();
	}
	
	public boolean cancelApp(int id) throws ClassNotFoundException, SQLException {
		return getAppManager().cancelAppointment(id);
	}
}
