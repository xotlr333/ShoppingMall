<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.net.URLEncoder" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객관리</title>

<style type="text/css">

	table {width: 1200px; margin-left: auto; margin-right: auto;
				 font-size: 16pt; border-collapse: collapse;}
   				 
	th, td {border-bottom: 1px solid #BDBDBD; padding: 20px!important;}
	
	.bot1{ border-bottom: 1px solid #000000;}
	.bot2{ border-bottom: 0px;}
	
	.button1{background-color: #000000; padding: 20px; font-size: 18pt;
			color: white;  width: 300px; border-color: #000000;}
			
	.pageingbt1{font-size: 10pt; border: 1px solid #000000; padding: 3px 5px;
				text-decoration: none!important; color: black!important; border-radius: 3px;}
	.pageingbt1:hover { background-color: #BDBDBD}
	
	.pageingbt2{font-size: 10pt; border: 1px solid #000000; padding: 3px 5px;
				text-decoration: none!important; border-radius: 3px;
				background-color: #1C1C1C; color: white!important;}
	
	.button2{background-color: #000000; padding: 5px; font-size: 10pt;
			color: white;  width: 50px; border-color: #000000;
			border-radius: 5px;}
			
	.po1 {width: 1200px; margin-left: auto; margin-right: auto;}
	
	.writebt {background-color: #000000; color: white!important;
		width: 250px; padding: 14px 20px; text-decoration: none!important;
		border-radius: 10px;}
</style>

<script type="text/javascript">
	function changeval(){
		myform.sval.value = "";
	}
</script>

</head>
<body>

<jsp:include page="./shopping_top.jsp"></jsp:include>

<br><br>

<div align="center">
<table>
<tr>
	<td class="bot1" colspan="5" align="left">
		<font style="font-size: 22pt;">고객관리</font>
	</td>
</tr>
<tr>
	<td align="center">아이디</td> <td align="center">이름</td> <td align="center">핸드폰</td>
	<td align="center">이메일</td> <td align="center">삭제</td>  
</tr>
<c:forEach items="${udto}" var="udto">
<tr>
	<td align="center"> ${udto.userid} </td>
	<td align="center"> ${udto.name} </td>
	<td align="center"> ${udto.phone} </td>
	<td align="center"> ${udto.email} </td>
	<td align="center"> <a class="writebt" href="userDelete.do?code=${udto.code}">삭제</a> </td>
</tr>
</c:forEach>
</table>
</div>
<br>

<!-- 페이징 -->
<div align="center">
<%String sval =(String)request.getAttribute("sval");
  if(sval==null || sval==""){sval="";}%>
<c:if test="${startpage>10}"><a class="pageingbt1" href="userList.do?pageNUM=${startpage-1}&skey=${skey}&sval=<%=URLEncoder.encode(sval, "UTF-8")%>">이전</a>&nbsp;</c:if>
<c:forEach var="i" begin="${startpage}" end="${endpage}" step="1">
<c:choose>
<c:when test="${pagenum==i}"><a class="pageingbt2" href="userList.do?pageNUM=${i}&skey=${skey}&sval=<%=URLEncoder.encode(sval, "UTF-8")%>">${i}</a> &nbsp;</c:when>
<c:otherwise><a class="pageingbt1" href="userList.do?pageNUM=${i}&skey=${skey}&sval=<%=URLEncoder.encode(sval, "UTF-8")%>">${i}</a> &nbsp;</c:otherwise>
</c:choose>
</c:forEach>
<c:if test="${endpage<pagecount}" ><a class="pageingbt1" href="userList.do?pageNUM=${startpage+10}&skey=${skey}&sval=<%=URLEncoder.encode(sval, "UTF-8")%>">다음</a></c:if>
</div>
<br>

<!-- 검색 -->
<div align="center">
	<form name="myform" action="userList.do">
	<font style="font-weight: bold; color: #424242;">검색</font>&nbsp; 
	<select name="skey" onchange="changeval();" >
		<option value="name" <c:if test="${skey=='name'}">selected</c:if>>이름</option>
		<option value="userid" <c:if test="${skey=='userid'}">selected</c:if>>아이디</option>
	</select>
	<input type="text" name="sval" value="${sval}">
	<input class="button2" type="submit" value="검색">
	</form>
</div>

<br><br><br><br><br>

<jsp:include page="./shopping_footer.jsp"></jsp:include>

</body>
</html>