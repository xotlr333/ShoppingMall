<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="animalTop.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<title>회원가입</title>
<script type="text/javascript" src="js/animal.js">


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
     <input type="submit" value="중복확인" onclick="return idCheck()" class="btn-primary form-control">
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