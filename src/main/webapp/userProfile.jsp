<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
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
<title>Profile</title>
</head>
<body>
<script src="main.js"></script>
	<script>
		document.addEventListener("DOMContentLoaded", function() {
			handleUserSession();
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
				</svg> Job Consultancy
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
					<li class="nav-item  active" id="profileLink"><a class="nav-link" href="#">Profile </a></li>
					<li class="nav-item" id="regLink"><a class="nav-link" href="register.jsp">Register </a></li>
					<li class="nav-item" id="loginLink"><a class="nav-link" href="login.jsp">Login </a></li>
					<li class="nav-item" id="logoutLink"><a class="nav-link" href="#">Logout </a></li>
				</ul>
			</div>
		</div>
	</nav>
	<div class="container" style="margin-top: 80px;">
		<div class="card" style="border-radius: 25px;">
			<div class="card-body p-md-5">
				<h1 class="card-title">My Profile</h1>
				<hr>
				<div class="row" style="margin: 30px 0px">
					<div class="col-md-6">
						<div id="profile" class="card-body" style="margin: 10% 0%;">
							<form class="mx-1 mx-md-4">
								<!-- Profile Section -->
								<div id="profile-section">


									<div class="card-body text-center">
										<img
											src="https://cdn.pixabay.com/photo/2016/08/08/09/17/avatar-1577909_1280.png"
											alt="avatar" class="rounded-circle img-fluid"
											style="width: 150px;">
										<h5 class="my-3" id="profile-name"></h5>
										<p class="text-muted mb-1" id="profile-email"></p>
										<p class="text-muted mb-1" id="profile-phone"></p>
										<p class="text-muted mb-4" id="profile-field"></p>
										<div class="d-flex justify-content-center mb-2">
											<button type="button" style="margin-right: 5px;"
												class="btn btn-primary" id="update-button">Update</button>
											<button type="button" class="btn btn-primary"
												id="change-password-button">Change Password</button>
										</div>
									</div>
								</div>

								<!-- Update Section -->
								<div id="update-section" style="display: none;">
									<!-- Name input -->
									<div class="d-flex flex-row align-items-center mb-4">
										<div class="form-outline flex-fill mb-0">
											<label class="form-label">Name</label><span
												class="text-danger">*</span> <input type="text"
												class="form-control" id="name" required />
											<div class="text-danger" id="nameError"></div>
										</div>
									</div>
									<!-- Email input -->
									<div class="d-flex flex-row align-items-center mb-4">
										<div class="form-outline flex-fill mb-0">
											<label class="form-label">Email</label><span
												class="text-danger">*</span> <input type="email"
												class="form-control" id="email" required />
											<div class="text-danger" id="emailError"></div>
										</div>
									</div>
									<!-- Number input -->
									<div class="d-flex flex-row align-items-center mb-4">
										<div class="form-outline flex-fill mb-0">
											<label class="form-label">Number</label><span
												class="text-danger">*</span> <input type="number"
												class="form-control" id="number" required />
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
									<div class="row" style="margin: 60px">
										<div class="d-flex justify-content-center mx-4 mb-3 mb-lg-4">
											<button type="button" style="margin-right: 5px;"
												class="btn btn-success" id="save-button">Save</button>
											<button type="button" class="btn btn-danger"
												id="cancel-button">Cancel</button>
										</div>
									</div>

								</div>
								<div id="password-section" style="display: none;">
									<!-- Current Password input -->
									<div class="d-flex flex-row align-items-center mb-4">
										<div class="form-outline flex-fill mb-0">
											<label class="form-label">Current Password</label><span
												class="text-danger">*</span> <input type="password"
												class="form-control" id="currentPassword" required />
											<div class="text-danger" id="currentPasswordError"></div>
										</div>
									</div>
									<!-- Password input -->
									<div class="d-flex flex-row align-items-center mb-4">
										<div class="form-outline flex-fill mb-0">
											<label class="form-label">Password</label><span
												class="text-danger">*</span> <input type="password"
												class="form-control" id="password" required />
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
									<div class="row" style="margin: 60px">
										<div class="d-flex justify-content-center mx-4 mb-3 mb-lg-4">
											<button type="button" style="margin-right: 5px;"
												class="btn btn-success" id="pw-save-button">Save</button>
											<button type="button" class="btn btn-danger"
												id="pw-cancel-button">Cancel</button>
										</div>
									</div>
								</div>
							</form>
						</div>





					</div>
					<div class="col-md-6">
						<img style="width: 500px;display: block;margin-left: auto;	margin-right: auto;"
							src="https://img.freepik.com/free-vector/resume-concept-illustration_114360-255.jpg?w=826&t=st=1690785552~exp=1690786152~hmac=1bb82c23ed5905cc735542644b20b0c5a47f9a1d5184cf299c28318c15e0e521"
							class="img-fluid profile-img" alt="Sample image">
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
	var user = JSON.parse(sessionStorage.getItem("jobSeeker"));
	/*   console.log(user); */
	const displayName = document.getElementById('profile-name');
	const displayEmail = document.getElementById('profile-email');
	const displayNumber = document.getElementById('profile-phone');
	const displayField = document.getElementById('profile-field');


	const profileSection = document.getElementById('profile-section');
	const updateSection = document.getElementById('update-section');
	const passwordSection = document.getElementById('password-section');
	const updateButton = document.getElementById('update-button');
	const changePasswordButton = document.getElementById('change-password-button');
	const saveButton = document.getElementById('save-button');
	const cancelButton = document.getElementById('cancel-button');
	const pwSaveButton = document.getElementById('pw-save-button');
	const pwCancelButton = document.getElementById('pw-cancel-button');

	const nameInput = document.getElementById('name');
	const emailInput = document.getElementById('email');
	const numberInput = document.getElementById('number');
	const fieldInput = document.getElementById('field');
	const nameError = document.getElementById('nameError');
	const emailError = document.getElementById('emailError');
	const numberError = document.getElementById('numberError');
	const fieldError = document.getElementById('fieldError');

	const currentPasswordInput = document.getElementById('currentPassword');
	const passwordInput = document.getElementById('password');
	const repeatPasswordInput = document.getElementById('repeatPassword');
	const currentPasswordError = document.getElementById('currentPasswordError');
	const passwordError = document.getElementById('passwordError');
	const repeatPasswordError = document.getElementById('repeatPasswordError');

	var responseName;
	var responseEmail;
	var responseNumber;
	var responseField;
	var responsePassword;


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




	$.ajax({
		url: "http://localhost:8080/ams/jobseeker",
		type: "GET",
        data: {
          seekerId: user.id,
          actiontype: "getUser"
        },
		dataType: "json",
		success: function(response) {
			//Update the HTML tags with the fetched data
			responseName = response.name;
			responseEmail = response.email;
			responseNumber = response.number;
			responseField = response.field;
			responsePassword = response.password;

			displayName.innerHTML = response.name;
			displayEmail.innerHTML = response.email;
			displayNumber.innerHTML = response.number;
			displayField.innerHTML = response.field;
		},
		error: function(xhr, status, error) {
			console.log("Error fetching data:", error);
		}
	});

	// Add event listeners
	updateButton.addEventListener('click', showUpdateSection);
	changePasswordButton.addEventListener('click', showPasswordSection);
	cancelButton.addEventListener('click', showProfileSection);
	pwCancelButton.addEventListener('click', showProfileSection);

	function showUpdateSection() {
		profileSection.style.display = 'none';
		updateSection.style.display = 'block';
		nameInput.value = responseName;
		emailInput.value = responseEmail;
		numberInput.value = responseNumber;
		fieldInput.value = responseField;


	}

	function showPasswordSection() {
		profileSection.style.display = 'none';
		passwordSection.style.display = 'block';
	}

	function showProfileSection() {
		profileSection.style.display = 'block';
		updateSection.style.display = 'none';
		passwordSection.style.display = 'none'
		nameInput.value = '';
		emailInput.value = '';
		numberInput.value = '';
		repeatPasswordError.innerHTML = '';
		currentPasswordInput.value = '';
		passwordInput.value = '';

	}


	saveButton.addEventListener('click', () => {
		const name = nameInput.value;
		const email = emailInput.value;
		const number = numberInput.value;
		const field = fieldInput.value;

		if (!name || !email || !number || !field) {
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
			if (!number) {
				numberError.innerHTML = '<p>Number is required.</p>';
			} else if (!/^[0-9]{10}$/.test(number)) {
				numberError.innerHTML = '<p>Number must be 10 digits (ex-0712345678).</p>';
			} else {
				numberError.innerHTML = '';
			}
			if (!field) {
				fieldError.innerHTML = '<p>Field is required.</p>';
			} else {
				fieldError.innerHTML = '';
			}
		} else {
			if (name === responseName && email === responseEmail && number === responseNumber && field === responseField) {
				Swal.fire({
					icon: 'error',
					text: 'There is nothing to update!',
					confirmButtonColor: '#3085d6',
					confirmButtonText: 'OK'
				});
				showProfileSection();

			} else {
				$.ajax({
					url: "http://localhost:8080/ams/jobseeker",
					type: "POST",
					data: {
						email: email,
						actiontype: "edit",
						password: user.password,
						number: number,
						name: name,
						field: field,
						id: user.id
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
								window.location.href = 'userProfile.jsp';
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
				showProfileSection();

			}



		}
	});

	pwSaveButton.addEventListener('click', () => {
		const currentPassword = currentPasswordInput.value;
		const password = passwordInput.value;
		const repeatPassword = repeatPasswordInput.value;
		if (!password || !repeatPassword || !currentPassword) {
			if (!currentPassword) {
				currentPasswordError.innerHTML = '<p>Current password is required.</p>';
			} else {
				currentPasswordError.innerHTML = '';
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
			currentPasswordError.innerHTML = '';
			passwordError.innerHTML = '';
			repeatPasswordError.innerHTML = '';

			const hashedPW = md5(currentPassword)

			if (hashedPW !== responsePassword) {
				currentPasswordError.innerHTML = '<p> Incorrect Current password.</p>';
			} else {
				currentPasswordError.innerHTML = '';

				if (password !== repeatPassword) {
					repeatPasswordError.innerHTML = '<p>Passwords do not match.</p>';
				} else {
					const newHashedPW = md5(password)
					$.ajax({
						url: "http://localhost:8080/ams/jobseeker",
						type: "POST",
						data: {
							email: responseEmail,
							actiontype: "edit",
							password: newHashedPW,
							number: responseNumber,
							name: responseName,
							field: responseField,
							id: user.id
						},
						success: function(response) {
							console.log("Success:", response);

							Swal.fire({
								icon: 'success',
								title: 'Success!',
								text: 'Password changed!',
								confirmButtonColor: '#3085d6',
								confirmButtonText: 'OK'
							}).then((result) => {
								if (result.isConfirmed) {
									window.location.href = 'userProfile.jsp';
								}
							});

						},
						error: function(xhr, status, error) {
							if (xhr.status === 500) {
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
					showProfileSection();
				}
			}
		}

	});

	function isValidEmail(email) {
		const emailPattern = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/;
		return emailPattern.test(email);
	}
	</script>
</body>
</html>
