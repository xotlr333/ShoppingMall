<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link rel="stylesheet" href="css/bootstrap.css">
<script type="text/javascript" src="script/animal.js">
</script>
</head>
<div class = "container">
<div class="col-lg-4"></div>
<div class="col-lg-4">
<%
	boolean result = Boolean.parseBoolean(request.getParameter("result"));
%>
<%
	if(result){
%>
	<h3>회원가입에 감사드립니다.</h3>
	<input type="button" value="로그인" onclick="location.href='animalLogin.jsp'"  class="btn-primary form-control">
<%} else { %>
	<h3>회원가입에 실패했습니다.</h3>
	<input type="button" value="뒤로가기" onclick="location.href='animalJoin.jsp'" width=50% class="btn-primary form-control">
<%} %>

</div>
</div>
<body>

</body>
</html>