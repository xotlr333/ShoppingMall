 $(function(){
    	  $("#userid").keyup(function(){
    		 $.ajax({
    			  url: "signupid.do",
    			  type : "post",
    			  data : {userid: $("#userid").val()},
    			  success : function(data){
    				  if(data== null || data==""){
    					$("#msgid").html("<p style='color: blue'>사용 가능한 아이디입니다</p>");
    					 
    				 }else{
    					$("#msgid").html("<p style='color: red'>이미 사용중인 아이디입니다</p>" );
    				  }
    			  },
    			  error: function(){
    				  
    			  }
    		  });
    	  });
      });
      
      
     
      
      $(function(){
      
       $("#email").keyup(function(){
         var email =$("#email").val();
         var ck = /\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*/;
         if(email.match(ck)==null){
    		 $("#msgemail").html("이메일 형식을 맞춰주세요");
    	  }else{
    		  $("#msgemail").html("");
    	  }
    	  
       });
      });
      
      
      

      
      
      $(function(){
        $("#pwd1").keyup(function(){

            if($("#pwd").val()==$("#pwd1").val()){
             $("#msgpwd").html("비밀번호가 일치합니다");
             $("#phone").focus();
            }
            else{$("#msgpwd").html("비밀번호가 일치하지 않습니다.");
            $("#pwd1").focus();}
        });
            
    });


    $(function(){
        $("#phone").keyup(function(){
            var ck1 = /^\d{3}-\d{3,4}-\d{4}$/; 
            if($("#phone").val().match(ck1) == null){
              $("#msgphone").html("전화번호 형식을 맞춰주세요");
            }else{
                $("#msgphone").html("");
                $("#birth").focus();}
            
        });
    });


  $(function(){
    $("#checkall").change(function(){
        $("#check1,#check2,#check3,#check4,#check5").attr("checked",false);

        if($("#checkall").is(":checked")==true){
         $("#check1,#check2,#check3,#check4,#check5").attr("checked",true);
          }else if($("#checkall").is(":checked")==false){
          $("#check1,#check2,#check3,#check4,#check5").attr("checked",false);
                  
        }
    });
  });
      