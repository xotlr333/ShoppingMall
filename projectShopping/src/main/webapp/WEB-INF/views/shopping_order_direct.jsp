<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>바로주문하기</title>

<style type="text/css">

	table {width: 1200px; margin-left: auto; margin-right: auto;
				 font-size: 16pt; border-collapse: collapse;}
   				 
	th, td {border-bottom: 1px solid #BDBDBD; padding: 20px!important;}
	
	input[type=text] {height: 30px;}
	
	.bot1{ border-bottom: 1px solid #000000;}
	.bot2{ border-bottom: 0px;}
	
	.button1{background-color: #000000; padding: 20px; font-size: 18pt;
			color: white;  width: 300px; border-color: #000000;}
	
</style>

<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
	//주소가져오기
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                
                var roadAddr = data.roadAddress; 
                var extraRoadAddr = ''; 

                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
               
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                document.getElementById('sample4_postcode').value = data.zonecode;
                document.getElementById("sample4_roadAddress").value = roadAddr;
            
                var guideTextBox = document.getElementById("guide");
             
            }
        }).open();
    }
    
    //체크박스 한번에 체크하기
    function cAll() {
        if ($("#checkAll").is(':checked')) {
            $("input[type=checkbox]").prop("checked", true);
        } else {
            $("input[type=checkbox]").prop("checked", false);
        }
    }
    
    //널체크
	function Checknull(){
		
		var n = myform.u_name.value;
		var p = myform.u_phone.value;
		var e = myform.u_email.value;
		var r = myform.u_recipient.value;
		var rp = myform.u_recipient_phone.value;
		var a = myform.u_postcode.value;
		var ad = myform.u_detailAddress.value;
		var m = myform.u_memo.value;
		var pm = document.getElementsByName('payMethod');
		var pm_ch = null;
		var ra = myform.u_roadAddress.value;
		var tp = myform.p_totalprice.value;
		
		if(n=="" || n==null){
			alert("주문자 이름을 입력해주세요");
			myform.u_name.focus();
			return false;}
		
		if(p=="" || p==null){
			alert("주문자 휴대폰 번호를 입력해주세요");
			myform.u_phone.focus();
			return false;}
		
		if(e=="" || e==null){
			alert("주문자 이메일을 입력해주세요");
			myform.u_email.focus();
			return false;}
		
		if(r=="" || r==null){
			alert("수령인을 입력해주세요");
			myform.u_recipient.focus();
			return false;}
		
		if(rp=="" || rp==null){
			alert("수령인 휴대폰 번호를 입력해주세요");
			myform.u_recipient_phone.focus();
			return false;}

		if(a=="" || a==null){
			alert("주소를 삽입해주세요");
			myform.u_postcode.focus();
			return false;}
		
		if(ad=="" || ad==null){
			alert("상세주소를 입력해주세요");
			myform.u_detailAddress.focus();
			return false;}
		
		if(m=="" || m==null){
			alert("배송메모를 입력해주세요");
			myform.u_memo.focus();
			return false;}

		for(var i=0;i<pm.length;i++){
			if(pm[i].checked == true){ 
				pm_ch = pm[i].value;
			}
		}
		if(pm_ch == null){
            alert("결제수단을 선택하세요."); 
			return false;
		}

		if($("#check1").is(':checked')){}
		else{alert("약관동의 체크해주세요");return false;}
		if($("#check2").is(':checked')){}
		else{alert("약관동의 체크해주세요");return false;}
		if($("#check3").is(':checked')){}
		else{alert("약관동의 체크해주세요");return false;}
		
		
		alert("수령인 : " + r + "\n"
			+"주소 :" + ra + "\n"
			+"결제수단 : " + pm_ch + "\n"
			+"총금액 : " + tp + "원 \n"
			+"주문이 완료되었습니다.\n감사합니다.")
		
		myform.submit();
	}//end
</script>


</head>
<body>

<jsp:include page="./shopping_top.jsp"></jsp:include>

<br><br>

<!-- 상품정보 -->
<form name="myform" action="orderInsert.do">
<div align="center">
<table class="productData">
<tr>
	<td class="bot1" colspan="3" align="left">
		<font style="font-size: 22pt;">주문상품 정보</font>
	</td>
</tr>
<tr>
	<td align="center">이미지</td>
	<td align="center">상품</td>
	<td align="center">주문금액</td>
</tr>
<tr>
	<td align="center"><img alt="" src="${pageContext.request.contextPath}/resources/images/${img}" width="150">
		<input type="hidden" name="p_img_name" value="${img}">
		<input type="hidden" name="c_code" value="0"></td>
	<td align="center">
		${brand} <input type="hidden" name="p_brand" value="${brand}"><br>
		${title} <input type="hidden" name="p_title" value="${title}"><br>
		${color} / ${psize} <input type="hidden" name="p_color" value="${color}"> <input type="hidden" name="p_psize" value="${psize}"><br>	
	</td>
	<td align="center"> <fmt:formatNumber value="${price}" type="number"/>원 </td>
</tr>
<tr>
	<td class="bot1" colspan="3" align="right">
		상품 
		<fmt:formatNumber value="${price}" type="number"/>원 + 
		배송 <fmt:formatNumber value="${delivery}" type="number"/>원 &nbsp;&nbsp;&nbsp; 
		주문금액 <fmt:formatNumber value="${price + delivery}" type="number"/>원
		<input type="hidden" name="p_price" value="${price}">
		<input type="hidden" name="p_delivery" value="${delivery}">
	</td>	
