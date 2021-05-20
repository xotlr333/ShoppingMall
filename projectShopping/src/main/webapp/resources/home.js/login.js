 
 $(function(){
  $("#login").click(function(){
  
      var userid = $("#userid").val();
      var pwd = $("#pwd").val();
      
      alert("userid="+userid);
      alert("pwd="+pwd);
      $.ajax({
          type: "post",
          url : "loginConfirm1.do",
          data: {userid: userid, pwd:pwd},
          success : function(data){
             if(data !=null){
             alert("data="+data);
             $("#lmsg").innerHTML(data);}
          }
      })
  });
  }); 
    