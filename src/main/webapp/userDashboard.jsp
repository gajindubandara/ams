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
<title>Dashboard</title>


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
					<li class="nav-item  active" id="dashboardLink"><a class="nav-link" href="#">Dashboard</a>
					</li>
					<li class="nav-item" id="profileLink"><a class="nav-link" href="userProfile.jsp">Profile </a></li>
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
				<h1 class="card-title">My Appointment Details</h1>
				<hr>
				<div class="row" style="margin: 30px 0px">
					<div class="col-md-5">
						<h2 class="card-title" style="margin-top: 50px;">Create New
							Appointment</h2>

						<form id="appointmentForm">

							<!-- Consultant input -->
							<div class="d-flex flex-row align-items-center mb-4">
								<div class="form-outline flex-fill mb-0">
									<label for="consultant">Consultant Name</label><span
										class="text-danger">*</span> <select class="form-control"
										id="consultant" required>
										<option value="" disabled selected>Select Consultant</option>

									</select>
									<div class="text-danger" id="consultantError"></div>
								</div>
							</div>

							<!-- Time Slot input -->
							<div class="d-flex flex-row align-items-center mb-4">
								<div class="form-outline flex-fill mb-0">
									<label for="timeSlot">Time Slot</label><span
										class="text-danger">*</span> <select class="form-control"
										id="timeSlot" required>
										<option value="" disabled selected>Select Time Slot</option>

									</select>
									<div class="text-danger" id="timeSlotError"></div>
								</div>
							</div>

							<!-- Submit Button -->
							<div class="d-flex justify-content-center">
								<button type="button" class="btn btn-primary"
									id="submitAppointment">Submit Appointment</button>
							</div>
						</form>
					</div>
					<div class="col-md-7 justify-content-center">

						<img
							style="width: 500px; display: block; margin-left: auto; margin-right: auto;"
							src="https://img.freepik.com/free-vector/appointment-booking-mobile-design_23-2148573175.jpg?w=826&t=st=1690797461~exp=1690798061~hmac=3ca79ead27a6b948b34054b59ef9169e8ebd11ebb95bc6e1f8fdfa1b837b8556"
							class="img-fluid img" alt="Sample image">
					</div>
					<div class="row">
						<h2 class="card-title" style="margin-top: 50px;">View My
							Appointments</h2>
						<div class="table-responsive">
							<table class="table">
								<thead class="thead-light">
									<tr>
										<th>Consultant</th>
										<th>Field</th>
										<th>Time Slot</th>
										<th>Created Date</th>
										<th>Actions</th>
									</tr>
								</thead>
								<tbody id="tableBody">
								</tbody>
							</table>
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
		<!-- ajax -->
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<!-- alert -->
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
	<script>
	document
	.addEventListener(
		'DOMContentLoaded',
		function() {
			const appointmentForm = document
				.getElementById('appointmentForm');

			const consultantSelect = document
				.getElementById('consultant');
			const consultantError = document
				.getElementById('consultantError');
			const slotSelect = document
				.getElementById('timeSlot');
			const slotError = document
				.getElementById('timeSlotError');
			const submitButton = document
				.getElementById('submitAppointment');

			submitButton
				.addEventListener(
					'click',
					function() {
						// Validate the field input

						const consultant = consultantSelect.value;
						const slot = slotSelect.value;

						if (!consultant || !slot) {

							if (!consultant) {
								consultantError.innerHTML = '<p>Consultant is required.</p>';
							} else {
								consultantError.innerHTML = '';
							}
							if (!slot) {
								slotError.innerHTML = '<p>Time slot is required.</p>';
							} else {
								slotError.innerHTML = '';
							}

						} else {

							consultantError.innerHTML = '';
							slotError.innerHTML = '';


							var user = JSON.parse(sessionStorage.getItem("jobSeeker"));
							console.log(user);
							console.log(user.id, slot);
							var currentDate = new Date();
							var year = currentDate.getFullYear();
							var month = currentDate.getMonth() + 1;
							var day = currentDate.getDate();
							var formattedDate = year + '-' + month + '-' + day;

							$.ajax({
								url: "http://localhost:8080/ams/appointment",
								type: "POST",
								data: {
									seekerId: user.id,
									actiontype: "book",
									assignedDate: formattedDate,
									id: slot
								},
								success: function(response) {
									Swal.fire({
										icon: 'success',
										title: 'Success!',
										text: 'The appointment was created successfully!',
										confirmButtonColor: '#3085d6',
										confirmButtonText: 'OK'
									}).then((result) => {
										if (result.isConfirmed) {
											window.location.href = 'userDashboard.jsp';
										}
									});
								},
								error: function(xhr, status, error) {
									Swal.fire({
										icon: 'error',
										title: 'Failed',
										text: 'Failed to create the appointment!',
										confirmButtonColor: '#3085d6',
										confirmButtonText: 'OK'
									});
								}
							});

						}

					});

		});
	</script>
	<script>
	$(document)
	.ready(
		function() {
			$
				.ajax({
					url: "http://localhost:8080/ams/appointment?actiontype=all",
					method: "GET",
					dataType: "json",
					success: function(data) {
						var stringifiedData = JSON
							.stringify(data);
						console.log(
							"Stringified API Data:",
							stringifiedData);
						console.log("API Data:", data);

						var fieldDropdown = document
							.getElementById("field");
						var countryDropdown = document
							.getElementById("country");
						var consultantDropdown = document
							.getElementById("consultant");
						var timeSlotDropdown = document
							.getElementById("timeSlot");
						const slotError = document
							.getElementById('timeSlotError');


						var addedConsultants = new Set();

						data.forEach(function(
								consultant) {
								if (!addedConsultants
									.has(consultant.adminName)) {
									addedConsultants
										.add(consultant.adminName);

									var option = document
										.createElement("option");
									option.value = consultant.adminName;
									option.textContent = consultant.adminName;
									consultantDropdown
										.appendChild(option);
								}
							});

						
						function updateTimeSlots(
							selectedConsultantName) {
							// Clear previous time slot options
							slotError.innerHTML = '';
							timeSlotDropdown.innerHTML = '<option value="" disabled selected>Select Time Slot</option>';

							// Find the selected consultant object
							var matchingConsultants = data
								.filter(function(
									consultant) {
									return consultant.adminName === selectedConsultantName;
								});

							console
								.log(matchingConsultants);

							// Populate time slot options for the matching consultants
							var availableSlotsFound = false;

							matchingConsultants
								.forEach(function(
									consultant) {
									var consultantDate = new Date(
										consultant.date);
									var currentDate = new Date();

									if (consultantDate > currentDate &&
										consultant.state === "active") {
										var timeSlots = consultant.slot.split(",");
										timeSlots.forEach(function(timeSlot) {
											var option = document
												.createElement("option");
											option.value = consultant.id;
											option.textContent = timeSlot;
											timeSlotDropdown
												.appendChild(option);
										});

										availableSlotsFound = true;
									}
								});

							if (!availableSlotsFound) {
								slotError.innerHTML = '<p>No available time slots</p>';
							}

						}

						// Update time slots when consultant dropdown changes
						consultantDropdown
							.addEventListener(
								"change",
								function() {
									var selectedConsultantName = consultantDropdown.value;
									updateTimeSlots(selectedConsultantName);
									console
										.log("selected");
								});
						
						
						genrateTablData(data);
					},
					error: function(xhr, status, error) {
						console.error(
							"Error fetching API data:",
							error);
					}
				});
		});
	
	
	
	function genrateTablData(arrayOfObjects){
		var user = JSON.parse(sessionStorage.getItem("jobSeeker"));
		var arrayOfObjects = arrayOfObjects.filter(function(item) {
			  return item.state != "active" && item.seekerId === user.id;
			});
	    var tableBody = document.getElementById("tableBody");

	    if (arrayOfObjects.length === 0) {
	        var row = tableBody.insertRow();
	        var noDataCell = row.insertCell();
	        noDataCell.colSpan = 7;
	        noDataCell.textContent = "No data";
	        noDataCell.style.textAlign = "center";
	        noDataCell.style.padding = "80px 0";
	    } else {
	        arrayOfObjects.forEach(function (obj) {
	            var row = tableBody.insertRow();
	            var consultant = row.insertCell(0);
	            var field = row.insertCell(1);
	            var timeSlot = row.insertCell(2);
	            var date = row.insertCell(3);
	            var actionCell = row.insertCell(4);



	            consultant.textContent = obj.adminName;
	            field.textContent = obj.field;
	            timeSlot.textContent = obj.slot;
	            date.textContent = obj.assigned_date;

	            
	            var editButton = document.createElement("button");
	            editButton.className = "btn btn-danger btn-sm";
	            editButton.innerHTML = `<svg width="16" height="16" fill="#ffffff" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
	            	  <path d="M20.25 4.5h-4.5V3.375A1.875 1.875 0 0 0 13.875 1.5h-3.75A1.875 1.875 0 0 0 8.25 3.375V4.5h-4.5a.75.75 0 0 0 0 1.5h.797l.89 14.293c.067 1.259 1.032 2.207 2.25 2.207h8.625c1.225 0 2.17-.927 2.25-2.203L19.453 6h.797a.75.75 0 1 0 0-1.5Zm-11.223 15H9a.75.75 0 0 1-.75-.723l-.375-10.5a.75.75 0 0 1 1.5-.054l.375 10.5a.75.75 0 0 1-.723.777Zm3.723-.75a.75.75 0 1 1-1.5 0V8.25a.75.75 0 1 1 1.5 0v10.5Zm1.5-14.25h-4.5V3.375A.37.37 0 0 1 10.125 3h3.75a.371.371 0 0 1 .375.375V4.5Zm1.5 14.277a.75.75 0 0 1-.75.723h-.027a.75.75 0 0 1-.723-.777l.375-10.5a.75.75 0 0 1 1.5.054l-.375 10.5Z"></path>
	            	</svg>`;
	            
	            	            
	            if(obj.state ==="booked"){
	            actionCell.appendChild(editButton);
	            }
	            
	            editButton.addEventListener("click", function () {

	                Swal.fire({
	                    icon: 'warning',
	                    title: 'Confirm Deletion',
	                    text: 'Are you sure you want to remove this appointment?',
	                    showCancelButton: true,
	                    confirmButtonColor: '#d33',
	                    cancelButtonColor: '#3085d6',
	                    confirmButtonText: 'Delete',
	                    cancelButtonText: 'Cancel'
	                  }).then((result) => {
	                    if (result.isConfirmed) {
	    	                $.ajax({
	  	                	  url: "http://localhost:8080/ams/appointment",
	  	                	  type: "POST",
	  	                	  data: {
	  	                	    actiontype: "cancel",
	  	                	    id: obj.id
	  	                	  },
	  	                	  success: function(response) {
	  	                		Swal.fire({
									icon: 'success',
									title: 'Success!',
									text: 'The appointment was removed successfully!',
									confirmButtonColor: '#3085d6',
									confirmButtonText: 'OK'
								}).then((result) => {
									if (result.isConfirmed) {
										window.location.href = 'userDashboard.jsp';
									}
								});
	  	                	  },
	  	                	  error: function(xhr, status, error) {
	  	                		Swal.fire({
									icon: 'error',
									title: 'Failed',
									text: 'Failed to cancel the appointment!',
									confirmButtonColor: '#3085d6',
									confirmButtonText: 'OK'
								});
	  	                	  }
	  	                	});
	                    }
	                  });

	            });
	        });
	    }
	}
	</script>


</body>
</html>
