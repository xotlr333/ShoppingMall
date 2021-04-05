<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<title> [board_reply.jsp]</title>

<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script type="text/javascript">
	//onclick="replyEdit('${rdto.rhobby_idx}', '${rdto.rwriter}', '${rdto.rmemo}', '${rdto.hobby_idx}');"
	function replyEdit(rhobby_idx, rwriter, rmemo, hobby_idx) {
		alert(rhobby_idx + " " + rwriter + " " + rmemo + " " + hobby_idx);
		$('#rwriter'+rhobby_idx).html(
			"<input type='text' id='edit_writer" + rhobby_idx + "' value=" + rwriter + " size=10 >"		
		);
		
		$('#rmemo'+rhobby_idx).html(
			"<input type='text' id='edit_memo" + rhobby_idx + "' value=" + rmemo + " size=10 >"		
		);
		
		$('#rbt'+rhobby_idx).html(
			"<input type='button' onclick='replyEditSave("+rhobby_idx+","+hobby_idx+")' id='btnEdit' value='댓글수정'>" +
			"<a href='boardDetail.do?idx="+hobby_idx+"'>[취소]</a>"
		);
	}//end
	
	function replyEditSave(rhobby_idx, hobby_idx) {
		var a = $('#edit_writer' + rhobby_idx).val()
		var b = $('#edit_memo' + rhobby_idx).val()
		location.href="boardreply_edit.do?rhobby_idx=" + rhobby_idx+"&rwriter="+a+"&rmemo="+b+"&hobby_idx="+hobby_idx;
	}//end
</script>
</head>
<body>

	<form method="get" action="boardreply_insert.do">
	<table width="1000" border="1" cellspacing="0" cellpadding="5" >
		&nbsp; hobby_idx값:${dto.hobby_idx} <input type="hidden" name="hobby_idx" value="${dto.hobby_idx}">
		<tr>
			<td>
			작성자:
			<input type="text" name="rwriter" size="20">
			<input type="submit" value="댓굴저장" style="height:25pt;">
			</td>
		</tr>
		<tr>
			<td>
			댓글메모:<textarea name="rmemo" rows="3" cols="60"></textarea>
			</td>
		</tr>
 
	</table>
	</form>
	
	<p>
	<!-- 댓글내용표시 -->
	<table width="1000" border="1" cellspacing="0" cellpadding="5">
		<tr>
			<td colspan=5>hobby댓글내용표시</td>
		</tr>
		<c:forEach var="rdto" items="${rLG}">
		<tr>
			<td width=60>${rdto.rrn}</td>
			<td width=60>${rdto.rhobby_idx}</td>
			<td width=100 id="rwriter${rdto.rhobby_idx}">${rdto.rwriter}</td>
			<td width=200 id="rmemo${rdto.rhobby_idx}">${rdto.rmemo}</td>
			<td width=200 id="rbt${rdto.rhobby_idx}">
				<input type="button" onclick="location.href='boardreply_delete.do?Ridx=${rdto.rhobby_idx}&idx=${dto.hobby_idx}'" value="삭제">
				<input type="button" onclick="replyEdit('${rdto.rhobby_idx}', '${rdto.rwriter}', '${rdto.rmemo}', '${rdto.hobby_idx}');" value="수정">
			</td>
		</tr>
		</c:forEach>
	</table>

<p><br><br><br>
</body>
</html>