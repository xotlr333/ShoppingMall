<%@page import="javax.swing.text.Document"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<script type="text/javascript">

</script>
</head>
<body>
    <b><font size="4">아이디 중복체크</font></b>
    <hr size="1" width="460">
    <br>
    
    <% 
	String id=request.getParameter("id"); //입력한 아이디 가져오기
	
	String ck="select count(*) as cnt from animal where userid =?";
	PST=CN.prepareStatement(ck);
	PST.setString(1,id);
	RS=PST.executeQuery();
	RS.next();
	aa=RS.getInt("cnt");
	System.out.println(aa);
	
	if(aa==0)
	{%>	
		<script>
		alert("사용 가능한 아이디 입니다");
		self.close();
		</script>
	<%	
	}else{
	%>
		<script>
		alert("사용중인 아이디 입니다");
		self.close();
		</script>
	<%
	}
	%>
  
  	
    
</body>
</html>