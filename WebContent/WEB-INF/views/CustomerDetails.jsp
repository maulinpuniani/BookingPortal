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
<h2>Booking Details</h2>
<form action="${pageContext.request.contextPath}/hotel/booking" method="post">
	
		<table>
		<tr>
		    <td> Name:</td>
		    <td><input name="name" size="30" required="required" /></td>
		</tr>
		<tr>
		 <td> <label for="email">Enter your email:</label></td>
  		 <td> <input type="email" id="email" name="email"></td>
  		</tr>
		<tr>
		    <td><label for="female">Female</label></td>
		    <td><input type="radio" name="gender" value="female"></td>
		</tr>
		
		<tr>
		    <td><label for="male">Male</label></td>
		    <td><input type="radio" name="gender" value="male" ></td>
		</tr>
		<tr>
		    <td><label> Credit/Debit Card Number:</label></td>
		    <td><input name="card" size="30" required="required" /></td>
		</tr>
		<tr>
		    <td><label> Credit/Debit Card Expiry(in mm/yyyy) :</label></td>
		    <td><input name="expiry" size="30" required="required" /></td>
		</tr>
		<tr>
		    <td><label> Credit/Debit Card CVV :</label></td>
		    <td><input name="cvv" size="3" required="required" /></td>
		</tr>
		<tr>
		    <td> <label>Total Cost:</label></td>
		    <td><input name="cost" value = ${map.cost}></td>
		</tr>
		
		<tr>
		    <td colspan="2"><input type="submit" value="Confirm Booking" /></td>
		</tr>
				
		</table>
		<input type="hidden" name = "hotelName" value="${map.hotel}" />
       	<input type="hidden" name = "checkInDate" value="${map.date}" />
		

	</form>
	 <a href="${pageContext.request.contextPath}/user/home" >Go Back to Home</a> <br />
	</div>
</body>
</html>