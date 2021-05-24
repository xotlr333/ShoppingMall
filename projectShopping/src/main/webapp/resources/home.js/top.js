   $(function(){
      $("#search .material-icons").click(function(){
        var keyword = $("#keyword").val();
       
        if(keyword =="" || keyword==null){
          alert("키워드를 입력해주세요");
         
         }else{
        keyword = encodeURI(keyword);
        location.href="slist.do?search="+ keyword ;}
      });
    });

    
    