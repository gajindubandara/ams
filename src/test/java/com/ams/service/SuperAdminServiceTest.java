package com.ams.service;

import static org.junit.jupiter.api.Assertions.*;

import java.sql.SQLException;

import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.MethodOrderer;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.TestMethodOrder;
import com.ams.model.SuperAdmin;

@TestMethodOrder(MethodOrderer.MethodName.class)
class SuperAdminServiceTest {

	public static int superAdminID;
	public String userEmail = "thejobs.admin@gmail.com";
	public String userPassword = "5d41402abc4b2a76b9719d911017c592";

	@Test
	@DisplayName("Super Admin Login")
	void testA() throws ClassNotFoundException, SQLException {
		final String email = userEmail;
		final String password = userPassword;

		SuperAdminService superAdminService = SuperAdminService.getSuperAdminService();

		SuperAdmin sa = superAdminService.loginSuperAdmin(email, password);
		System.out.println(sa.getId());
		superAdminID = sa.getId();

		if (!(sa.getId() > 0)) {
			sa = null;
		}

		assertNotNull(sa, "This should login the user");
	}

	@Test
	@DisplayName("Super Admin Login With Invalid Password")
	void testB() throws ClassNotFoundException, SQLException {
		final String email = userEmail;
		final String password = "igiuiags687687ahdkjhk";

		SuperAdminService superAdminService = SuperAdminService.getSuperAdminService();

		SuperAdmin sa = superAdminService.loginSuperAdmin(email, password);

		if (!(sa.getId() > 0)) {
			sa = null;
		}
		assertNull(sa, "This should fail login");
	}

	@Test
	@DisplayName("Super Admin Login With Invalid Email ")
	void testC() throws ClassNotFoundException, SQLException {
		final String email = "wrong@gmail.com";
		final String password = userPassword;

		SuperAdminService superAdminService = SuperAdminService.getSuperAdminService();

		SuperAdmin sa = superAdminService.loginSuperAdmin(email, password);

		if (!(sa.getId() > 0)) {
			sa = null;
		}
		assertNull(sa, "This should fail login");
	}

	@Test
	@DisplayName("Edit Super Admin")
	void testD() throws ClassNotFoundException, SQLException {
		SuperAdmin sa = new SuperAdmin();
		sa.setName("Test Name");
		sa.setEmail(userEmail);
		sa.setNumber("0766786225");
		sa.setPassword(userPassword);
		sa.setId(superAdminID);

		SuperAdminService superAdminService = SuperAdminService.getSuperAdminService();

		boolean result = superAdminService.editAdmin(sa);

		assertTrue(result, "This should edit the super admin");
	}
	
	@Test
	@DisplayName("Edit Super Admin For A Non Existing Id")
	void testE() throws ClassNotFoundException, SQLException {
		SuperAdmin sa = new SuperAdmin();
		sa.setName("Test Name");
		sa.setEmail(userEmail);
		sa.setNumber("0766786225");
		sa.setPassword(userPassword);
		sa.setId(100);

		SuperAdminService superAdminService = SuperAdminService.getSuperAdminService();

		boolean result = superAdminService.editAdmin(sa);

		assertFalse(result, "This should return false");
	}

	@Test
	@DisplayName("Get Super Admin By Id")
	void testF() throws ClassNotFoundException, SQLException {

		SuperAdminService superAdminService = SuperAdminService.getSuperAdminService();

		SuperAdmin sa = superAdminService.fetchSingleSuperAdmin(superAdminID);

		if (!(sa.getId() > 0)) {
			sa = null;
		}
		assertNotNull(sa, "This should get the super admin by id");
	}
	
	@Test
	@DisplayName("Get Super Admin By Non Existing Id")
	void testG() throws ClassNotFoundException, SQLException {

		SuperAdminService superAdminService = SuperAdminService.getSuperAdminService();

		SuperAdmin sa = superAdminService.fetchSingleSuperAdmin(100);

		if (!(sa.getId() > 0)) {
			sa = null;
		}
		assertNull(sa, "This should return null");
	}
}
