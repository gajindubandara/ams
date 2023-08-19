<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>API Data Retrieval</title>
    <!-- Include jQuery library -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
    <button id="fetchData">Fetch API Data</button>
    <script>
        $(document).ready(function () {
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
    </script>
</body>
</html>

