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
<title>The Jobs | Admin Dates</title>
</head>
<body>
<script src="admin.js"></script>
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
					<li class="nav-item active" id="dateLink"><a class="nav-link" href="#">Dates </a></li>
										<li class="nav-item" id="profileLink"><a class="nav-link" href="adminProfile.jsp">Profile </a></li>
					<li class="nav-item " id="loginLink"><a class="nav-link" href="adminLogin.jsp">Login </a></li>
					<li class="nav-item" id="logoutLink"><a class="nav-link" href="#">Logout </a></li>
				</ul>
			</div>
		</div>
	</nav>
	<div class="container" style="margin: 80px auto"">
		<div class="card" style="border-radius: 25px;">
			<div class="card-body p-md-5">
				<h1 class="card-title">My Available Date & Times</h1>
				<hr>
				<div class="row" style="margin: 30px 0px">
					<div class="col-md-5">
						<h2 class="card-title">Add Time Slots</h2>
						<form id="dateForm">

							<!-- <div class="col-md-6"> -->


								<div class="d-flex flex-row align-items-center mb-4">
									<div class="form-outline flex-fill mb-0">
										<label class="form-label"> Date</label><span
											class="text-danger">*</span> 
											<input type="date" id="date" name="date" class="form-control">
											<!-- <input type="text" id="date"class="form-control"> -->
										<div class="text-danger" id="dateError"></div>
									</div>
								</div>

								<div class="d-flex flex-row align-items-center mb-4">
									<div class="form-outline flex-fill mb-0">
										<label class="form-label"> Start Time</label><span
											class="text-danger">*</span> <input type="time"
											class="form-control" id="startTime" />
										<div class="text-danger" id="startTimeError"></div>
									</div>
								</div>


								<div class="d-flex flex-row align-items-center mb-4">
									<div class="form-outline flex-fill mb-0">
										<label class="form-label"> End Time</label><span
											class="text-danger">*</span> <input type="time"
											class="form-control" id="endTime" />
										<div class="text-danger" id="endTimeError"></div>
									</div>
								</div>
							<!-- </div> -->

						<!-- 	<input type="hidden" name="slot" id="slot" /> <input
								type="hidden" name="dateCreated" id="dateCreated" /> <input
								type="hidden" name="id" id="id" /> <input type="hidden"
								name="country" id="country" /> <input type="hidden"
								name="field" id="field" /> <input type="hidden"
								name="actiontype" value="add" /> -->

							<!-- Submit Button -->
							<div class="d-flex justify-content-center">
								<button type="button" class="btn btn-primary" id="add">Add</button>
							</div>
						</form>
					</div>
					<div class="col-md-7 justify-content-center">
						<img
							src="https://img.freepik.com/free-vector/build-your-program-appointment-booking_23-2148552954.jpg?w=826&t=st=1692513261~exp=1692513861~hmac=4f7dc6e823139b72c1b43ee75bb66ee846f14876dd38e23d93fbc94ebfad8184"
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
									<th>Action</th>

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
  var birthdayInput = document.getElementById('date');

  birthdayInput.addEventListener('input', function () {
    var selectedDate = new Date(birthdayInput.value);
    var yyyy = selectedDate.getFullYear();
    var mm = String(selectedDate.getMonth() + 1).padStart(2, '0');
    var dd = String(selectedDate.getDate()).padStart(2, '0');

    var formattedDate = yyyy + '-' + mm + '-' + dd;
    birthdayInput.value = formattedDate;
  });

  birthdayInput.addEventListener('change', function () {
    console.log('Selected date:', birthdayInput.value);
  });

  var today = new Date();
  var minDate = today.toISOString().split('T')[0];
  birthdayInput.setAttribute('min', minDate);
