package com.ams.service;

import static org.junit.jupiter.api.Assertions.*;

import java.sql.SQLException;
import java.util.List;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

import com.ams.model.Admin;
import com.ams.model.Appointment;

class AppointmentServiceTest {

	public static int appID;

	@Test
	@DisplayName("Add Appointment")
	void testA() throws ClassNotFoundException, SQLException {

		Appointment app = new Appointment();
		app.setAdminId(6);
		app.setCountry("United Kingdom");
		app.setField("Cybersecurity");
		app.setSlot("0000-00-00 00:00 - 00:00");
		app.setDate("2023-08-28");

		AppointmentService appservice = AppointmentService.getAppService();

		boolean result = appservice.addApp(app);

		assertTrue(result, "This should add an appointment into the database");
	}

	@Test
	@DisplayName("Get Single Appointment")
	void testB() throws ClassNotFoundException, SQLException {

		AppointmentService appservice = AppointmentService.getAppService();

		Appointment app = appservice.fetchSingleAppForTestng("0000-00-00 00:00 - 00:00");
		System.out.println(app.getId());
		appID = app.getId();

		if (!(app.getId() > 0)) {
			app = null;
		}

		assertNotNull(app, "This should get the appointment");
	}

	@Test
	@DisplayName("Book Appointment")
	void testC() throws ClassNotFoundException, SQLException {

		Appointment app = new Appointment();

		app.setSeekerId(59);
		app.setState("pending");
		app.setAssigned_date("2023-08-21");
		app.setId(appID);

		AppointmentService appservice = AppointmentService.getAppService();

		boolean result = appservice.bookApp(app);

		assertTrue(result, "This should book an appointment");

	}

	@Test
	@DisplayName("Cancel Appointment")
	void testD() throws ClassNotFoundException, SQLException {

		AppointmentService appservice = AppointmentService.getAppService();

		boolean result = appservice.cancelApp(appID);

		assertTrue(result, "This should cancel an appointment");
	}

	@Test
	@DisplayName("Get All Appointments")
	void testE() throws ClassNotFoundException, SQLException {

		AppointmentService appservice = AppointmentService.getAppService();

		List<Appointment> result = appservice.fetchAllApps();
		boolean haveData = true;

		if (!(result.size() > 0)) {
			haveData = false;
		}

		assertTrue(haveData, "This should get all the appointments");
	}

	@Test
	@DisplayName("Get All Appointments For Reports")
	void testF() throws ClassNotFoundException, SQLException {

		AppointmentService appservice = AppointmentService.getAppService();

		List<Appointment> result = appservice.fetchAllAppsForReports();
		boolean haveData = true;

		if (!(result.size() > 0)) {
			haveData = false;
		}

		assertTrue(haveData, "This should get all the appointments with the foreign key data");
	}

	@Test
	@DisplayName("Change Appointment State")
	void testG() throws ClassNotFoundException, SQLException {

		Appointment app = new Appointment();
		app.setState("confirmed");
		app.setId(appID);

		AppointmentService appservice = AppointmentService.getAppService();

		boolean result = appservice.changeAppState(app);

		assertTrue(result, "This should change the appointment state");

	}

	@Test
	@DisplayName("Delete The Appointment")
	void testH() throws ClassNotFoundException, SQLException {

		AppointmentService appservice = AppointmentService.getAppService();

		boolean result = appservice.deleteApp(appID);

		assertTrue(result, "This should delete the appointment");
	}

}
