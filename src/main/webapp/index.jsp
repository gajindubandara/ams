<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
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
<title>The Jobs</title>
</head>
<body style="min-height: fit-content">
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
			} else {
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
					<li class="nav-item active" id="indexLink"><a class="nav-link"
						href="#">Home</a></li>
					<li class="nav-item" id="dashboardLink"><a class="nav-link"
						href="userDashboard.jsp">Dashboard</a></li>
					<li class="nav-item" id="profileLink"><a class="nav-link"
						href="userProfile.jsp">Profile </a></li>
					<li class="nav-item" id="regLink"><a class="nav-link"
						href="register.jsp">Register </a></li>
					<li class="nav-item" id="loginLink"><a class="nav-link"
						href="login.jsp">Login </a></li>
					<li class="nav-item" id="logoutLink"><a class="nav-link"
						href="#">Logout </a></li>
				</ul>
			</div>
		</div>
	</nav>

	<div class="container justify-content-center" style="margin:80px auto 30px auto;">
		<div class="row">
			<div class="card"
				style="background: rgb(235, 235, 235); border-radius: 25px;">
				<div class="row  justify-content-center text-center">
					<div class="col-md-12" style="margin: 80px 0px;">
						<h1 class="display-4">Your Dream Job Awaits!</h1>
						<p class="lead">We connect job seekers with their ideal career
							consultants.</p>
						<a href="userDashboard.jsp" class="btn btn-primary btn-lg">Get
							Started</a>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="container justify-content-center" style="margin-bottom:30px;">
		<div class="row">
			<div class="card"
				style="background: rgb(235, 235, 235); border-radius: 25px;">
				<p class="text-center h1  mb-5 mx-1 mx-md-4 mt-4">Our
					Consultants</p>

				<div class="row  justify-content-center">
					<div class="col-md-8" style="margin-bottom: 50px;">
						<div class="table-responsive">
							<p>Search consultants by name or field:</p>
							<input class="form-control" id="myInput" type="text"
								placeholder="Search.."> <br>
							<table class="table">
								<thead class="thead-dark">
									<tr>
										<th>Country</th>
										<th>Field</th>
										<th>Consultant</th>

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
	</div>

	<div class="container justify-content-center" style="margin-bottom:30px;">
		<div class="row">
			<div class="card"
				style="background: rgb(235, 235, 235); border-radius: 25px;">
				<p class="text-center h1  mb-5 mx-1 mx-md-4 mt-4">Our Services</p>

				<div class="row">
					<div class="col-md-4 mb-4">
						<div class="card">
							<img
								src="https://img.freepik.com/free-vector/hand-holding-pen-concept-illustration_114360-8470.jpg?w=826&t=st=1692455412~exp=1692456012~hmac=1e77baa169c761f8c698f9257e058ed0d072b27f2429f51fc38edb45b9251152"
								class="card-img-top" alt="Service 1">
							<div class="card-body">
								<h5 class="card-title">Resume Writing</h5>
								<p class="card-text">Craft a professional resume that stands
									out to employers.</p>
							</div>
						</div>
					</div>
					<div class="col-md-4 mb-4">
						<div class="card">
							<img
								src="https://img.freepik.com/free-vector/vision-statement-concept-illustration_114360-7296.jpg?w=826&t=st=1692455514~exp=1692456114~hmac=af0506ae86cf4e4439e95a66227d1edeeabf1817678880e802fc52c4fe3b2fa8"
								class="card-img-top" alt="Service 2">
							<div class="card-body">
								<h5 class="card-title">Job Search Assistance</h5>
								<p class="card-text">We help you find and apply for the best
									job opportunities.</p>
							</div>
						</div>
					</div>
					<div class="col-md-4 mb-4">
						<div class="card">
							<img
								src="https://img.freepik.com/free-vector/interview-concept-illustration_114360-1678.jpg?w=826&t=st=1692455477~exp=1692456077~hmac=e92347e7ecdeabda387c886d10fb9774a648b5ef7c372678cae19a11173fb511"
								class="card-img-top" alt="Service 3">
							<div class="card-body">
								<h5 class="card-title">Interview Coaching</h5>
								<p class="card-text">Prepare for interviews and boost your
									chances of success.</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="container justify-content-center" style="margin-bottom:30px;">
		<div class="row">
			<div class="card"
				style="background: rgb(235, 235, 235); border-radius: 25px;">
				<p class="text-center h1  mb-5 mx-1 mx-md-4 mt-4">Our Location</p>

				<div class="col-md-12" style="flex: none !important; margin-bottom: 50px;">
					<iframe style="display: block; margin: 20px auto;"
						src="https://www.google.com/maps/embed?pb=!1m14!1m12!1m3!1d440.71172710001474!2d80.63575254602611!3d7.302379879852639!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!5e0!3m2!1sen!2slk!4v1692453886684!5m2!1sen!2slk"
						width="800" height="450" style="border:0;" allowfullscreen=""
						loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
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
	document.addEventListener('DOMContentLoaded',function() {
		$.ajax({
			url: "http://localhost:8080/ams/admin?actiontype=getAllConsultants",
			method: "GET",
			dataType: "json",
			success: function(data) {
				var stringifiedData = JSON
					.stringify(data);
				console.log(
					"Stringified API Data:",
					stringifiedData);
				console.log("API Data:", data);
				data.sort((a, b) => {
					  return a.field.localeCompare(b.country);
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
		var arrayOfObjects = arrayOfObjects.filter(function(item) {
			  return item.state != "inactive";
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
	            var country = row.insertCell(0);
	            var field = row.insertCell(1);
	            var consultant = row.insertCell(2);
	            


	            consultant.textContent = obj.name;
	            field.textContent = obj.field;
	            country.textContent = obj.country;

	        });
	    }
	}
	</script>
</body>
</html>
