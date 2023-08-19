<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"  isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>All Appointments</title>
    <!-- Include Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
    <div class="container mt-5">
        <h1>All Appointments</h1>
        <span>${feebackMessage}</span>
        <table class="table">
            <thead>
                <tr>
                    <th>Admin ID</th>
                    <th>Country</th>
                    <th>Field</th>
                    <th>State</th>
                    <th>Slot</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${appointments}" var="appointment">
                    <tr>
                        <td>${appointment.adminId}</td>
                        <td>${appointment.country}</td>
                        <td>${appointment.field}</td>
                        <td>${appointment.state}</td>
                        <td>${appointment.slot}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
    <script>
        $(document).ready(function () {
            $("#fetchData").click(function () {
                $.ajax({
                    url: "http://localhost:8080/ams/getAll", // Replace with your API URL
                    method: "GET",
                    dataType: "json",
                    success: function (data) {
                        console.log(data);
                    },
                    error: function (xhr, status, error) {
                        console.error("Error fetching API data:", error);
                    }
                });
            });
        });
    </script>
    <script>
    
  /*   document.addEventListener("DOMContentLoaded", function () {
        fetchAllAppointmentsAndLog();
    });
    
    
    function fetchAllAppointmentsAndLog() {
        var xhr = new XMLHttpRequest();
        xhr.open("GET", "http://localhost:8080/ams/YourServletURL?actiontype=fetchAll", true);

        xhr.onreadystatechange = function () {
            if (xhr.readyState === 4 && xhr.status === 200) {
                try {
                    var appointments = JSON.parse(xhr.responseText);
                    console.log(appointments); // Log the fetched data to the console
                } catch (error) {
                    console.error("Error parsing JSON:", error);
                }
            }
        };

        xhr.send();
    } */
    </script>
</body>
</html>
