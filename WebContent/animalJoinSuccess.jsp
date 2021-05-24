<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../ssi.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 성공</title>
<script type="text/javascript" src="script/animal.js">
</script>
</head>
<% 
request.setCharacterEncoding("UTF-8");
		
	String userid = request.getParameter("userid");
	String userpwd = request.getParameter("userpwd");
	String gender = request.getParameter("gender");
	String animal = request.getParameter("animal");
	int age =Integer.parseInt(request.getParameter("age"));
 
  
    String sql = "insert into animal values(?,?,?,?,?)";
    PST = CN.prepareStatement(sql);
    PST.setString(1, userid);
    PST.setString(2, userpwd);
    PST.setString(3, gender);
    PST.setString(4, animal);
    PST.setInt(5, age);
    
    boolean result = PST.executeUpdate() == 1;
	response.sendRedirect("animalJoinResult.jsp?result="+result);
%>

<body>
</body>
</html>