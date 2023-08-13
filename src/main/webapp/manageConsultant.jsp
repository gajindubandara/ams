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
<link rel="stylesheet" href="styles.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
<title>Manage Consultants</title>
<link rel="stylesheet" href="styles.css">
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
	<section class="vh-100">
		<div class="container h-100">
			<div class="card">
				<div
					class="row d-flex justify-content-center align-items-center h-100">
					<div class="col-md-12">
						<div class="card text-black"
							style="border-radius: 25px;">
							<div class="card-body p-md-5">
								<h1 class="card-title">Manage Consultants</h1>
								<hr>
								<div class="row">
									<h3 class="card-title">Add New Consultant</h3>
									<p style="text-align: center" id="response">${feebackMessage}</p> 
									<form class="mx-1 mx-md-4" id="registerForm" action="registeradmin" method="post">
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

												<!-- Field input -->
												<div class="d-flex flex-row align-items-center mb-4">
													<div class="form-outline flex-fill mb-0">
														<label class="form-label"> Field</label><span
															class="text-danger">*</span> 
															<!-- <input type="text"
															class="form-control" id="field" name="field" required /> -->
															<select class="form-control" id="field" name="field" required >
															<option value="" disabled selected>Select Field</option>
															</select>
														<div class="text-danger" id="fieldError"></div>
													</div>
												</div>
												<!-- Country input -->
												<div class="d-flex flex-row align-items-center mb-4">
													<div class="form-outline flex-fill mb-0">
														<label class="form-label"> Country</label><span
															class="text-danger">*</span> 
															<select class="form-control" id="country" name="country" required >
															<option value="" disabled selected>Select Country</option>
															</select>
														<div class="text-danger" id="countryError"></div>
													</div>
												</div>

											</div>
											<div class="col-md-6">
												<div class="row">
													<div class="d-flex flex-row align-items-center mb-4">
														<div class="form-outline flex-fill mb-0">
															<label for="Date">Select A Date</label><span
																class="text-danger">*</span>
															<div class="text-danger" id="dateError"></div>
														</div>
													</div>

													<div class="col-md-6">
														<h4 style="font-weight: bolder;">
															<input type="checkbox" id="saturdayCheckbox" /> Saturday
														</h4>
														<!-- Start time input -->
														<div class="d-flex flex-row align-items-center mb-4">
															<div class="form-outline flex-fill mb-0">
																<label class="form-label"> Start Time</label><span
																	class="text-danger">*</span> <input type="time"
																	class="form-control" id="startTimeSat" disabled />
																<div class="text-danger" id="startTimeSatError"></div>
															</div>
														</div>

														<!-- End time input -->
														<div class="d-flex flex-row align-items-center mb-4">
															<div class="form-outline flex-fill mb-0">
																<label class="form-label"> End Time</label><span
																	class="text-danger">*</span> <input type="time"
																	class="form-control" id="endTimeSat" disabled />
																<div class="text-danger" id="endTimeSatError"></div>
															</div>
														</div>
													</div>
													<div class="col-md-6">
														<h4 style="font-weight: bolder;">
															<input type="checkbox" id="sundayCheckbox" /> Sunday
														</h4>
														<!-- Start time input -->
														<div class="d-flex flex-row align-items-center mb-4">
															<div class="form-outline flex-fill mb-0">
																<label class="form-label"> Start Time</label><span
																	class="text-danger">*</span> <input type="time"
																	class="form-control" id="startTimeSun" disabled />
																<div class="text-danger" id="startTimeSunError"></div>
															</div>
														</div>

														<!-- End time input -->
														<div class="d-flex flex-row align-items-center mb-4">
															<div class="form-outline flex-fill mb-0">
																<label class="form-label"> End Time</label><span
																	class="text-danger">*</span> <input type="time"
																	class="form-control" id="endTimeSun" disabled />
																<div class="text-danger" id="endTimeSunError"></div>
															</div>
														</div>
													</div>
													
													<input type="hidden" name="dates" id="dates"  />
													<input type="hidden" name="slots" id="slots"  />
													<input type="hidden" name="password" id="password" value="12345"  />
													<input type="hidden" name="actiontype" value="add" />
													<span>*Note - Default password is - 12345</span>
													<div class="d-flex justify-content-end mx-4 mb-3 mb-lg-4">
														<button type="button" class="btn btn-primary btn-lg" style="margin-right:23px"
															id="registerButton">Register</button>
														<!-- <button type="button" class="btn btn-primary btn-lg"
															id="getDataButton">Get Data</button> -->
													</div>
												</div>

											</div>
										</div>

									</form>
								</div>
								<div class="row" style="margin-top:60px;">
									
										<h3 class="card-title">Consultants</h3>
										<div class="table-responsive">
											<table class="table">
												<thead class="thead-light">
													<tr>
														<th>Name</th>
														<th>Email</th>
														<th>Number</th>
														<th>Field</th>
														<th>Country</th>
														<th>Dates</th>
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

				</div>
			</div>
		</div>
	</section>
	
	<!-- The modal popup -->
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
        const saturdayCheckbox = document.getElementById('saturdayCheckbox');
        const sundayCheckbox = document.getElementById('sundayCheckbox');
        const startTimeSat = document.getElementById('startTimeSat');
        const endTimeSat = document.getElementById('endTimeSat');
        const startTimeSun = document.getElementById('startTimeSun');
        const endTimeSun = document.getElementById('endTimeSun');

        saturdayCheckbox.addEventListener('change', function() {
            startTimeSat.disabled = !saturdayCheckbox.checked;
            endTimeSat.disabled = !saturdayCheckbox.checked;
        });

        sundayCheckbox.addEventListener('change', function() {
            startTimeSun.disabled = !sundayCheckbox.checked;
            endTimeSun.disabled = !sundayCheckbox.checked;
        });

        
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
            const startTimeSatValue = startTimeSat.value;
            const endTimeSatValue = endTimeSat.value;
            const startTimeSunValue = startTimeSun.value;
            const endTimeSunValue = endTimeSun.value;

            // Reset error messages
            nameError.innerHTML = '';
            emailError.innerHTML = '';
            numberError.innerHTML = '';
            fieldError.innerHTML = '';
            countryError.innerHTML = '';
            dateError.innerHTML = '';

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
                if (!sundayCheckbox.checked && !saturdayCheckbox.checked) {
                    dateError.textContent = 'Date is required';
                } else {
                    dateError.textContent = '';
                    
                	if (sundayCheckbox.checked) {
						if (!startTimeSunValue) {
							document
									.getElementById("startTimeSunError").textContent = "Start Time is required.";
							return;
						} else {
							document
									.getElementById("startTimeSunError").textContent = "";
						}
						if (!endTimeSunValue) {
							document
									.getElementById("endTimeSunError").textContent = "End Time is required.";
							return;
						} else {
							document
									.getElementById("endTimeSunError").textContent = "";
						}
						if (endTimeSunValue <= startTimeSunValue) {
							document.getElementById("endTimeSunError").textContent = "Invalid time range";
							return;
                    	  }else
                    	  {
                    		  document.getElementById("endTimeSunError").textContent = "";
                    	  }
					}
					if (saturdayCheckbox.checked) {
						if (!startTimeSatValue) {
							document
									.getElementById("startTimeSatError").textContent = "Start Time is required.";
							return;
						} else {
							document
									.getElementById("startTimeSatError").textContent = "";
						}
						if (!endTimeSatValue) {
							document
									.getElementById("endTimeSatError").textContent = "End Time is required.";
							return;
						} else {
							document
									.getElementById("endTimeSatError").textContent = "";
						}
						if (endTimeSatValue <= startTimeSatValue) {
							document.getElementById("endTimeSatError").textContent = "Invalid time range";
							return;
                    	  }else
                    	  {
                    		  document.getElementById("endTimeSatError").textContent = "";
                    	  }
					}

                    // Log all the details
                    console.log('Name:', name);
                    console.log('Email:', email);
                    console.log('Number:', number);
                    console.log('Field:', field);
                    console.log('Country:', country);
                    console.log('Saturday Checked:', saturdayCheckbox.checked);
                    console.log('Sunday Checked:', sundayCheckbox.checked);
                    console.log('Start Time (Saturday):', startTimeSatValue);
                    console.log('End Time (Saturday):', endTimeSatValue);
                    console.log('Start Time (Sunday):', startTimeSunValue);
                    console.log('End Time (Sunday):', endTimeSunValue);
                    
                    var timeSlotsSatArray;
                    var timeSlotsSunArray;
                    var timeSlots=[];
                    
                  		if (saturdayCheckbox.checked) {
                    	    timeSlotsSatArray = calculateIntervals(startTimeSatValue, endTimeSatValue);
                    	   
                    	    const timeSlotsForSaturday = { day: 'Saturday',startTime:startTimeSatValue,endTime:endTimeSatValue, slots: timeSlotsSatArray };
                    	    timeSlots.push(timeSlotsForSaturday);
                    	}

                    	if (sundayCheckbox.checked) {
                    	    timeSlotsSunArray = calculateIntervals(startTimeSunValue, endTimeSunValue);
                    	    
                    	    const timeSlotsForSunday = { day: 'Sunday',startTime:startTimeSunValue,endTime:endTimeSunValue, slots: timeSlotsSunArray };
                    	    timeSlots.push(timeSlotsForSunday);
                    	} 
                    
                    	
                    const jsonStringSlots = JSON.stringify(timeSlots);
                    /* console.log("timeSlots",jsonStringSlots); */
                 
                    var availableTimeSlots = [];

                    timeSlots.forEach(function(slot) {
                      var timeSlot = slot.day + " " + slot.startTime + " - " + slot.endTime;
                      availableTimeSlots.push(timeSlot);
                    });
                    
                    const jsonStringDates = JSON.stringify(availableTimeSlots);
                    /* console.log(availableTimeSlots); */
                    
                    registerForm.elements['dates'].value = jsonStringDates;
                    registerForm.elements['slots'].value = jsonStringSlots;
                    registerForm.submit();
                    
                    var popupContainer = document.getElementById('popupContainer');
                    popupContainer.style.display = 'block';

                    setTimeout(function () {
                        popupContainer.style.display = 'none';
    				}, 2000);
   
                }
            }
        });
        
        
 /*        var results = [
        	  {
        	    "day": "Saturday",
        	    "startTime": "08:00",
        	    "endTime": "11:00",
        	    "slots": ["08:00 AM", "08:30 AM", "09:00 AM", "09:30 AM", "10:00 AM", "10:30 AM"]
        	  },
        	  {
        	    "day": "Sunday",
        	    "startTime": "10:00",
        	    "endTime": "13:00",
        	    "slots": ["10:00 AM", "10:30 AM", "11:00 AM", "11:30 AM", "12:00 PM", "12:30 PM"]
        	  }
        	]; */

        	// Function to populate the checkboxes and time inputs based on the 'results' array
        	/* function populateForm() {
        	  results.forEach(item => {
        	    if (item.day === 'Saturday') {
        	      document.getElementById('saturdayCheckbox').checked = true;
        	      document.getElementById('startTimeSat').value = item.startTime;
        	      document.getElementById('endTimeSat').value = item.endTime;
        	    } else if (item.day === 'Sunday') {
        	      document.getElementById('sundayCheckbox').checked = true;
        	      document.getElementById('startTimeSun').value = item.startTime;
        	      document.getElementById('endTimeSun').value = item.endTime;
        	    }
        	  });
        	}
        	
        	document.getElementById('getDataButton').addEventListener('click', populateForm); */
    });
    
    function calculateIntervals(startTimeInput, endTimeInput) {
    	  const startTimeParts = startTimeInput.split(':');
    	  const endTimeParts = endTimeInput.split(':');
    	  
    	  const startHour = parseInt(startTimeParts[0], 10);
    	  const startMinute = parseInt(startTimeParts[1], 10);
    	  
    	  const endHour = parseInt(endTimeParts[0], 10);
    	  const endMinute = parseInt(endTimeParts[1], 10);
    	  
    	  const startTime = new Date();
    	  startTime.setHours(startHour, startMinute, 0);
    	  
    	  const endTime = new Date();
    	  endTime.setHours(endHour, endMinute, 0);
    	  
    	  const interval = 30; // Interval in minutes
    	  
    	  const timeSlots = [];
    	  
    	  while (startTime <= endTime) {
    	    const formattedTime = startTime.toLocaleTimeString([], { hour: '2-digit', minute: '2-digit' });
    	    timeSlots.push(formattedTime);
    	    
    	    startTime.setMinutes(startTime.getMinutes() + interval);
    	  }
    	  timeSlots.pop();
    	  return timeSlots;
    	}
    
    function isValidEmail(email) {
        const emailPattern = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/;
        return emailPattern.test(email);
    }
