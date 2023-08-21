package com.ams.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.ams.dao.dbutils.DbDriverManager;
import com.ams.dao.dbutils.DbDriverManagerFactory;
import com.ams.model.Admin;
import com.ams.model.SuperAdmin;

public class SuperAdminManagerImpl implements SuperAdminManager {

	public SuperAdminManagerImpl() {
	}
	
	private Connection getConnection() throws ClassNotFoundException, SQLException {
		
		DbDriverManagerFactory driverFactory = new DbDriverManagerFactory();
		DbDriverManager driverManager = driverFactory.getDbDriver("MySQL");
		
		return driverManager.getConnection(); 
	}
	
	
	@Override
	public SuperAdmin loginSuperAdmin(String Email, String Passsword) throws SQLException, ClassNotFoundException {
		Connection connection = getConnection();
		String query = "SELECT * FROM super_admin WHERE email=?  AND password=?";
		
		PreparedStatement ps = connection.prepareStatement(query);
		ps.setString(1, Email);
		ps.setString(2, Passsword);
		
		ResultSet rs = ps.executeQuery();
		
		SuperAdmin sp =new SuperAdmin();
		
		while(rs.next()) {
			sp.setId(rs.getInt("id"));
			sp.setName(rs.getString("name"));
			sp.setEmail(rs.getString("email"));
			sp.setNumber(rs.getString("number"));
			sp.setPassword(rs.getString("password"));

		}
		
		ps.close();	
		connection.close();		
		return sp;
	}

	@Override
	public boolean editAdmin(SuperAdmin sa) throws SQLException, ClassNotFoundException {
		Connection connection = getConnection();
		String query = "UPDATE super_admin SET name=?, email=?,number=?,password=? WHERE id=?";
		
		PreparedStatement ps = connection.prepareStatement(query);
		ps.setString(1, sa.getName());
		ps.setString(2, sa.getEmail());
		ps.setString(3, sa.getNumber());
		ps.setString(4, sa.getPassword());
		ps.setInt(5, sa.getId());
		
		boolean result = false;		
		if(ps.executeUpdate() > 0)
			result = true;
		
		ps.close();
		connection.close();
		
		return result;
	}

	@Override
	public SuperAdmin fetchSingleAdmin(int adminId) throws SQLException, ClassNotFoundException {
		Connection connection = getConnection();
		String query = "SELECT * FROM super_admin WHERE id=?";
		
		PreparedStatement ps = connection.prepareStatement(query);
		ps.setInt(1, adminId);
		
		ResultSet rs = ps.executeQuery();
		
		SuperAdmin sa =new SuperAdmin();
		
		while(rs.next()) {
			sa.setId(rs.getInt("id"));
			sa.setName(rs.getString("name"));
			sa.setEmail(rs.getString("email"));
			sa.setNumber(rs.getString("number"));
			sa.setPassword(rs.getString("password"));
		}
		
		ps.close();
		connection.close();		
		return sa;
	}

}
