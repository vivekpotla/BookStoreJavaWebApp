<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.javaproject.GetCart"%>
<%@page import="com.javaproject.Book"%>
<%@page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@include file="components/allCSS.jsp"%>
</head>
<body>
<%@include file="components/navBar2.jsp"%>

<%
	String msg = request.getParameter("msg");
	if ("done".equals(msg)) {
%>
<script>
	alert("Successfully Removed.");
	window.location.assign("cart.jsp");
</script>
<%
	}
%>
	<h3 class='text-center bg-success text-white p-2 mt-5 rounded w-50 mx-auto'>My Cart</h3>
	<%

    List <Book> list = GetCart.getAllBooks(); 
    
    //Checking for size if empty or not 
    
    //if empty display it there
    if(list.size()==0){
    
    %>
    <div class=' display-4 mt-5  text-danger w-50 mx-auto p-3 text-center rounded-pill'>Cart is Empty :)</div>
    
    <%   }
    
    else {  
    %>
	
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
											<form name="removeFromCart" action="removefromcart" method="post">
											<input type='text' name='idvalue' value='<%= b.id%>' style="display:none;" placeholder='<%= b.id%>'>
											<input type="submit" name="cartbutton" value="Remove" class='btn btn-danger my-auto'>
											</form>
									</td>
								</tr>
								<%
									}
								%>
							</tbody>
						</table>
						
	<%}
    %>					

	
	
</body>
</html>