<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
<h1>Error Page</h1>
<p>${errorMessage}</p>
<a href="${pageContext.request.contextPath}/user/register">Go to Register</a><br/>
<a href="${pageContext.request.contextPath}/user/login">Go Back to Login</a><br/>
</body>
</html>