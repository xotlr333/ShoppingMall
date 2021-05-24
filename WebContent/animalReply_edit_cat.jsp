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

String writer = request.getParameter("writer");
String content = request.getParameter("content");
int code = Integer.parseInt(request.getParameter("code"));
int num = Integer.parseInt(request.getParameter("num"));

msg="update c_animal_reply set cr_writer=?, cr_content=? ,cr_date=sysdate where cr_num=?";
PST=CN.prepareStatement(msg);
	PST.setString(1, writer);
	PST.setString(2, content);
	PST.setInt(3, num);
	PST.executeUpdate();
	
System.out.println("댓글수정 성공");
response.sendRedirect("animalDetail_cat.jsp?idx="+code);

%>

</body>
</html>