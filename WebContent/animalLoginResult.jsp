<%@ page language="java" contentType="text/html; charset=UTF-8"   %>
<%@ include file="ssi.jsp" %>

<!DOCTYPE html>
<html> <head>
<title> [loginList.jsp]</title>
   <style type="text/css">
	 
   </style>
</head>
<body>
<%
   String a = request.getParameter("userid");
   String b = request.getParameter("userpwd");
  try{
   msg="select count(*) as cnt from animal where userid =? and userpwd =? ";
   PST=CN.prepareStatement(msg);
   		PST.setString(1, a);
   		PST.setString(2, b);
   RS=PST.executeQuery();
  
 if(RS.next()==true){ Gtotal=RS.getInt("cnt"); }
 if( Gtotal>0){	 
	 session.setAttribute("naver", a);
	 System.out.println(a+"님 로그인 되셨습니다 \n");
  }else{
  	System.out.println("로그인을 다시 해주세요\n");
  	session.setAttribute("", a);
  	session.removeAttribute("naver");
  }
 
  response.sendRedirect("animalHome.jsp");
  
  }catch(Exception ex){ System.out.println("로그인 에러");}
  %>
</body>
</html>