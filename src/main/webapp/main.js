function handleUserSession() {
  var jobSeeker = sessionStorage.getItem("jobSeeker");
  var dashboardLink = document.getElementById("dashboardLink");
  var logoutLink = document.getElementById("logoutLink");
  var loginLink = document.getElementById("loginLink");
  var regLink = document.getElementById("regLink");
  var profileLink = document.getElementById("profileLink");

  if (!jobSeeker) {
    window.location.href = "login.jsp";
    dashboardLink.style.display = "none";
    logoutLink.style.display = "none";
    profileLink.style.display = "none";
  } else {
    loginLink.style.display = "none";
    regLink.style.display = "none";
  }

  logoutLink.addEventListener("click", function(event) {
    event.preventDefault();
    sessionStorage.removeItem("jobSeeker");
    window.location.href = "login.jsp";
  });
}
