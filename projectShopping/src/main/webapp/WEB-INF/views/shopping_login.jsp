<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>main</title>

    <link rel="stylesheet" href="resources/home.css/login.css">
    

</head>
<body>
<jsp:include page="./shopping_top.jsp"></jsp:include>

  <form action="loginConfirm.do" method="post">

    <div id="login1">
    <input type="text" name="userid" placeholder="아이디 입력"><br>
    <input type="password" name="pwd" placeholder="비밀번호 입력"><br>
    <input type="submit" id="login" value="로그인">
    <div id="lmsg">${msg}</div>
    </div>
    <div id="login2">
        <ul>
            <li><a href="findid.do">아이디 찾기</a></li>
            <li><a href="#">비밀번호 찾기</a></li>
            <li><a href="signup.do">회원가입</a></li>
        </ul>
    </div>
 </form>
     
  <jsp:include page="./shopping_footer.jsp"></jsp:include>   
     
  




</body>
</html>