<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="tag" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="icon" type="image/png" href="assets/jobs.png">
<!-- Bootstrap 5 CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
	crossorigin="anonymous">

<!-- Bootstrap 5 JS -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
	crossorigin="anonymous"></script>

<!-- Bootstrap 4 CSS (optional) -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

<!-- Your custom CSS -->
<link rel="stylesheet" href="styles.css">
<title>The Jobs | Register</title>
</head>
<body>
<script>
document.addEventListener("DOMContentLoaded", function() {
    var jobSeeker = sessionStorage.getItem("jobSeeker");
    var dashboardLink = document.getElementById("dashboardLink");
	var logoutLink = document.getElementById("logoutLink");
	var loginLink = document.getElementById("loginLink");
	var regLink = document.getElementById("regLink");
	var profileLink = document.getElementById("profileLink");
    if (!jobSeeker) {
    	profileLink.style.display = "none";
    	dashboardLink.style.display = "none";
    	logoutLink.style.display = "none";
    	}else{
    	loginLink.style.display = "none";
    	regLink.style.display = "none";
    	}
});
</script>
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
		<div class="container">
			<a class="navbar-brand" href="#"> <svg width="30" height="30"
					fill="#007bff" viewBox="0 0 24 24"
					xmlns="http://www.w3.org/2000/svg">
  					<path
						d="M15.75 13.5h-7.5V12H.75v9.188a.562.562 0 0 0 .563.562h21.375a.562.562 0 0 0 .562-.563V12h-7.5v1.5Z"></path>
  					<path
						d="M23.25 5.813a.563.563 0 0 0-.563-.563H18V2.625a.375.375 0 0 0-.375-.375H6.375A.375.375 0 0 0 6 2.625V5.25H1.312a.563.563 0 0 0-.562.563V10.5h22.5V5.812Zm-7.125-.563h-8.25V4.125h8.25V5.25Z"></path>
				</svg> The Jobs
			</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarNav" aria-controls="navbarNav"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarNav">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item" id="indexLink"><a class="nav-link" href="index.jsp">Home</a>
					</li>
					<li class="nav-item" id="dashboardLink"><a class="nav-link" href="userDashboard.jsp">Dashboard</a>
					</li>
					<li class="nav-item" id="profileLink"><a class="nav-link" href="userProfile.jsp">Profile </a></li>
					<li class="nav-item  active" id="regLink"><a class="nav-link" href="#">Register </a></li>
					<li class="nav-item" id="loginLink"><a class="nav-link" href="login.jsp">Login </a></li>
					<li class="nav-item" id="logoutLink"><a class="nav-link" href="#">Logout </a></li>
				</ul>
			</div>
		</div>
	</nav>

	<div class="container" style="margin: 80px auto">
		<div
			class="row d-flex justify-content-center align-items-center h-100">

			<div class="col-md-12">
				<div class="card text-black" style="border-radius: 25px;">
					<div class="card-body">
						<div class="row justify-content-center" style="margin: 5% 0%;">
							<div class="col-md-12">
								<p class="text-center h1 fw-bold mb-5 mx-1 mx-md-4 mt-4">Sign
									up</p>
								<form id="regForm" class="mx-1 mx-md-4">
									<div class="row">
										<div class="col-md-6">
											<!-- Name input -->
											<div class="d-flex flex-row align-items-center mb-4">
												<div class="form-outline flex-fill mb-0">
													<label class="form-label">Your Name</label><span
														class="text-danger">*</span> <input type="text"
														class="form-control" id="name" name="name" required />
													<div class="text-danger" id="nameError"></div>
												</div>
											</div>
											<!-- Email input -->
											<div class="d-flex flex-row align-items-center mb-4">
												<div class="form-outline flex-fill mb-0">
													<label class="form-label">Your Email</label><span
														class="text-danger">*</span> <input type="email"
														class="form-control" id="email" name="email" required />
													<div class="text-danger" id="emailError"></div>
												</div>
											</div>
											<!-- Number input -->
											<div class="d-flex flex-row align-items-center mb-4">
												<div class="form-outline flex-fill mb-0">
													<label class="form-label">Your Number</label><span
														class="text-danger">*</span> <input type="number"
														class="form-control" id="number" name="number" required />
													<div class="text-danger" id="numberError"></div>
												</div>
											</div>
										</div>
										<div class="col-md-6">
											<!-- Field input -->
											<div class="d-flex flex-row align-items-center mb-4">
												<div class="form-outline flex-fill mb-0">
													<label class="form-label"> Interested Field</label><span
														class="text-danger">*</span> <select class="form-control"
														id="field" name="field" required>
														<option value="" disabled selected>Select Field</option>
													</select>
													<div class="text-danger" id="fieldError"></div>
												</div>
											</div>

											<!-- Password input -->
											<div class="d-flex flex-row align-items-center mb-4">
												<div class="form-outline flex-fill mb-0">
													<label class="form-label">Password</label><span
														class="text-danger">*</span> <input type="password"
														class="form-control" id="password" name="password"
														required />
													<div class="text-danger" id="passwordError"></div>
												</div>
											</div>
											<!-- Repeat Password input -->
											<div class="d-flex flex-row align-items-center mb-4">
												<div class="form-outline flex-fill mb-0">
													<label class="form-label">Repeat your password</label><span
														class="text-danger">*</span> <input type="password"
														class="form-control" id="repeatPassword" required />
													<div class="text-danger" id="repeatPasswordError"></div>
												</div>
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-md-12">

											<div style="margin-bottom: 10px;">
												<a href="login.jsp">Already have an account? Login here.</a>
											</div>

											<input type="hidden" name="actiontype" value="add" /> <input
												type="hidden" name="hashedPw" id="hashedPw" />

											<div class="d-flex justify-content-end mx-4 mb-3 mb-lg-4">
												<button type="button" class="btn btn-primary btn-lg"
													id="registerButton">Register</button>
											</div>
										</div>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>



	<footer class="footer">
		<div class="text-center p-3"
			style="background-color: #3d4452; color: white;">
			© 2023 Copyright: <a class="text-white" href="h">TheJobs.com</a>
		</div>
	</footer>


	<!-- md5 hashing -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/blueimp-md5/2.18.0/js/md5.min.js"></script>
	<!-- ajax -->
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<!-- alert -->
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

	<script>
    document.addEventListener('DOMContentLoaded', function () { 

      const registerForm = document.getElementById('regForm');
      const nameInput = document.getElementById('name');
      const emailInput = document.getElementById('email');
      const numberInput = document.getElementById('number');
      const passwordInput = document.getElementById('password');
      const fieldInput = document.getElementById('field');
      const repeatPasswordInput = document.getElementById('repeatPassword');
      const nameError = document.getElementById('nameError');
      const emailError = document.getElementById('emailError');
      const numberError = document.getElementById('numberError');
      const fieldError = document.getElementById('fieldError');
      const passwordError = document.getElementById('passwordError');
      const repeatPasswordError = document.getElementById('repeatPasswordError');
      const registerButton = document.getElementById('registerButton');


      const fields = [
  	 	'Advertising',
  	    'Agriculture',
  	    'Architecture',
  	    'Artificial Intelligence (AI)',
  	    'Biotechnology',
  	    'Cloud Computing',
  	    'Content Marketing',
  	    'Consulting',
  	    'Construction',
  	    'Criminal Justice',
  	    'Cybersecurity',
  	    'Customer Service',
  	    'Data Science',
  	    'Database Administration',
  	    'DevOps',
  	    'Digital Marketing',
  	    'Education',
  	    'Engineering',
  	    'Environmental Science',
  	    'Film Production',
  	    'Food Science',
  	    'Game Development',
  	    'Healthcare',
  	    'Hospitality',
  	    'Information Technology (IT)',
  	    'Journalism',
  	    'Law',
  	    'Legal Services',
  	    'Machine Learning',
  	    'Marketing',
  	    'Mechanical Engineering',
  	    'Medicine',
  	    'Mobile App Development',
  	    'Nursing',
  	    'Pharmaceuticals',
  	    'Pharmacy',
  	    'Photography',
  	    'Project Management',
  	    'Psychology',
  	    'Real Estate',
  	    'Renewable Energy',
  	    'Research',
  	    'Sales',
  	    'Search Engine Optimization (SEO)',
  	    'Social Media Marketing',
  	    'Software Development',
  	    'Sports Management',
  	    'Teaching',
  	    'Tourism',
  	    'UX/UI Design',
  	    'Video Production',
  	    'Web Development',
  	    'Writing and Editing'
  ];

  const selectField = document.getElementById('field');

  fields.forEach(field => {
      const fieldOption = document.createElement('option');
      fieldOption.value = field;
      fieldOption.textContent = field;
      selectField.appendChild(fieldOption);
  });
  
      registerButton.addEventListener('click', async function () {
  
        const name = nameInput.value;
        const email = emailInput.value;
        const number = numberInput.value;
        const password = passwordInput.value;
        const field = fieldInput.value;
        const repeatPassword = repeatPasswordInput.value;

        if (!name || !email || !number || !field || !password || !repeatPassword) {
          if (!name) {
            nameError.innerHTML = '<p>Name is required.</p>';
          } else {
            nameError.innerHTML = '';
          }
          if (!email) {
              emailError.innerHTML = '<p>Email is required.</p>';
          } else if (!isValidEmail(email)) {
              emailError.innerHTML = '<p>Invalid email format.</p>';
          } else {
              emailError.innerHTML = '';
          }
          if (!field) {
        	  fieldError.innerHTML = '<p>Field is required.</p>';
            } else {
            	fieldError.innerHTML = '';
            }
          if (!number) {
              numberError.innerHTML = '<p>Number is required.</p>';
          } else if (!/^[0-9]{10}$/.test(number)) {
              numberError.innerHTML = '<p>Number must be 10 digits (ex-0712345678).</p>';
          } else {
              numberError.innerHTML = '';
          }
          if (!password) {
            passwordError.innerHTML = '<p>Password is required.</p>';
          } else {
            passwordError.innerHTML = '';
          }
          if (!repeatPassword) {
            repeatPasswordError.innerHTML = '<p>Repeat password is required.</p>';
          } else {
            repeatPasswordError.innerHTML = '';
          }
        } else {
        	nameError.innerHTML = '';
        	emailError.innerHTML = '';
        	numberError.innerHTML = '';
        	passwordError.innerHTML = '';
        	fieldError.innerHTML = '';
        
        	
            if (password !== repeatPassword) {
                repeatPasswordError.innerHTML = '<p>Passwords do not match.</p>';
              } else {
                repeatPasswordError.innerHTML = '';
                
                const hashedPw =md5(password);
                
                $.ajax({
                    url: "http://localhost:8080/ams/jobseeker",
                    type: "POST",
                    data: {
                      email: email,
                      actiontype: "add",
                      password: hashedPw,
                      number: number,
                      name: name,
                      field: field
                    },
                    success: function(response) {
                      console.log("Success:", response);
                      
                      Swal.fire({
                          icon: 'success',
                          title: 'Success!',
                          text: 'Registration successful!',
                          confirmButtonColor: '#3085d6',
                          confirmButtonText: 'OK'
                        }).then((result) => {
                          if (result.isConfirmed) {
                            window.location.href = 'login.jsp';
                          }
                        });
                      
                    },
                    error: function(xhr, status, error) {
                      if (xhr.status === 400) {
                    	  Swal.fire({
                              icon: 'error',
                              title: 'Failed',
                              text: 'There is an existing job seeker for this email!',
                              confirmButtonColor: '#3085d6',
                              confirmButtonText: 'OK'
                            });
                      } else if (xhr.status === 500) {
                        Swal.fire({
                            icon: 'error',
                            title: 'Failed',
                            text: 'Internal Server Error',
                            confirmButtonColor: '#3085d6',
                            confirmButtonText: 'OK'
                          });
                      } else {
                        console.log("Other Error:", error);
                      }
                    }
                  });
              } 
             
        }
      }); 
  
    });
    
    
    
    function isValidEmail(email) {
        const emailPattern = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/;
        return emailPattern.test(email);
    }
  </script>
</body>
</html>
