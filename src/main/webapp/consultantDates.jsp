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
<title>Manage Time Slots</title>
<link rel="stylesheet" href="styles.css">
 <!-- Include Bootstrap Datepicker CSS and JavaScript -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"></script>
<style>
.card {
	margin: 40px auto;
}

tr {
	height: 50px;
}

.img {
	width: 500px;
	display: block;
	margin-left: auto;
	margin-right: auto;
}
</style>
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
	<div class="container">
		<div class="card">
			<div class="card-body p-md-5">
				<h1 class="card-title">My Available Date & Times</h1>
				<hr>
				<div class="row" style="margin: 30px 0px">
					<div class="col-md-5">
						<h2 class="card-title">Add Time Slots</h2>
						<p style="text-align: center" id="response">${feebackMessage}</p>
						<form id="dateForm" action="addslots" method="post">

							<div class="col-md-6">
								
								
								<div class="d-flex flex-row align-items-center mb-4">
									<div class="form-outline flex-fill mb-0">
										<label class="form-label"> Date</label><span
											class="text-danger">*</span> 
											<input type="text" id="date" class="form-control">
										<div class="text-danger" id="dateError"></div>
									</div>
								</div>
								
								<div class="d-flex flex-row align-items-center mb-4">
									<div class="form-outline flex-fill mb-0">
										<label class="form-label"> Start Time</label><span
											class="text-danger">*</span> <input type="time"
											class="form-control" id="startTime"  />
										<div class="text-danger" id="startTimeError"></div>
									</div>
								</div>

								
								<div class="d-flex flex-row align-items-center mb-4">
									<div class="form-outline flex-fill mb-0">
										<label class="form-label"> End Time</label><span
											class="text-danger">*</span> <input type="time"
											class="form-control" id="endTime"  />
										<div class="text-danger" id="endTimeError"></div>
									</div>
								</div>
							</div>

							<input type="hidden" name="slot" id="slot"  />
							<input type="hidden" name="dateCreated" id="dateCreated"  />
							<input type="hidden" name="id" id="id" />
							<input type="hidden" name="country" id="country"  />
							<input type="hidden" name="field" id="field"  />
							
							<input type="hidden" name="actiontype" value="add" />

							<!-- Submit Button -->
							<div class="d-flex justify-content-center">
								<button type="button" class="btn btn-primary"
									id="add">Add</button>
							</div>
						</form>
					</div>
					<div class="col-md-7 justify-content-center">
						<img
							src="https://img.freepik.com/free-vector/appointment-booking-mobile-design_23-2148573175.jpg?w=826&t=st=1690797461~exp=1690798061~hmac=3ca79ead27a6b948b34054b59ef9169e8ebd11ebb95bc6e1f8fdfa1b837b8556"
							class="img-fluid img" alt="Sample image">
					</div>
				</div>
				<div class="row">
					<h2 class="card-title">View My Time Slots</h2>
					<div class="table-responsive">
											<table class="table">
												<thead class="thead-light">
													<tr>
														<th>Time Slot</th>
														<th>State</th>

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

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"></script>
    <script>
        $(document).ready(function () {
            $('#date').datepicker({
                startDate: new Date(),
                autoclose: true
            });
        });
    </script>
	<script>
		// JavaScript logic for form validation and submission
		document
				.addEventListener(
						'DOMContentLoaded',
						function() {
							const dateForm = document
									.getElementById('dateForm');
							const dateInput = document
									.getElementById('date');
							const startTimeInput = document
									.getElementById('startTime');
							const endTimeInput = document
									.getElementById('endTime');
							const add = document
									.getElementById('add');
							
							

				            

							add.addEventListener('click',function() {
												// Validate the field input
												const date = dateInput.value;
												const startTime = startTimeInput.value;
												const endTime = endTimeInput.value;


												if (!date || !startTime
														|| !endTime) {
													if (!date) {
														dateError.innerHTML = '<p>Date is required.</p>';
													} else {
														dateError.innerHTML = '';
													}
													if (!startTime) {
														startTimeError.innerHTML = '<p>Start time is required.</p>';
													} else {
														startTimeError.innerHTML = '';
													}
													if (!endTime) {
														endTimeError.innerHTML = '<p>End time is required.</p>';
													} else {
														endTimeError.innerHTML = '';
													}
												

												} else {
													dateError.innerHTML = '';
													startTimeError.innerHTML = '';
													endTimeError.innerHTML = '';
													
													if (endTime <= startTime) {
														document.getElementById("endTimeError").textContent = "Invalid time range";
														return;
							                    	  }else
							                    	  {
							                    		  document.getElementById("endTimeError").textContent = "";
							                    		  console.log('successful!',date,startTime,endTime);
							                    		  
							                    		  
							                    		var currentDate = new Date();
							                    		var year = currentDate.getFullYear();
							                    		var month = currentDate.getMonth() + 1; 
							                    		var day = currentDate.getDate();
							                    		var formattedDate = year + '-' + month + '-' + day;
								                    		
						                    		  	const slotString = date +" "+ startTime+" - "+endTime;
						                    		  	
						                    		  	dateForm.elements['slot'].value = slotString;
						                    		  	dateForm.elements['dateCreated'].value = formattedDate;
						                    		  	dateForm.elements['id'].value = "6";
						                              	dateForm.elements['country'].value = "UK";
						                              	dateForm.elements['field'].value = "IT";
							                              
							                    		  
							                    		  dateForm.submit();
							                              
							                              var popupContainer = document.getElementById('popupContainer');
							                              popupContainer.style.display = 'block';

							                              setTimeout(function () {
							                                  popupContainer.style.display = 'none';
							              				}, 2000);
							                    		  
							                    	  }


													

												}

											});
						});
	</script>

</body>
</html>
