function handleUserSession() {
  var admin = sessionStorage.getItem("admin");
  var dashboardLink = document.getElementById("dashboardLink");
  var logoutLink = document.getElementById("logoutLink");
  var loginLink = document.getElementById("loginLink");
  var profileLink = document.getElementById("profileLink");
  var dateLink = document.getElementById("dateLink");

  if (!admin) {
    window.location.href = "adminLogin.jsp";
    dashboardLink.style.display = "none";
    logoutLink.style.display = "none";
    profileLink.style.display = "none";
    dateLink.style.display = "none";
  } else {
    loginLink.style.display = "none";
  }

  logoutLink.addEventListener("click", function(event) {
    event.preventDefault();
    console.log("clicked");
    sessionStorage.removeItem("admin");
    window.location.href = "adminLogin.jsp";
  });
}
