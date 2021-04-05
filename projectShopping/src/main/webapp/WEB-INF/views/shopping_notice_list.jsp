<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
</head>
<body>
<h2>공지사항</h2>

<table width="300" border="1" cellspacing="0">
	<tr>
		<td>번호</td> <td>제목</td> <td>날짜</td> 
	</tr>

<c:forEach items="${ndto}" var="ndto">
	<tr>
		<td>${ndto.rn}</td>
		<td> <a href="noticeDetail.do?code=${ndto.code}"> ${ndto.title}</a> </td>
		<td><fmt:formatDate value="${ndto.wdate}" pattern="yyy-mm-dd"/>  </td>
	</tr>
</c:forEach>
</table>
</body>
</html>