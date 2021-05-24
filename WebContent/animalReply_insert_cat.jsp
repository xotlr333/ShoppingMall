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
try{
String writer=request.getParameter("writer");
String content=request.getParameter("content");
int code=Integer.parseInt(request.getParameter("code"));
msg="insert into c_animal_reply values(c_seq_re.nextval,?,?,sysdate,?)";
PST=CN.prepareStatement(msg);
	PST.setString(1, writer);
	PST.setString(2, content);
	PST.setInt(3, code);
	PST.executeUpdate();
	System.out.println("댓글저장 성공했습니다");
	response.sendRedirect("animalDetail_cat.jsp?idx="+code);
}catch(Exception e){}
%>

</body>
</html>