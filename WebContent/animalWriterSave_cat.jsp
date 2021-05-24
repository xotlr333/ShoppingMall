<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./ssi.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>WriteSave_c.jsp</title>
</head>
<body>


<%
String path = application.getRealPath("download");
System.out.println("경로" + path);




int size = 1024*1024*4;
DefaultFileRenamePolicy dr = new DefaultFileRenamePolicy();
MultipartRequest mr = new MultipartRequest(request,path,size,"UTF-8");


 String id = (String)session.getAttribute("naver");
 String a = mr.getParameter("c_title");
 String b = mr.getParameter("c_content");
 String c = mr.getParameter("c_animal_name");
 String d = mr.getParameter("c_gender");
 String e = mr.getFilesystemName("c_file_name");

 out.println("id :" + id +"<br>");
 out.println("제목 :" + a +"<br>");
 out.println("내용 :" + b +"<br>");
 out.println("반려동물 이름  :" + c +"<br>");
 out.println("성별 :" + d +"<br>");
 out.println("파일 :" + e +"<br>");
 

  
 

 
 try{
	 msg="insert into c_animal values(?,?,?,?,?,?,sysdate,cat_seq.nextval,0)";
		PST=CN.prepareStatement(msg);
		 PST.setString(1,id);
		 PST.setString(2,a);
		 PST.setString(3,b);
		 PST.setString(4,c);
		 PST.setString(5,d);
		 PST.setString(6,e); 
		 PST.executeUpdate();
	 	
System.out.println("고양이 테이블 저장 성공");
}catch(Exception ex){System.out.println(" 고양이 테이블 등록에러" + ex);}
response.sendRedirect("animalList_cat.jsp");

%>

</body>
</html>