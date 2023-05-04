<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <a class="navbar-brand" href="home.jsp" style="font-family : 'Cursive'; font-size : 25px;">Bookify</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav ml-auto ">
      <li class="nav-item active">
        <a class="nav-link" href="cart.jsp"><i class="fa fa-shopping-cart"></i> <b>My Cart </b> <span class="sr-only">(current)</span></a>
      </li>
      
      <li class="nav-item active my-auto px-2">
        <form name="logoutbutton" action="logout" method="post">
			<input type="submit" name="fetchdata" value="Logout" class='btn btn-danger my-auto'>
			</form>
      </li>
      
      
    </ul>
    
  </div>
</nav>