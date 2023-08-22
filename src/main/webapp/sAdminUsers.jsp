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
<title>The Jobs | Users</title>


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
					<li class="nav-item " id="dashboardLink"><a class="nav-link"	href="sAdminDashboard.jsp">Dashboard</a></li>
					<li class="nav-item" id="dateLink"><a class="nav-link" href="sAdminDates.jsp">Dates </a></li>
					<li class="nav-item" id="consultantLink"><a class="nav-link" href="sAdminConsultants.jsp">Consultants </a></li>
					<li class="nav-item active" id="userlink"><a class="nav-link" href="#">Users </a></li>
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
				<h1 class="card-title">Job Seeker Details</h1>
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
									<th>Email</th>
									<th>Number</th>
									<th>Field</th>
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
					url: "http://localhost:8080/ams/jobseeker?actiontype=getAllUsers",
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
	            var email = row.insertCell(1);
	            var number = row.insertCell(2);
	            var field = row.insertCell(3);

	            jobSeeker.textContent = obj.name;
	            email.textContent = obj.email;
	            number.textContent = obj.number;
	            field.textContent = obj.field;
	        });
	    }
	}
	
	
	
	</script>


</body>
</html>
