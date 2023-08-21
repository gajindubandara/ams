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
<title>The Jobs | Reports</title>
<style>

.order-card {
    color: #fff;
}

.bg-c-blue {
    background: linear-gradient(45deg,#01499b,#73b4ff);
}

.bg-c-green {
    background: linear-gradient(45deg,#00876c,#59e0c5);
}

.bg-c-yellow {
    background: linear-gradient(45deg,#8f5400,#ffcb80);
}

.bg-c-pink {
    background: linear-gradient(45deg,#7f0015,#ff869a);
}


.card {
    border-radius: 5px;
    -webkit-box-shadow: 0 1px 2.94px 0.06px rgba(4,26,55,0.16);
    box-shadow: 0 1px 2.94px 0.06px rgba(4,26,55,0.16);
    border: none;
    margin-bottom: 30px;
    -webkit-transition: all 0.3s ease-in-out;
    transition: all 0.3s ease-in-out;
}

.card .card-block {
    padding: 25px;
}

.order-card i {
    font-size: 26px;
}

.f-left {
    float: left;
}

.f-right {
    float: right;
}
</style>
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
					<li class="nav-item" id="dashboardLink"><a class="nav-link"	href="sAdminDashboard.jsp">Dashboard</a></li>
					<li class="nav-item" id="dateLink"><a class="nav-link" href="sAdminDates.jsp">Dates </a></li>
					<li class="nav-item" id="consultantLink"><a class="nav-link" href="sAdminConsultants.jsp">Consultants </a></li>
					<li class="nav-item" id="userlink"><a class="nav-link" href="sAdminUsers.jsp">Users </a></li>
					<li class="nav-item active" id="reportslink"><a class="nav-link" href="#">Reports </a></li>
					<li class="nav-item" id="profileLink"><a class="nav-link" href="sAdminProfile.jsp">Profile </a></li>
					<li class="nav-item" id="loginLink"><a class="nav-link" href="sAdminLogin.jsp">Login </a></li>
					<li class="nav-item" id="logoutLink"><a class="nav-link" href="#">Logout </a></li>
				</ul>
			</div>
		</div>
	</nav>
	
		<div class="container">
		<div class="card">
			<div class="card-body p-md-5">
				<h1 class="card-title">System Statistics</h1>
				<hr>
				<div class="row">
				<!-- <div class="col-md-2"><button class="btn btn-primary btn-sm" onclick="generatePDF()">Generate Report</button></div> -->
				</div>
				<br>
				<div class="row">
					<h4 class="card-title">System Overview</h4>
				<hr>
					<div class="col-md-4 col-xl-3">
						<div class="card bg-c-blue order-card">
							<div class="card-block">
								<h6 class="m-b-20">Total Job Seekers</h6>
								<h2 class="text-right">
									<svg width="46" height="46" fill="#ffffff" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
									  <path d="M7.125 12a3.375 3.375 0 1 0 0-6.75 3.375 3.375 0 0 0 0 6.75Z"></path>
									  <path d="M10.969 13.875c-1.32-.67-2.777-.938-3.844-.938-2.09 0-6.375 1.282-6.375 3.844v1.969h7.031v-.753c0-.89.375-1.784 1.032-2.528.523-.595 1.256-1.146 2.156-1.594Z"></path>
									  <path d="M15.938 13.5c-2.441 0-7.313 1.508-7.313 4.5v2.25H23.25V18c0-2.992-4.872-4.5-7.313-4.5Z"></path>
									  <path d="M15.938 12a4.125 4.125 0 1 0 0-8.25 4.125 4.125 0 0 0 0 8.25Z"></path>
									</svg> <span id="total-job-seekers">0</span>
								</h2>

							</div>
						</div>
					</div>

					<div class="col-md-4 col-xl-3">
						<div class="card bg-c-green order-card">
							<div class="card-block">
								<h6 class="m-b-20">Total Consultants</h6>
								<h2 class="text-right">
									<svg width="46" height="46" fill="#ffffff" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
									  <path d="M15.592 3.027C14.68 2.042 13.406 1.5 12 1.5c-1.414 0-2.692.54-3.6 1.518-.918.99-1.365 2.334-1.26 3.786C7.348 9.67 9.528 12 12 12c2.472 0 4.648-2.33 4.86-5.195.106-1.439-.344-2.78-1.268-3.778Z"></path>
									  <path d="M20.25 22.5H3.75a1.454 1.454 0 0 1-1.134-.522 1.655 1.655 0 0 1-.337-1.364c.396-2.195 1.63-4.038 3.571-5.333C7.574 14.132 9.758 13.5 12 13.5c2.242 0 4.426.633 6.15 1.781 1.94 1.294 3.176 3.138 3.571 5.332.091.503-.032 1-.336 1.365a1.453 1.453 0 0 1-1.135.522Z"></path>
									</svg> <span id="total-admins">0</span>
								</h2>
							</div>
						</div>
					</div>

					<div class="col-md-4 col-xl-3">
						<div class="card bg-c-yellow order-card">
							<div class="card-block">
								<h6 class="m-b-20">Total Sessions</h6>
								<h2 class="text-right">
									<svg width="46" height="46" fill="#ffffff" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
									  <path d="M19.125 2.25H4.875A3.379 3.379 0 0 0 1.5 5.625v9A3.379 3.379 0 0 0 4.875 18H6v3a.75.75 0 0 0 1.23.576L11.52 18h7.605a3.379 3.379 0 0 0 3.375-3.375v-9a3.379 3.379 0 0 0-3.375-3.375ZM7.5 11.625a1.5 1.5 0 1 1 0-3 1.5 1.5 0 0 1 0 3Zm4.5 0a1.5 1.5 0 1 1 0-3 1.5 1.5 0 0 1 0 3Zm4.5 0a1.5 1.5 0 1 1 0-3 1.5 1.5 0 0 1 0 3Z"></path>
									</svg> <span id="total-app">0</span>
								</h2>
							</div>
						</div>
					</div>

					<div class="col-md-4 col-xl-3">
						<div class="card bg-c-pink order-card">
							<div class="card-block">
								<h6 class="m-b-20">Completed Sessions</h6>
								<h2 class="text-right">
									<svg width="46" height="46" fill="#ffffff" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
  									<path d="M12 2.25c-5.376 0-9.75 4.374-9.75 9.75s4.374 9.75 9.75 9.75 9.75-4.374 9.75-9.75S17.376 2.25 12 2.25Zm2.259 5.692 1.13.987-3.45 3.942-1.13-1.081 3.45-3.848ZM8.997 16.06l-3.308-3.31 1.061-1.06L10.058 15l-1.061 1.06Zm3.047.037L8.698 12.75l1.06-1.06 2.212 2.213 5.209-5.961 1.13.987-6.265 7.169Z"></path>
									</svg>
									 <span id="total-completed-app">0</span>
								</h2>
							</div>
						</div>
					</div>
				</div>
				<br>
				<br>
				<div class="row">
					<div class="col-md-6">
						<h4 class="card-title">Field Wise Appointment Chart</h4>
						<hr>
						<div id="chart"></div>
					</div>

					<div class="col-md-6">
						<h4 class="card-title">Country Wise Appointment Chart</h4>
						<hr>
						<div id="chart2"></div>
					</div>
				</div>
				<br>
				<br>
				<div class="row">
					<div class="col-md-12">
						<h4 class="card-title">Consultant Wise Appointments</h4>
						<hr>
						<div id="chartBar"></div>
					</div>

				</div>
				
				<div class="row">
					<div class="col-md-12">
						<h4 class="card-title">Field Wise Consultants</h4>
						<hr>
						<div id="chartBarCon"></div>
					</div>

				</div>
				
				<div class="row">
					<div class="col-md-12">
						<h4 class="card-title">Field Wise Job Seekers</h4>
						<hr>
						<div id="chartBarJob"></div>
					</div>

				</div>


				<!-- <div class="row">
				
				</div> -->


			</div>
		</div>
	</div>
<!-- ajax -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/html2pdf.js/0.10.1/html2pdf.bundle.min.js"></script>

<script type="text/javascript">
        function generatePDF() {
            const element = document.body; // Capture the entire body
            const opt = {
                margin: 10,
                filename: 'webpage.pdf',
                image: { type: 'jpeg', quality: 0.98 },
                html2canvas: { scale: 2 },
                jsPDF: { unit: 'mm', format: 'a4', orientation: 'landscape' }
            };
            // Create a PDF from the captured element
            html2pdf().from(element).set(opt).save();
        }
    </script>
    
    
<script>
const displayJobSeekers = document.getElementById('total-job-seekers');
const displayConsultants = document.getElementById('total-admins');
const displayApp = document.getElementById('total-app');
const displayCompletedApp = document.getElementById('total-completed-app');

	document.addEventListener('DOMContentLoaded',function() {
		
		//get all consultants
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
				
				data = data.filter(function(item) {
					  return item.state != "inactive";
					});
				
				displayConsultants.innerHTML = data.length;
				
				data.sort((a, b) => {
					  return a.field.localeCompare(b.field);
					}); 
				
				
				var fieldFrequency = {};
				data.forEach(entry => {
				  if (fieldFrequency[entry.field]) {
				    fieldFrequency[entry.field]++;
				  } else {
				    fieldFrequency[entry.field] = 1;
				  }
				});

				// Create arrays for fields and their frequencies
				var fieldNames = Object.keys(fieldFrequency);
				var fieldFrequencies = Object.values(fieldFrequency);

				// Sort the arrays based on frequency in descending order
				var sortedIndices = fieldFrequencies.map((_, index) => index)
				  .sort((a, b) => fieldFrequencies[b] - fieldFrequencies[a]);

				var sortedFieldNames = sortedIndices.map(index => fieldNames[index]);
				var sortedFieldFrequencies = sortedIndices.map(index => fieldFrequencies[index]);
				
			    genrateFiledWiseConChart(sortedFieldNames,sortedFieldFrequencies)
			    console.log("field names:", sortedFieldNames);
				console.log("Frequencies:", sortedFieldFrequencies);


			},
			error: function(xhr, status, error) {
				console.error(
					"Error fetching API data:",
					error);
			}
		});
		
		
		//get all jobseekers
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
				displayJobSeekers.innerHTML = data.length;
				
				data.sort((a, b) => {
					  return a.field.localeCompare(b.field);
					}); 
				
				
				var fieldFrequency = {};
				data.forEach(entry => {
				  if (fieldFrequency[entry.field]) {
				    fieldFrequency[entry.field]++;
				  } else {
				    fieldFrequency[entry.field] = 1;
				  }
				});

				// Create arrays for fields and their frequencies
				var fieldNames = Object.keys(fieldFrequency);
				var fieldFrequencies = Object.values(fieldFrequency);

				// Sort the arrays based on frequency in descending order
				var sortedIndices = fieldFrequencies.map((_, index) => index)
				  .sort((a, b) => fieldFrequencies[b] - fieldFrequencies[a]);

				var sortedFieldNames = sortedIndices.map(index => fieldNames[index]);
				var sortedFieldFrequencies = sortedIndices.map(index => fieldFrequencies[index]);
				
			    genrateFiledWiseJobChart(sortedFieldNames,sortedFieldFrequencies)
			    console.log("field names:", sortedFieldNames);
				console.log("Frequencies:", sortedFieldFrequencies);
					

			},
			error: function(xhr, status, error) {
				console.error(
					"Error fetching API data:",
					error);
			}
		});
		
		
		
		//get all appointments
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
				
				var app = data.filter(function(item) {
					  return item.state != "active";
					});
				
				displayApp.innerHTML = app.length;
				
				var completed = data.filter(function(item) {
					  return item.state === "completed";
					});
				
				displayCompletedApp.innerHTML = completed.length;
				
				
				
				// Calculate frequency of each country
				var countryFrequency = {};
				app.forEach(entry => {
				  if (countryFrequency[entry.country]) {
				    countryFrequency[entry.country]++;
				  } else {
				    countryFrequency[entry.country] = 1;
				  }
				});

				// Create arrays for countries and their frequencies
				var countries = Object.keys(countryFrequency);
				var frequenciesCountry = Object.values(countryFrequency);
				genrateCountryWiseAppChart(countries,frequenciesCountry); 
				console.log("Countries:", countries);
				console.log("Frequencies:", frequenciesCountry);
				
				// Calculate frequency of each field
				var fieldFrequency = {};
				app.forEach(entry => {
				  if (fieldFrequency[entry.field]) {
				    fieldFrequency[entry.field]++;
				  } else {
				    fieldFrequency[entry.field] = 1;
				  }
				});

				// Create arrays for fields and their frequencies
				var fields = Object.keys(fieldFrequency);
				var frequenciesField = Object.values(fieldFrequency);
				genrateFieldWiseAppChart(fields,frequenciesField);
				console.log("Fields:", fields);
				console.log("Frequencies:", frequenciesField);
				
				
				
				
				// Calculate the number of appointments for each consultant
				var consultantAppointments = {};
				app.forEach(entry => {
				  var consultantName = entry.adminName;
				  if (consultantAppointments[consultantName]) {
				    consultantAppointments[consultantName]++;
				  } else {
				    consultantAppointments[consultantName] = 1;
				  }
				});

				var consultantNames = Object.keys(consultantAppointments);
				var appointmentCounts = Object.values(consultantAppointments);
				genrateConsultantWiseAppChart(consultantNames,appointmentCounts);
				console.log("consultnats:", consultantNames);
				console.log("appointmets:", appointmentCounts);
				
			},
			error: function(xhr, status, error) {
				console.error(
					"Error fetching API data:",
					error);
			}
		});
		
	});
	
	
	
	
	function genrateCountryWiseAppChart(fields,frequencies){
		var options = {
				  series: frequencies,
				  chart: {
				    type: 'donut',
				    width: 450
				  },
				  labels:fields,
				  colors: ['#1f77b4', '#ff7f0e', '#2ca02c', '#d62728', '#9467bd', '#8c564b', '#e377c2', '#7f7f7f', '#bcbd22', '#17becf'], // Custom colors
				  responsive: [{
				    breakpoint: 480,
				    options: {
				      chart: {
				        width: 200
				      },
				      legend: {
				        position: 'bottom'
				      }
				    }
				  }],
				};
		
		var countryChart = new ApexCharts(document.querySelector("#chart2"), options);
		countryChart.render();
	}
	
	
	function genrateFieldWiseAppChart(fields,frequencies){
		var options = {
				  series: frequencies,
				  chart: {
				    type: 'donut',
				    width: 450
				  },
				  labels:fields,
				  colors: ['#1f77b4', '#ff7f0e', '#2ca02c', '#d62728', '#9467bd', '#8c564b', '#e377c2', '#7f7f7f', '#bcbd22', '#17becf'], // Custom colors
				  responsive: [{
				    breakpoint: 480,
				    options: {
				      chart: {
				        width: 200
				      },
				      legend: {
				        position: 'bottom'
				      }
				    }
				  }]
				};
		
		var fieldChart = new ApexCharts(document.querySelector("#chart"), options);
		fieldChart.render();
	}
	
	
	function genrateConsultantWiseAppChart(names,counts){
		
		var barOptions = {
		        series: [{
		        name: 'Appointments',
		        data: counts
		      }, 
		      ],
		        chart: {
		        type: 'bar',
		        height: 350,
		        font:'sans-serif'
		      },
		      plotOptions: {
		        bar: {
		          horizontal: false,
		          columnWidth: '55%',
		          endingShape: 'rounded'
		        },
		      },
		      dataLabels: {
		        enabled: false
		      },
		      stroke: {
		        show: true,
		        width: 2,
		        colors: ['transparent']
		      },
		      xaxis: {
		        categories: names,
		        title: {
		            text: 'Consultant'
		          }
		      },
		      yaxis: {
		        title: {
		          text: 'Appointments'
		        }
		      },
		      fill: {
		        opacity: 1
		      },
		      tooltip: {
		        y: {
		          formatter: function (val) {
		            return val
		          }
		        }
		      }
		      };

		      var chart = new ApexCharts(document.querySelector("#chartBar"), barOptions);
		      chart.render();
		
		
	}
	
	
	function genrateFiledWiseJobChart(field,counts){
		var options = {
		          series: [{
		          data: counts,
		          name: 'Job Seekers',
		        }],
		          chart: {
		          type: 'bar',
		     /*      height: 350 */
		        },
		        plotOptions: {
		          bar: {
		            borderRadius: 4,
		            horizontal: true,
		          }
		        },
		        dataLabels: {
		          enabled: false
		        },
		        xaxis: {
		          categories: field
		        },
		        tooltip: {
			        y: {
			          formatter: function (val) {
			            return val
			          }
			        }
			      },
			      colors: ['#070087'],     
		        };

		        var chart = new ApexCharts(document.querySelector("#chartBarJob"), options);
		        chart.render();
		
	}
	
	function genrateFiledWiseConChart(field,counts){
		var options = {
		          series: [{
		          data: counts,
		          name: 'Consultants',
		        }],
		          chart: {
		          type: 'bar',
		     /*      height: 350 */
		        },
		        plotOptions: {
		          bar: {
		            borderRadius: 4,
		            horizontal: true,
		          }
		        },
		        dataLabels: {
		          enabled: false
		        },
		        xaxis: {
		          categories: field
		        },
		        tooltip: {
			        y: {
			          formatter: function (val) {
			            return val
			          }
			        }
			      },
		        colors: ['#26e7a6'],
		        };

		        var chart = new ApexCharts(document.querySelector("#chartBarCon"), options);
		        chart.render();
		
	}

	</script>

</body>
</html>