package com.ams.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.sql.SQLIntegrityConstraintViolationException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ams.model.JobSeeker;
import com.ams.service.JobSeekerService;
import com.google.gson.Gson;

public class JobSeekerController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	String message = "";

	private JobSeekerService getJobseekerService() {
		return JobSeekerService.getJobseekerService();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String actionType = request.getParameter("actiontype");

		if (actionType.equals("login")) {
			loginSingleJobSeeker(request, response);
		} 
		else if (actionType.equals("getUser")) {
			fetchSingleJobSeeker(request, response);
		}

//		else {
//			fetchAllProducts(request, response);
//		}

//		 RequestDispatcher rd = request.getRequestDispatcher("register.jsp");
//		 rd.forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String actionType = request.getParameter("actiontype");

		if (actionType.equals("add")) {
			addJobSeeker(request, response);
		} else if (actionType.equals("edit")) {
			editJobSeeker(request, response);
		} else if (actionType.equals("delete")) {
			deleteJobSeeker(request, response);
		}
	}

	
	private void loginSingleJobSeeker(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String email = request.getParameter("email");
		String password = request.getParameter("password");

		try {
			JobSeeker js = getJobseekerService().loginJobSeeker(email, password);
			if (js.getId() > 0) {

				Gson gson = new Gson();
				String jsonString = gson.toJson(js);
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
	
	private void addJobSeeker(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		JobSeeker js = new JobSeeker();
		js.setName(request.getParameter("name"));
		js.setEmail(request.getParameter("email"));
		js.setNumber(request.getParameter("number"));
		js.setPassword(request.getParameter("password"));
		js.setField(request.getParameter("field"));

		try {
			if (getJobseekerService().addJobSeeker(js)) {
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
	         response.getWriter().write("There is an existing job seeker for this email!");
	        
		} catch (SQLException e) {
			message = e.getMessage();
			response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
			response.getWriter().append(message);
		}

	}

	private void editJobSeeker(HttpServletRequest request, HttpServletResponse response) throws IOException {
		JobSeeker js = new JobSeeker();

		js.setName(request.getParameter("name"));
		js.setEmail(request.getParameter("email"));
		js.setNumber(request.getParameter("number"));
		js.setPassword(request.getParameter("password"));
		js.setField(request.getParameter("field"));
		js.setId(Integer.parseInt(request.getParameter("id")));
		


		try {
			if (getJobseekerService().editJobSeeker(js)) {
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
	         response.getWriter().write("There is an existing job seeker for this email!");
	        
		} catch (SQLException e) {
			message = e.getMessage();
			response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
			response.getWriter().append(message);
		}
		

	}

	private void deleteJobSeeker(HttpServletRequest request, HttpServletResponse response) {

	}

	private void fetchSingleJobSeeker(HttpServletRequest request, HttpServletResponse response) throws IOException {
		int seekerId = Integer.parseInt(request.getParameter("seekerId"));
		
		try {
			JobSeeker js = getJobseekerService().fetchSingleJobSeeker(seekerId);
			if (js.getId() > 0) {

				Gson gson = new Gson();
				String jsonString = gson.toJson(js);
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

	private void fetchAllJobSeekers(HttpServletRequest request, HttpServletResponse response) {

	}



}
