<script src="${pageContext.request.contextPath}/resources/js/login_check.js"></script>
	<!-- Navigation -->
    <nav class="navbar navbar-expand-lg navbar-light fixed-top" id="mainNav">
      <div class="container">
      
        <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
          <i class="fas fa-bars"></i>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
          <ul class="navbar-nav ">
            <li class="nav-item">
              <a class="nav-link active" aria-current="page" href="index.jsp">index</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="list.do">Board</a>
            </li>
            
            <li class="nav-item">
              <a class="nav-link" href="album.do">Album</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="signUp.do">SignUp</a>
            </li>
          </ul>
        </div>
      </div>
    </nav>
    
    <!-- Page Header -->
    <header class="masthead" style="background-image: url('./resources/img/home-bg.jpg')">
      <div class="overlay"></div>
      <div class="container">
        <div class="row">
          <div class="col-lg-12 mx-auto">
            <div class="site-heading">
              <h1>My Spring BBS</h1>
            </div>
          </div>
        </div>
      </div>
      <li class="nav-item">
              <span id="user_s">
	           <form method="post" action="login.do">
	             <input type="text"  placeholder="id"  name="id" id="id" value="sky" required>
	             <input type="text"  placeholder="pw"  name="pw" id="pw" value="1234" required>
	             <input type="button" class="btn btn-primary" onclick="javascript:loginCheck();" value="login">
               </form>
              </span>
            </li>
    </header>



