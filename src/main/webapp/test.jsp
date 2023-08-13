<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
/* Styling for the modal popup */
.popup-container {
    display: none;
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background-color: rgba(0, 0, 0, 0.5);
    z-index: 1000;
}

.popup-content {
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    background-color: white;
    padding: 20px;
    border-radius: 5px;
    box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
}

.spinner {
    border: 4px solid rgba(0, 0, 0, 0.1);
    border-top: 4px solid #3498db;
    border-radius: 50%;
    width: 40px;
    height: 40px;
    animation: spin 2s linear infinite;
}

@keyframes spin {
    0% { transform: rotate(0deg); }
    100% { transform: rotate(360deg); }
}

</style>
</head>
<body>
<button id="showPopupBtn">Show Popup</button>

<!-- The modal popup -->
<div id="popupContainer" class="popup-container">
    <div class="popup-content">
        <div class="spinner"></div>
    </div>
</div>
<script>
document.getElementById('showPopupBtn').addEventListener('click', function () {
    var popupContainer = document.getElementById('popupContainer');
    popupContainer.style.display = 'block';

    // Close the popup after 3 seconds
    setTimeout(function () {
        popupContainer.style.display = 'none';
        console.log('Spinner animation is over.');
    }, 3000); // 3000 milliseconds = 3 seconds
});

</script>
</body>
</html>