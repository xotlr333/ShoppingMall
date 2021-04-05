<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
  <title>Home</title>
  <style type="text/css">
 	 *{ font-size:20pt; font-weight: bold; }
 	 a{ font-size:20pt; font-weight: bold; text-decoration: none; }
 	 a:hover{ font-size:24pt;  text-decoration: underline; }
  </style>
</head>
<body>
<h1>
	Hello world!!!  TIS kim Lee
</h1>


 <h2> <P>  The time on the server is ${serverTime}  도우넛,마이콜  </h2> </P> 
    <p>
   	<a href="index.jsp">[index]</a>
   	<a href="home.do">[home]</a>
   	<a href="boardWrite.do">[글쓰기]</a>
   	<a href="boardList.do">[전체출력]</a>
</body>
</html>
