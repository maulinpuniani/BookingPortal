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
  background-image: url('https://i.pinimg.com/736x/a9/32/8b/a9328b39074a72a8411745cf0754a71d.jpg');

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
<h2> Hotels !!</h2>
<form action="${pageContext.request.contextPath}/hotel/book" method="post" >
<table>
<c:forEach items="${requestScope.hotelList}" var="hotel">
<tr>
		<td><input type="radio" name="selectHotel" value= "selectHotel"></td>
		<td>
            <b>Hotel Name:</b> ${hotel.hotelName}<br>
            <b>Hotel City:</b> ${hotel.city}<br>
            <b>Room Type:</b> ${hotel.roomType}<br>
       		<b>Room Price:</b>${hotel.price} <br>
       	</td>
       	</tr>
       	<input type="hidden" name = "price" value="${hotel.price}" />
       	<input type="hidden" name = "hotelName" value="${hotel.hotelName}" />
       	<input type="hidden" name = "checkInDate" value="${hotel.checkInDate}" />
        </c:forEach><br>
        <tr>
        <td>No. of Rooms</td>
		    <td colspan="2"><input name="numberOfRooms" size="30" required="required" /></td>
		</tr>
  
     	<tr>
     	<td></td>
		    <td colspan="2"><input type="submit" value="Book Hotel" /></td>
		</tr>
 
    </table>
    </form>
     <a href="${pageContext.request.contextPath}/user/home" >Go Back to Home</a> <br />
     </div>
</body>
</html>