</script>

	<script>
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
            var admin = JSON.parse(sessionStorage.getItem("admin"));   
            console.log(admin);



            add.addEventListener('click', function() {
                // Validate the field input
                const date = dateInput.value;
                const startTime = startTimeInput.value;
                const endTime = endTimeInput.value;


                if (!date || !startTime ||
                    !endTime) {
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
                    } else {
                        document.getElementById("endTimeError").textContent = "";

                        /* var currentDate = new Date();
                        var year = currentDate.getFullYear();
                        var month = currentDate.getMonth() + 1;
                        var day = currentDate.getDate();
                        var formattedCurrentDate = year + '-' + month + '-' + day; */

                        const slotString = date + " " + startTime + " - " + endTime;
                        console.log(slotString);
                        
                                    
                        
                        $.ajax({
                            url: "http://localhost:8080/ams/appointment",
                            type: "POST",
                            data: {
                              actiontype: "add",
                              id: admin.id,
                              country: admin.country,
                              field: admin.field,
                              date:date,
                              slot:slotString
                              
                            },
                            success: function(response) {
                              console.log("Success:", response);
                              
                              Swal.fire({
                                  icon: 'success',
                                  title: 'Success!',
                                  text: 'Time slot added successfully!',
                                  confirmButtonColor: '#3085d6',
                                  confirmButtonText: 'OK'
                                }).then((result) => {
                                  if (result.isConfirmed) {
                                    window.location.href = 'adminDates.jsp';
                                  }
                                });
                              
                            },
                            error: function(xhr, status, error) {
                              if (xhr.status === 400) {
                            	  Swal.fire({
                                      icon: 'error',
                                      title: 'Failed',
                                      text: 'This time slot exists!',
                                      confirmButtonColor: '#3085d6',
                                      confirmButtonText: 'OK'
                                    });
                              } else if (xhr.status === 500) {
                                Swal.fire({
                                    icon: 'error',
                                    title: 'Failed',
                                    text: 'Failed to add the time slot!!',
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
	</script>
		<script>
	$(document)
	.ready(
		function() {
			$.ajax({
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
		
		
		//sorting to the state order
		var stateOrder = ["active", "pending", "confirmed", "rejected", "completed"];
		var arrayOfObjects = arrayOfObjects.sort((a, b) => {
			  return stateOrder.indexOf(a.state) - stateOrder.indexOf(b.state);
			}); 
		
		//getting the date for the user
 		var admin = JSON.parse(sessionStorage.getItem("admin")); 
		arrayOfObjects = arrayOfObjects.filter(function(item) {
			  return item.adminId===admin.id;
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
	            var slot = row.insertCell(0);
	            var status = row.insertCell(1);
	            var actionCell = row.insertCell(2);


	            slot.textContent = obj.slot;
	           /*  state.textContent = obj.state; */

	            
	           
	        var viewState = document.createElement("div");
	        var btnDelete = document.createElement("span");
      		btnDelete.innerHTML = ` 
      			<button id="reject" class="btn btn-danger btn-sm"><svg width="25" height="25" fill="#ffffff" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
      		  <path d="M20.979 4.5H15.75V2.25A.75.75 0 0 0 15 1.5H9a.75.75 0 0 0-.75.75V4.5H3.021L3 6.375h1.547l.942 14.719A1.5 1.5 0 0 0 6.984 22.5h10.032a1.5 1.5 0 0 0 1.496-1.404l.941-14.721H21L20.979 4.5ZM8.25 19.5l-.422-12h1.547l.422 12H8.25Zm4.5 0h-1.5v-12h1.5v12Zm1.125-15h-3.75V3.187A.188.188 0 0 1 10.313 3h3.374a.188.188 0 0 1 .188.188V4.5Zm1.875 15h-1.547l.422-12h1.547l-.422 12Z"></path>
      			</svg></button>`;
    
	            if(obj.state==="active"){
	            	actionCell.appendChild(btnDelete);
	            	viewState.innerHTML = `<svg width="25" height="25" fill="#29bd00" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
	            		  <path d="M12 21.75c-5.376 0-9.75-4.374-9.75-9.75S6.624 2.25 12 2.25s9.75 4.374 9.75 9.75-4.374 9.75-9.75 9.75Z"></path>
	            		</svg> Active`;
	            	
	            }else{
	            	viewState.innerHTML = `<svg width="25" height="25" fill="#f00000" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
	            		  <path d="M12 21.75c-5.376 0-9.75-4.374-9.75-9.75S6.624 2.25 12 2.25s9.75 4.374 9.75 9.75-4.374 9.75-9.75 9.75Z"></path>
	            		</svg> In Progress`;
	            	
	            }
	           
	            status.appendChild(viewState);
	            
	            btnDelete.addEventListener("click", function () {

	                Swal.fire({
	                    icon: 'warning',
	                    title: 'Confirm Delete',
	                    text: 'Are you sure you want to delete this appointment?',
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
	  	                	    actiontype: "delete",
	  	                	    id: obj.id,
	  	                	  },
	  	                	  success: function(response) {
	  	                		Swal.fire({
									icon: 'success',
									title: 'Success!',
									text: 'Appointment deleted!',
									confirmButtonColor: '#3085d6',
									confirmButtonText: 'OK'
								}).then((result) => {
									if (result.isConfirmed) {
										window.location.href = 'adminDates.jsp';
									}
								});
	  	                	  },
	  	                	  error: function(xhr, status, error) {
	  	                		Swal.fire({
									icon: 'error',
									title: 'Failed',
									text: 'Failed to delete the appointment!',
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
