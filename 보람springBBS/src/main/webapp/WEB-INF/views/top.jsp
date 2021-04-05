<script src="${pageContext.request.contextPath}/resources/js/login_check.js"></script>

<!-- Navigation -->
<nav class="navbar navbar-expand-lg navbar-dark  fixed-top" id="mainNav">
	<div class="container">
		<div class="d-flex flex-wrap align-items-center justify-content-between col-lg-10 mx-auto">
			<a class="navbar-brand brand d-inline-flex align-items-center justify-content-between mr-4"
				href="index.jsp"><i class="fas fa-leaf mr-2"></i>
				<span>Spring Project</span>
			</a>
			<div class="d-flex order-lg-2 align-items-center">
				<div id="user_s">
					<a class="btn btn-login px-0" id="login_btn" onclick="javascript:openLoginModal();" role="button"> Login<i class="fas fa-sign-in-alt ml-2"></i></a>
				</div>
				<button class="navbar-toggler navbar-toggler-right rounded-circle" type="button" data-toggle="collapse"
					data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
					<i class="fas fa-bars"></i>
					
				</button>
			</div>
<%-- Menu Link here!! --%>
			<div class="collapse navbar-collapse order-lg-1 justify-content-between"
				id="navbarResponsive">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0 mt-3 mt-lg-0">
					<li class="nav-item">
						<a class="nav-link active" aria-current="page" href="index.jsp">Index</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="list.do">Board</a> 
					</li>
					<li class="nav-item">
						<a class="nav-link" href="album.do">Album</a>
					</li>
				</ul>
			</div>
			<div class="sdropdown pb-1 rounded rounded-2 " style="width: 13rem;">
					<a class="dropdown-item p-0 py-1 px-1 d-inline-flex align-items-center justify-content-around"
					 onclick="location.href='logout.do'" role='button'>
						<span>Logout</span>
						<i class='fas fa-power-off ml-4'></i>
					</a>
			</div>
		</div>
	</div>
</nav>
<!-- Page Header -->
<header class="masthead"
	style="background-image: url('./resources/img/bg_art.jpg')">
	<div class="overlay"></div>
	<div class="container">
		<div class="row">
			<div class="col-lg-10 mx-auto">
				<div class="site-heading pl-3">
					<h1>My Spring
						<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						BBS
					</h1>
				</div>
			</div>
		</div>
	</div>
</header>
<%-- Login Modal --%>
<div id="login_modal" >
	<div class="login_modal_layer" onclick="javascript:closeLogin_modal();"></div>
	<div class="login_modal_content border border-3 rounded rounded-2 px-4 pb-5 pt-3" style="width: 24rem;">
		<button type="button" class="close_md border-0" onclick="javascript:closeLogin_modal();"> <i class="fas fa-times"></i> </button>
		<form class="modal-body px-4 pt-4 pb-2" method="post" >
			<div class="mb-3">
				<label for="id" class="form-label">Id</label> <input type="text" class="form-control" placeholder="id" name="id" id="id" value="sky" required>
			</div>
			<div class="mb-3">
				<label for="pw" class="form-label">Password</label> 
				<input type="password" class="form-control" placeholder="Password" name="pw" id="pw" value="1234" required>
			</div>
			<div class="mb-3">
				<div class="form-check d-flex align-items-center sub">
					<input type="checkbox" class="form-check-input" id="dropdownCheck">
					<label class="form-check-label " for="dropdownCheck">Remember me</label>
				</div>
			</div>
			<button type="submit" class="btn btn-primary" onclick="javascript:loginCheck();">Login</button>
		</form>
		<div class="dropdown-divider"></div>
		<a class="dropdown-item sub" href="signUp.do"> New around here? <font color="#0085a1">Sign up</font> </a>
		<a class="dropdown-item sub" href="#">Forgot password?</a>
	</div>
</div>




