<%@ page language="java" contentType="text/html; charset=UTF-8"  %>
<%@ include file="ssi.jsp" %>
<%@ include file="animalTop.jsp" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.*" %>
<%-- 테이블 명 d_animal --%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> [animalList.jsp]</title>

  <script type="text/javascript">
    function changeclear( ){
       myform.keyword.value="";
       myform.keyword.focus();
    }//end
  </script>
 </head>
 

<body>
<table style="margin-left: auto; margin-right: auto;"><tr><td><h1> <img src='images/minidog.jpg' height = '70px'>강아지 게시판</h1></td></tr></table>

<%!
 int start, end ; 
 int pagecount;  
 int pageNUM ;   
 int startpage, endpage; 
 String pnum;  
 int temp; 
 int num; 

 String sqry; 
 String skey, sval; 
 String returnpage; 
 
 SimpleDateFormat sdf;
 Date dt;
%>

 <%
  skey=request.getParameter("keyfield"); 
  sval=request.getParameter("keyword"); 
  if(skey==null || skey=="" || sval==null || sval==""){
     sqry=" where d_id like '%%' "; 
     skey=""; sval="";
  }else{ sqry=" where "+skey+" like '%"+sval+"%'";  }
   
  returnpage="&keyfield="+skey+"&keyword="+sval ; 
        
   msg="select count(*) as cnt from d_animal "+ sqry;
   ST=CN.createStatement();
   RS=ST.executeQuery(msg);
   if(RS.next()==true){
    Gtotal=RS.getInt("cnt");   
   }
 %>

 <table width=1030 border=1 cellspacing=0 style="margin-left: auto; margin-right: auto;">  
 
  <tr bgcolor="#ffff00">
  <th width = 50>번호</th> <th width = 600>제 목</th> <th width = 200>아이디</th> <th width = 80>조회수</th> <th width = 100>날짜</th> 
  </tr>
 <%
   pnum=request.getParameter("pageNum");
   if(pnum==null || pnum==""){ pnum="1"; }
   pageNUM=Integer.parseInt(pnum); 
      
     //start=(pageNUM-1)*10+1 ; 
     //end=pageNUM*10 ;
       
     start = Gtotal-(pageNUM-1)*10 - 9;
     end = Gtotal-(pageNUM-1)*10;
     
     if(Gtotal%10==0){ pagecount=Gtotal/10; }
     else{ pagecount=(Gtotal/10)+1; } 
     
        //게시판 목록 갯수 오버플로우 시 다음 페이지를 생성
     temp=(pageNUM-1)%10;
     startpage=pageNUM-temp; 
     endpage=startpage+9; 
     if(endpage>pagecount){ endpage=pagecount;} 
     
   String x=" select * from ( " ;
   String y=" select rownum rn, g.* from d_animal g " + sqry;  
   String z=" ) where rn between "+start+" and "+end + "order by d_wdate desc";
   msg=x+y+z;  
   
   sdf =  new SimpleDateFormat("yyyy-mm-dd HH:mm:ss");
   dt = new Date();
   dt = sdf.parse(sdf.format(dt));

   ST=CN.createStatement();
   RS=ST.executeQuery(msg); 
   num=Gtotal-(pageNUM-1)*10+1;
   while(RS.next()==true){
      no = RS.getInt("d_code"); 
      title = RS.getString("d_title");
      num--;
      ST3=CN.createStatement();
      msg3="select count(*) as rcnt from d_animal_reply where dr_code =" + no;
      RS3=ST3.executeQuery(msg3);
      if(RS3.next()==true){
         Rtotal = RS3.getInt("rcnt");
      }//if end
      Date sd = sdf.parse(RS.getString("d_wdate"));
 %>      
   <tr align="center"  onmouseover="style.backgroundColor='#dddddd'" onmouseout="style.backgroundColor=''">
     <td> <%= num  %></td>
     <td><a href="animalDetail_dog.jsp?idx=<%=no%>"><%= RS.getString("d_title") %></a><%if(Rtotal>0){%><font style="font-size:12pt; color:#11217B;"><%out.println("["+Rtotal+"]");}%></font> </td> 
     <td><%= RS.getString("d_id")  %>  </td>
     <td> <%= RS.getInt("d_cnt")  %></td>
     <td> <%= RS.getDate("d_wdate")  %></td>
   </tr>  
  
 <%  
   }//while end

 %>
 
  <tr align="center">
   <td colspan="6">
     <%
      if(startpage>10){
        out.println("<a href=animalList_dog.jsp?pageNum="+(startpage-10)+returnpage+">[이전]</a>");   
       }
     %>
   
     <%
      for(int i=startpage; i<=endpage; i++){
         if(i==pageNUM){
         out.println("<font style='font-size:18pt; color:red'>["+i+"]</font>");   
         }
         else{
          out.println("<a href=animalList_dog.jsp?pageNum="+i+returnpage+">[" + i + "]</a>" );
         }
      }
     %> 
     
     <%
      if(endpage<pagecount){
      out.println("<a href=animalList_dog.jsp?pageNum="+(startpage+10)+returnpage+">[다음]</a>");   
      }
     %>
   </td>
  </tr>
  
 <tr align="center">
     <td colspan="6">
      <form name="myform" action="animalList_dog.jsp">
         <select name="keyfield" onchange="changeclear();">
            <option value="d_id"  <% if(skey.equals("d_id")){out.println("selected");} %> >이름검색</option>
            <option value="d_title" <% if(skey.equals("d_title")){out.println("selected");} %> >제목검색</option>
         </select>
         <input type="text" name="keyword" value="<%=sval %>" size=10>
         <input type="submit" value="검 색 "> 
      </form>
     </td>
  </tr>
  <tr align = "right">
  <td colspan = "6">
   <a href='animalWriter_dog.jsp'"><img src="images/button_write.PNG">
  <!-- <input  type="button" value="글 쓰기" onclick="location.href='animalWriter_dog.jsp'"> 글쓰기 버튼!!! -->
  </tr>
 </table> 

<p>
  <jsp:include page="animalbottom.jsp"></jsp:include>
</body>
</html>