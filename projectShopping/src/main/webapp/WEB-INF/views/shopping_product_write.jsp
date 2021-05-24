<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 올리기</title>

<style type="text/css">

	table {width: 1200px; margin-left: auto; margin-right: auto;
				 font-size: 16pt; border-collapse: collapse;}
   				 
	th, td {border-bottom: 1px solid #BDBDBD; padding: 20px!important;}
	
	input[type="text"]{width: 70%; font-size: 16pt; border: none;}
	textarea{font-size: 16pt;}
	
	.bot1{ border-bottom: 1px solid #000000;}
	.bot2{ border-bottom: 0px;}
	
	.button1{background-color: #000000; padding: 20px; font-size: 18pt;
			color: white;  width: 300px; border-color: #000000;}
			
	.but1 {background-color: #000000; color: white!important;
		width: 250px; padding: 14px 20px; text-decoration: none!important;
		border-radius: 10px;}
	.po1 {width: 1200px; margin-left: auto; margin-right: auto;}

</style>

<script type="text/javascript">
	function Checknull(){
		var t = myform.title.value;
		var c = myform.upload_f1.value;
		var b = myform.brand.value;
		var p = myform.price.value;
		var d = myform.delivery.value;
		var i = myform.upload_f2.value;
		
		
		if(b=="" || b==null){
			alert("브랜드를 입력해주세요");
			myform.brand.focus();
			return false;}
		
		if(t=="" || t==null){
			alert("제목을 입력해주세요");
			myform.title.focus();
			return false;}
		
		if(p=="" || p==null){
			alert("가격을 입력해주세요");
			myform.price.focus();
			return false;}
		
		if(d=="" || d==null){
			alert("배송비를 입력해주세요");
			myform.delivery.focus();
			return false;}
		
		if(i=="" || i==null){
			alert("상품이미지를 삽입해주세요");
			myform.img.focus();
			return false;}

		if(c=="" || c==null){
			alert("내용이미지를 삽입해주세요");
			myform.content.focus();
			return false;}
		
		myform.submit();
	}//end
	
	  function handleFileSelect1(){
			var files = document.getElementById('file1').files[0]; 
	   		var reader = new FileReader();  
	        reader.onload = (function(theFile) {
	          return function(e) {  
	          var img_view = ['<img src=', e.target.result + '  width="400" height="200"  alt="tis" />'].join('');
	              document.getElementById('preview1').innerHTML = img_view ;
	          };
	       })(files);
	     reader.readAsDataURL(files);    
	   }// end
	   
	function handleFileSelect2(){
		var files = document.getElementById('file2').files[0]; 
		var reader = new FileReader();  
		reader.onload = (function(theFile) {
		   return function(e) {  
		   var img_view = ['<img src=', e.target.result + '  width="400" height="200"  alt="tis" />'].join('');
		       document.getElementById('preview2').innerHTML = img_view ;
		   };
		})(files);
	 reader.readAsDataURL(files);    
	}// end
</script>

</head>
<body>

<jsp:include page="./shopping_top.jsp"></jsp:include>

<br><br>
<form method="post" name="myform" enctype="multipart/form-data" accept-charset="utf-8" action="productInsert.do">
<div align="center">
<table>
<tr>
	<td class="bot1" colspan="2" align="left">
		<font style="font-size: 22pt;">상품 등록</font>
	</td>
</tr>
<tr>
	<td width="200"  align="left">브랜드</td>
	<td align="left" colspan="2"><input type="text" name="brand" placeholder="브랜드입력란"> </td>
</tr>
<tr>
	<td align="left" >제목</td>
	<td align="left" ><input type="text" name="title" placeholder="제목입력란"> </td>
</tr>
<tr>
	<td align="left">가격</td>
	<td align="left"><input type="text" name="price" placeholder="가격입력란 예)12000"> </td>
</tr>
<tr>
	<td align="left">배송비</td>
	<td align="left"><input type="text" name="delivery" placeholder="배송비입력란 예)2500"> </td>
</tr>
<tr>
	<td align="left">색상</td>
	<td align="left"><input type="text" name="color" placeholder="색상입력란 예)blak,white,brown"> </td>
</tr>
<tr>
	<td align="left">사이즈</td>
	<td align="left"><input type="text" name="psize" placeholder="사이즈입력란 예)S,M,L"> </td>
</tr>
<tr>
	<td align="left">분류</td>
	<td align="left">
		<input type="radio" name="category" value="1" checked="checked">상의 
		<input type="radio" name="category" value="2">하의
		<input type="radio" name="category" value="3">아웃터
	</td>
</tr>
<tr>
	<td align="left">상품 이미지</td>
	<td align="left"><input type="file" id="file2" name="upload_f2" onchange="handleFileSelect2()"> </td>
</tr>
<tr>
	<td align="left">상품 미리보기</td>
	<td align="left"><div id="preview2"></div> </td>
</tr>
<tr>
	<td align="left">내용 파일</td>
	<td align="left"><input type="file" name="upload_f1" id="file1" onchange="handleFileSelect1()"> </td>
</tr>
<tr>
	<td class="bot1" align="left">내용 미리보기</td>
	<td class="bot1" align="left"><div id="preview1"></div> </td>
</tr>
</table>
</div>

<br><br>

<div class="po1" align="center">
<div align="right">
<a class="but1" href="#" onclick="Checknull();">등록</a>&nbsp;
<a class="but1" href="productList.do">취소</a>
</div>
</div>
</form>

<br><br><br><br><br>

<jsp:include page="./shopping_footer.jsp"></jsp:include>

</body>
</html>