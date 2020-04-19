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
<h4>     Departure flights !!</h4> 
<form action="${pageContext.request.contextPath}/flight/book" method="post" name="form1">
<table>
<c:forEach items="${requestScope.map.depart}" var="flight">
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
               <b>Arrival Time:</b> ${flight.arrivalTime}<br>
           
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
 <br><br>
  <h4>     Return flights !!</h4> 
        <table>
        <c:forEach items="${requestScope.map.returnFlight}" var="flight1">
        <tr>
		<td><input type="radio" name="returnFlight" value= "returnFlight"></td>
		<td>
            <b>Flight No:</b> ${flight1.flightNo}<br>
            <b>Flight Name:</b> ${flight1.flightName}<br>
            <b>Source:</b> ${flight1.source}<br>
            <b>Destination:</b> ${flight1.destination}<br>
            <b>Return Date:</b> ${flight1.date}<br>
             <b>Price:</b> ${flight1.price}<br>
              <b>Departure Time:</b> ${flight1.departureTime}<br>
               <b>Arrival Time:</b> ${flight1.arrivalTime}<br>
               </td>
               </tr>
             <input type="hidden" name = "retflightNo" value="${flight1.flightNo}" />
			 <input type="hidden" name = "retprice" value="${flight1.price}" />
			 <input type="hidden" name = "retsource" value="${flight1.source}" />
				<input type="hidden" name = "retdest" value="${flight1.destination}" />
				<input type="hidden" name = "retarival" value="${flight1.arrivalTime}" />
				<input type="hidden" name = "retdep" value="${flight1.departureTime}" />
        </c:forEach>
        </table>
        <table>    
        <tr>
		    <td colspan="2"><input type="submit" value="Book Flight" /></td>
		</tr>
		</table>
        </form>
         <a href="${pageContext.request.contextPath}/user/home" >Go Back to Home</a> <br />
         </div>
</body>
</html>