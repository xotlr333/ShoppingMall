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
   	  	<td colspan="7" align="right">총 갯수 : 개</td>
   	  </tr>
   	  
   	  <tr style="background-color: yellow;">
   	    <td>번호</td> <td>이름</td>  <td>제목</td><td>내용</td> <td>성별</td> <td>취미</td> <td>이미지</td>
   	  </tr>

   	</table>
   	<p>
   	<a href="index.jsp">[index]</a>
   	<a href="boardWrite.do">[글쓰기]</a>
   	<a href="login.do">[로그인]</a>
   	<a href="boardList.do">[전체출력]</a>
</body>
</html>



