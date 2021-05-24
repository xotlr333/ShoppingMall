<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나의페이지</title>

<style type="text/css">

	table {width: 1200px; margin-left: auto; margin-right: auto;
				 font-size: 16pt; border-collapse: collapse;}
   				 
	th, td {border-bottom: 1px solid #BDBDBD; padding: 20px!important;}
	
	
	.bot1{ border-bottom: 1px solid #000000;}
	.bot2{ border-bottom: 0px;}
	.bot3{ border-bottom: 0px; border-top: 1px solid #000000; }
	.top1{ border-top: 1px solid #000000;}
	
	.but1 {background-color: #000000; color: white!important;
		width: 250px; padding: 14px 20px; text-decoration: none!important;
		border-radius: 10px;}
	.po1 {width: 1200px; margin-left: auto; margin-right: auto;}
	
	.button1{background-color: #000000; padding: 20px; font-size: 18pt;
			color: white;  width: 300px; border-color: #000000;}
			
	.writebt {background-color: #000000; color: white!important;
		width: 250px; padding: 14px 20px; text-decoration: none!important;
		border-radius: 10px;}
	
</style>

<script type="text/javascript">

function myEdit(e_pwd,e_name,e_email,e_phone,e_code){
	$('#e_u_pwd').html(
			"<input type='text' name='pwd' value=" + e_pwd + " size=30> "+
			"<input type='hidden' name='code' value="+e_code+">"
			
	);
	$('#e_u_name').html(
			"<input type='text' name='name' value=" + e_name + " size=30> "
			
	);
	$('#e_u_email').html(
			"<input type='text' name='email' value=" + e_email + " size=30> "
			
	);
	$('#e_u_phone').html(
			"<input type='text' name='phone' value=" + e_phone + " size=30> "
			
	);
	
 	$('#e_bt').html(
		"<a class='but1' href='#' onclick='mySubmit();' style='font-size: 12pt; background-color: #424242;'>수정</a> " +
		"<a class='but1' href='mypage.do' style='font-size: 12pt; background-color: #424242;'>취소</a>"
	); 
	
}//end

function mySubmit(){
	myform.submit();
}//end

</script>


</head>
<body>

<jsp:include page="./shopping_top.jsp"></jsp:include>

<br><br>

<!-- 고객정보 -->
<form name="myform" action="mypageEdit.do">
<div align="center">
<table>
<tr>
	<td class="bot1" colspan="3" align="left">
		<font style="font-size: 22pt;">고객 정보</font>
	</td>
</tr>
<tr>
	<td width="200"  align="left">아이디</td>
	<td align="left">
		${udto.userid}
	</td>
</tr>
<tr>
	<td width="200"  align="left">비밀번호</td>
	<td align="left" id="e_u_pwd">
		${udto.pwd}
	</td>
</tr>
<tr>
	<td width="200"  align="left">이름</td>
	<td align="left" id="e_u_name">
		${udto.name}
	</td>
</tr>
<tr>
	<td width="200"  align="left" >이메일</td>
	<td align="left" id="e_u_email">
		${udto.email}
	</td>
</tr>
<tr>
	<td align="left">휴대폰</td>
	<td align="left" id="e_u_phone">
		${udto.phone}
	</td>
</tr>
<tr>
	<td class="bot1" width="200"  align="left">생일</td>
	<td class="bot1" align="left">
		${udto.birth_y}년 ${udto.birth_m}월 ${udto.birth_d}일
		<input type="hidden" name="birt_y" value="${udto.birth_y}">  
		<input type="hidden" name="birth_m" value="${udto.birth_m}">
		<input type="hidden" name="birth_d" value="${udto.birth_d}">
	</td>
</tr>
</table>
</div>
<br><br><br>

<div class="po1" align="center">
<div align="right" id="e_bt">
<a class="but1" href="#" onclick="myEdit('${udto.pwd}','${udto.name}','${udto.email}','${udto.phone}','${udto.code}');" >수정</a>
</div>
</div>
<br><br><br>
</form>

<!-- 주문내역 -->
<div align="center">
<table class="productData">
<tr>
	<td class="bot1" colspan="3" align="left">
		<font style="font-size: 22pt;">주문 내역</font>
	</td>
</tr>
<c:if test="${o_count!=0}">
<c:forEach var="L" begin="0" end="${o_count-1}">
<c:set var="b" value="r_p_brand${L}"/>
<c:set var="t" value="r_p_title${L}"/>
<c:set var="c" value="r_p_color${L}"/>
<c:set var="s" value="r_p_psize${L}"/>
<c:set var="l" value="p_length${L}"/>
<c:set var="i" value="r_p_img_name${L}"/>
<c:set var="p" value="r_p_price${L}"/>
<c:set var="d" value="r_p_delivery${L}"/>
<c:set var="to" value="totalprice${L}"/>
<c:set var="w" value="wdate${L}"/>
<c:set var="co" value="o_code${L}"/>
<tr class="top1">
	<td align="center">이미지</td>
	<td align="center">상품</td>
	<td align="center">주문금액</td>
</tr>
<c:forEach var="e" begin="0" end="${requestScope[l]-1}">
<tr>
	<td align="center"><img alt="" src="${pageContext.request.contextPath}/resources/images/${requestScope[i][e]}" width="150"></td>
	<td align="center">
		${requestScope[b][e]} <br>
		${requestScope[t][e]} <br>
		${requestScope[c][e]} / ${requestScope[s][e]}  <br>	
	</td>
	<td align="center">
		상품 : <fmt:formatNumber value="${requestScope[p][e]}" type="number"/>원 <br>
		배송비 : <fmt:formatNumber value="${requestScope[d][e]}" type="number"/>원
	 </td>
</tr>
</c:forEach>
<tr>
	<td class="bot3" colspan="3" align="right">
		<a class="writebt" href="orderDelete.do?code=${requestScope[co]}">내역삭제</a> &nbsp; &nbsp;
		주문날짜 : <fmt:formatDate value="${requestScope[w]}" pattern="yyyy-MM-dd"/> &nbsp;&nbsp;&nbsp;&nbsp;
		<font style="font-weight: bold;">총 결제금액</font>
		<font style="font-weight: bold; color: #DBA901; font-size: 20pt;"> <fmt:formatNumber value="${requestScope[to]}" type="number"/>원</font>
	</td>
</tr>
</c:forEach>
</c:if>
<c:if test="${o_count==0}">
<tr>
	<td align="center">
		주문내역이 없습니다.
	</td>
</tr>
</c:if>
</table>
</div>

<br><br><br><br><br>

<jsp:include page="./shopping_footer.jsp"></jsp:include>
</body>
</html>