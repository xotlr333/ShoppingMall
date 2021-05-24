<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>main</title>

<style type="text/css">
	
	table {width: 800px; margin-left: auto; margin-right: auto;
				 font-size: 16pt; border-collapse: collapse;}
   				 
	th, td {border-bottom: 1px solid #BDBDBD; padding: 20px!important;}
	input[type="text"]{height: 35px;}
	
	.bot1{ border-bottom: 1px solid #000000;}
	.bot2{ border-bottom: 0px;}
	
	.but1 {background-color: #000000; color: white!important;
		width: 150px; padding: 14px 20px; text-decoration: none!important;
		border-radius: 10px; border-color: #000000;}
	
	.po1 {width: 800px; margin-left: auto; margin-right: auto;}
</style>

<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="resources/home.js/signup.js"></script> 
  
</head>
<body>
<jsp:include page="./shopping_top.jsp"></jsp:include>
 
 <form action="signupinsert.do" method="post">
		<div id="sign" align="left">

			<div id="signinformation">
			<table>
				<tr>
					<td class="bot1" colspan="2" align="left">회원가입</td>
				</tr>
				<tr>
					<td>아이디</td>
					<td><input type="text" name="userid" id="userid"><br>
					<div id="msgid"></div></td>
				</tr>
				<tr>
					<td>이름</td>
					<td><input type="text" name="name" id="name"><br>
					<div id="msgid"></div></td>
				</tr>
				<tr>
					<td>이메일</td>
					<td><input type="email" name="email" id="email"><br>
					<div id="msgemail"></div></td>
				</tr>
				<tr>
					<td>비밀번호</td> 
					<td><input type="password" name="pwd" id="pwd"></td>
				</tr>
				<tr>
					<td>비밀번호재확인</td>
					<td><input type="password" name="pwd1" id="pwd1"><br>
					<div id="msgpwd"></div></td>
				</tr>
				<tr>
					<td>휴대폰번호</td> 
					<td><input type="tel" name="phone" id="phone"><br>
					<div id="msgphone"></div></td>
				</tr>
				<tr>
					<td>생년월일</td> 
					<td><select name="birth_y">
							<option>년도</option>
							<c:forEach var="i" begin="1960" end="2007">
								<option value="${i}"> ${i} </option>
							</c:forEach>
							
					</select> <select name="birth_m">
							<option>월</option>
							<c:forEach var="i" begin="1" end="12">
								<option value="${i}"> ${i} </option>
							</c:forEach>
							
					</select> <select name="birth_d">
							<option>일</option>
							<c:forEach var="i" begin="1" end="31">
								<option value="${i}"> ${i} </option>
							</c:forEach>
							
	
					</select></td>
				</tr>
				</table>
			</div>
			<br><br><br>
			<div id="signcheck">
				<table>
					<tr>
						<td colspan="2"><input type="checkbox" id="checkall"
							name="checkall">약관모두 동의</td>
					</tr>
					<tr>
						<td><input type="checkbox" required id="check1" name="check1"
							value="1">만 14세 이상입니다(필수)</td>
						<td><a href="#">내용보기</a></td>
					</tr>
					<tr>
						<td><input type="checkbox" required id="check2" name="check2"
							value="2">하이버 약관 동의(필수)</td>
						<td><a href="#">내용보기</a></td>
					</tr>
					<tr>
						<td><input type="checkbox" id="check3" name="check3"
							value="3">개인정보수집 및 이용에 대한 안내(필수)</td>
						<td><a href="#">내용보기</a></td>
					</tr>
					<tr>
						<td><input type="checkbox" id="check4" name="check4"
							value="4">이벤트/마케팅 수신 동의(선택)</td>
						<td><a href="#">내용보기</a></td>
					</tr>
					<tr>
						<td  class="bot1"><input type="checkbox" id="check5" name="check5"
							value="5">야간 혜택 알림 수신 동의(선택)</td>
						<td  class="bot1"><a href="#">내용보기</a></td>
					</tr>
				</table>
				<br>
				<div class="po1" align="center">
				<div align="right">
				<input class="but1" type="submit" id="submit" value="가입하기">
				</div>
				</div>
			</div>
		</div>
	</form>
	
	<br><br>
  <jsp:include page="./shopping_footer.jsp"></jsp:include>   
     
  




</body>
</html>