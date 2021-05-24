<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>top</title>

  <link rel="stylesheet" href="resources/home.css/top.css">
  <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
  <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <script src="resources/home.js/top.js"></script>




</head>
<body>



<div id="container">
  <div id="head1">
    <div id="logo">
      <h2><a href="home.do">TMALL</a></h2>
    </div>
    <div id="search">
      <input type="text" id="keyword">
      <button class="material-icons">&#xe8b6;</button>
    </div>
    <div id="login-box">
      <ul>
       <li><a href="noticeList.do">공지사항</a></li>
      <li><a href="qnaList.do">QnA</a></li>
       <c:choose>
        <c:when test="${userid=='admin'}">
         <li><a href="productWrite.do">등록하기</a></li>
        </c:when>
       <c:otherwise>
        <li><a href="cart.do">장바구니</a></li>
       </c:otherwise> 
       </c:choose>   
       <c:choose>
        <c:when test="${userid=='admin'}">
        <li><a href="userList.do">고객관리</a></li>
        </c:when>
       <c:otherwise>
         <li><a href="mypage.do">마이페이지</a></li>
       </c:otherwise> 
       </c:choose> 
       <c:choose>
        <c:when test="${empty userid}">
         <li><a href="login.do">로그인</a></li>
        </c:when>
       <c:otherwise>
        <li><a href="logout.do">로그아웃</a></li>
       </c:otherwise> 
       </c:choose>     
      </ul>
    </div>
  </div>
  <div id="navi">
    <nav>
      <ul id="topMenu">
        <li><a href="home.do">홈</a></li>
        <li><a href="pre.do">혜택존</a></li>
        <li><a href="#">브랜드</a>
          <ul>
            <li><a href="productList.do?pcategory=top">상의</a></li>
            <li><a href="productList.do?pcategory=jean">하의</a></li>
            <li><a href="productList.do?pcategory=outer">아우터</a></li>
          </ul>
        </li>
        <li><a href="pre.do">쇼핑몰</a></li>  
        <li><a href="pre.do">라이프</a></li>
        <li><a href="pre.do">하이엔드</a></li>
        
     </ul>
    </nav>
  </div>


</div>

</body>
</html>