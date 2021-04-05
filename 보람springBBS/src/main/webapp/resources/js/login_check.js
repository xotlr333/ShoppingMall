/*============= Login Modal =============*/
	function openLoginModal(){
		$('#login_modal').fadeIn(110);
		$('html').css({"overflow":"hidden"});
	};
	function closeLogin_modal(){
		$('#login_modal').fadeOut(110);
		$('html').css({"overflow":"scroll"});
	};
/*======================================*/
function openLogInfo(){
	$('.sdropdown').fadeToggle(110); 
};
/*======================================*/

function loginCheck() {
	
	var data = {id : $("#id").val() , pw : $("#pw").val()};
	$.ajax({
		type: "POST",
		url: "loginCheck.do",
		data : data,
		success : function(data){
			if(data == '' || data == null){
				alert("로그인에 실패했습니다. 아이디와 비밀번호를 다시 확인해주세요.");				
			}		
			else{
				alert("login success!");	
				location.reload(true);
			}
		}
	})
}

function loginChange(){
	var data = {req : "req"};
	$.ajax({
		type: "POST",
		url: "loginChange.do",
		data : data,
		success : function(data){
			if(data!='null'){
				login_s = document.getElementById("user_s");
				login_s.innerHTML = "<div class='d-inline-flex align-items-center' onclick='javascript:openLogInfo();'><span class='sicon_btn'> <span class='m-0'>welcom!</span> <span class='ml-2' style='font-size:22px;'> <strong>"+data+"</strong> <span class='change_icon ml-2'><i class='fas fa-angle-down'></i></span></span></span></div>";
			}
		}
	})
	
	$.ajax({
		type: "POST",
		url: "popup_check.do",
		success : function(data){
			if(data=='popup'){
				var popUrl = "popup.do";
				var popOption = "width=400%, height=450%, resizable=no, scrollbars=no, status=no;";
				window.open(popUrl,"",popOption);
			}
		}
	})
}
window.onload=loginChange;

