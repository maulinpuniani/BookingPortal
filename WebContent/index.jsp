<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

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
  background-image: url('https://www.southhavenjellystone.com/content/uploads/jellystone-park-book-now-button.png');

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
<center><h2>Hi, Welcome to Booking Portal !!</h2></center><br>
  <c:set var="contextPath" value="${pageContext.request.contextPath}" />
 <center> <a href="${contextPath}/user/login">Click here to login</a>  </center>
  </div>
</body>
</html>