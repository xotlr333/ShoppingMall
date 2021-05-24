<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 <%
    String disp = "";
    disp = (String)session.getAttribute("naver");
    if(disp==null || disp.equals("")){ 
 
    	System.out.println("로그인처리를 하셔야 합니다  top.jsp");
    	response.sendRedirect("animalLogin.jsp");
    }else{
     System.out.println(disp + " 로그인유저입니다  top.jsp" );    
    
  }
    %>
</body>
</html>