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

  int code = Integer.parseInt(mr.getParameter("c_code"));
  String id = mr.getParameter("c_id");
  String title = mr.getParameter("c_title");
  String content = mr.getParameter("c_content");
  String animal_name = mr.getParameter("c_animal_name");
  String gender = mr.getParameter("c_gender");
  String file = mr.getFilesystemName("c_file_name");
	 
   msg="update c_animal set c_title=?, c_content=?, c_animal_name=?, c_gender=?, c_file_name=?, c_wdate=sysdate where c_code=?"; 
 
   PST=CN.prepareStatement(msg); 
   	PST.setString(1,title);
   	PST.setString(2,content);
   	PST.setString(3,animal_name);
   	PST.setString(4,gender);
   	PST.setString(5,file);
   	PST.setInt(6, code);
    PST.executeUpdate();
   
   System.out.println("수정완료");
   response.sendRedirect("animalList_cat.jsp"); 
 %>
</body>
</html>


















