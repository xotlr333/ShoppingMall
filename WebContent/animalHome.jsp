<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="animalTop.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript">
System.out.println("dd");
</script>
</head>

<body>

<table width=900 border=0 style="margin-left: auto; margin-right: auto;">
	<tr>
		<td>
			<div>
				<div style="float:left;">
				<a href="animalList_dog.jsp"><img alt="" src="images/dog1.jpg" height="300px"></a>
				<p align="center">강아지 게시판</p> 
				</div>
				
				<div style="float:left;">
				<a href="animalList_cat.jsp"><img alt="" src="images/cat1.jpg" height="300px"></a>
				<p align="center">고양이 게시판</p>
				</div>
			</div>
		</td>
	</tr>
	 
</table>

<p>
  <jsp:include page="animalbottom.jsp"></jsp:include>
</body>
</html>