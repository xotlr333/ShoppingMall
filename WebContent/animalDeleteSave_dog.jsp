<%@ page language="java" contentType="text/html; charset=UTF-8"  %>
<%@ include file="ssi.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title></head>
<body>
 <%
   int idx = Integer.parseInt(request.getParameter("idx"));
   msg="delete from d_animal where d_code="+idx;
   ST=CN.createStatement();
   ST.executeUpdate(msg);
   System.out.println(idx+ " 번 데이터 삭제 성공했습니다 ");
   response.sendRedirect("animalList_dog.jsp"); //현재화면보이지않고 바로 이동
 %>
</body>
</html>
