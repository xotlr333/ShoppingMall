<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>animalReply.jsp</title>

<script type="text/javascript">
	var r_num;
	function r_edit(writer,content,num){
		r_num=num;
		reply_form.bt_save.value="댓글수정";
		reply_form.writer.value=writer;
		reply_form.content.value=content;
	}//end
	
	function button_submit(code){
		  var bt = reply_form.bt_save.value;
		  var writer = reply_form.writer.value;
		  var content = reply_form.content.value;
		
		   if(bt=="댓글등록"){
			  document.reply_form.action="animalReply_insert_dog.jsp?writer="+writer+"&content="+content+"&code="+code;
			  document.reply_form.method="post";
			  document.reply_form.submit();
			  return false;
		  }else if(bt=="댓글수정"){
			  reply_form.bt_save.value = "댓글등록";
			  document.reply_form.action="animalReply_edit_dog.jsp?writer="+writer+"&content="+content+"&code="+code+"&num="+r_num;
			  document.reply_form.method="post";
			  document.reply_form.submit();
			  return false;
		  }//if end 
	  }//end

</script>
</head>
<body>
<%! int Renum = 0; %>
<%
	Rdata = request.getParameter("idx");
%>

<table width=600 border=0 rules="rows" cellspacing=0 style="margin-left: auto; margin-right: auto;">
	<tr bgcolor="#FFBF00" style="color:#F3F781" align="center">
		<td colspan="4" height=50 style="font-size:16pt; font-weight:bold; border-radius: 0.5em;">댓글 목록</td>
	</tr>
	
	<tr><td><p></td></tr>
  <%
  try{
    Renum=0;
	String x="select rownum rn, c.d_code,r.dr_num,r.dr_writer,r.dr_content,r.dr_date from d_animal c ";
    String y=" inner join d_animal_reply r";
    String z=" on c.d_code=r.dr_code and r.dr_code="+Rdata+" order by dr_date";
    String msg=x+y+z;
    ST=CN.createStatement();
    RS=ST.executeQuery(msg);
	
    while(RS.next()==true){
    	Renum++;
    	Rrn = RS.getInt("rn");
    	Rnum=RS.getInt("dr_num");
    	String Rwriter=RS.getString("dr_writer");
    	String Rcontent=RS.getString("dr_content");
    	int Rcode=RS.getInt("d_code"); 
   %>
   
   <tr  >
    <td> [<%= Renum %>]</td>
    <td> <%= Rwriter %></td>
    <td> <%= Rcontent  %></td>
    <td align="right">
      <div style="font-size:16pt"><%= RS.getDate("dr_date")  %></div>
      <a class="btn btn-outline-warning" style="font-size:8pt;" href="animalReply_delete_dog.jsp?idx=<%=Rdata%>&num=<%=Rnum%>">댓글삭제</a>
      <a class="btn btn-outline-warning" style="font-size:8pt;" onclick="r_edit('<%=Rwriter %>','<%=Rcontent %>', '<%=Rnum%>')" href="#"  >댓글수정</a>
    </td>
   </tr>
   
   <%}//while end
  }catch(Exception e){System.out.println("댓글 오류" + e.toString());}   
   %>
</table>

<p>

<form name="reply_form" action="">
  <table width=600 border=0 cellspacing=0 style="margin-left: auto; margin-right: auto;">
    <tr bgcolor="#FFBF00" style="color:#F3F781" align="center">
		<td colspan="3" height=30 style="font-size:16pt; font-weight:bold;">댓글 작성</td>
	</tr>
    <tr>
      <td style="color:#FE9A2E; font-weight:bold; font-size: 16pt;">저자</td>
      <td><input type="text" name="writer" size=30> </td>
      <td rowspan=2 align="center"><input type="button"  onclick="button_submit('<%=Rdata %>');" 
      								class="btn btn-warning" name="bt_save" value="댓글등록" 
      								style=" color:#F3F781; font-size: 20pt;"> </td>
    </tr>
    <tr>
      <td style="color:#FE9A2E; font-weight:bold; font-size: 16pt;">내용</td>
      <td><textarea rows="3" cols="30" name="content"></textarea> </td>
    </tr>
  </table>
</form>

</body>
</html>