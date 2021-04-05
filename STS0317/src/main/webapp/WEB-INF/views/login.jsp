<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<html>
<head>
<title>[login.jsp]</title>
   <style type="text/css">
      input, b{font-size: 20pt; font-weight: bold;}
      a{text-decoration: none;font-size: 20pt; font-weight: bold;}
      a:hover {color: red; font-size: 20pt; font-weight: bold;}
      #LOG-IN{
       font-size:26pt; font-weight: bold; 
       background:"yellow"; height:150; 
      }
   </style>
   
   <script type="text/javascript">
     var xhr; //전역변수 
     
     function first( ){
      return new XMLHttpRequest( ); //ajax처리도와주는 개체생성
     }//end
     
     function two(){  
      //순수자바스크립트에서 var키워드 생략가능
      var a=document.getElementById("userid").value; //myform.userid.value;
      var b=document.getElementById("pwd").value; //myform.pwd.value;
      var url="loginprocess.do?userid="+a+"&pwd="+b; 
   
      xhr=first();
      xhr.open("get", url, true);
      xhr.send();
      xhr.onreadystatechange=display;  //xhr.onload=display; 
    }//end
     
     function display( ){
       if(xhr.readyState==4){
         if(xhr.status==200){
          var message=xhr.responseText;
          document.getElementById("msg").innerHTML=message;
         }//200 end
       }//4 end
     }//end
   </script>
</head>
<body>
   
   
<!-- ajax요청한 페이지에 결과 출력 뉴스,맵 -->

<div id="msg" align="center">   
   <table width="550" border="1" cellspacing="0">
    <form action="loginprocess.do" method="post">
      <tr>
         <td width=350> <b>userid: </b></td>
         <td> <input type="text" name="userid" id="userid" value="asky"></td>
         
         <td rowspan=3 align="center">
          <input type="submit"  value="LOGIN" id="LOG-IN" >
         </td>
      </tr>
      
      <tr>
         <td width=350><b>userpw: </b> </td>
         <td>
           <input type="text"  name="pwd" id="pwd" value="1234">       
         </td>
      </tr>
      <tr>
         <td colspan="2" align="center">
             <a href="boardWrite.jsp">[하비글쓰기]</a>
              <a href="boardList.do">[하비글출력]</a>
              <a href="index.jsp">[index]</a>
         </td>
      </tr>
      </form>
   </table>
</div>

</body>
</html>