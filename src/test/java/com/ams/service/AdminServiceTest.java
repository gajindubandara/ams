package com.ams.service;

import static org.junit.jupiter.api.Assertions.*;

import java.sql.SQLException;
import java.sql.SQLIntegrityConstraintViolationException;
import java.util.List;

import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.MethodOrderer;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.TestMethodOrder;

import com.ams.model.Admin;
import com.mysql.cj.jdbc.exceptions.MysqlDataTruncation;

@TestMethodOrder(MethodOrderer.MethodName.class)
class AdminServiceTest {

	public static int adminID;
	public String userEmail = "test@example.com";
	public String userPassword = "c4ca4238a0b923820dcc509a6f75849b";

	@Test
	@DisplayName("Register As An Admin")
	void testA() throws ClassNotFoundException, SQLException {

		Admin admin = new Admin();
		admin.setName("Test Name");
		admin.setEmail(userEmail);
		admin.setNumber("0766786225");
		admin.setPassword(userPassword);
		admin.setField("Cybersecurity");
		admin.setState("active");
		admin.setCountry("United Kingdom");

		AdminService adminService = AdminService.getAdminService();

		boolean result = adminService.addAdmin(admin);

		assertTrue(result, "This should register the user into the database");
	}

	@Test
	@DisplayName("Try To Register An Admin For An Existing Email")
	void testB() throws ClassNotFoundException {
		Admin admin = new Admin();
		admin.setName("Test Name");
		admin.setEmail(userEmail);
		admin.setNumber("0766786225");
		admin.setPassword(userPassword);
		admin.setField("Cybersecurity");
		admin.setState("active");
		admin.setCountry("United Kingdom");

		AdminService adminService = AdminService.getAdminService();

		try {
			adminService.addAdmin(admin);

		} catch (MysqlDataTruncation e) {
			assertEquals(MysqlDataTruncation.class, e.getClass(), "Expected exception was not thrown.");
		} catch (SQLException e) {
			assertEquals(SQLIntegrityConstraintViolationException.class, e.getClass(),
					"Expected exception was not thrown.");
		}

	}

	@Test
	@DisplayName("Admin Login")
	void testC() throws ClassNotFoundException, SQLException {
		final String email = userEmail;
		final String password = userPassword;

		AdminService adminService = AdminService.getAdminService();

		Admin admin = adminService.loginAdmin(email, password);
		System.out.println(admin.getId());
		adminID = admin.getId();

		if (!(admin.getId() > 0)) {
			admin = null;
		}

		assertNotNull(admin, "This should login the user");
	}

	@Test
	@DisplayName("Admin With Invalid Password")
	void testD() throws ClassNotFoundException, SQLException {
		final String email = userEmail;
		final String password = "igiuiags687687ahdkjhk";

		AdminService adminService = AdminService.getAdminService();

		Admin admin = adminService.loginAdmin(email, password);

		if (!(admin.getId() > 0)) {
			admin = null;
		}
		assertNull(admin, "This should fail login");
	}

	@Test
	@DisplayName("Admin Login With Invalid Email")
	void testE() throws ClassNotFoundException, SQLException {
		final String email = "wrong@gmail.com";
		final String password = userPassword;

		AdminService adminService = AdminService.getAdminService();

		Admin admin = adminService.loginAdmin(email, password);
		System.out.println(admin.getId());

		if (!(admin.getId() > 0)) {
			admin = null;
		}
		assertNull(admin, "This should fail login");
	}

	@Test
	@DisplayName("Get Admin By Id")
	void testF() throws ClassNotFoundException, SQLException {

		AdminService adminService = AdminService.getAdminService();

		Admin admin = adminService.fetchSingleAdmin(adminID);

		if (!(admin.getId() > 0)) {
			admin = null;
		}
		assertNotNull(admin, "This should get the admin by id");
	}

	@Test
	@DisplayName("Get All Job Seekers")
	void testG() throws ClassNotFoundException, SQLException {

		AdminService adminService = AdminService.getAdminService();

		List<Admin> result = adminService.fetchAllAdmins();
		boolean haveData = true;

		if (!(result.size() > 0)) {
			haveData = false;
		}

		assertTrue(haveData, "This should get all the admins");
	}

	@Test
	@DisplayName("Edit An Admin")
	void testH() throws ClassNotFoundException, SQLException {
		Admin admin = new Admin();
		admin.setName("Test Name");
		admin.setEmail(userEmail);
		admin.setNumber("0766786225");
		admin.setPassword(userPassword);
		admin.setField("Cybersecurity");
		admin.setState("active");
		admin.setCountry("United Kingdom");
		admin.setId(adminID);

		AdminService adminService = AdminService.getAdminService();

		boolean result = adminService.editAdmin(admin);

		assertTrue(result, "This should edit the admin");
	}

	@Test
	@DisplayName("Change Admin State")
	void testI() throws ClassNotFoundException, SQLException {

		Admin admin = new Admin();
		admin.setId(adminID);
		admin.setState("inactive");

		AdminService adminService = AdminService.getAdminService();
		boolean result = adminService.changeAdminState(admin);
		assertTrue(result, "This should change state of the admin");
	}

	@Test
	@DisplayName("Delete An Admin")
	void testJ() throws ClassNotFoundException, SQLException {
		System.out.println(adminID);
		AdminService adminService = AdminService.getAdminService();

		boolean result = adminService.deleteAdmin(adminID);

		assertTrue(result, "This should delete the user");
	}
}
