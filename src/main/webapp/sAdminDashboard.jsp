<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
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
<title>The Jobs | Super Admin Dashboard</title>


</head>
<body>
	<script src="superAdmin.js"></script>
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
					<li class="nav-item active" id="dashboardLink"><a class="nav-link"	href="#">Dashboard</a></li>
					<li class="nav-item" id="dateLink"><a class="nav-link" href="sAdminDates.jsp">Dates </a></li>
					<li class="nav-item" id="consultantLink"><a class="nav-link" href="sAdminConsultants.jsp">Consultants </a></li>
					<li class="nav-item" id="userlink"><a class="nav-link" href="sAdminUsers.jsp">Users </a></li>
					<li class="nav-item" id="reportslink"><a class="nav-link" href="sAdminReports.jsp">Reports </a></li>
					<li class="nav-item" id="profileLink"><a class="nav-link" href="sAdminProfile.jsp">Profile </a></li>
					<li class="nav-item" id="loginLink"><a class="nav-link" href="sAdminLogin.jsp">Login </a></li>
					<li class="nav-item" id="logoutLink"><a class="nav-link" href="#">Logout </a></li>
				</ul>
			</div>
		</div>
	</nav>


	<div class="container" style="margin: 80px auto">
		<div class="card" style="border-radius: 25px;">
			<div class="card-body p-md-5">
				<h1 class="card-title">Appointment Details</h1>
				<hr>
				<div class="row" style="margin: 30px 0px">
					<div class="col-md-4" style="margin-bottom: 20px;">
						<input class="form-control" id="myInput" type="text"
							placeholder="Search..">
					</div>


					<div class="table-responsive">
						<table class="table">
							<thead class="thead-light">
								<tr>
									<th>Job Seeker</th>
									<th>Consultant</th>
									<th>Time Slot</th>
									<th>Created Date</th>
									<th>Status</th>
									<th>Actions</th>
								</tr>
							</thead>
							<tbody id="tableBody">
							</tbody>
						</table>
						<p id="noResults"
							style="display: none; text-align: center; margin-bottom: 30px;">No
							results found.</p>
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
		 $(document).ready(function(){
		      $("#myInput").on("keyup", function() {
		        var value = $(this).val().toLowerCase();
		        var tableRows = $("#tableBody tr");
		        var noResultsMessage = $("#noResults");
		        
	
		        tableRows.filter(function() {
		          $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1);
		        });
		        
		        
		        var row = tableBody.insertRow();
		        var noDataCell;
	
		        if (tableRows.filter(":visible").length === 0) {
		        	noResultsMessage.show();
		        } else{
		        	noResultsMessage.hide();
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
		arrayOfObjects = arrayOfObjects.filter(function(item) {
			  return item.state != "active" ;
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
	            var jobSeeker = row.insertCell(0);
	            var consultant = row.insertCell(1);
	            var timeSlot = row.insertCell(2);
	            var date = row.insertCell(3);
	            var status = row.insertCell(4);
	            var actionCell = row.insertCell(5);



	            jobSeeker.textContent = obj.seekerName;
	            consultant.textContent = obj.adminName;
	            timeSlot.textContent = obj.slot;
	            date.textContent = obj.assigned_date;
	            
	           
	        var viewState = document.createElement("div");
    
      		
      		var btnAcc = document.createElement("span");
      		btnAcc.innerHTML = ` 
        		 <button id="accept" class="btn btn-success btn-sm"><svg width="25" height="25" fill="#ffffff" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
        		  <path d="M12 2.25c-5.376 0-9.75 4.374-9.75 9.75s4.374 9.75 9.75 9.75 9.75-4.374 9.75-9.75S17.376 2.25 12 2.25Zm-1.781 14.643L6.44 12.694l1.115-1.003 2.625 2.916 6.225-7.414 1.15.963-7.337 8.737Z"></path>
        		  </svg></button> 
        		`;
        		
        	var btnRej = document.createElement("span");
      		btnRej.innerHTML = ` 
      			<button id="reject" class="btn btn-danger btn-sm"><svg width="25" height="25" fill="#ffffff" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
        		  <path d="M12 2.25c-5.376 0-9.75 4.374-9.75 9.75s4.374 9.75 9.75 9.75 9.75-4.374 9.75-9.75S17.376 2.25 12 2.25ZM16.06 15 15 16.06l-3-3-3 3L7.94 15l3-3-3-3L9 7.94l3 3 3-3L16.06 9l-3 3 3 3Z"></path>
        		</svg></button>  
        		`;
        		
        		
        	var btnCom= document.createElement("span");
      		btnCom.innerHTML = ` 
      			<button id="reject" class="btn btn-primary btn-sm"><svg width="25" height="25" fill="#ffffff" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
      		  <path d="M12.136 2.25c-5.484-.073-9.96 4.403-9.886 9.887.073 5.259 4.355 9.54 9.614 9.614 5.484.075 9.96-4.402 9.885-9.885-.072-5.26-4.354-9.542-9.613-9.615Zm-.787 9.023 2.416-2.766a.75.75 0 0 1 1.13.988l-2.416 2.765a.749.749 0 1 1-1.13-.987ZM9.527 15.53a.75.75 0 0 1-1.06 0l-2.248-2.25a.75.75 0 0 1 1.062-1.06l2.25 2.25a.75.75 0 0 1-.004 1.06Zm8.288-6.037-5.245 6a.75.75 0 0 1-.54.257h-.024a.75.75 0 0 1-.531-.22l-2.247-2.25a.75.75 0 0 1 1.061-1.06l1.397 1.398a.375.375 0 0 0 .547-.018l4.453-5.094a.75.75 0 0 1 1.13.988h-.001Z"></path>
      			</svg></button>  
        		`;

        		
	            if(obj.state==="pending"){
	            	viewState.innerHTML = `<svg width="25" height="25" fill="#e0a500" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
	            		  <path d="M19.5 1.5h-15v5.25L9.563 12 4.5 17.25v5.25h15v-5.25L14.437 12 19.5 6.75V1.5Zm-6.75 9v5.25l4.266 4.5H6.938l4.312-4.5V10.5L7.5 6.75h9l-3.75 3.75Z"></path>
	            		</svg> Pending`;
	            		

	            	 	actionCell.appendChild(btnAcc);
	            		actionCell.appendChild(btnRej);
	            
		            	
	            }
	            else if(obj.state==="confirmed"){
	            	viewState.innerHTML = `<svg width="25" height="25" fill="#00d12a" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
	            		  <path d="M12 2.25c-5.376 0-9.75 4.374-9.75 9.75s4.374 9.75 9.75 9.75 9.75-4.374 9.75-9.75S17.376 2.25 12 2.25Zm-1.781 14.643L6.44 12.694l1.115-1.003 2.625 2.916 6.225-7.414 1.15.963-7.337 8.737Z"></path>
	            		</svg> Confirmed`;
	            	actionCell.appendChild(btnCom);
	            }
	            
	            else if(obj.state==="rejected"){
	            	viewState.innerHTML = `<svg width="25" height="25" fill="#ff0000" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
	            		  <path d="M12 2.25c-5.376 0-9.75 4.374-9.75 9.75s4.374 9.75 9.75 9.75 9.75-4.374 9.75-9.75S17.376 2.25 12 2.25ZM16.06 15 15 16.06l-3-3-3 3L7.94 15l3-3-3-3L9 7.94l3 3 3-3L16.06 9l-3 3 3 3Z"></path>
	            		</svg> Rejected`;
	            }
	            
	            else if(obj.state==="completed"){
	            	viewState.innerHTML = `<svg width="25" height="25" fill="#0061ff" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
	            		  <path d="M12.136 2.25c-5.484-.073-9.96 4.403-9.886 9.887.073 5.259 4.355 9.54 9.614 9.614 5.484.075 9.96-4.402 9.885-9.885-.072-5.26-4.354-9.542-9.613-9.615Zm-.787 9.023 2.416-2.766a.75.75 0 0 1 1.13.988l-2.416 2.765a.749.749 0 1 1-1.13-.987ZM9.527 15.53a.75.75 0 0 1-1.06 0l-2.248-2.25a.75.75 0 0 1 1.062-1.06l2.25 2.25a.75.75 0 0 1-.004 1.06Zm8.288-6.037-5.245 6a.75.75 0 0 1-.54.257h-.024a.75.75 0 0 1-.531-.22l-2.247-2.25a.75.75 0 0 1 1.061-1.06l1.397 1.398a.375.375 0 0 0 .547-.018l4.453-5.094a.75.75 0 0 1 1.13.988h-.001Z"></path>
	            		</svg> Completed`;
	            }
	           
	            	
	            status.appendChild(viewState);
	            

	            btnRej.addEventListener("click", function () {

	                Swal.fire({
	                    icon: 'warning',
	                    title: 'Confirm Reject',
	                    text: 'Are you sure you want to reject this appointment?',
	                    showCancelButton: true,
	                    confirmButtonColor: '#d33',
	                    cancelButtonColor: '#3085d6',
	                    confirmButtonText: 'Reject',
	                    cancelButtonText: 'Cancel'
	                  }).then((result) => {
	                    if (result.isConfirmed) {
	    	                $.ajax({
	  	                	  url: "http://localhost:8080/ams/appointment",
	  	                	  type: "POST",
	  	                	  data: {
	  	                	    actiontype: "change",
	  	                	    id: obj.id,
	  	                	    state:"rejected"
	  	                	  },
	  	                	  success: function(response) {
	  	                		Swal.fire({
									icon: 'success',
									title: 'Success!',
									text: 'Appointment rejected!',
									confirmButtonColor: '#3085d6',
									confirmButtonText: 'OK'
								}).then((result) => {
									if (result.isConfirmed) {
										window.location.href = 'sAdminDashboard.jsp';
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
	             
	             btnAcc.addEventListener("click", function () {
	            	  Swal.fire({
		                    icon: 'success',
		                    title: 'Confirm Accept',
		                    text: 'Are you sure you want to accept this appointment?',
		                    showCancelButton: true,
		                    confirmButtonColor: '#28a745',
		                    cancelButtonColor: '#dc3545',
		                    confirmButtonText: 'Accept',
		                    cancelButtonText: 'Cancel'
		                  }).then((result) => {
		                    if (result.isConfirmed) {
		    	                $.ajax({
		  	                	  url: "http://localhost:8080/ams/appointment",
		  	                	  type: "POST",
		  	                	  data: {
		  	                	    actiontype: "change",
		  	                	    id: obj.id,
		  	                	    state:"confirmed"
		  	                	  },
		  	                	  success: function(response) {
		  	                		Swal.fire({
										icon: 'success',
										title: 'Success!',
										text: 'Appointment accepted!',
										confirmButtonColor: '#3085d6',
										confirmButtonText: 'OK'
									}).then((result) => {
										if (result.isConfirmed) {
											window.location.href = 'sAdminDashboard.jsp';
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
	             
	             btnCom.addEventListener("click", function () {
	            	  Swal.fire({
		                    icon: 'success',
		                    title: 'Confirm Completion',
		                    text: 'Are you sure you want to finish this appointment?',
		                    showCancelButton: true,
		                    confirmButtonColor: '#28a745',
		                    cancelButtonColor: '#dc3545',
		                    confirmButtonText: 'Accept',
		                    cancelButtonText: 'Cancel'
		                  }).then((result) => {
		                    if (result.isConfirmed) {
		    	                $.ajax({
		  	                	  url: "http://localhost:8080/ams/appointment",
		  	                	  type: "POST",
		  	                	  data: {
		  	                	    actiontype: "change",
		  	                	    id: obj.id,
		  	                	    state:"completed"
		  	                	  },
		  	                	  success: function(response) {
		  	                		Swal.fire({
										icon: 'success',
										title: 'Success!',
										text: 'Appointment completed successfully!',
										confirmButtonColor: '#3085d6',
										confirmButtonText: 'OK'
									}).then((result) => {
										if (result.isConfirmed) {
											window.location.href = 'sAdminDashboard.jsp';
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
