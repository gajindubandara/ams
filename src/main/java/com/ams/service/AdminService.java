package com.ams.service;

import java.sql.SQLException;
import java.util.List;

import com.ams.dao.AdminManager;
import com.ams.dao.AdminManagerImpl;
import com.ams.model.Admin;

public class AdminService {

	private static AdminService adminServiceObj;

	private AdminService() {
		
	}
	
	public synchronized static AdminService getAdminService() {
		
		if(adminServiceObj == null) {
			adminServiceObj = new AdminService();
		}
		
		return adminServiceObj;
	}
	
	private AdminManager getAdminManager() {
		return new AdminManagerImpl();
	}
	
	public boolean addJobSeeker(Admin admin) throws ClassNotFoundException, SQLException {
		return getAdminManager().addAdmin(admin);
	}
	
	public boolean editJobSeeker(Admin admin) throws ClassNotFoundException, SQLException {
		return getAdminManager().editAdmin(admin);
	}
	
	public boolean deleteJobSeeker(int adminId) throws ClassNotFoundException, SQLException {
		return getAdminManager().deleteAdmin(adminId);
	}
	
	public Admin fetchSingleJobSeeker(int adminId) throws ClassNotFoundException, SQLException {
		return getAdminManager().fetchSingleAdmin(adminId);
	}
	
	public List<Admin> fetchAllJobSeekers() throws ClassNotFoundException, SQLException {
		return getAdminManager().fetchAllAdmins();
	}
}
