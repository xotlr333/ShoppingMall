<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
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
	boardWrite.jsp<br>
	<form method="post"   enctype="multipart/form-data"   action="boardInsert.do" >
      이름: <input type="text" name="name" value="dong"> <br>
      제목: <input type="text" name="title" value="summer"> <br>
      내용: <textarea rows="3" cols="20"  name="content"></textarea> <br>
      성별:
      <input type="radio" name="gender" value="man" checked>남자 
      <input type="radio" name="gender" value="woman">여자 <br>
      취미:
      <input type="checkbox" name="hobby" value="game">게임
      <input type="checkbox" name="hobby" value="study">공부
      <input type="checkbox" name="hobby" value="ski">스키
      <input type="checkbox" name="hobby" value="movie" checked>영화 <br>
      파일: <input type="file" name="upload_f"><p>
      <input type="submit" value="스프링hobby테이블저장">
      <input type="reset" value="입력취소">
  </form>

   	<p>
   	<a href="index.jsp">[index]</a>
   	<a href="home.do">[home]</a>
   	<a href="boardWrite.do">[글쓰기]</a>
   	<a href="boardList.do">[전체출력]</a>
</body>
</html>



