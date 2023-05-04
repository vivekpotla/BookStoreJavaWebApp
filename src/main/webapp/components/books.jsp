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
	
	<div class='text-center bg-info p-2 w-50 rounded mx-auto'>Books </div>
	<table class="table table-striped w-50 mx-auto">
							<thead>
								<tr>
									<th scope="col">#</th>
									<th scope="col">Image</th>
									<th scope="col">Book Title</th>
									<th scope="col">Author</th>
									<th scope="col">Price</th>
									<th scope="col">Add to Cart</th>
								</tr>
							</thead>

							<tbody>
								<%
									GetBooks gb = new GetBooks();
								    List <Book> list = gb.getAllBooks();
									int i=0;
									for (Book b : list) {
										i++;
								%>
								<tr class='my-auto'>
									<td><%=i%></td>
								    <td><img src='<%=b.imgURL %>' width="100px" height="100px"></td>
									<td><%=b.name %></td>
									<td><%=b.author %></td>
									<td>Rs . <%=b.cost %></td>
									<td><button class='btn btn-primary my-auto'>Add to cart</button></td>
								</tr>
								<%
									}
								%>
							</tbody>
						</table>
</body>
</html>