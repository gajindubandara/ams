package com.ams.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.sql.SQLIntegrityConstraintViolationException;
import java.util.List;

import javax.servlet.RequestDispatcher;
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

		
//		 RequestDispatcher rd = request.getRequestDispatcher("manageConsultant.jsp");
//		 rd.forward(request, response);
		 

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String actionType = request.getParameter("actiontype");

		if (actionType.equals("add")) {
			addAdmin(request, response);
		} else if (actionType.equals("edit")) {
			editAdmin(request, response);
		} else if (actionType.equals("delete")) {
			deleteAdmin(request, response);
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

		try {
			if (getAdminService().addAdmin(admin)) {
				message = "<svg width=\"46\" height=\"46\" fill=\"#00f556\" viewBox=\"0 0 24 24\" xmlns=\"http://www.w3.org/2000/svg\">\r\n"
						+ "  <path d=\"M12.136 2.25c-5.484-.073-9.96 4.403-9.886 9.887.073 5.259 4.355 9.54 9.614 9.614 5.484.075 9.96-4.402 9.885-9.885-.072-5.26-4.354-9.542-9.613-9.615Zm-.787 9.023 2.416-2.766a.75.75 0 0 1 1.13.988l-2.416 2.765a.749.749 0 1 1-1.13-.987ZM9.527 15.53a.75.75 0 0 1-1.06 0l-2.248-2.25a.75.75 0 0 1 1.062-1.06l2.25 2.25a.75.75 0 0 1-.004 1.06Zm8.288-6.037-5.245 6a.75.75 0 0 1-.54.257h-.024a.75.75 0 0 1-.531-.22l-2.247-2.25a.75.75 0 0 1 1.061-1.06l1.397 1.398a.375.375 0 0 0 .547-.018l4.453-5.094a.75.75 0 0 1 1.13.988h-.001Z\"></path>\r\n"
						+ "</svg> Registration Successful!";
			} else {
				message = "<svg width=\"46\" height=\"46\" fill=\"#f20232\" viewBox=\"0 0 24 24\" xmlns=\"http://www.w3.org/2000/svg\">\r\n"
						+ "  <path d=\"M12 2.25c-5.376 0-9.75 4.374-9.75 9.75s4.374 9.75 9.75 9.75 9.75-4.374 9.75-9.75S17.376 2.25 12 2.25ZM16.06 15 15 16.06l-3-3-3 3L7.94 15l3-3-3-3L9 7.94l3 3 3-3L16.06 9l-3 3 3 3Z\"></path>\r\n"
						+ "</svg> Registration Failed!";
			}
		} catch (ClassNotFoundException e ) {
			message = "operation failed! " + e.getMessage();
		}
		catch (SQLIntegrityConstraintViolationException e) {
		    message =  "<svg width=\"46\" height=\"46\" fill=\"#f20232\" viewBox=\"0 0 24 24\" xmlns=\"http://www.w3.org/2000/svg\">\r\n"
					+ "  <path d=\"M12 2.25c-5.376 0-9.75 4.374-9.75 9.75s4.374 9.75 9.75 9.75 9.75-4.374 9.75-9.75S17.376 2.25 12 2.25ZM16.06 15 15 16.06l-3-3-3 3L7.94 15l3-3-3-3L9 7.94l3 3 3-3L16.06 9l-3 3 3 3Z\"></path>\r\n"
					+ "</svg> There is an existing admin for this email!";
		}
		catch (SQLException e) {
		    message = "Operation failed: " + e.getMessage();
		}

		request.setAttribute("feebackMessage", message);
		RequestDispatcher rd = request.getRequestDispatcher("manageConsultant.jsp");
		rd.forward(request, response);
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

	private void deleteAdmin(HttpServletRequest request, HttpServletResponse response) {

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

}
