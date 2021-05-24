<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="animalTop.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<title>회원가입</title>
<script type="text/javascript">
var ok = false;
function idCheck() {
	var id = join.userid.value;
	
	if(!id) {
		alert("아이디를 입력하세요");
		join.userid.focus();
		return;
	}
	var url = "animalidCheck.jsp";
	window.open(url,"중복확인",
	"toolbar=no, menubar=no, scroolbars=yes, resizable=no,width=450, height=200"); 
    ok=true;
}

function joincheck() {
	if (document.join.userid.value.length == 0) {
		alert("아이디를 입력하세요");
		join.userid.focus();
		return false;
	}
	if (document.join.userpwd.value == "") {
		alert("비밀번호를 입력하세요.");
		join.userpwd.focus();
		return false;
	} 
	
	if (document.join.age.value == "") {
		alert("나이를 입력하세요.");
		join.userpwd.focus();
		return false;
	}
	
	if (ok == false) {
		alert("아이디 중복체크를 하세요");
		join.useridCheck.focus();
		return false;
	}
	
	document.join.submit();
}

</script>
</head>
<body>
<div class = "container">
<div class="col-lg-4"></div>
<div class="col-lg-4">
 
 <form name="join" action="animalJoinSuccess.jsp" method="post" align="center">
 
   <h2 style="color:#FACC2E; text-align:center;">회원가입</h2>
   
   <div class="form-group"> 
     <input type="text" name="userid" placeholder="아이디" class="form-control">
     <input type="button" name="useridCheck" value="중복확인" onclick="idCheck()" class="btn-primary form-control">
   </div>
  
   <div class="form-group">
     <input type="password" name="userpwd" placeholder="비밀번호" class="form-control"><p>
   </div>
   
   <div class="form-group">
    <input type="text" name="age" placeholder="나이" class="form-control">
   </div>
   
   <div class="form-group" style="text-align:center;">
     <label class="btn btn-primary">
       <input type="radio" name="animal" value="dog" checked="checked"> 강아지
     </label>
     <label class="btn btn-primary">
       <input type="radio" name="animal" value="cat"> 고양이
     </label>
   </div>
 
   <div class="form-group" style="text-align: center;">
     <label class="btn btn-primary ">
       <input type="radio" name="gender" autocomplete="off" value="man" checked="checked">남자 
     </label>
     <label class="btn btn-primary"> 
     <input type="radio" name="gender" autocomplete="off" value="woman" >여자 
     </label>
    </div>
   <div> 
   <input type="button" value="회원가입" onclick="joincheck()" class="btn-primary form-control">
   </div>
     <br>
     <div>
   <input type="button" value="취소" onclick="location.href='animalHome.jsp'" class="btn-primary form-control"> 
   </div>
   </div> 
</form>
</div>
</div>


</body>
</html>