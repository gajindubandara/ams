package com.ams.dao;

import java.sql.SQLException;
import java.util.List;

import com.ams.model.Admin;



public interface AdminManager {
public boolean addAdmin(Admin admin) throws SQLException, ClassNotFoundException;
	
	public boolean editAdmin(Admin admin) throws SQLException, ClassNotFoundException;
	
	public boolean deleteAdmin(int adminId) throws SQLException, ClassNotFoundException;
	
	public Admin fetchSingleAdmin(int adminId) throws SQLException, ClassNotFoundException;
	
	public List<Admin> fetchAllAdmins() throws SQLException, ClassNotFoundException;
	
	public Admin loginAdmin(String adminEmail, String adminPasssword) throws SQLException, ClassNotFoundException;

}
