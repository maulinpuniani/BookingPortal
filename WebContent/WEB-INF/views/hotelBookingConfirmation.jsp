<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
body, html {
  height: 100%;
  margin: 0;
}

.bg {
  /* The image used */
  background-image: url('https://kinrossshowdotcom.files.wordpress.com/2016/08/thankyou21.jpg');

  /* Full height */
  height: 100%; 

  /* Center and scale the image nicely */
  background-position: center;
  background-repeat: no-repeat;
  background-size: cover;
}
</style>
</head>
<body>
<div class="bg">

<center><h3>Your Hotel Booking is Confirmed. Hope you have a nice stay!!</h3></center>
</center><h3>Your Booking itinerary has been sent to your email.</h3></center>
<a href="${pageContext.request.contextPath}/user/home" >Go Back to Home</a> <br />
</div>
</body>
</html>