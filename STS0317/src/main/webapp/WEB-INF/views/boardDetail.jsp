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
 	 a{ font-size:20pt; font-weight: bold; text-decoration: none; }
 	 a:hover{ font-size:24pt;  text-decoration: underline; }
 </style>
</head>
<body>
	<h2>boardDetail.jsp</h2>
   	<table width=900 border=1 cellspacing=0>

   	  <tr>
   	  <td rowspan="5" align="center">
   	  	<a href="download.do?fname=${dto.img_file_name}&idx=${dto.hobby_idx}">
   	  		<img src ='${pageContext.request.contextPath}/resources/upload/${dto.img_file_name}' width="250" height="250"> 
   	  	</a>
   	  </td>
   	  <td>이름</td>
   	  <td>${dto.name}</td>
   	  </tr>
   	  <tr>
   	  	<td>제목</td>
   	    <td>${dto.title}</td>
   	  </tr>
   	  <tr>
   	  	<td>내용</td>
   	    <td>${dto.content}</td>
   	  </tr>
   	  <tr>
   	  	<td>성별</td>
   	    <td>${dto.gender}</td>
   	  </tr>
   	  <tr>
   	  	<td>취미</td>
   	    <td>${dto.hobby}</td>
   	  </tr>
   	 
   	</table>
   	<p>
   	<a href="index.jsp">[index]</a>
   	<a href="boardWrite.do">[글쓰기]</a>
   	<a href="boardList.do">[전체출력]</a>
   	<a href="boardDelete.do?idx=${dto.hobby_idx}">[삭제]</a>
   	<a href="boardPreEdit.do?idx=${dto.hobby_idx}">[수정]</a>
   	
<!-- 3월29일월요일 댓글시작 임포트 boardreply_list.do -->
     <c:import url="/boardreply_list.do"></c:import>
</body>
</html>



