<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
  background-image: url('https://www.softwareadvice.com/resources/wp-content/uploads/Boost-Cheaper-Books-for-Small-Hotels-Tile.png');

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
<h3>Search Hotel</h3>
<form action="${pageContext.request.contextPath}/hotel/search" method="post" name="form1">
	
		<table>
		<tr>
		    <td>City:</td>
		    <td><input name="city" size="30" required="required" /></td>
		</tr>
		<tr>
		    <td><label for="date">Check in:</label></td>
		    <td> <input type="date" id="checkIndate" name="checkIndate" required="required" ></td>
		</tr> 
		 <tr>
		    <td><label for="date">Check out:</label></td>
		    <td> <input type="date" id="checkOutdate" name="checkOutdate" required="required"></td>
		</tr> 
		<tr>
		    <td>Room Type:</td>
		    <td><input name="roomType" size="30" required="required" /></td>
		</tr>
		<tr>
		    <td colspan="2"><input type="submit" value="Search" /></td>
		</tr>
				
		</table>

	</form>
	 <a href="${pageContext.request.contextPath}/user/home" >Go Back to Home</a> <br />
	</div>
</body>
</html>