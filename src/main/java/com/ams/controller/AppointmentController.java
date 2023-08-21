package com.ams.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.sql.SQLIntegrityConstraintViolationException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ams.model.Appointment;
import com.ams.service.AppointmentService;
import com.google.gson.Gson;



public class AppointmentController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	String message = "";

	private AppointmentService getAppService() {
		return AppointmentService.getAppService();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String actionType = request.getParameter("actiontype");

		if (actionType.equals("all")) {
			fetchAllApp(request, response);
		} 
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String actionType = request.getParameter("actiontype");

		if (actionType.equals("add")) {
			addApp(request, response);
		} else if (actionType.equals("book")) {
			bookApp(request, response);
		} else if(actionType.equals("cancel")) {
			cancelApp(request, response);
		} else if(actionType.equals("change")) {
			changeAppState(request, response);
		}else if(actionType.equals("delete")) {
			deleteApp(request, response);
		}
	}

	private void addApp(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		Appointment app = new Appointment();

		int adminId = Integer.parseInt(request.getParameter("id"));
		app.setAdminId(adminId);
		app.setCountry(request.getParameter("country"));
		app.setField(request.getParameter("field"));
		app.setState("active");
		app.setSlot(request.getParameter("slot"));
		app.setDate(request.getParameter("date"));
		
		
		try {
			if (getAppService().addApp(app)) {
				message = " Date added Successful!";
				response.getWriter().append(message);
			} else {
				message = "Failed!";
				response.getWriter().append(message);
			}
		} catch (ClassNotFoundException e) {
			message = e.getMessage();
			response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
			response.getWriter().append(message);
		}  catch (SQLIntegrityConstraintViolationException e) {
			 response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
	         response.getWriter().write("Time slot already exists!");
	        
		} catch (SQLException e) {
			message = e.getMessage();
			response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
			response.getWriter().append(message);
		}

	}

	private void bookApp(HttpServletRequest request, HttpServletResponse response) throws IOException  {
		Appointment app = new Appointment();
		app.setSeekerId(Integer.parseInt(request.getParameter("seekerId")));
		app.setState("pending");
		app.setAssigned_date(request.getParameter("assignedDate"));
		app.setId(Integer.parseInt(request.getParameter("id")));


		try {
			if (getAppService().bookApp(app)) {
				message = " Appointment Successful!";
				response.getWriter().append(message);
			} else {
				message = "Appointment Failed!";
				response.getWriter().append(message);
			}
		} catch (ClassNotFoundException e) {
			message = e.getMessage();
			response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
			response.getWriter().append(message);
		}  catch (SQLException e) {
			message = e.getMessage();
			response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
			response.getWriter().append(message);
		}
		

	}

	private void cancelApp(HttpServletRequest request, HttpServletResponse response) throws IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		
		try {
			if(getAppService().cancelApp(id)) {
				message = " Appointment cancelled!";
				response.getWriter().append(message);
			}
			else {
				message = " Failed to cancel the appointment!";
				response.getWriter().append(message);
			}
		} 
		catch (ClassNotFoundException e) {
			message = e.getMessage();
			response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
			response.getWriter().append(message);
		}  catch (SQLException e) {
			message = e.getMessage();
			response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
			response.getWriter().append(message);
		}
	}


	private void fetchAllApp(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
	        List<Appointment> item = getAppService().fetchAllAppsForReports();
	        
	        Gson gson = new Gson();
	        String jsonString = gson.toJson(item);
	        
	        response.getWriter().append(jsonString);
	    } catch (ClassNotFoundException e) {
			message = e.getMessage();
			response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
			response.getWriter().append(message);
		}  catch (SQLException e) {
			message = e.getMessage();
			response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
			response.getWriter().append(message);
		}
	}
	
	
	private void changeAppState(HttpServletRequest request, HttpServletResponse response) throws IOException {
		Appointment app = new Appointment();
		app.setId(Integer.parseInt(request.getParameter("id")));
		app.setState(request.getParameter("state"));

		try {
			if (getAppService().changeAppState(app)) {
				message = " Appointment State Changed!";
				response.getWriter().append(message);
			} else {
				message = "Failed!";
				response.getWriter().append(message);
			}
		} catch (ClassNotFoundException e) {
			message = e.getMessage();
			response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
			response.getWriter().append(message);
		}  catch (SQLException e) {
			message = e.getMessage();
			response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
			response.getWriter().append(message);
		}
	}
	
	
	private void deleteApp(HttpServletRequest request, HttpServletResponse response) throws IOException {
	int id = Integer.parseInt(request.getParameter("id"));
		
		try {
			if(getAppService().deleteApp(id)) {
				message = " Appointment deleted!";
				response.getWriter().append(message);
			}
			else {
				message = " Failed to delete the appointment!";
				response.getWriter().append(message);
			}
		} 
		catch (ClassNotFoundException e) {
			message = e.getMessage();
			response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
			response.getWriter().append(message);
		}  catch (SQLException e) {
			message = e.getMessage();
			response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
			response.getWriter().append(message);
		}


	}

}
