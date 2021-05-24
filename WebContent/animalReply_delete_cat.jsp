<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%

int code=Integer.parseInt(request.getParameter("idx"));
int num=Integer.parseInt(request.getParameter("num"));

msg="delete from c_animal_reply where cr_num=" + num;
ST=CN.createStatement();
ST.executeUpdate(msg);
response.sendRedirect("animalDetail_cat.jsp?idx="+code);

%>

</body>
</html>