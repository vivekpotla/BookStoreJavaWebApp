<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 
  <%@include file="components/allCSS.jsp"%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%
	String msg = (String)request.getParameter("msg");
	if ("done".equals(msg)) {
%>
<script>
	alert("Book Added Successfully..");
	window.location.assign("addBook.jsp");
</script>
<% 
	}

	else if ("BookIDalreadyexists".equals(msg)) {
%>
<script>
	alert("Book ID Already Exists");
	window.location.assign("addBook.jsp");
</script>
<% 
	}
%>



<%@include file="components/navbar.jsp"%>

<h1 class='text-center p-3 w-75 mx-auto bg-success rounded mt-5'>Add Book </h1>
<form action='addbook' method='post' class='w-75 mx-auto mt-5'>
  <div class="form-row">
		  <div class="form-group col-md-6">
		      <label for="bookid">Book ID</label>
		      <input type="number" class="form-control" name="bookid" >
	     </div>
	     
	    <div class="form-group col-md-6">
	      <label for="bookName">Book name</label>
	      <input type="text" class="form-control"  name='bookName'>
	    </div>
    
  </div>
  <div class="form-row">
	  <div class="form-group col-md-6">
	    <label for="author">Author Name</label>
	    <input type="text" class="form-control" name="author" >
	  </div>
	  <div class="form-group col-md-6">
	      <label for="cost">Price in Rs.</label>
	    <input type="number" class="form-control" name="cost" placeholder="in Rs.">
	  </div>
  </div>
  <div class="form-row">
   <div class="form-group col-md-12">
	    <label for="imgURL">Image URL</label>
	    <input type="text" class="form-control" name="imgURL" >
	  </div>
  </div>
 
  <button type="submit" class="btn btn-primary p-3"> + Add Book</button>
</form>
</body>
</html>