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
	boardEdit.jsp<br>
	<form method="post"   enctype="multipart/form-data"   action="boardEdit.do" >
      이름: <input type="text" name="name" value="${dto.name}"> <br>
      제목: <input type="text" name="title" value="${dto.title}"> <br>
      내용: <textarea rows="3" cols="20"  name="content">${dto.content}</textarea> <br>
      성별:
      <input type="radio" name="gender" value="man"  >남자
      <input type="radio" name="gender" value="woman"  >여자 [수정전:${dto.gender}]<br>
      취미:
      <input type="checkbox" name="hobby" value="game" >게임
      <input type="checkbox" name="hobby" value="study">공부
      <input type="checkbox" name="hobby" value="ski">스키
      <input type="checkbox" name="hobby" value="movie" checked>영화 [수정전:${dto.hobby}] <br>
      파일: <input type="file" name="upload_f"><p>
      <input type="submit" value="스프링hobby테이블저장">
      <input type="reset" value="입력취소">
      <input type="hidden" name="hobby_idx" value="${dto.hobby_idx}">
  </form>

   	<p>
   	<a href="index.jsp">[index]</a>
   	<a href="home.do">[home]</a>
   	<a href="boardWrite.do">[글쓰기]</a>
   	<a href="boardList.do">[전체출력]</a>
</body>
</html>



