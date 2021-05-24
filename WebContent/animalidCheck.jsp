<%@page import="javax.swing.text.Document"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<script type="text/javascript">
 	function send(){
 		idCheck.idinput.value=window.opener.join.userid.value;
 	}
 </script>
</head>
<body onload="send();">
    <b><font size="4">아이디 중복체크</font></b>
    <hr size="1" width="460">
    <br>
	
	<form name="idCheck" method=post action="animalidCheckSave.jsp">
         <input type="text" name="idinput" id="new_id" >
         <input type="submit" value="중복확인">
    <br>
    <input type="reset" value="취소" ><br>
    </form>
  
    
</body>
</html>