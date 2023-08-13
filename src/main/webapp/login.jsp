<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
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
<title>Login</title>
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
					<div class="card text-black"
						style="border-radius: 25px; height: 650px;">
						<div class="card-body p-md-5">
							<div class="row justify-content-center" style="margin: 5% 0%;">
								<div
									class="col-md-6">
									<img
										src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-registration/draw1.webp"
										class="img-fluid" alt="Sample image">
								</div>
								<div class="col-md-6">
									<p class="text-center h1 fw-bold mb-5 mx-1 mx-md-4 mt-4">Login</p>
									<form class="mx-1 mx-md-4" id="loginForm">
										<!-- username input -->
										<div class="d-flex flex-row align-items-center mb-4">
											<div class="form-outline flex-fill mb-0">
												<label class="form-label">Your Email</label><span
													class="text-danger">*</span> <input type="email"
													class="form-control" id="email" required />
												<div class="text-danger" id="emailError"></div>
											</div>
										</div>
										<!-- password input -->
										<div class="d-flex flex-row align-items-center mb-4">
											<div class="form-outline flex-fill mb-0">
												<label class="form-label" for="password">Password</label><span
													class="text-danger">*</span> <input type="password"
													id="password" class="form-control" required />
												<div class="text-danger" id="passwordError"></div>
											</div>
										</div>
										<div class="text-center" style="margin-bottom: 10px;">
											<a href="register.jsp">Don't have an account? Register here.</a>
										</div>
										<div class="d-flex justify-content-center mx-4 mb-3 mb-lg-4">
											<button type="button" class="btn btn-primary btn-lg"
												id="loginButton">Login</button>
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

	<footer class="footer">
		<div class="text-center p-3"
			style="background-color: #3d4452; color: white;">
			© 2023 Copyright: <a class="text-white" href="h">TheJobs.com</a>
		</div>
	</footer>

	<script>
    document.addEventListener('DOMContentLoaded', function () {
      const loginForm = document.getElementById('loginForm');
      const emailInput = document.getElementById('email');
      const passwordInput = document.getElementById('password');
      const emailError = document.getElementById('emailError');
      const passwordError = document.getElementById('passwordError');
      const loginButton = document.getElementById('loginButton');

      loginButton.addEventListener('click', function () {
        const email = emailInput.value;
        const password = passwordInput.value;

        if (!email || !password) {
          if (!email) {
            emailError.innerHTML = '<p>Email is required.</p>';
          } else {
            emailError.innerHTML = '';
          }
          
          if (!password) {
            passwordError.innerHTML = '<p>Password is required.</p>';
          } else {
            passwordError.innerHTML = '';
          }
        } else {
          if (email === 'abc@gmail.com' && password === '1234') {
            // Successful login
            console.log('Login successful:', email);
            emailError.innerHTML = '';
            passwordError.innerHTML = '';
          } else {
            // Failed login
            Swal.fire({
              icon: 'error',
              title: 'Login Failed',
              text: 'Invalid email or password',
              confirmButtonColor: '#3085d6',
              confirmButtonText: 'OK'
            });
          }
        }
      });
    });
  </script>
</body>
</html>
