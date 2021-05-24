<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ include file="ssi.jsp" %>
<%@ include file="animalTop.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 게시글 상세페이지</title>
  <style type="text/css">
    *{font-size:16pt; font-weight:bold;  font-family: "굴림" ;  }
    a{font-size:16pt; font-weight:bold;  text-decoration:none; }
    a:hover{font-size:16pt; font-weight:bold; text-decoration:underline; }
    .underliner{border-bottom : 1px solid black;}
    .topliner{border-top : 1px solid black;}   
    .det{ border-top: 1px solid #444444;border-collapse: collapse;border-bottom: 1px solid #444444;padding: 10px;}
                                
  </style>
 </head>
<body>
<%
  String data=request.getParameter("idx");
  msg="update c_animal set c_cnt=c_cnt+1 where c_code = " + data;   // 조회수 갱신
  ST=CN.createStatement( );
  ST.executeUpdate(msg);

  msg="select * from c_animal where c_code = " + data; // 상세 출력 위한 테이블 참조
  ST=CN.createStatement( );
  RS=ST.executeQuery(msg);
  RS.next(); 
  no = RS.getInt("c_code");
  file=RS.getString("c_file_name");
%>
 <div style="width:30%; float:left;">
 <table class="det" width=300  cellpadding=5 style="margin-left: auto; margin-right: auto;">
  <tr align="center" bgcolor="#F5DA81" >
    <th class="det"> 글쓴이 :  </th>
    <th class="det"> <%= RS.getString("c_id") %>님 </th>
  <tr>
  
  <tr align="center">
  	<td class="det" style="font-size:12pt;"> 고양이 이름 :</td>
  	<td class="det"> <%= RS.getString("c_animal_name") %> </td>
  </tr>
  
  <tr align="center">
  	<td class="det" style="font-size:12pt;"> 고양이 성별 : </td>
  	<td class="det"><%= RS.getString("c_gender") %> </td>
  </tr>
  
   <tr align="center">
  	<td class="det" style="font-size:12pt;"> 날     짜 :  </td>
  	<td class="det" style="font-size:14pt;">  <%= RS.getDate("c_wdate") %> </td>
  </tr>
  </table>
  </div>
  
  <div style="width:70%; float:left;">
  <table width=700  cellpadding=5 style="margin-left: auto; margin-right: auto; ">
  <tr align="center">
  	<td class="det"> 제 목: <%= RS.getString("c_title") %> </td>
  </tr>
  
  <tr align="center">
  	<td class="det" bgcolor=white  align="center" width=350 height=200 style="padding:0px;"> 
  		<img src="./download/<%=file %>" width=700 height=200> 
  	</td>
  </tr>
  
  
  <tr>
  	<td class="det" height=250><%= RS.getString("c_content") %> </td>
  </tr>
  </table>
  </div>
  
  <p><br><br><br>
  <table width=500 border=0 cellspacing=0 cellpadding=5 style="margin-left: auto; margin-right: auto;">
  <tr align="center">
   <td >
       <a class="btn btn-outline-warning" href="animalIndex.jsp">index</a>
       <a class="btn btn-outline-warning" href="animalEdit_cat.jsp?idx=<%=no%>">수정</a>
  	   <a class="btn btn-outline-warning" href="animalDeleteSave_cat.jsp?idx=<%=no%>">삭제</a>
  	   <a class="btn btn-outline-warning" href="animalList_cat.jsp">목록</a>
   </td>
  </tr>
 </table>
    
<P>    
<%-- 댓글 추가시 갱신! --%>
<jsp:include page="animalReply_cat.jsp">
    <jsp:param  name="idx" value="<%=no%>" />
 </jsp:include>

</body>
</html>