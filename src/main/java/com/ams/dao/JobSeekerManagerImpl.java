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
import com.ams.model.JobSeeker;


public class JobSeekerManagerImpl implements JobSeekerManager {

	public JobSeekerManagerImpl() {
	}
	
	private Connection getConnection() throws ClassNotFoundException, SQLException {
		
		DbDriverManagerFactory driverFactory = new DbDriverManagerFactory();
		DbDriverManager driverManager = driverFactory.getDbDriver("MySQL");
		
		return driverManager.getConnection(); 
	}
	
	
	@Override
	public boolean addJobSeeker(JobSeeker jobSeeker) throws SQLException, ClassNotFoundException {
		Connection connection = getConnection();

		String query = "INSERT INTO job_seekers  (name, email,number,password,field) VALUES (?,?,?,?,?)";
		PreparedStatement ps = connection.prepareStatement(query);
		ps.setString(1, jobSeeker.getName());
		ps.setString(2, jobSeeker.getEmail());
		ps.setString(3, jobSeeker.getNumber());
		ps.setString(4, jobSeeker.getPassword());
		ps.setString(5, jobSeeker.getField());
		boolean result = false;
		
		if(ps.executeUpdate() > 0)
			result = true;		
		
		ps.close();
		connection.close();		
		return result;
	}

	@Override
	public boolean editJobSeeker(JobSeeker jobSeeker) throws SQLException, ClassNotFoundException {
		Connection connection = getConnection();
		String query = "UPDATE job_seekers SET name=?, email=?,number=?,password=?,field=? WHERE seeker_id=?";
		
		PreparedStatement ps = connection.prepareStatement(query);
		ps.setString(1, jobSeeker.getName());
		ps.setString(2, jobSeeker.getEmail());
		ps.setString(3, jobSeeker.getNumber());
		ps.setString(4, jobSeeker.getPassword());
		ps.setString(5, jobSeeker.getField());
		ps.setInt(6, jobSeeker.getId());
		
		boolean result = false;		
		if(ps.executeUpdate() > 0)
			result = true;
		
		ps.close();
		connection.close();
		
		return result;
	}

	@Override
	public boolean deleteJobSeeker(int jobSeekerId) throws SQLException, ClassNotFoundException {
		Connection connection = getConnection();
		String query = "DELETE FROM job_seekers WHERE seeker_id=?";
		
		PreparedStatement ps = connection.prepareStatement(query);
		ps.setInt(1, jobSeekerId);
		
		boolean result = false;
		if(ps.executeUpdate() > 0) {
			result = true;
		}
		
		ps.close();
		connection.close();
		
		return result;
	}

	@Override
	public JobSeeker fetchSingleJobSeeker(int jobSeekerId) throws SQLException, ClassNotFoundException {
		Connection connection = getConnection();
		String query = "SELECT * FROM job_seekers WHERE seeker_id=?";
		
		PreparedStatement ps = connection.prepareStatement(query);
		ps.setInt(1, jobSeekerId);
		
		ResultSet rs = ps.executeQuery();
		
		JobSeeker js =new JobSeeker();
		
		while(rs.next()) {
			js.setId(rs.getInt("seeker_id"));
			js.setName(rs.getString("name"));
			js.setEmail(rs.getString("email"));
			js.setNumber(rs.getString("number"));
			js.setField(rs.getString("field"));
			js.setPassword(rs.getString("password"));
		}
		
		ps.close();
		connection.close();		
		return js;
	}

	@Override
	public List<JobSeeker> fetchAllJobSeekers() throws SQLException, ClassNotFoundException {
		Connection connection = getConnection();
		
		String query = "SELECT * FROM job_seekers";
		Statement st = connection.createStatement();
		
		List<JobSeeker> list = new ArrayList<JobSeeker>();
		
		ResultSet rs = st.executeQuery(query);
		while(rs.next()) {
			
			JobSeeker js = new JobSeeker();
			js.setId(rs.getInt("seeker_id"));
			js.setName(rs.getString("name"));
			js.setEmail(rs.getString("email"));
			js.setNumber(rs.getString("number"));
			js.setField(rs.getString("field"));
			
			list.add(js);
		}
		
		st.close();
		connection.close();
		
		return list;
	}

	@Override
	public JobSeeker loginJobSeeker(String jobSeekerEmail,String jobSeekerPassword) throws SQLException, ClassNotFoundException {
		Connection connection = getConnection();
		String query = "SELECT * FROM job_seekers WHERE email=?  AND password=?";
		
		PreparedStatement ps = connection.prepareStatement(query);
		ps.setString(1, jobSeekerEmail);
		ps.setString(2, jobSeekerPassword);
		
		ResultSet rs = ps.executeQuery();
		
		JobSeeker js =new JobSeeker();
		
		while(rs.next()) {
			js.setId(rs.getInt("seeker_id"));
			js.setName(rs.getString("name"));
			js.setEmail(rs.getString("email"));
			js.setNumber(rs.getString("number"));
			js.setField(rs.getString("field"));
			js.setPassword(rs.getString("password"));
		}
		
		ps.close();
		connection.close();		
		return js;
	}

}