</tr>
<tr>
	<td class="bot2" colspan="3" align="right">
		<font style="font-weight: bold;">총 결제금액</font>
		<font style="font-weight: bold; color: #DBA901; font-size: 20pt;"> <fmt:formatNumber value="${price + delivery}" type="number"/>원</font>
		<input type="hidden" name="p_totalprice" value="${price + delivery}">
	</td>
</tr>

</table>
</div>

<!-- 주문자정보 -->
<div align="center">
<table>
<tr>
	<td class="bot1" colspan="3" align="left">
		<font style="font-size: 22pt;">주문자 정보</font>
	</td>
</tr>
<tr>
	<td width="200"  align="left">이름</td>
	<td align="left"><input type="text" name="u_name" value="${udto.name}">  </td>
</tr>
<tr>
	<td align="left">휴대폰</td>
	<td align="left"><input type="text" name="u_phone" value="${udto.phone}"> </td>
</tr>
<tr>
	<td class="bot1" align="left">이메일</td>
	<td class="bot1" align="left"><input type="text" name="u_email" value="${udto.email}"></td>
</tr>
</table>
</div>

<br><br><br>

<!-- 배송지정보 -->
<div align="center">
<table>
<tr>
	<td class="bot1" colspan="3" align="left">
		<font style="font-size: 22pt;">배송지 정보</font>
	</td>
</tr>
<tr>
	<td width="200"  align="left">수령인</td>
	<td  align="left"><input type="text" name="u_recipient" value="${udto.name}"> </td>
</tr>
<tr>
	<td align="left">휴대폰</td>
	<td align="left"><input type="text" name="u_recipient_phone" value="${udto.phone}"> </td>
</tr>
<tr>
	<td align="left">배송주소</td>
	<td align="left">
	<input type="text" id="sample4_postcode" name="u_postcode" placeholder="우편번호">
	<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
	<input type="text" name="u_roadAddress" id="sample4_roadAddress" placeholder="도로명주소" size="60" ><br>
	<span id="guide" style="color:#999;display:none"></span>
	<input type="text" name="u_detailAddress" id="sample4_detailAddress" placeholder="상세주소"  size="60"><br>
	 </td>
</tr>
<tr>
	<td class="bot1" align="left">배송메모</td>
	<td class="bot1" align="left"><input name="u_memo" type="text" size="60" value="잘부탁드립니다"> </td>
</tr>
</table>
</div>

<br><br><br>

<!-- 최종 결제 금액 -->
<div align="center">
<table>
<tr>
	<td class="bot1" colspan="3" align="left">
		<font style="font-size: 22pt;">최종 결제 금액</font>
	</td>
</tr>
<tr>
	<td width="200" class="bot2" align="left">총 상품금액</td>
	<td class="bot2" align="right"><fmt:formatNumber value="${price}" type="number"/>원</td>
</tr>
<tr>
	<td align="left" class="bot2">배송비</td>
	<td align="right" class="bot2"><fmt:formatNumber value="${delivery}" type="number"/>원 </td>
</tr>
<tr>
	<td class="bot1" align="left"><font style="font-weight: bold; font-size: 18pt;">총 결제예상 금액</font></td>
	<td class="bot1" align="right" width="200"><font style="font-weight: bold; color: #DBA901; font-size: 22pt;"><fmt:formatNumber value="${price + delivery}" type="number"/>원</font></td>
</tr>
</table>
</div>

<br><br><br>

<!-- 결제 수단 -->
<div align="center">
<table>
<tr>
	<td class="bot1" colspan="3" align="left">
		<font style="font-size: 22pt;">결제수단</font>
	</td>
</tr>
<tr>
	<td class="bot1" align="left"> 
		<input type="radio" id="payMethod" name="payMethod" value="신용/체크카드">신용/체크카드
		<input type="radio" id="payMethod" name="payMethod" value="무통장 입금">무통장 입금
		<input type="radio" id="payMethod" name="payMethod" value="핸드폰 결제">핸드폰 결제
	</td>
</tr>
</table>
</div>

<br><br><br>

<!-- 구매조건/약관 및 개인정보 이용 동의 -->
<div align="center">
<table>
<tr>
	<td class="bot1" colspan="3" align="left">
		<font style="font-size: 22pt;">구매조건/약관 및 개인정보 이용 동의</font>
		<div align="right" style="float:right;">모두동의 <input type="checkbox" id="checkAll" onclick="cAll();"> </div>
	</td>
</tr>
<tr>
	<td width="600" class="bot2" align="left">TIS 쇼핑몰 약관 동의</td>
	<td class="bot2" align="right"> <input type="checkbox" id="check1" name="check1"> </td>
</tr>
<tr>
	<td align="left" class="bot2">개인정보수집 및 이용에 대한 안내</td>
	<td align="right" class="bot2"><input type="checkbox" id="check2" name="check2"> </td>
</tr>
<tr>
	<td class="bot1" align="left">구매조건 및 개인정보 제3자 제공</td>
	<td class="bot1" align="right"><input type="checkbox" id="check3" name="check3"></td>
</tr>
</table>
</div>

<br><br><br>

<!-- 주문하기 버튼 -->
<div align="center">
	<input type="button" class="button1" onclick="Checknull();" value="주문하기">
</div>
</form>
<br><br><br><br><br>

<jsp:include page="./shopping_footer.jsp"></jsp:include>

</body>
</html>