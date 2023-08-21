function handleUserSession() {
	var superAdmin = sessionStorage.getItem("superAdmin");
	var dashboardLink = document.getElementById("dashboardLink");
	var logoutLink = document.getElementById("logoutLink");
	var loginLink = document.getElementById("loginLink");
	var profileLink = document.getElementById("profileLink");
	var dateLink = document.getElementById("dateLink");
	var userlink = document.getElementById("userlink");
	var consultantLink = document.getElementById("consultantLink");
	var reportsLink = document.getElementById("reportslink");

	if (!superAdmin) {
		 window.location.href = "sAdminLogin.jsp";
		profileLink.style.display = "none";
		dashboardLink.style.display = "none";
		logoutLink.style.display = "none";
		dateLink.style.display = "none";
		userlink.style.display = "none";
		consultantLink.style.display = "none";
		reportsLink.style.display = "none";
	} else {
		loginLink.style.display = "none";
	}

	logoutLink.addEventListener("click", function(event) {
		event.preventDefault();
		console.log("clicked");
		sessionStorage.removeItem("superAdmin");
		window.location.href = "sAdminLogin.jsp";
	});
}
