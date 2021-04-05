<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <title> </title>
 <style type="text/css">
 	 *{ font-size:18pt; font-weight: bold; }
 	 a{ font-size:18pt;  color:blue; font-weight: bold; text-decoration: none; }
 	 a:hover{ font-size:20pt;  text-decoration: underline; }
 </style>
 
</head>
<body>
 <font color=blue>[boardList.jsp]</font> <br>
    
 <table width=1000 border=1   cellspacing="0">
  	 <tr align="right" height=40>
  	 	<td colspan="6">
  	 	  <a href="index.jsp">[index.jsp]</a>
		  <a href="boardWrite.do">[신규등록]</a>
  	 	  레코드: 7/12 &nbsp;  
  	 	</td>
  	 </tr>
  
     <tr bgcolor=pink height=50>
      <td>번호</td> <td>이름</td>  <td>제목</td> 
      <td>성별</td> <td>취미</td>  <td>이미지</td> 
     </tr>
     
     
     	<c:forEach items="${list}" var="dto">
     	<tr>
     	<td>0</td>
     	<td>${dto.name}</td>
     	<td>${dto.title}</td>
     	<td>${dto.gender}</td>
     	<td>${dto.hobby}</td>
     	<td><img alt="" src="${pageContext.request.contextPath}/resources/upload/${dto.img_file_name}" width="100"> </td>
     	</tr>
     	</c:forEach>
     
     
</table>
	
   	<p>
   	<a href="index.jsp">[index]</a>
   	<a href="boardWrite.do">[글쓰기]</a>
   	<a href="boardList.do">[전체출력]</a>
</body>
</html>



