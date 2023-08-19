package com.ams.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.ams.dao.dbutils.DbDriverManager;
import com.ams.dao.dbutils.DbDriverManagerFactory;
import com.ams.model.Admin;

public class AdminManagerImpl implements AdminManager {
	
	public AdminManagerImpl() {
	}
	
	private Connection getConnection() throws ClassNotFoundException, SQLException {
		
		DbDriverManagerFactory driverFactory = new DbDriverManagerFactory();
		DbDriverManager driverManager = driverFactory.getDbDriver("MySQL");
		
		return driverManager.getConnection(); 
	}

	@Override
	public boolean addAdmin(Admin admin) throws SQLException, ClassNotFoundException {
		Connection connection = getConnection();

		String query = "INSERT INTO admins  (name, email,number,password,field) VALUES (?,?,?,?,?)";
		PreparedStatement ps = connection.prepareStatement(query);
		ps.setString(1, admin.getName());
		ps.setString(2, admin.getEmail());
		ps.setString(3, admin.getNumber());
		ps.setString(4, admin.getPassword());
		ps.setString(5, admin.getField());

		boolean result = false;
		
		if(ps.executeUpdate() > 0)
			result = true;		
		
		ps.close();
		connection.close();		
		return result;
	}

	@Override
	public boolean editAdmin(Admin admin) throws SQLException, ClassNotFoundException {
		Connection connection = getConnection();
		String query = "UPDATE admins SET name=?, email=?,number=?,password=?,field=? WHERE admin_id=?";
		
		PreparedStatement ps = connection.prepareStatement(query);
		ps.setString(1, admin.getName());
		ps.setString(2, admin.getEmail());
		ps.setString(3, admin.getNumber());
		ps.setString(4, admin.getPassword());
		ps.setString(5, admin.getField());
		ps.setInt(6, admin.getId());
		
		boolean result = false;		
		if(ps.executeUpdate() > 0)
			result = true;
		
		ps.close();
		connection.close();
		
		return result;
	}

	@Override
	public boolean deleteAdmin(int adminId) throws SQLException, ClassNotFoundException {
		Connection connection = getConnection();
		String query = "DELETE FROM admins WHERE admin_id=?";
		
		PreparedStatement ps = connection.prepareStatement(query);
		ps.setInt(1, adminId);
		
		boolean result = false;
		if(ps.executeUpdate() > 0) {
			result = true;
		}
		
		ps.close();
		connection.close();
		
		return result;
	}

	@Override
	public Admin fetchSingleAdmin(int adminId) throws SQLException, ClassNotFoundException {
		Connection connection = getConnection();
		String query = "SELECT * FROM admins WHERE admin_id=?";
		
		PreparedStatement ps = connection.prepareStatement(query);
		ps.setInt(1, adminId);
		
		ResultSet rs = ps.executeQuery();
		
		Admin admin =new Admin();
		
		while(rs.next()) {
			admin.setId(rs.getInt("seeker_id"));
			admin.setName(rs.getString("name"));
			admin.setEmail(rs.getString("email"));
			admin.setNumber(rs.getString("number"));
			admin.setField(rs.getString("field"));
		}
		
		ps.close();
		connection.close();		
		return admin;
	}

	@Override
	public List<Admin> fetchAllAdmins() throws SQLException, ClassNotFoundException {
		Connection connection = getConnection();
		
		String query = "SELECT * FROM admins";
		Statement st = connection.createStatement();
		
		List<Admin> list = new ArrayList<Admin>();
		
		ResultSet rs = st.executeQuery(query);
		while(rs.next()) {
			
			Admin admin =new Admin();
			admin.setId(rs.getInt("seeker_id"));
			admin.setName(rs.getString("name"));
			admin.setEmail(rs.getString("email"));
			admin.setNumber(rs.getString("number"));
			admin.setField(rs.getString("field"));
			
			list.add(admin);
		}
		
		st.close();
		connection.close();
		
		return list;
	}

}
