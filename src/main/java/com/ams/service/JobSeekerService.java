package com.ams.service;

import java.sql.SQLException;
import java.util.List;

import com.ams.dao.JobSeekerManager;
import com.ams.dao.JobSeekerManagerImpl;
import com.ams.model.JobSeeker;

public class JobSeekerService {

	private static JobSeekerService jobSeekerServiceObj;

	private JobSeekerService() {
		
	}
	
	public synchronized static JobSeekerService getJobseekerService() {
		
		if(jobSeekerServiceObj == null) {
			jobSeekerServiceObj = new JobSeekerService();
		}
		
		return jobSeekerServiceObj;
	}
	
	private JobSeekerManager getJobSeekerManager() {
		return new JobSeekerManagerImpl();
	}
	
	public boolean addJobSeeker(JobSeeker jobSeeker) throws ClassNotFoundException, SQLException {
		return getJobSeekerManager().addJobSeeker(jobSeeker);
	}
	
	public boolean editJobSeeker(JobSeeker jobSeeker) throws ClassNotFoundException, SQLException {
		return getJobSeekerManager().editJobSeeker(jobSeeker);
	}
	
	public boolean deleteJobSeeker(int jobSeekerId) throws ClassNotFoundException, SQLException {
		return getJobSeekerManager().deleteJobSeeker(jobSeekerId);
	}
	
	public JobSeeker fetchSingleJobSeeker(int jobSeekerId) throws ClassNotFoundException, SQLException {
		return getJobSeekerManager().fetchSingleJobSeeker(jobSeekerId);
	}
	
	public List<JobSeeker> fetchAllJobSeekers() throws ClassNotFoundException, SQLException {
		return getJobSeekerManager().fetchAllJobSeekers();
	}
	
	public JobSeeker loginJobSeeker(String jobSeekerEmail, String jobSeekerPassword) throws ClassNotFoundException, SQLException {
		return getJobSeekerManager().loginJobSeeker(jobSeekerEmail, jobSeekerPassword);
	}
}
