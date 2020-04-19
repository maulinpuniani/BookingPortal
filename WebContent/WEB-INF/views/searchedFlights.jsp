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
<h2>Searched flights</h2>
<form action="${pageContext.request.contextPath}/flight/book" method="post" name="form1">
<table>
<c:forEach items="${requestScope.flightList}" var="flight">
<tr>
<td><input type="radio" name="departureFlight" value= "departureFlight"></td>
<td>
            <b>Flight No:</b> ${flight.flightNo}<br>
            <b>Flight Name:</b> ${flight.flightName}<br>
            <b>Source:</b> ${flight.source}<br>
            <b>Destination:</b> ${flight.destination}<br>
            <b>Date:</b> ${flight.date}<br>
             <b>Price:</b> ${flight.price}<br>
              <b>Departure Time:</b> ${flight.departureTime}<br>
               <b>Arrival Time:</b> ${flight.arrivalTime}<br><br>
            
</td>
</tr>
				<input type="hidden" name = "depflightNo" value="${flight.flightNo}" />
				<input type="hidden" name = "depprice" value="${flight.price}" />
				<input type="hidden" name = "depsource" value="${flight.source}" />
				<input type="hidden" name = "depdest" value="${flight.destination}" />
				<input type="hidden" name = "deparival" value="${flight.arrivalTime}" />
				<input type="hidden" name = "depdep" value="${flight.departureTime}" />
        </c:forEach>
        </table>
         <tr>
		    <td colspan="2"><input type="submit" value="Book Flight" /></td>
		</tr>
        </form>
         <a href="${pageContext.request.contextPath}/user/home" >Go Back to Home</a> <br />
         </div>
</body>
</html>