</script>


	<script>
var arrayOfObjects = [
	  {
	    "name": "Gajindu Bandara",
	    "email": "gajindukb@gmail.com",
	    "number": "0766786225",
	    "field": "Science",
	    "country": "USA",
	    "dates": ["Saturday 08:00 - 12:00", "Sunday 13:00 - 16:00"],
	    "slots": [
	      {
	        "day": "Saturday",
	        "startTime": "08:00",
	        "endTime": "12:00",
	        "slots": ["08:00 AM", "08:30 AM", "09:00 AM", "09:30 AM", "10:00 AM", "10:30 AM", "11:00 AM", "11:30 AM"]
	      },
	      {
	        "day": "Sunday",
	        "startTime": "13:00",
	        "endTime": "16:00",
	        "slots": ["01:00 PM", "01:30 PM", "02:00 PM", "02:30 PM", "03:00 PM", "03:30 PM"]
	      }
	    ]
	  },
	  {
	    "name": "Alice Smith",
	    "email": "alice@example.com",
	    "number": "1234567890",
	    "field": "Math",
	    "country": "Canada",
	    "dates": [ "Saturday 15:00 - 18:00"],
	    "slots": [
	      {
	        "day": "Friday",
	        "startTime": "10:00",
	        "endTime": "14:00",
	        "slots": ["10:00 AM", "10:30 AM", "11:00 AM", "11:30 AM", "12:00 PM", "12:30 PM", "01:00 PM", "01:30 PM"]
	      },
	      {
	        "day": "Saturday",
	        "startTime": "15:00",
	        "endTime": "18:00",
	        "slots": ["03:00 PM", "03:30 PM", "04:00 PM", "04:30 PM", "05:00 PM", "05:30 PM"]
	      }
	    ]
	  },
	  {
	    "name": "Michael Johnson",
	    "email": "michael@example.com",
	    "number": "9876543210",
	    "field": "History",
	    "country": "UK",
	    "dates": ["Sunday 09:00 - 12:00"],
	    "slots": [
	      {
	        "day": "Monday",
	        "startTime": "09:00",
	        "endTime": "12:00",
	        "slots": ["09:00 AM", "09:30 AM", "10:00 AM", "10:30 AM", "11:00 AM", "11:30 AM"]
	      },
	      {
	        "day": "Wednesday",
	        "startTime": "14:00",
	        "endTime": "17:00",
	        "slots": ["02:00 PM", "02:30 PM", "03:00 PM", "03:30 PM", "04:00 PM", "04:30 PM"]
	      }
	    ]
	  },
	  {
	    "name": "Emily Davis",
	    "email": "emily@example.com",
	    "number": "5555555555",
	    "field": "Art",
	    "country": "Australia",
	    "dates": ["Saturday 12:00 - 16:00", "Sunday 17:00 - 20:00"],
	    "slots": [
	      {
	        "day": "Thursday",
	        "startTime": "12:00",
	        "endTime": "16:00",
	        "slots": ["12:00 PM", "12:30 PM", "01:00 PM", "01:30 PM", "02:00 PM", "02:30 PM", "03:00 PM", "03:30 PM"]
	      },
	      {
	        "day": "Friday",
	        "startTime": "17:00",
	        "endTime": "20:00",
	        "slots": ["05:00 PM", "05:30 PM", "06:00 PM", "06:30 PM", "07:00 PM", "07:30 PM"]
	      }
	    ]
	  },
	  {
	    "name": "David Lee",
	    "email": "david@example.com",
	    "number": "1112223333",
	    "field": "Language",
	    "country": "Germany",
	    "dates": [ "Sunday 10:00 - 13:00"],
	    "slots": [
	      {
	        "day": "Tuesday",
	        "startTime": "14:00",
	        "endTime": "18:00",
	        "slots": ["02:00 PM", "02:30 PM", "03:00 PM", "03:30 PM", "04:00 PM", "04:30 PM", "05:00 PM", "05:30 PM"]
	      },
	      {
	        "day": "Thursday",
	        "startTime": "10:00",
	        "endTime": "13:00",
	        "slots": ["10:00 AM", "10:30 AM", "11:00 AM", "11:30 AM", "12:00 PM", "12:30 PM"]
	      }
	    ]
	  }
	];


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
            var nameCell = row.insertCell(0);
            var emailCell = row.insertCell(1);
            var numberCell = row.insertCell(2);
            var fieldCell = row.insertCell(3);
            var countryCell = row.insertCell(4);
            var datesCell = row.insertCell(5);
            var actionCell = row.insertCell(6);

            nameCell.textContent = obj.name;
            emailCell.textContent = obj.email;
            numberCell.textContent = obj.number;
            fieldCell.textContent = obj.field;
            countryCell.textContent = obj.country;
            datesCell.textContent = obj.dates.join(", ");
            
            var editButton = document.createElement("button");
            editButton.className = "btn btn-primary btn-sm";
            editButton.innerHTML = `<svg width="16" height="16" fill="none" stroke="currentColor"
                            stroke-linecap="round" stroke-linejoin="round" stroke-width="2" viewBox="0 0 24 24"
                            xmlns="http://www.w3.org/2000/svg">
                            <path d="M11 4H4a2 2 0 0 0-2 2v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2v-7"></path>
                            <path d="M18.5 2.5a2.121 2.121 0 0 1 3 3L12 15l-4 1 1-4 9.5-9.5z"></path>
                        </svg>`;
            
            editButton.addEventListener("click", function () {
                console.log(obj.name);
            });
            actionCell.appendChild(editButton);
        });
    }

</script>
</body>
</html>
