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
  background-image: url('https://www.friendstravelnc.com/Content/images/gif/hotel-gif5.gif');

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
<h3>Welcome to home page!</h3><br>
<a href="${pageContext.request.contextPath}/flight/getAll">All Flights</a><br/>
<a href="${pageContext.request.contextPath}/flight/search">Search Flights</a><br/>
<a href="${pageContext.request.contextPath}/hotel/search">Search Hotels</a><br/>
</div>
</body>
</html>