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
<title>The Jobs | Consultants</title>


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
					<li class="nav-item active" id="consultantLink"><a class="nav-link" href="#">Consultants </a></li>
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
				<h1 class="card-title">Manage Consultants</h1>
				<hr>

				<div class="row" style="margin: 30px 0px">
					<h3 class="card-title">Add New Consultant</h3>
					<form id="registerForm">
						<div class="row">
							<div class="col-md-6">

								<!-- Name input -->
								<div class="d-flex flex-row align-items-center mb-4">
									<div class="form-outline flex-fill mb-0">
										<label class="form-label"> Name</label><span
											class="text-danger">*</span> <input type="text"
											class="form-control" id="name" name="name" required />
										<div class="text-danger" id="nameError"></div>
									</div>
								</div>
								<!-- Email input -->
								<div class="d-flex flex-row align-items-center mb-4">
									<div class="form-outline flex-fill mb-0">
										<label class="form-label"> Email</label><span
											class="text-danger">*</span> <input type="email"
											class="form-control" id="email" name="email" required />
										<div class="text-danger" id="emailError"></div>
									</div>
								</div>
								<!-- Number input -->
								<div class="d-flex flex-row align-items-center mb-4">
									<div class="form-outline flex-fill mb-0">
										<label class="form-label"> Number</label><span
											class="text-danger">*</span> <input type="number"
											class="form-control" id="number" name="number" required />
										<div class="text-danger" id="numberError"></div>
									</div>
								</div>

							</div>
							<div class="col-md-6">
								<div class="row">

									<!-- Field input -->
									<div class="d-flex flex-row align-items-center mb-4">
										<div class="form-outline flex-fill mb-0">
											<label class="form-label"> Field</label><span
												class="text-danger">*</span>
											<!-- <input type="text"
															class="form-control" id="field" name="field" required /> -->
											<select class="form-control" id="field" name="field" required>
												<option value="" disabled selected>Select Field</option>
											</select>
											<div class="text-danger" id="fieldError"></div>
										</div>
									</div>
									<!-- Country input -->
									<div class="d-flex flex-row align-items-center mb-4">
										<div class="form-outline flex-fill mb-0">
											<label class="form-label"> Country</label><span
												class="text-danger">*</span> <select class="form-control"
												id="country" name="country" required>
												<option value="" disabled selected>Select Country</option>
											</select>
											<div class="text-danger" id="countryError"></div>
										</div>
									</div>
									<span>*Note - Default password is - 12345</span> <br>
									<div class="d-flex justify-content-end mx-4 mb-3 mb-lg-4">
										<button type="button" class="btn btn-primary btn-lg"
											style="margin-right: 23px" id="registerButton">Register</button>
									</div>
								</div>
							</div>
						</div>
					</form>
				</div>



				<div class="row" style="margin: 30px 0px">
					<h3 class="card-title">Consultants</h3>
					<div class="col-md-4" style="margin-bottom: 20px;">
						<input class="form-control" id="myInput" type="text"
							placeholder="Search..">
					</div>


					<div class="table-responsive">
						<table class="table">
							<thead class="thead-light">
								<tr>
									<th>Consultant</th>
									<th>Email</th>
									<th>Number</th>
									<th>Field</th>
									<th>Country</th>
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
	<!-- md5 hashing -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/blueimp-md5/2.18.0/js/md5.min.js"></script>
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
		var stateOrder = ["active", "inactive"];
		var arrayOfObjects = arrayOfObjects.sort((a, b) => {
			  return stateOrder.indexOf(a.state) - stateOrder.indexOf(b.state);
			});
		
		//getting the date for the user
		/* arrayOfObjects = arrayOfObjects.filter(function(item) {
			  return item.state != "active" ;
			});  */
		
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
	            var email = row.insertCell(1);
	            var number = row.insertCell(2);
	            var field = row.insertCell(3);
	            var country = row.insertCell(4);
	            var status = row.insertCell(5);
	            var actionCell = row.insertCell(6);



	            consultant.textContent = obj.name;
	            email.textContent = obj.email;
	            number.textContent = obj.number;
	            field.textContent = obj.field;
	            country.textContent = obj.country;
	            status.textContent = obj.status;

	           
	        var viewState = document.createElement("div");
    
      		
      		var btnActive = document.createElement("span");
      		btnActive.innerHTML = ` 
        		 <button id="accept" class="btn btn-success btn-sm"><svg width="25" height="25" fill="#ffffff" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
        		  <path d="M12 2.25c-5.376 0-9.75 4.374-9.75 9.75s4.374 9.75 9.75 9.75 9.75-4.374 9.75-9.75S17.376 2.25 12 2.25Zm-1.781 14.643L6.44 12.694l1.115-1.003 2.625 2.916 6.225-7.414 1.15.963-7.337 8.737Z"></path>
        		  </svg></button> 
        		`;
        		
        	var btnInactive = document.createElement("span");
        	btnInactive.innerHTML = ` 
      			<button id="reject" class="btn btn-danger btn-sm"><svg width="25" height="25" fill="#ffffff" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
        		  <path d="M12 2.25c-5.376 0-9.75 4.374-9.75 9.75s4.374 9.75 9.75 9.75 9.75-4.374 9.75-9.75S17.376 2.25 12 2.25ZM16.06 15 15 16.06l-3-3-3 3L7.94 15l3-3-3-3L9 7.94l3 3 3-3L16.06 9l-3 3 3 3Z"></path>
        		</svg></button>  
        		`;
        		


        		
	            if(obj.state==="active"){
	            	viewState.innerHTML = `<svg width="25" height="25" fill="#16bd00" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
	            		  <path d="M12 21.75c-5.376 0-9.75-4.374-9.75-9.75S6.624 2.25 12 2.25s9.75 4.374 9.75 9.75-4.374 9.75-9.75 9.75Z"></path>
	            		</svg> Active`;
	            		

	            	 	
	            		actionCell.appendChild(btnInactive);
	               	
	            } else{
	            	viewState.innerHTML = `<svg width="25" height="25" fill="#e60000" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
	            		  <path d="M12 21.75c-5.376 0-9.75-4.374-9.75-9.75S6.624 2.25 12 2.25s9.75 4.374 9.75 9.75-4.374 9.75-9.75 9.75Z"></path>
	            		</svg> Inactive`;
	            	
	            		actionCell.appendChild(btnActive);
	            }
	           
	            	
	            status.appendChild(viewState);
	            

	            btnInactive.addEventListener("click", function () {

	                Swal.fire({
	                    icon: 'warning',
	                    title: 'Confirm Inactive',
	                    text: 'Are you sure you want to inactive this consultant?',
	                    showCancelButton: true,
	                    confirmButtonColor: '#d33',
	                    cancelButtonColor: '#3085d6',
	                    confirmButtonText: 'Inactivate',
	                    cancelButtonText: 'Cancel'
	                  }).then((result) => {
	                    if (result.isConfirmed) {
	    	                $.ajax({
	  	                	  url: "http://localhost:8080/ams/admin",
	  	                	  type: "POST",
	  	                	  data: {
	  	                	    actiontype: "change",
	  	                	    id: obj.id,
	  	                	    state:"inactive"
	  	                	  },
	  	                	  success: function(response) {
	  	                		Swal.fire({
									icon: 'success',
									title: 'Success!',
									text: 'Consultant inactive!',
									confirmButtonColor: '#3085d6',
									confirmButtonText: 'OK'
								}).then((result) => {
									if (result.isConfirmed) {
										window.location.href = 'sAdminConsultants.jsp';
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
	             
	            btnActive.addEventListener("click", function () {
	            	  Swal.fire({
		                    icon: 'success',
		                    title: 'Confirm Active',
		                    text: 'Are you sure you want to active this consultant?',
		                    showCancelButton: true,
		                    confirmButtonColor: '#28a745',
		                    cancelButtonColor: '#dc3545',
		                    confirmButtonText: 'Activate',
		                    cancelButtonText: 'Cancel'
		                  }).then((result) => {
		                    if (result.isConfirmed) {
		    	                $.ajax({
		  	                	  url: "http://localhost:8080/ams/admin",
		  	                	  type: "POST",
		  	                	  data: {
		  	                	    actiontype: "change",
		  	                	    id: obj.id,
		  	                	    state:"active"
		  	                	  },
		  	                	  success: function(response) {
		  	                		Swal.fire({
										icon: 'success',
										title: 'Success!',
										text: 'Consultant active!',
										confirmButtonColor: '#3085d6',
										confirmButtonText: 'OK'
									}).then((result) => {
										if (result.isConfirmed) {
											window.location.href = 'sAdminConsultants.jsp';
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
	<script>
    document.addEventListener('DOMContentLoaded', function() {
        const registerForm = document.getElementById('registerForm');
        const nameInput = document.getElementById('name');
        const emailInput = document.getElementById('email');
        const numberInput = document.getElementById('number');
        const fieldInput = document.getElementById('field');
        const countryInput = document.getElementById('country');
        const nameError = document.getElementById('nameError');
        const emailError = document.getElementById('emailError');
        const numberError = document.getElementById('numberError');
        const fieldError = document.getElementById('fieldError');
        const countryError = document.getElementById('countryError');
        const dateError = document.getElementById('dateError'); // Added dateError
        const registerButton = document.getElementById('registerButton');
  
        
        const countries = [
		  'Afghanistan', 'Albania', 'Algeria', 'Andorra', 'Angola', 'Antigua and Barbuda', 'Argentina', 'Armenia', 'Australia', 'Austria', 'Azerbaijan',
		  'Bahamas', 'Bahrain', 'Bangladesh', 'Barbados', 'Belarus', 'Belgium', 'Belize', 'Benin', 'Bhutan', 'Bolivia', 'Bosnia and Herzegovina', 'Botswana', 'Brazil', 'Brunei', 'Bulgaria', 'Burkina Faso', 'Burundi',
		  'Cabo Verde', 'Cambodia', 'Cameroon', 'Canada', 'Central African Republic', 'Chad', 'Chile', 'China', 'Colombia', 'Comoros', 'Congo', 'Costa Rica', 'Cote d\'Ivoire', 'Croatia', 'Cuba', 'Cyprus', 'Czech Republic',
		  'Denmark', 'Djibouti', 'Dominica', 'Dominican Republic',
		  'Ecuador', 'Egypt', 'El Salvador', 'Equatorial Guinea', 'Eritrea', 'Estonia', 'Eswatini', 'Ethiopia',
		  'Fiji', 'Finland', 'France',
		  'Gabon', 'Gambia', 'Georgia', 'Germany', 'Ghana', 'Greece', 'Grenada', 'Guatemala', 'Guinea', 'Guinea-Bissau', 'Guyana',
		  'Haiti', 'Honduras', 'Hungary',
		  'Iceland', 'India', 'Indonesia', 'Iran', 'Iraq', 'Ireland', 'Israel', 'Italy',
		  'Jamaica', 'Japan', 'Jordan',
		  'Kazakhstan', 'Kenya', 'Kiribati', 'Korea, North', 'Korea, South', 'Kosovo', 'Kuwait', 'Kyrgyzstan',
		  'Laos', 'Latvia', 'Lebanon', 'Lesotho', 'Liberia', 'Libya', 'Liechtenstein', 'Lithuania', 'Luxembourg',
		  'Madagascar', 'Malawi', 'Malaysia', 'Maldives', 'Mali', 'Malta', 'Marshall Islands', 'Mauritania', 'Mauritius', 'Mexico', 'Micronesia', 'Moldova', 'Monaco', 'Mongolia', 'Montenegro', 'Morocco', 'Mozambique', 'Myanmar (Burma)',
		  'Namibia', 'Nauru', 'Nepal', 'Netherlands', 'New Zealand', 'Nicaragua', 'Niger', 'Nigeria', 'North Macedonia', 'Norway',
		  'Oman',
		  'Pakistan', 'Palau', 'Panama', 'Papua New Guinea', 'Paraguay', 'Peru', 'Philippines', 'Poland', 'Portugal',
		  'Qatar',
		  'Romania', 'Russia', 'Rwanda',
		  'Saint Kitts and Nevis', 'Saint Lucia', 'Saint Vincent and the Grenadines', 'Samoa', 'San Marino', 'Sao Tome and Principe', 'Saudi Arabia', 'Senegal', 'Serbia', 'Seychelles', 'Sierra Leone', 'Singapore', 'Slovakia', 'Slovenia', 'Solomon Islands', 'Somalia', 'South Africa', 'South Sudan', 'Spain', 'Sri Lanka', 'Sudan', 'Suriname', 'Sweden', 'Switzerland', 'Syria',
		  'Taiwan', 'Tajikistan', 'Tanzania', 'Thailand', 'Timor-Leste', 'Togo', 'Tonga', 'Trinidad and Tobago', 'Tunisia', 'Turkey', 'Turkmenistan', 'Tuvalu',
		  'Uganda', 'Ukraine', 'United Arab Emirates', 'United Kingdom', 'United States', 'Uruguay', 'Uzbekistan',
		  'Vanuatu', 'Vatican City', 'Venezuela', 'Vietnam',
		  'Yemen',
		  'Zambia', 'Zimbabwe'
		];

        const selectCountry = document.getElementById('country');

        countries.forEach(country => {
            const contryOption = document.createElement('option');
            contryOption.value = country;
            contryOption.textContent = country;
            selectCountry.appendChild(contryOption);
        });
        
        
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
        
        registerButton.addEventListener('click', function() {
            const name = nameInput.value;
            const email = emailInput.value;
            const number = numberInput.value;
            const field = fieldInput.value;
            const country = countryInput.value;


            // Reset error messages
            nameError.innerHTML = '';
            emailError.innerHTML = '';
            numberError.innerHTML = '';
            fieldError.innerHTML = '';
            countryError.innerHTML = '';


            // Validation logic
            if (!name || !email || !number || !field || !country) {
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
                if (!field) {fieldError.innerHTML = '<p>Field is required.</p>';
                } else {
                	fieldError.innerHTML = '';
                }
                if (!country){
                	countryError.innerHTML = '<p>Country is required.</p>';
                }else{
                	countryError.innerHTML = '';
                }
                
            } else {


                    // Log all the details
                    console.log('Name:', name);
                    console.log('Email:', email);
                    console.log('Number:', number);
                    console.log('Field:', field);
                    console.log('Country:', country);
                    
                    
                    const hashedPw =md5("12345");

                    $.ajax({
                        url: "http://localhost:8080/ams/admin",
                        type: "POST",
                        data: {
                          email: email,
                          actiontype: "add",
                          password: hashedPw,
                          number: number,
                          name: name,
                          field: field,
                          country:country
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
                                window.location.href = 'sAdminConsultants.jsp';
                              }
                            });
                          
                        },
                        error: function(xhr, status, error) {
                          if (xhr.status === 400) {
                        	  Swal.fire({
                                  icon: 'error',
                                  title: 'Failed',
                                  text: 'There is an existing consultant for this email!',
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
                    

            }
        });

    });
    

    
    function isValidEmail(email) {
        const emailPattern = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/;
        return emailPattern.test(email);
    }
</script>

</body>
</html>
