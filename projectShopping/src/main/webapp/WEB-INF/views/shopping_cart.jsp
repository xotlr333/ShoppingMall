<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니</title>

<style type="text/css">

	table {width: 1200px; margin-left: auto; margin-right: auto;
				 font-size: 16pt; border-collapse: collapse;}
   				 
	th, td {border-bottom: 1px solid #BDBDBD; padding: 20px!important;}
	
	
	.bot1{ border-bottom: 1px solid #000000;}
	.bot2{ border-bottom: 0px;}
	
	.but1 {background-color: #000000; color: white!important;
		width: 250px; padding: 14px 20px; text-decoration: none!important;
		border-radius: 10px;}
	
	.button1{background-color: #000000; padding: 20px; font-size: 18pt;
			color: white;  width: 300px; border-color: #000000;}
	
</style>

<script type="text/javascript">
	function checkNull(){
		
		var t = document.getElementById("p_total").value;
		if(t=="" || t==null || t=="0"){
			alert("주문하실 상품이 없습니다");
			return false;}
		
		location.href='order.do'
	}

</script>

</head>
<body>
<jsp:include page="./shopping_top.jsp"></jsp:include>
<br>

<!-- 상품정보 -->
<div align="center">
<table class="productData">
<tr>
	<td class="bot1" colspan="4" align="left">
		<font style="font-size: 22pt;">주문상품 정보</font>
	</td>
</tr>
<tr>
	<td align="center">이미지</td>
	<td align="center">상품</td>
	<td align="center">주문금액</td>
	<td align="center">삭제</td>
</tr>
<c:forEach items="${cdto}" var="cdto">
<tr>
	<td align="center"><img alt="" src="${pageContext.request.contextPath}/resources/images/${cdto.img}" width="150"></td>
	<td align="center">
		${cdto.brand} <br>
		${cdto.color} / ${cdto.psize} <br>	
	</td>
	<td align="center"> <fmt:formatNumber value="${cdto.price}" type="number"/>원 </td>
	<td align="center">
		<a class="but1" href="cartDelete.do?c_code=${cdto.c_code}">삭제</a>
	</td>
</tr>
<tr>
	<td class="bot1" colspan="4" align="right">
		상품 
		<fmt:formatNumber value="${cdto.price}" type="number"/>원 + 
		배송 <fmt:formatNumber value="${cdto.delivery}" type="number"/>원 &nbsp;&nbsp;&nbsp; 
		주문금액 <fmt:formatNumber value="${cdto.price + cdto.delivery}" type="number"/>원</td>
</tr>
</c:forEach>
<tr>
	<td class="bot2" colspan="4" align="right">
		<font style="font-weight: bold;">총 결제금액</font>
		<font style="font-weight: bold; color: #DBA901; font-size: 20pt;"> <fmt:formatNumber value="${total}" type="number"/>원</font>
		<input type="hidden" id="p_total" value="${total}">
	</td>
</tr>

</table>
</div>

<!-- 주문하기 버튼 -->
<div align="center">
	<input type="button" class="button1" onClick="checkNull();" value="주문하기">
</div>

<br><br><br><br><br>

<jsp:include page="./shopping_footer.jsp"></jsp:include>

</body>
</html>