<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
body {
background-color: rgb(51, 255, 232  );

}
</style>
</head>
<body>
<h2> All the flights !!</h2>
<c:forEach items="${requestScope.flightList}" var="flight">
            <b>Flight No:</b> ${flight.flightNo}<br>
            <b>Flight Name:</b> ${flight.flightName}<br>
            <b>Source:</b> ${flight.source}<br>
            <b>Destination:</b> ${flight.destination}<br>
            <b>Date:</b> ${flight.date}<br><br>
        </c:forEach>
        
        <a href="${pageContext.request.contextPath}/user/home" >Go Back to Home</a> <br />
</body>
</html>