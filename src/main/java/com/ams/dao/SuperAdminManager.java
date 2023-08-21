package com.ams.dao;

import java.sql.SQLException;

import com.ams.model.Admin;
import com.ams.model.SuperAdmin;

public interface SuperAdminManager {
	public SuperAdmin loginSuperAdmin(String Email, String Passsword) throws SQLException, ClassNotFoundException;
	
	public boolean editAdmin(SuperAdmin sa) throws SQLException, ClassNotFoundException;
		
	public SuperAdmin fetchSingleAdmin(int adminId) throws SQLException, ClassNotFoundException;
}
