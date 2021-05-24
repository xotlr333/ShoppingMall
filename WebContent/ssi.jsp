<%@ page language="java" contentType="text/html; charset=UTF-8"  %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.oreilly.servlet.multipart.*" %>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>  </title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script></head>

</head>
<body>
 <%! //전역변수,전역함수
   //ssi.jsp문서는 단독실행가능합니다
   Connection CN; //DB서버연결정보,명령어생성할때 참조 
   Statement ST, ST3; //ST=CN.createStatement()
   PreparedStatement PST; //PST=CN.prepareStatment(sql)
   CallableStatement CS; //CS=CN.callableStatement(sql)
   ResultSet RS, RS3; //조회한결과를 RS기억  RS.next( )
 
   String msg, msg3, msg5; //msg="쿼리문기술"
   int code, aa; // 전화번호 
   String id, name, title, gender, animal_name,content ; //이름, 제목, 패스워드, 이메일, 주소
   String url, file, size;
   java.util.Date Gnalja; //날짜
   int Gtotal=27, Stotal=7, Rtotal=0; 
   int Rnum; // 댓글의 num필드기억
   int Rrn, no; // 댓글의 rownum필드기억
   String Rdata;
   boolean ok = false;
 %>
 
 <%
   try{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	String url="jdbc:oracle:thin:@127.0.0.1:1521:XE";
	CN=DriverManager.getConnection(url,"system", "1234");
	//System.out.println("db연결 성공했습니다 11-26-월요일 8시 43분 ");
   }catch(Exception ex){System.out.println("db에러:"+ex);}
 %>

 </body>
</html>


















