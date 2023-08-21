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

		/*
		 * try { if (getAppService().addApp(app)) { message =
		 * "<svg width=\"46\" height=\"46\" fill=\"#00f556\" viewBox=\"0 0 24 24\" xmlns=\"http://www.w3.org/2000/svg\">\r\n"
		 * +
		 * "  <path d=\"M12.136 2.25c-5.484-.073-9.96 4.403-9.886 9.887.073 5.259 4.355 9.54 9.614 9.614 5.484.075 9.96-4.402 9.885-9.885-.072-5.26-4.354-9.542-9.613-9.615Zm-.787 9.023 2.416-2.766a.75.75 0 0 1 1.13.988l-2.416 2.765a.749.749 0 1 1-1.13-.987ZM9.527 15.53a.75.75 0 0 1-1.06 0l-2.248-2.25a.75.75 0 0 1 1.062-1.06l2.25 2.25a.75.75 0 0 1-.004 1.06Zm8.288-6.037-5.245 6a.75.75 0 0 1-.54.257h-.024a.75.75 0 0 1-.531-.22l-2.247-2.25a.75.75 0 0 1 1.061-1.06l1.397 1.398a.375.375 0 0 0 .547-.018l4.453-5.094a.75.75 0 0 1 1.13.988h-.001Z\"></path>\r\n"
		 * + "</svg> Time Slot Added!"; } else { message =
		 * "<svg width=\"46\" height=\"46\" fill=\"#f20232\" viewBox=\"0 0 24 24\" xmlns=\"http://www.w3.org/2000/svg\">\r\n"
		 * +
		 * "  <path d=\"M12 2.25c-5.376 0-9.75 4.374-9.75 9.75s4.374 9.75 9.75 9.75 9.75-4.374 9.75-9.75S17.376 2.25 12 2.25ZM16.06 15 15 16.06l-3-3-3 3L7.94 15l3-3-3-3L9 7.94l3 3 3-3L16.06 9l-3 3 3 3Z\"></path>\r\n"
		 * + "</svg> Failed To Add Time Slot!"; } } catch (ClassNotFoundException e ) {
		 * message = "operation failed! " + e.getMessage(); } catch (SQLException e) {
		 * message = "Operation failed: " + e.getMessage(); }
		 */

		/*
		 * request.setAttribute("feebackMessage", message); RequestDispatcher rd =
		 * request.getRequestDispatcher("consultantDates.jsp"); rd.forward(request,
		 * response);
		 */
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
