package com.ams.dao.dbutils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;


public class DbDriverManagerMySqlImpl implements DbDriverManager {

	public Connection getConnection() throws ClassNotFoundException, SQLException {	

		Class.forName("com.mysql.jdbc.Driver");
		
		String url = "jdbc:mysql://127.0.0.1:3306/ams";
		String userName = "root";
		String password = "1234";
		
		return DriverManager.getConnection(url, userName, password);
	}

}
