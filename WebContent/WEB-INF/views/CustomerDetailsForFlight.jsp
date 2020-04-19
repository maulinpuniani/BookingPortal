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
  background-image: url('http://www.flightattendantjoe.com/wp-content/uploads/2013/05/cartoon-airplane.jpeg');

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
<form action="${pageContext.request.contextPath}/flight/confirmbooking" method="post">
	
		<table>
		<tr>
		    <td> Name:</td>
		    <td><input name="name" size="30" required="required" /></td>
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
		    <td><input name="cost" value = ${map.cost}/></td>
		</tr>
		
		<tr>
		    <td colspan="2"><input type="submit" value="Confirm Booking" /></td>
		</tr>
				
		</table>
		<input type="hidden" name = "depflightNo" value="${map.depflightNo}" />
		<input type="hidden" name = "depsource" value="${map.depsource}" />
		<input type="hidden" name = "depdest" value="${map.depdest}" />
       	<input type="hidden" name = "depdep" value="${map.depdep}" />
		<input type="hidden" name = "deparival" value="${map.deparival}" />
       	<input type="hidden" name = "retflightNo" value="${map.retflightNo}" />
       	<input type="hidden" name = "retdest" value="${map.retdest}" />
       	<input type="hidden" name = "retsrc" value="${map.retsrc}" />
       	<input type="hidden" name = "retarival" value="${map.retarival}" />
       	<input type="hidden" name = "retdep" value="${map.retdep}" />
      

	</form>
	 <a href="${pageContext.request.contextPath}/user/home" >Go Back to Home</a> <br />
	 </div>
</body>
</html>