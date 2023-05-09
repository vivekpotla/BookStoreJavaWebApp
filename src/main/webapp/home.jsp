<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@include file="components/allCSS.jsp"%>
 
 

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Bookify e-Book Store</title>

</head>
<body>
    <%@include file="components/navBar2.jsp"%>
	<%
		String user = (String) session.getAttribute("name");
		

		if (user== null) {
	%>
	<script>
		alert("Login to Continue");
		window.location.assign("login.jsp");
	</script>
	<%
		}
	%>
		<h3 class=' py-2 my-2 ml-2'><i>Welcome <% out.println(session.getAttribute("name")) ;%> ! </i></h3>
		  <%@include file="components/books.jsp"%>
		
</body>
</html>