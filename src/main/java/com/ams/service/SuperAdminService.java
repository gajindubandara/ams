package com.ams.service;

import java.sql.SQLException;

import com.ams.dao.SuperAdminManager;
import com.ams.dao.SuperAdminManagerImpl;
import com.ams.model.SuperAdmin;

public class SuperAdminService {
	
	private static SuperAdminService superAdminServiceObj;

	private SuperAdminService() {
		
	}
	
	public synchronized static SuperAdminService getSuperAdminService() {
		
		if(superAdminServiceObj == null) {
			superAdminServiceObj = new SuperAdminService();
		}
		
		return superAdminServiceObj;
	}
	
	
	private SuperAdminManager getSuperAdminManager() {
		return new SuperAdminManagerImpl();
	}
	
	
	public SuperAdmin loginSuperAdmin(String email, String password) throws ClassNotFoundException, SQLException {
		return getSuperAdminManager().loginSuperAdmin(email, password);
	}
	
	public boolean editAdmin(SuperAdmin sa) throws ClassNotFoundException, SQLException {
		return getSuperAdminManager().editAdmin(sa);
	}
		
	public SuperAdmin fetchSingleSuperAdmin(int adminId) throws ClassNotFoundException, SQLException {
		return getSuperAdminManager().fetchSingleAdmin(adminId);
	}

}
