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
	
	public boolean addAdmin(Admin admin) throws ClassNotFoundException, SQLException {
		return getAdminManager().addAdmin(admin);
	}
	
	public boolean editAdmin(Admin admin) throws ClassNotFoundException, SQLException {
		return getAdminManager().editAdmin(admin);
	}
	
	public boolean deleteAdmin(int adminId) throws ClassNotFoundException, SQLException {
		return getAdminManager().deleteAdmin(adminId);
	}
	
	public Admin fetchSingleAdmin(int adminId) throws ClassNotFoundException, SQLException {
		return getAdminManager().fetchSingleAdmin(adminId);
	}
	
	public List<Admin> fetchAllAdmins() throws ClassNotFoundException, SQLException {
		return getAdminManager().fetchAllAdmins();
	}
	
	public Admin loginAdmin(String adminEmail, String adminPassword) throws ClassNotFoundException, SQLException {
		return getAdminManager().loginAdmin(adminEmail, adminPassword);
	}
}
