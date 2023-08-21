package com.ams.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.sql.SQLIntegrityConstraintViolationException;
import java.util.List;


import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ams.model.Admin;
import com.ams.service.AdminService;
import com.google.gson.Gson;



public class AdminController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	String message = "";

	private AdminService getAdminService() {
		return AdminService.getAdminService();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String actionType = request.getParameter("actiontype");

		if (actionType.equals("getAllConsultants")) {
			fetchAllAdmins(request, response);
		}
		else if (actionType.equals("login")) {
			loginSingleAdmin(request, response);
		}else if (actionType.equals("getAdmin")) {
			fetchSingleAdmin(request, response);
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String actionType = request.getParameter("actiontype");

		if (actionType.equals("add")) {
			addAdmin(request, response);
		} else if (actionType.equals("edit")) {
			editAdmin(request, response);
		} else if(actionType.equals("change")) {
			changeAdminState(request, response);
		}
	}

	private void addAdmin(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		Admin admin = new Admin();
		admin.setName(request.getParameter("name"));
		admin.setEmail(request.getParameter("email"));
		admin.setNumber(request.getParameter("number"));
		admin.setEmail(request.getParameter("email"));
		admin.setPassword(request.getParameter("password"));
		admin.setField(request.getParameter("field"));
		admin.setCountry(request.getParameter("country"));;
		

		try {
			if (getAdminService().addAdmin(admin)) {
				message = " Registration Successful!";
				response.getWriter().append(message);
			} else {
				message = "Registration Failed!";
				response.getWriter().append(message);
			}
		} catch (ClassNotFoundException e) {
			message = e.getMessage();
			response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
			response.getWriter().append(message);
		} catch (SQLIntegrityConstraintViolationException e) {
			 response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
	         response.getWriter().write("There is an existing admin for this email!");
	        
		} catch (SQLException e) {
			message = e.getMessage();
			response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
			response.getWriter().append(message);
		}

	}

	private void editAdmin(HttpServletRequest request, HttpServletResponse response) throws IOException {
		Admin admin = new Admin();

		admin.setName(request.getParameter("name"));
		admin.setEmail(request.getParameter("email"));
		admin.setNumber(request.getParameter("number"));
		admin.setPassword(request.getParameter("password"));
		admin.setField(request.getParameter("field"));
		admin.setCountry(request.getParameter("country"));
		
		admin.setId(Integer.parseInt(request.getParameter("id")));
		


		try {
			if (getAdminService().editAdmin(admin)) {
				message = " Profile Updated!";
				response.getWriter().append(message);
			} else {
				message = "Failed to Update Profile!";
				response.getWriter().append(message);
			}
		} catch (ClassNotFoundException e) {
			message = e.getMessage();
			response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
			response.getWriter().append(message);
		} 
		 catch (SQLIntegrityConstraintViolationException e) {
			 response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
	         response.getWriter().write("There is an existing admin for this email!");
	        
		} catch (SQLException e) {
			message = e.getMessage();
			response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
			response.getWriter().append(message);
		}
	}

	private void fetchSingleAdmin(HttpServletRequest request, HttpServletResponse response) throws IOException {
		int id = Integer.parseInt(request.getParameter("adminId"));
		
		try {
			Admin admin = getAdminService().fetchSingleAdmin(id);
			if (admin.getId() > 0) {

				Gson gson = new Gson();
				String jsonString = gson.toJson(admin);
				response.getWriter().append(jsonString);

			} else {
				response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
		        response.getWriter().write("Invalid ID!");
			}
		} catch (ClassNotFoundException | SQLException e) {
			message = e.getMessage();
			response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
			response.getWriter().append(message);
		}

	}

	private void fetchAllAdmins(HttpServletRequest request, HttpServletResponse response) throws IOException {
		try {
	        List<Admin> item = getAdminService().fetchAllAdmins();

	        
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
	
	
	private void loginSingleAdmin(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String email = request.getParameter("email");
		String password = request.getParameter("password");

		try {
			Admin admin = getAdminService().loginAdmin(email, password);
			if (admin.getId() > 0) {

				Gson gson = new Gson();
				String jsonString = gson.toJson(admin);
				response.getWriter().append(jsonString);

			} else {
				message = "Invalid email or password";
				response.sendError(HttpServletResponse.SC_UNAUTHORIZED, message);
			}
		} catch (ClassNotFoundException | SQLException e) {
			message = e.getMessage();
			response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
			response.getWriter().append(message);
		}

	}
	
	
	private void changeAdminState(HttpServletRequest request, HttpServletResponse response) throws IOException {
		Admin admin = new Admin();
		admin.setId(Integer.parseInt(request.getParameter("id")));
		admin.setState(request.getParameter("state"));

		try {
			if (getAdminService().changeAdminState(admin)) {
				message = " Admin State Changed!";
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

}
