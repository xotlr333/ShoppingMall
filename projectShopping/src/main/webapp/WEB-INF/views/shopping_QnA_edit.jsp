<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객문의 수정</title>

<style type="text/css">

	table {width: 1200px; margin-left: auto; margin-right: auto;
				 font-size: 16pt; border-collapse: collapse;}
   				 
	th, td {border-bottom: 1px solid #BDBDBD; padding: 20px!important;}
	
	input[type="text"]{width: 70%; font-size: 16pt; border: none;}
	textarea{font-size: 16pt;}
	
	.bot1{ border-bottom: 1px solid #000000;}
	.bot2{ border-bottom: 0px;}
	
	.button1{background-color: #000000; padding: 20px; font-size: 18pt;
			color: white;  width: 300px; border-color: #000000;}
			
	.but1 {background-color: #000000; color: white!important;
		width: 250px; padding: 14px 20px; text-decoration: none!important;
		border-radius: 10px;}
	.po1 {width: 1200px; margin-left: auto; margin-right: auto;}

</style>

<script type="text/javascript">
function Checknull(){
	var t = myform.title.value;
	var c = myform.content.value;
	
	if(t=="" || t==null){
		alert("제목을 입력해주세요");
		myform.title.focus();
		return false;
	}

	if(c=="" || c==null){
		alert("내용을 입력해주세요");
		myform.content.focus();
		return false;
	}
	
	myform.submit();
	
}//end
</script>

</head>
<body>

<jsp:include page="./shopping_top.jsp"></jsp:include>

<br><br>

<form name="myform" action="qnaedit.do">
<div align="center">
<table>
<tr>
	<td class="bot1" colspan="3" align="left">
		<input type="hidden" name="code" value="${qdto.code}">
		<font style="font-size: 22pt;">고객문의 수정</font>
	</td>
</tr>
<tr>
	<td width="200"  align="left">아이디</td>
	<td align="left">${qdto.userid} </td>
</tr>
<tr>
	<td align="left">제목</td>
	<td align="left"><input type="text" name="title" placeholder="제목입력란" value="${qdto.title}"> </td>
</tr>
<tr>
	<td class="bot1" align="left">내용</td>
	<td class="bot1" align="left"><textarea rows="20" cols="60" name="content">${qdto.content}</textarea> </td>
</tr>
</table>

</div>

<br><br>

<div class="po1" align="center">
<div align="right">
<a class="but1" href="#" onclick="Checknull();">수정</a> &nbsp;
<a class="but1" href="javascript:history.back();">취소</a>
</div>
</div>
</form>

<br><br><br><br><br>

<jsp:include page="./shopping_footer.jsp"></jsp:include>

</body>
</html>