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
<title>The Jobs | Admin Login</title>
</head>
<body>
 <script>
document.addEventListener("DOMContentLoaded", function() {
    var admin = sessionStorage.getItem("admin");
    var dashboardLink = document.getElementById("dashboardLink");
	var logoutLink = document.getElementById("logoutLink");
	var loginLink = document.getElementById("loginLink");
	var profileLink = document.getElementById("profileLink");
	var dateLink = document.getElementById("dateLink");
    if (!admin) {
    	profileLink.style.display = "none";
    	dashboardLink.style.display = "none";
    	logoutLink.style.display = "none";
    	dateLink.style.display = "none";
    	}else{
    	loginLink.style.display = "none";
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
					<li class="nav-item" id="dashboardLink"><a class="nav-link" href="adminDashboard.jsp">Dashboard</a>
					</li>
					<li class="nav-item" id="dateLink"><a class="nav-link" href="adminDates.jsp">Dates </a></li>
					<li class="nav-item" id="profileLink"><a class="nav-link" href="adminProfile.jsp">Profile </a></li>
					<li class="nav-item  active" id="loginLink"><a class="nav-link" href="#">Login </a></li>
					<li class="nav-item" id="logoutLink"><a class="nav-link" href="#">Logout </a></li>
				</ul>
			</div>
		</div>
	</nav>

<div class="container" style="margin: 80px auto">
			<div
				class="row d-flex justify-content-center align-items-center h-100">
				<div class="col-md-6">
				<div class="card text-black"
						style="border-radius: 25px;">
						<div class="card-body">
							<div class="row justify-content-center" style="margin: 5% 0%;">
								<div class="col-md-12">
									<p class="text-center h1 fw-bold mb-5 mx-1 mx-md-4 mt-4">Admin Login</p>

									<form class="mx-1 mx-md-4" id="loginForm">
										<!-- username input -->
										<div class="d-flex flex-row align-items-center mb-4">
											<div class="form-outline flex-fill mb-0">
												<label class="form-label">Your Email</label><span
													class="text-danger">*</span> <input type="email"
													class="form-control" name="email" id="email" required />
												<div class="text-danger" id="emailError"></div>
											</div>
										</div>
										<!-- password input -->
										<div class="d-flex flex-row align-items-center mb-4">
											<div class="form-outline flex-fill mb-0">
												<label class="form-label" for="password">Password</label><span
													class="text-danger">*</span> <input type="password"
													name="password" id="password" class="form-control" required />
												<div class="text-danger" id="passwordError"></div>
											</div>
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
        	
        	const hashedPW =md5(password)
        	$.ajax({
                url: "http://localhost:8080/ams/admin",
                type: "GET",
                data: {
                  email: email,
                  password: hashedPW,
                  actiontype: "login"
                },
                success: function(result) {
                	sessionStorage.setItem("admin", result);
                	
                	window.location.href = "adminDashboard.jsp";

                },
                error: function(xhr, status, error) {

                    if (xhr.status === 401) {

                        Swal.fire({
                            icon: 'error',
                            title: 'Login Failed',
                            text: 'Invalid email or password',
                            confirmButtonColor: '#3085d6',
                            confirmButtonText: 'OK'
                          });
                    } else {

                      console.log("An error occurred: " + xhr.statusText);
                    }
                  }
              });
        }
      });
    });
  </script>
</body>
</html>
