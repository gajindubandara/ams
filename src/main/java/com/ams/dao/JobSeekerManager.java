package com.ams.dao;

import java.sql.SQLException;
import java.util.List;

import com.ams.model.JobSeeker;


public interface JobSeekerManager {

	public boolean addJobSeeker(JobSeeker jobSeeker) throws SQLException, ClassNotFoundException;
	
	public boolean editJobSeeker(JobSeeker jobSeeker) throws SQLException, ClassNotFoundException;
	
	public boolean deleteJobSeeker(int jobSeekerId) throws SQLException, ClassNotFoundException;
	
	public JobSeeker fetchSingleJobSeeker(int jobSeekerId) throws SQLException, ClassNotFoundException;
	
	public List<JobSeeker> fetchAllJobSeekers() throws SQLException, ClassNotFoundException;
	
	public JobSeeker loginJobSeeker(String jobSeekerEmail, String jobSeekerPasssword) throws SQLException, ClassNotFoundException;
}
