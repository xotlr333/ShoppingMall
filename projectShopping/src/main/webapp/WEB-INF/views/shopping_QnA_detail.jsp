<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객문의 상세페이지</title>

<style type="text/css">
	table {width: 1200px; margin-left: auto; margin-right: auto;
				 font-size: 16pt; border-collapse: collapse;}
   				 
	th, td {border-bottom: 1px solid #BDBDBD; padding: 20px!important;}
	
	.bot1{ border-bottom: 1px solid #000000;}
	
	.but1 {background-color: #000000; color: white!important;
		width: 250px; padding: 14px 20px; text-decoration: none!important;
		border-radius: 10px;}
	.po1 {width: 1200px; margin-left: auto; margin-right: auto;}
</style>

</head>
<body>

<jsp:include page="./shopping_top.jsp"></jsp:include>

<br><br>

<div align="center">
<table>
<tr>
	<td class="bot1" colspan="3" align="left">
		<font style="font-size: 22pt;">고객문의</font>
	</td>
</tr>
<tr>
	<td align="left"> ▶ ${qdto.title} </td>
	<td align="right"><fmt:formatDate value="${qdto.wdate}" pattern="yyy-MM-dd"/>  </td>
</tr>
<tr>
	<td colspan="2" height="500">${qdto.content}</td>
</tr>
</table>
</div>

<br><br><br>

<div class="po1" align="center">
<div align="right">
<c:if test="${checkid eq 'ok'}">
<a class="but1" href="qnapreedit.do?code=${qdto.code}">수정</a> &nbsp;
<a class="but1" href="qnadelete.do?code=${qdto.code}">삭제</a> &nbsp;
</c:if>
<a class="but1" href="qnaList.do">목록</a> &nbsp; 
</div>
</div>

<br>
<!-- 답글 -->
<c:import url="/qnaReplyList.do"></c:import>

<br><br><br><br><br>

<jsp:include page="./shopping_footer.jsp"></jsp:include>
</body>
</html>