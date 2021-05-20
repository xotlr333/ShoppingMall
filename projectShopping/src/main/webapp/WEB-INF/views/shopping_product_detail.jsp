<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 상세페이지</title>

<style type="text/css">
	table{width: 800px;}
	.cont1{padding: 20px; border-bottom: 1px solid #BDBDBD; border-top: 1px solid #BDBDBD;
			font-size: 18pt; font-weight: bold;}
	.cont2{padding-top: 20px;}
	
	.but1 {background-color: #000000; color: white!important;
		width: 250px; padding: 14px 20px; text-decoration: none!important;
		border-radius: 10px;}
	.po1 {width: 800px; margin-left: auto; margin-right: auto;}
</style>

<script type="text/javascript">
function Checknull1(){
	var c = myform.color.value;
	var s = myform.psize.value;
	
	if(c=="no"){
		alert("색상을 선택해주세요");
		myform.color.focus();
		return false;
	}
	
	if(s=="no"){
		alert("사이즈를 선택해주세요");
		myform.psize.focus();
		return false;
	}
	alert("상품이 장바구니에 저장되었습니다");
	myform.submit();
}//end

function Checknull2(){
	var c = myform.color.value;
	var s = myform.psize.value;
	var order_action = document.myform;
	
	if(c=="no"){
		alert("색상을 선택해주세요");
		myform.color.focus();
		return false;
	}
	
	if(s=="no"){
		alert("사이즈를 선택해주세요");
		myform.psize.focus();
		return false;
	}
	
	order_action.action = "orderDirect.do";
	alert("바로");
	myform.submit();
}//end

</script>

</head>
<body>

<jsp:include page="./shopping_top.jsp"></jsp:include>

<br><br>
<form name="myform" action="cartInsert.do">
<div align="center">
<table>
<tr>
	<td rowspan="7" align="center">
		<img alt="" src="${pageContext.request.contextPath}/resources/images/${pdto.img}" width="450">
		<input type="hidden" name="img" value="${pdto.img}">
		<input type="hidden" name="p_code" value="${pdto.code}">
	</td>
	<td>
		<font style="font-size: 10pt; font-weight: bold;"> ${pdto.brand}</font>
		<input type="hidden" name="brand" value="${pdto.brand}">
	</td>
</tr>
<tr>
	<td align="left">
		<font style="font-size: 25pt; font-weight: bold;">${pdto.title}</font>
		<input type="hidden" name="title" value="${pdto.title}">
	</td>
</tr>
<tr>
	<td align="left">
		<font style="font-size: 25pt; font-weight: bold;"><fmt:formatNumber value="${pdto.price}" type="number"/>원</font>
		<input type="hidden" name="price" value="${pdto.price}">
	</td>
</tr>
<tr>
	<td align="left">배송비 : <fmt:formatNumber value="${pdto.delivery}" type="number"/>원 
	<input type="hidden" name="delivery" value="${pdto.delivery}"></td>
	
</tr>
<tr>
	<td align="left">
		<select name="color">
			<option value="no">[색상]옵션을 선택하세요</option>
			<c:forEach items="${color}" var="color">
			<option value="${color}">${color}</option>
			</c:forEach>
		</select> 
	</td>
</tr>
<tr>
	<td align="left">
		<select name="psize">
			<option value="no">[사이즈]옵션을 선택하세요</option>
			<c:forEach items="${psize}" var="psize">
			<option value="${psize}">${psize}</option>
			</c:forEach>
		</select> 
	</td>
</tr>
<tr>
	<td>
		<a class="but1" href="#" onclick="Checknull1();" >장바구니</a> &nbsp; 
		<a class="but1" href="#" onclick="Checknull2();">바로구매</a><p>
	</td>
	
</tr>
<tr>
	<td class="cont1" align="center" colspan="2">
		상품정보
	</td>
</tr>
<tr>
	<td class="cont2" align="center" colspan="2">
	
		<img alt="" src="${pageContext.request.contextPath}/resources/images/${pdto.content}" width="700">
	</td>
</tr>
</table>
</div>
</form>

<br><br><br>
<div class="po1" align="center">
<div align="right">
<c:if test="${idch eq 'admin'}">
<a class="but1" href="productPreEdit.do?code=${pdto.code}">수정</a> &nbsp;
<a class="but1" href="productDelete.do?code=${pdto.code}">삭제</a> &nbsp;
</c:if>
<a class="but1" href="productList.do">목록</a> &nbsp; 
</div>
</div>

<br><br><br><br><br>

<jsp:include page="./shopping_footer.jsp"></jsp:include>

</body>
</html>