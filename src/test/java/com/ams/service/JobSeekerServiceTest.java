package com.ams.service;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.MethodOrderer;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.TestMethodOrder;

import com.ams.model.Admin;
import com.ams.model.JobSeeker;
import com.mysql.cj.jdbc.exceptions.MysqlDataTruncation;

import java.sql.SQLException;
import java.sql.SQLIntegrityConstraintViolationException;
import java.util.List;

@TestMethodOrder(MethodOrderer.MethodName.class)
class JobSeekerServiceTest {

	public static int userID;
	public String userEmail = "test@example.com";
	public String userPassword = "c4ca4238a0b923820dcc509a6f75849b";

	@Test
	@DisplayName("Register As A Job Seeker")
	void testA() throws ClassNotFoundException, SQLException {

		JobSeeker jobSeeker = new JobSeeker();
		jobSeeker.setName("Test Name");
		jobSeeker.setEmail(userEmail);
		jobSeeker.setNumber("0766786225");
		jobSeeker.setPassword(userPassword);
		jobSeeker.setField("Cybersecurity");

		JobSeekerService jobSeekerService = JobSeekerService.getJobseekerService();

		boolean result = jobSeekerService.addJobSeeker(jobSeeker);

		assertTrue(result, "This should register the user into the database");
	}

	@Test
	@DisplayName("Try To Register A Job Seeker For An Existing Email")
	void testB() throws ClassNotFoundException {
		JobSeeker jobSeeker = new JobSeeker();
		jobSeeker.setName("Test Name");
		jobSeeker.setEmail(userEmail);
		jobSeeker.setNumber("0766786225");
		jobSeeker.setPassword(userPassword);
		jobSeeker.setField("Cybersecurity");

		JobSeekerService jobSeekerService = JobSeekerService.getJobseekerService();

		try {
			jobSeekerService.addJobSeeker(jobSeeker);
		} catch (MysqlDataTruncation e) {
			assertEquals(MysqlDataTruncation.class, e.getClass(), "This should throw an exception");
		} catch (SQLException e) {
			assertEquals(SQLIntegrityConstraintViolationException.class, e.getClass(),
					"This should throw an exception");
		}

	}

	@Test
	@DisplayName("Job Seeker Login")
	void testC() throws ClassNotFoundException, SQLException {
		final String email = userEmail;
		final String password = userPassword;

		JobSeekerService jobSeekerService = JobSeekerService.getJobseekerService();

		JobSeeker js = jobSeekerService.loginJobSeeker(email, password);
		System.out.println(js.getId());
		userID = js.getId();

		if (!(js.getId() > 0)) {
			js = null;
		}

		assertNotNull(js, "This should login the user");
	}

	@Test
	@DisplayName("Job Seeker Login With Invalid Password")
	void testD() throws ClassNotFoundException, SQLException {
		final String email = userEmail;
		final String password = "igiuiags687687ahdkjhk";

		JobSeekerService jobSeekerService = JobSeekerService.getJobseekerService();

		JobSeeker js = jobSeekerService.loginJobSeeker(email, password);
		if (!(js.getId() > 0)) {
			js = null;
		}

		assertNull(js, "This should fail login");
	}

	@Test
	@DisplayName("Job Seeker Login With Invalid Email")
	void testE() throws ClassNotFoundException, SQLException {
		final String email = "wrong@gmail.com";
		final String password = userPassword;

		JobSeekerService jobSeekerService = JobSeekerService.getJobseekerService();

		JobSeeker js = jobSeekerService.loginJobSeeker(email, password);
		if (!(js.getId() > 0)) {
			js = null;
		}
		assertNull(js, "This should fail login");
	}

	@Test
	@DisplayName("Get Job Seeker By Id")
	void testF() throws ClassNotFoundException, SQLException {

		JobSeekerService jobSeekerService = JobSeekerService.getJobseekerService();

		JobSeeker js = jobSeekerService.fetchSingleJobSeeker(userID);

		if (!(js.getId() > 0)) {
			js = null;
		}
		assertNotNull(js, "This should get the user by id");
	}

	@Test
	@DisplayName("Get All Job Seekers")
	void testG() throws ClassNotFoundException, SQLException {

		JobSeekerService jobSeekerService = JobSeekerService.getJobseekerService();

		List<JobSeeker> result = jobSeekerService.fetchAllJobSeekers();

		boolean haveData = true;

		if (!(result.size() > 0)) {
			haveData = false;
		}

		assertTrue(haveData, "This should get all the job seekers");
	}

	@Test
	@DisplayName("Edit A Job Seeker")
	void testH() throws ClassNotFoundException, SQLException {
		JobSeeker js = new JobSeeker();
		js.setName("Test Name 2");
		js.setEmail(userEmail);
		js.setNumber("076678000");
		js.setPassword(userPassword);
		js.setField("Cybersecurity");
		js.setId(userID);

		JobSeekerService jobSeekerService = JobSeekerService.getJobseekerService();

		boolean result = jobSeekerService.editJobSeeker(js);

		assertTrue(result, "This should edit the job seeker");
	}

	@Test
	@DisplayName("Delete The Job Seeker")
	void testI() throws ClassNotFoundException, SQLException {
		System.out.println(userID);

		JobSeekerService jobSeekerService = JobSeekerService.getJobseekerService();

		boolean result = jobSeekerService.deleteJobSeeker(userID);

		assertTrue(result, "This should delete the user");
	}

}
