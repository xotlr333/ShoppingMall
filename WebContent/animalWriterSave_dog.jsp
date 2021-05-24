<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./ssi.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>WriteSave_d.jsp</title>
</head>
<body>


<%
String path = application.getRealPath("download");
System.out.println("경로" + path);




int size = 1024*1024*4;
DefaultFileRenamePolicy dr = new DefaultFileRenamePolicy();
MultipartRequest mr = new MultipartRequest(request,path,size,"UTF-8");
String id = (String)session.getAttribute("naver");
 String a = mr.getParameter("d_title");
 String b = mr.getParameter("d_content");
 String c = mr.getParameter("d_animal_name");
 String d = mr.getParameter("d_gender");
 String e = mr.getFilesystemName("d_file_name");

 out.println("id :" + id +"<br>");
 out.println("제목 :" + a +"<br>");
 out.println("내용 :" + b +"<br>");
 out.println("반려동물 이름  :" + c +"<br>");
 out.println("성별 :" + d +"<br>");
 out.println("파일 :" + e +"<br>");
 
 
  
 

 
 try{
	 msg="insert into d_animal values(?,?,?,?,?,?,sysdate,dog_seq.nextval,0)";
		PST=CN.prepareStatement(msg);
		 PST.setString(1,id); 
		 PST.setString(2,a);
		 PST.setString(3,b);
		 PST.setString(4,c);
		 PST.setString(5,d);
		 PST.setString(6,e);
		 PST.executeUpdate();
	 	
System.out.println(" 강아지 테이블 저장 성공");
}catch(Exception ex){System.out.println(" 강아지테이블 등록에러" + ex);}
response.sendRedirect("animalList_dog.jsp");

%>

</body>
</html>