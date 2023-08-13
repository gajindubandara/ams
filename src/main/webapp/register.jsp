<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="tag" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
	crossorigin="anonymous"></script>

<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<link rel="stylesheet" href="styles.css">
<title>Register</title>
<link rel="stylesheet" href="styles.css">
</head>
<body>
	<div class="topnav">
		<div href="#home" class="title">The Jobs</div>
		<!-- <a href="#news">News</a> -->
		<a href="">Profile</a> <a>Login <svg width="16" height="16"
				fill="none" stroke="currentColor" stroke-linecap="round"
				stroke-linejoin="round" stroke-width="2" viewBox="0 0 24 24"
				xmlns="http://www.w3.org/2000/svg">
    <path d="M15 3h4a2 2 0 0 1 2 2v14a2 2 0 0 1-2 2h-4"></path>
    <path d="m10 17 5-5-5-5"></path>
    <path d="M15 12H3"></path>
  </svg>
		</a>

	</div>
	<section class="vh-100">
		<div class="container h-100">
			<div
				class="row d-flex justify-content-center align-items-center h-100">
				<div class="col-lg-12 col-xl-11">
					<div class="card text-black" style="border-radius: 25px;">
						<div class="card-body p-md-5">
							<div class="row justify-content-center" style="margin: 5% 0%;">
								<div class="col-md-6">
									<img
										src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-registration/draw1.webp"
										class="img-fluid" alt="Sample image" style="margin: 50% 0%">
								</div>
								<div class="col-md-6">
									<p class="text-center h1 fw-bold mb-5 mx-1 mx-md-4 mt-4">Sign
										up</p>
									<p style="text-align: center" id="response">${feebackMessage}</p> 
									<form id="regForm" action="register" method="post"
										class="mx-1 mx-md-4" id="registerForm">
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

										<!-- Field input -->
										<div class="d-flex flex-row align-items-center mb-4">
											<div class="form-outline flex-fill mb-0">
												<label class="form-label"> Interested Field</label><span
													class="text-danger">*</span> 
													<select class="form-control" id="field" name="field" required >
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
													class="form-control" id="password" name="password" required />
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
										<div class="text-center" style="margin-bottom: 10px;">
											<a href="login.jsp">Already have an account? Login here.</a>
										</div>

										<input type="hidden" name="actiontype" value="add" />

										<div class="d-flex justify-content-center mx-4 mb-3 mb-lg-4">
											<!-- <button type="submit" class="btn btn-primary btn-lg"
												id="registerButton">Register</button> -->
											<button type="button" class="btn btn-primary btn-lg"
												id="registerButton">Register</button>
										</div>
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<!-- The modal popup -->
	<div id="popupContainer" class="popup-container">
		<div class="popup-content">
			<div class="spinner"></div>
		</div>
	</div>
	
	<footer class="footer">
		<div class="text-center p-3"
			style="background-color: #3d4452; color: white;">
			© 2023 Copyright: <a class="text-white" href="h">TheJobs.com</a>
		</div>
	</footer>


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
        
        	
            if (password !== repeatPassword) {
                repeatPasswordError.innerHTML = '<p>Passwords do not match.</p>';
              } else {
                repeatPasswordError.innerHTML = '';
                registerForm.submit();
                
                var popupContainer = document.getElementById('popupContainer');
                popupContainer.style.display = 'block';

                setTimeout(function () {
                    popupContainer.style.display = 'none';
				}, 2000);
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
