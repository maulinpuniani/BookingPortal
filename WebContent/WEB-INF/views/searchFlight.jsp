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
<h2>Search Flights Page!</h2>
	<form action="${pageContext.request.contextPath}/flight/search" method="post" name="form1">
	
		<table>
		<tr>
		    <td><label for="one-way">One-way</label></td>
		    <td><input type="radio" id="one-way" name="trip" value="one-way" onclick = "hide()"></td>
		</tr>
		
		<tr>
		    <td><label for="round-trip">Round-trip</label></td>
		    <td><input type="radio" id="round-trip" name="trip" value="round-trip" onclick = "show()"></td>
		</tr>
		<tr>
		    <td>Source:</td>
		    <td><input name="source" size="30" required="required" /></td>
		</tr>
		<tr>
		    <td>Destination:</td>
		    <td><input name="destination" size="30" required="required" /></td>
		</tr> 
		<tr>
		    <td><label for="date">Depart on:</label></td>
		    <td> <input type="date" id="departdate" name="departdate" required="required" ></td>
		</tr> 
		 <tr>
		    <td><label for="date" id="returnlabel">Return on:</label></td>
		    <td> <input type="date" id="returndate" name="returndate"></td>
		</tr> 
 
		
		<tr>
		    <td colspan="2"><input type="submit" value="Search" /></td>
		</tr>
				
		</table>

	</form>

	 <script>
          
			function hide() {
				document.getElementById("returndate").style.display = "none";
				document.getElementById("returnlabel").style.display = "none";
			/*	var value = document.forms["form1"]["trip"].value;
				if (value.equals("round-trip")) {
					var returnValue = document.forms["form1"]["returndate"].value;
					if (returnValue == null) {
						alert("Please enter return date");
						return false;
					} else {
						return true;
					}

				}*/
			}function show() {
				document.getElementById("returndate").style.display = "block";
				document.getElementById("returnlabel").style.display = "block";
			}
			
		</script>
		 <a href="${pageContext.request.contextPath}/user/home" >Go Back to Home</a> <br />
</div>
</body>
</html>