<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.net.URLEncoder" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객문의 답글</title>

<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<style type="text/css">
	table {width: 1200px; margin-left: auto; margin-right: auto;
				 font-size: 16pt; border-collapse: collapse;}
   				 
	th, td {border-bottom: 1px solid #BDBDBD; padding: 20px;}
	
	input[type="text"]{width: 70%; font-size: 16pt; border: none;}
	.editwrite[type="text"]{border: 1px solid; height: 30px;}
	
	.bot1{ border-bottom: 1px solid #000000;}
	
	.but1 {background-color: #000000; color: white;
		width: 250px; padding: 14px 20px; text-decoration: none;
		border-radius: 10px;}
	.po1 {width: 1200px; margin-left: auto; margin-right: auto;}
</style>

<script type="text/javascript">

function Checknull(){
	var c = myform.r_content.value;
	
	if(c=="" || c==null){
		alert("내용을 입력해주세요");
		myform.r_content.focus();
		return false;
	}
	
	myform.submit();
	
}//end

function reEdit(r_code,r_content,code){
	$('#r_content'+r_code).html(
			"답글 수정 : <input type='text' name='r_content' class='editwrite' value=" + r_content + " size=10> "+
			"<input type='hidden' name='code' value='"+code+"' > "+
			"<input type='hidden' name='r_code' value='"+r_code+"' > "
			
	);
	
	$('#bt'+r_code).html(
		"<a class='but1' href='#' onclick='reEditSave();' style='font-size: 12pt; background-color: #424242;'>수정</a> " +
		"<a class='but1' href='qnadatail.do?code=" + code+ "' style='font-size: 12pt; background-color: #424242;'>취소</a>"
	);
	
}//end

function reEditSave(){
	myform2.submit();
}//end


</script>

</head>
<body>
<form name="myform2" action="qnaReplyEdit.do">
<div align="center">
<table>
<tr>
	<td class="bot1" colspan="3" align="left">
		<font style="font-size: 22pt;">답변</font>
	</td>
</tr>
<c:forEach items="${qrdto}" var="qrdto">
<tr>
	<td align="left" id="r_content${qrdto.r_code}"> ▶ ${qrdto.r_content} </td>
	<td align="right" width="200" id="bt${qrdto.r_code}">
	<c:if test="${idch eq 'admin'}">
		<a class="but1" href="qnaReplyDelete.do?code=${qrdto.code}&r_code=${qrdto.r_code}" style="font-size: 12pt;">삭제</a>
		<a class="but1" href="#" onclick="reEdit('${qrdto.r_code}','${qrdto.r_content}','${qrdto.code}');" style="font-size: 12pt;">수정</a>
	</c:if>
	</td>
</tr>
</c:forEach>
</table>
</div>
</form>

<br>
<c:if test="${idch eq 'admin'}">
<form name="myform" action="qnaReplyInsert.do">
<div align="center">
<table>
<tr>
	<td class="bot1" colspan="3" align="left">
		<input type="hidden" name="code" value="${qdto.code}">
		<font style="font-size: 18pt;">답변 작성</font>
	</td>
</tr>
<tr>
	<td align="left"> ▶ <input type="text" name="r_content" placeholder="답변입력란"> </td>
</tr>
</table>
</div>

<br><br>
<div class="po1" align="center">
<div align="right">
<a class="but1" href="#" onclick="Checknull();">등록</a> &nbsp;
</div>
</div>
</form>
</c:if>
<br><br><br>

</body>
</html>