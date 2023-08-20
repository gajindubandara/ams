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
import com.ams.model.Appointment;

public class AppointmentManagerImpl implements AppointmentManager {

	
	public AppointmentManagerImpl() {
	}
	
	private Connection getConnection() throws ClassNotFoundException, SQLException {
		
		DbDriverManagerFactory driverFactory = new DbDriverManagerFactory();
		DbDriverManager driverManager = driverFactory.getDbDriver("MySQL");
		
		return driverManager.getConnection(); 
	}
	
	@Override
	public boolean addAppointment(Appointment app) throws SQLException, ClassNotFoundException {
		Connection connection = getConnection();

		String query = "INSERT INTO appointment  (admin_id,country,field,state,slot,date) VALUES (?,?,?,?,?,?)";
		PreparedStatement ps = connection.prepareStatement(query);
		ps.setInt(1, app.getAdminId());
		ps.setString(2, app.getCountry());
		ps.setString(3, app.getField());
		ps.setString(4, app.getState());
		ps.setString(5, app.getSlot());
		ps.setString(6, app.getDate());

		boolean result = false;
		
		if(ps.executeUpdate() > 0)
			result = true;		
		
		ps.close();
		connection.close();		
		return result;
	}

	@Override
	public boolean bookAppointment(Appointment app) throws SQLException, ClassNotFoundException {
		Connection connection = getConnection();
		String query = "UPDATE appointment SET seeker_id=?,state=?,assigned_date=? WHERE id=?";
		
		PreparedStatement ps = connection.prepareStatement(query);
		ps.setInt(1, app.getSeekerId());
		ps.setString(2, app.getState());
		ps.setString(3, app.getAssigned_date());
		ps.setInt(4, app.getId());
		
		boolean result = false;		
		if(ps.executeUpdate() > 0)
			result = true;
		
		ps.close();
		connection.close();
		
		return result;
	}
	
	@Override
	public boolean changeAppointmentState(Appointment app) throws SQLException, ClassNotFoundException {
		Connection connection = getConnection();
		String query = "UPDATE appointment SET state=? WHERE id=?";
		
		PreparedStatement ps = connection.prepareStatement(query);
		ps.setString(1, app.getState());
		ps.setInt(2, app.getId());
		
		boolean result = false;		
		if(ps.executeUpdate() > 0)
			result = true;
		
		ps.close();
		connection.close();
		
		return result;
	}

	@Override
	public Appointment fetchSingleAppointment(int id) throws SQLException, ClassNotFoundException {
		Connection connection = getConnection();
		String query = "SELECT * FROM appointment WHERE id=?";
		
		PreparedStatement ps = connection.prepareStatement(query);
		ps.setInt(1, id);
		
		ResultSet rs = ps.executeQuery();
		
		Appointment app =new Appointment();
		
		while(rs.next()) {
			app.setId(rs.getInt("seeker_id"));
			app.setDate(rs.getString("date"));
			app.setAdminId(rs.getInt("admin_id"));
			app.setSeekerId(rs.getInt("seeker_id"));
			app.setSlot(rs.getString("slot"));
			app.setCountry(rs.getString("country"));
			app.setField(rs.getString("field"));
			app.setState(rs.getString("state"));
			app.setAssigned_date(rs.getString("assigned_date"));
		}
		
		ps.close();
		connection.close();		
		return app;
	}

	@Override
	public List<Appointment> fetchAllAppointment() throws SQLException, ClassNotFoundException {
		Connection connection = getConnection();
		
		String query = "SELECT * FROM appointment";
		Statement st = connection.createStatement();
		
		List<Appointment> list = new ArrayList<Appointment>();
		
		ResultSet rs = st.executeQuery(query);
		while(rs.next()) {
			
			Appointment app =new Appointment();
			app.setId(rs.getInt("seeker_id"));
			app.setDate(rs.getString("date"));
			app.setAdminId(rs.getInt("admin_id"));
			app.setSeekerId(rs.getInt("seeker_id"));
			app.setSlot(rs.getString("slot"));
			app.setCountry(rs.getString("country"));
			app.setField(rs.getString("field"));
			app.setState(rs.getString("state"));
			app.setAssigned_date(rs.getString("assigned_date"));
			
			list.add(app);
		}
		
		st.close();
		connection.close();
		
		return list;
	}

	@Override
	public List<Appointment> fetchAllAppointmentForReports() throws SQLException, ClassNotFoundException {
		Connection connection = getConnection();

		String query = "SELECT a.id AS appointment_id, a.date, a.slot, a.country, a.field, a.state, a.assigned_date, a.admin_id, " +
		               "adm.name AS admin_name, a.seeker_id, js.name AS seeker_name " +
		               "FROM appointment a " +
		               "LEFT JOIN admins adm ON a.admin_id = adm.admin_id " +
		               "LEFT JOIN job_seekers js ON a.seeker_id = js.seeker_id";

		Statement st = connection.createStatement();

		List<Appointment> list = new ArrayList<Appointment>();

		ResultSet rs = st.executeQuery(query);
		while (rs.next()) {
		    Appointment app = new Appointment();
		    app.setId(rs.getInt("appointment_id"));
		    app.setDate(rs.getString("date"));
		    app.setSlot(rs.getString("slot"));
		    app.setCountry(rs.getString("country"));
		    app.setField(rs.getString("field"));
		    app.setState(rs.getString("state"));
		    app.setAdminId(rs.getInt("admin_id"));
		    app.setAdminName(rs.getString("admin_name"));
		    app.setSeekerId(rs.getInt("seeker_id"));
		    app.setSeekerName(rs.getString("seeker_name"));
		    app.setAssigned_date(rs.getString("assigned_date"));
		    

		    list.add(app);
		}

		rs.close();
		st.close();
		connection.close();

		return list;

	}

	@Override
	public boolean cancelAppointment(int id) throws SQLException, ClassNotFoundException {
		Connection connection = getConnection();
		String query = "UPDATE appointment SET `seeker_id` = NULL,assigned_date=NULL, state=? WHERE id=?";
		
		PreparedStatement ps = connection.prepareStatement(query);
		ps.setString(1, "active");
		ps.setInt(2, id);

		
		boolean result = false;		
		if(ps.executeUpdate() > 0)
			result = true;
		
		ps.close();
		connection.close();
		
		return result;
	}

	@Override
	public boolean deleteAppointment(int id) throws SQLException, ClassNotFoundException {
		Connection connection = getConnection();
		String query = "DELETE FROM appointment WHERE id=?";
		
		PreparedStatement ps = connection.prepareStatement(query);
		ps.setInt(1, id);
		
		boolean result = false;
		if(ps.executeUpdate() > 0) {
			result = true;
		}
		
		ps.close();
		connection.close();
		
		return result;
	}

	

}
