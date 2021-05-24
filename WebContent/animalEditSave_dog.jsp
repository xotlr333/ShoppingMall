<%@ page language="java" contentType="text/html; charset=UTF-8"  %>
<%@ include file="ssi.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title></head>
<body>
 <%
 
 
 String path = application.getRealPath("download");
 System.out.println("경로" + path);

 int size = 1024*1024*4;
 DefaultFileRenamePolicy dr = new DefaultFileRenamePolicy();
 MultipartRequest mr = new MultipartRequest(request,path,size,"UTF-8");

  int code = Integer.parseInt(mr.getParameter("d_code"));
  String id = mr.getParameter("d_id");
  String title = mr.getParameter("d_title");
  String content = mr.getParameter("d_content");
  String animal_name = mr.getParameter("d_animal_name");
  String gender = mr.getParameter("d_gender");
  String file = mr.getFilesystemName("d_file_name");
	 
   msg="update d_animal set d_title=?, d_content=?, d_animal_name=?, d_gender=?, d_file_name=?, d_wdate=sysdate where d_code=?"; 
 
   PST=CN.prepareStatement(msg); 
   	PST.setString(1,title);
   	PST.setString(2,content);
   	PST.setString(3,animal_name);
   	PST.setString(4,gender);
   	PST.setString(5,file);
   	PST.setInt(6, code);
    PST.executeUpdate();
   
   System.out.println("수정완료");
   response.sendRedirect("animalList_dog.jsp"); 
 %>
</body>
</html>


















