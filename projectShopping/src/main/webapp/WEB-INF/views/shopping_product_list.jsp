<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.net.URLEncoder" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품</title>

<style type="text/css">
	table{width: 800px;}
	tr td {padding: 10px!important;}
	
	.but1{text-decoration: none!important; color: black!important;}
	
	.pageingbt1{font-size: 10pt; border: 1px solid #000000; padding: 3px 5px;
				text-decoration: none!important; color: black!important; border-radius: 3px;}
	.pageingbt1:hover { background-color: #BDBDBD}
	
	.pageingbt2{font-size: 10pt; border: 1px solid #000000; padding: 3px 5px;
				text-decoration: none!important; border-radius: 3px;
				background-color: #1C1C1C; color: white!important;}
				
	.po1 {width: 800px; margin-left: auto; margin-right: auto;}
	
	.writebt {background-color: #000000; color: white!important;
		width: 250px; padding: 14px 20px; text-decoration: none!important;
		border-radius: 10px;}
	
</style>

<script type="text/javascript">
	function changeval(){
		myform.sval.value = "";
	}
</script>

</head>
<body>
<jsp:include page="./shopping_top.jsp"></jsp:include>

<br><br>

<div align="center">
<table>
<tr>
	<td class="bot1" colspan="4" align="center">
		<font style="font-size: 22pt;">카테고리</font>
	</td>
</tr>
<tr>
	<td colspan="4" align="right">
		<font style="font-size: 10pt;">
			<a class="but1" href="productList.do?categ=recent&pcategory=${pcategory}">
				<c:if test="${categ=='recent'}"><font style="font-size: 12pt; font-weight: bold;"></c:if>
				최신순
				<c:if test="${categ=='recent'}"></font></c:if>
			</a> &nbsp;|&nbsp;
			<a class="but1" href="productList.do?categ=priceL&pcategory=${pcategory}">
				<c:if test="${categ=='priceL'}"><font style="font-size: 12pt; font-weight: bold;"></c:if>
				낮은가격순
				<c:if test="${categ=='priceL'}"></font></c:if>
			</a> &nbsp;|&nbsp; 
			<a class="but1" href="productList.do?categ=priceH&pcategory=${pcategory}">
				<c:if test="${categ=='priceH'}"><font style="font-size: 12pt; font-weight: bold;"></c:if>
				높은가격순
				<c:if test="${categ=='priceH'}"></font></c:if>
			</a>
		</font>
	</td>
</tr>
<tr>
<c:forEach items="${pdto}" var="pdto">
	<td width="200"><a class="but1" href="productDetail.do?code=${pdto.code}">
		<img alt="" src="./resources/images/${pdto.img}" width="180" height="200"> <br>
		${pdto.brand} <br>
		${pdto.title} <br>
		<fmt:formatNumber value="${pdto.price}" type="number"/></a>
	</td>
	<c:if test="${pdto.rn%4==0}"></tr><tr></c:if>
</c:forEach>
</tr>
</table>
</div>
<br>

<!-- 페이징 -->
<div align="center">
<c:if test="${startpage>10}"><a class="pageingbt1" href="productList.do?pageNUM=${startpage-1}&categ=${categ}&pcategory=${pcategory}">이전</a>&nbsp;</c:if>
<c:forEach var="i" begin="${startpage}" end="${endpage}" step="1">
<c:choose>
<c:when test="${pagenum==i}"><a class="pageingbt2" href="productList.do?pageNUM=${i}&categ=${categ}&pcategory=${pcategory}">${i}</a> &nbsp;</c:when>
<c:otherwise><a class="pageingbt1" href="productList.do?pageNUM=${i}&categ=${categ}&pcategory=${pcategory}">${i}</a> &nbsp;</c:otherwise>
</c:choose>
</c:forEach>
<c:if test="${endpage<pagecount}" ><a class="pageingbt1" href="productList.do?pageNUM=${startpage+10}&categ=${categ}&pcategory=${pcategory}">다음</a></c:if>
</div>
<br>

<div class="po1" align="center">
<c:if test="${idch eq 'admin'}">
<div align="right">
<a class="writebt" href="productWrite.do">글쓰기</a>
</div>
</c:if>
</div>

<br><br><br><br><br>

<jsp:include page="./shopping_footer.jsp"></jsp:include>

</body>
</html>