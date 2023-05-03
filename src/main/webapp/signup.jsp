<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Registration Form</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" type="text/css" href="component/login.css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<style>
body{
  height: 100vh;
  background: #406495 !important;
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
}

.card{
  overflow: hidden;
  border: 0 !important;
  border-radius: 20px !important;
  box-shadow: 0 0.5rem 1rem 0 rgba(0, 0, 0, 0.1);
}

.img-left{
  width: 45%;
  background: url('../images/log.jpg') center;
  background-size: cover;
}

.card-body{
  padding: 2rem;
}

.title{
  margin-bottom: 2rem;
}

.form-input{
  position: relative;
}

.form-input input{
  width: 100%;
  height: 45px;
  padding-left: 40px;
  margin-bottom: 20px;
  box-sizing: border-box;
  box-shadow: none;
  border: 1px solid #00000020;
  border-radius: 50px;
  outline: none;
  background: transparent;
}

.form-input span{
  position: absolute;
  top: 10px;
  padding-left: 15px;
  color: #007bff;
}

.form-input input::placeholder{
  color: black;
  padding-left: 0px;
}

.form-input input:focus, .form-input input:valid{
  border: 2px solid #007bff;
}

.form-input input:focus::placeholder{
  color: #454b69;
}


.form-input textarea{
  width: 100%;
  height: 45px;
  padding-left: 40px;
  margin-bottom: 20px;
  box-sizing: border-box;
  box-shadow: none;
  border: 1px solid #00000020;
  border-radius: 50px;
  outline: none;
  background: transparent;
}

.form-input textarea::placeholder{
  color: black;
  padding-left: 0px;
}

.form-input textarea:focus, .form-input textarea:valid{
  border: 2px solid #007bff;
}

.form-input textarea:focus::placeholder{
  color: #454b69;
}

.form-box button[type="submit"]{
  margin-top: 10px;
  border: none;
  cursor: pointer;
  border-radius: 50px;
  background: #007bff;
  color: #fff;
  font-size: 90%;
  font-weight: bold;
  letter-spacing: .1rem;
  transition: 0.5s;
  padding: 12px;
}

.form-box button[type="submit"]:hover{
  background: #0069d9;
}

.forget-link, .register-link{
  color: #007bff;
  font-weight: bold;
}

.forget-link:hover, .register-link:hover{
  color: #0069d9;
  text-decoration: none;
}

.form-box .btn-social{
  color: white !important;
  border: 0;
  font-weight: bold;
}

.form-box .btn-facebook{
  margin-top: 10px;
  border: none;
  cursor: pointer;
  border-radius: 50px;
  font-size: 90%;
  font-weight: bold;
  letter-spacing: .1rem;
  transition: 0.5s;
  padding: 12px;
  background: #4866a8;
}

.form-box .btn-facebook:hover{
  background: #3d578f;
}
</style>
</head>
<body>

<%
	String msg = (String) session.getAttribute("msg");
	if ("valid".equals(msg)) {
%>
<script>
	alert("Registration Successfully..");
	window.location.assign("login.jsp");
</script>
<% session.removeAttribute("msg");
	}

	else if ("User Already Exists".equals(msg)) {
%>
<script>
	alert("User Already Exists");
	window.location.assign("login.jsp");
</script>
<% session.removeAttribute("msg");
	}
	else if(msg!=null){
%> <script>
	alert("Sign Up failed");
	window.location.assign("login.jsp");
	
   </script>
 <% session.removeAttribute("msg");
 }
 %> 

 

	<div class="container">
		<div class="row px-5">
			<div class="col-lg-6 col-xl-9 card  mx-auto px-0">
				

				<div class="card-body w-50 mx-auto">
					<h2 class=" text-center my-4 mx-auto">Sign Up</h2>
					<form class="form-box px-3" action="signup" method="post">

						<div class="form-input">
							<span><i class="fa fa-user"></i></span> <input type="text"
								name="fullName" placeholder="Enter Full Name" required>
						</div>

						<div class="form-input">
							<span><i class="fa fa-envelope-o"></i></span> <input type="email"
								name="email" placeholder="Email Address" required>
						</div>

						<div class="form-input">
							<span><i class="fa fa-key"></i></span> <input type="password"
								name="password" placeholder="Password" required>
						</div>

						<div class="form-input">
							<span><i class="fa fa-phone"></i></span> <input type="text"
								name="ContactNo" placeholder="Enter Contact No." maxlength="10"
								required>
						</div>


						<div class="mb-3">
							<button type="submit" class="btn btn-block text-uppercase">
								Submit</button>
						</div>

						<div class="row mb-3">
							<a href="index.jsp" class="btn btn-block btn-social btn-facebook">
								Back to Home </a>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

</body>
</html>