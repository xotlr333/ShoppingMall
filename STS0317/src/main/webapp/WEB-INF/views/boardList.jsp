<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <title> </title>
 <style type="text/css">
 	 *{ font-size:20pt; font-weight: bold; }
 	 a{ font-size:20pt; color: black;   font-weight: bold; text-decoration: none; }
 	 a:hover{ font-size:24pt; color: black; text-decoration: underline; }
 </style>
 
 <script type="text/javascript">
 
 	function myclear() {
 		search.sval.value="";
 		search.sval.focus();
	}
 
 </script>
</head>
<body>
	<h2>boardList.jsp</h2>
   	<table width=900 border=1 cellspacing=0>
   	  <tr>
   	  	<td colspan="7" align="right">총 갯수 : ${GGtotal}/${Gtotal}개</td>
   	  </tr>
   	  
   	  <tr style="background-color: yellow;">
   	    <td>번호</td> <td>이름</td>  <td>제목</td><td>내용</td> <td>성별</td> <td>취미</td> <td>이미지</td>
   	  </tr>
   	  <c:forEach var="dto" items="${LG}">
   	  <tr>
   	    <td>${dto.rn}</td>
   	    <td>${dto.name}</td>
   	    <td><a href="boardDetail.do?idx=${dto.hobby_idx}">${dto.title}</a> <c:if test="${dto.rcnt>0}"><font style="color: red;">[${dto.rcnt}]</font></c:if> </td>
   	    <td>${dto.content}</td>
   	    <td>${dto.gender}</td>
   	    <td>${dto.hobby}</td>
   	    <td align="center"><img src ='${pageContext.request.contextPath}/resources/upload/${dto.img_file_name}' width="100" height="50"> </td>
   	  </tr>
   	  </c:forEach>
   	  <tr>
   	  	<td colspan="7" align="center">
   	  		<c:if test="${startpage>10}"><a href="boardList.do?pagenum=${endpage-10}&skey=${skey}&sval=${sval}">[이전]</a></c:if>
   	  		<c:forEach var="i" begin="${startpage}" end="${endpage}" step="1">
   	  		<c:choose>
   	  			<c:when test="${pageNUM==i}"><font style="color: red; font-size: 30pt;">[${i}]</font></c:when>
   	  			<c:otherwise><a href="boardList.do?pagenum=${i}&skey=${skey}&sval=${sval}">[${i}]</a></c:otherwise>
   	  		</c:choose>
   	  			
   	  		</c:forEach>
   	  		<c:if test="${endpage<pagecount}"><a href="boardList.do?pagenum=${startpage+10}&skey=${skey}&sval=${sval}">[다음] </a></c:if>
   	  	</td>
   	  </tr>
   	  <tr>
   	  	<td colspan="7" align="center">
   	  		
   	  		<form name="search" action="boardList.do">
   	  		검색:
   	  		<select name="skey"  onchange="myclear();">
   	  			<option  value="title"   <c:if test="${skey=='title'}">selected="selected"</c:if> >제목</option>
   	  			<option  value="name" <c:if test="${skey=='name'}">selected="selected"</c:if> >이름</option>
   	  		</select>
   	  		<input type="text" name="sval" size="10" value="${sval}">
   	  		<input type="submit" value="검색">
   	  		</form>
   	  	</td>
   	  </tr>
   	  
   	 
   	</table>
   	<p>
   	<a href="index.jsp">[index]</a>
   	<a href="boardWrite.do">[글쓰기]</a>
   	<a href="login.do">[로그인]</a>
   	<a href="boardList.do">[전체출력]</a>
</body>
</html>



