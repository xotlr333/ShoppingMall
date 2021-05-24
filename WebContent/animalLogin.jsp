<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="animalTop.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<title>로그인</title>
<script type="text/javascript">	  
function checkNull() {
	 if(login.userid.value.length == 0) {
		 alert("아이디를 입력하세요");
		 login.userid.focus();
		 return false;
	 }else {login.userpwd.focus();}
	 if(login.userpwd.value.length == 0) {
		 alert("비밀번호를 입력하세요");
		 login.userpwd.focus();
		 return false;
    }
	 return true;
 }

</script>
</head>
<body align="center";>
  <div class = "container">
  <div class="col-lg-4"></div>
  <div class="col-lg-4">
  
    <form name="login" action="animalLoginResult.jsp" method="post">
       <div class="form-group">
       <input type ="text" name="userid" placeholder="아이디" class="form-control">
       </div>
       <div class="form-group">
       <input type="password" name="userpwd" placeholder="비밀번호" class="form-control">
       </div>
       
       <input type="submit" value="로그인" class="btn-primary form-control"
                onclick="checkNull()"> 
        
       <a href="animalLogin.jsp">취소</a>
       <a href="animalJoin.jsp">회원가입</a>
    </form>
  </div>
  </div>
  
  
</body>
</html>