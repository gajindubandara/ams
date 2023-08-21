package com.ams.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.sql.SQLIntegrityConstraintViolationException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ams.model.Admin;
import com.ams.model.SuperAdmin;
import com.ams.service.SuperAdminService;
import com.google.gson.Gson;


public class SuperAdminController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	String message = "";

	private SuperAdminService getSuperAdminService() {
		return SuperAdminService.getSuperAdminService();
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String actionType = request.getParameter("actiontype");

		if (actionType.equals("login")) {
			loginSingleSuperAdmin(request, response);
		}else if (actionType.equals("getSuperAdmin")) {
			fetchSingleSuperAdmin(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String actionType = request.getParameter("actiontype");
		if (actionType.equals("edit")) {
			editSuperAdmin(request, response);
		} 
	}
	
	
	private void loginSingleSuperAdmin(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String email = request.getParameter("email");
		String password = request.getParameter("password");

		try {
			SuperAdmin sp = getSuperAdminService().loginSuperAdmin(email, password);
			if (sp.getId() > 0) {

				Gson gson = new Gson();
				String jsonString = gson.toJson(sp);
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
	
	private void editSuperAdmin(HttpServletRequest request, HttpServletResponse response) throws IOException {
		SuperAdmin sa = new SuperAdmin();

		sa.setName(request.getParameter("name"));
		sa.setEmail(request.getParameter("email"));
		sa.setNumber(request.getParameter("number"));
		sa.setPassword(request.getParameter("password"));
		sa.setId(Integer.parseInt(request.getParameter("id")));
		


		try {
			if (getSuperAdminService().editAdmin(sa)) {
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
	         response.getWriter().write("There is an existing  super admin for this email!");
	        
		} catch (SQLException e) {
			message = e.getMessage();
			response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
			response.getWriter().append(message);
		}
	}
	
	
	private void fetchSingleSuperAdmin(HttpServletRequest request, HttpServletResponse response) throws IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		
		try {
			SuperAdmin sa = getSuperAdminService().fetchSingleSuperAdmin(id);
			if (sa.getId() > 0) {

				Gson gson = new Gson();
				String jsonString = gson.toJson(sa);
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

}
