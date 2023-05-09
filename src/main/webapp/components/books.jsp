<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.javaproject.GetBooks"%>
<%@page import="com.javaproject.Book"%>
<%@page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
	String msg = request.getParameter("msg");
	if ("done".equals(msg)) {
%>
<script>
	alert("Added to Cart");
	window.location.assign("home.jsp");
</script>
<%
	}else if("exist".equals(msg)){
%>
<script>
	alert("Already in cart");
	window.location.assign("home.jsp");
</script>
<%}
%>

	
	<div class='text-center bg-info p-2 w-50 rounded mx-auto text-white font-weight-bold'>Books </div>
	<table class="table table-striped w-50 mx-auto">
							<thead>
								<tr>
									<th scope="col">Book ID</th>
									<th scope="col">Image</th>
									<th scope="col">Book Title</th>
									<th scope="col">Author</th>
									<th scope="col">Price</th>
									<th scope="col">Add to Cart</th>
								</tr>
							</thead>

							<tbody>
								<%
									
								    List <Book> list = GetBooks.getAllBooks();
									int i=0;
									for (Book b : list) {
										i++;
								%>
								<tr class='my-auto'>
									<td><%=b.id%></td>
								    <td><img src='<%=b.imgURL %>' width="100px" height="100px"></td>
									<td><%=b.name %></td>
									<td><%=b.author %></td>
									<td>Rs . <%=b.cost %></td>
									<td>
										<form name="addToCart" action="addtocart" method="post">
											<input type='text' name='idvalue' value='<%= b.id%>' style="display:none;" placeholder='<%= b.id%>'>
											<input type="submit" name="cartbutton" value="Add To Cart" class='btn btn-primary my-auto'>
										</form>
									</td>
								</tr>
								<%
									}
								%>
							</tbody>
						</table>
</body>
</html>