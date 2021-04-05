<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 상세페이지</title>

<style type="text/css">
	.tit { background-color: red;  width: 1200px; 
			margin-left: auto; margin-right: auto;}
	
	.con {margin-left: auto; margin-right: auto;}
</style>

</head>
<body>
<div align="center"><h2>공지사항</h2></div>

<div class="tit" align="center">
<table width="1000" border="1" cellspacing="0">
	<tr>
		<td width="200">제목 : ${ndto.title}</td> 
		<td>날짜 : <fmt:formatDate value="${ndto.wdate}" pattern="yyy-mm-dd"/>  </td> 
	</tr>
</table>
</div>

<div class="con" align="center">
<table border="1" cellspacing="0">
	<tr align="center">
		<td>내용</td>
	</tr>
	<tr>
	<td rowspan="2">${ndto.content}</td>
	<tr>
</table>
</div>

</body>
</html>