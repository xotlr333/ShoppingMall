<%@ page language="java" contentType="text/html; charset=UTF-8"  %>
<%@ include file="./ssi.jsp" %>
<%@ include file="animalLoginCheck.jsp" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Write_c.jsp</title>


<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script></head>


<style>
.radio{display: inline;}

.write{width : 78%;}
input{ 
       border: 2px solid ;
		   padding: 6px;
       border-radius:3px;
       border-color:#f1f3f5;}
       
       
textarea{

	  border: 2px solid ;
		padding: 8px;
		filter: alpha(opacity=100);
		opacity: 1;
		border-radius: 5px;
		border-color:  #f1f3f5;
		
		}

button{
      border: 1px solid yellow;
      padding:5px;
      border-radius:4px;
      }



</style>

<script type="text/javascript">
Gflag=false;

function checkNull(){
	var a= w_form.c_title.value;
	var b= w_form.c_content.value;
	var c= w_form.c_animal_name.value;
	var d= w_form.file2.value;
	
	if(a==null || a==""){alert("제목을 입력해주세요");
  w_form.c_title.focus();
  return false;
  }else{w_form.c_content.focus();}
  
  if(b==null || b==""){alert("내용을 입력해주세요");
  w_form.c_content.focus();
  return false;
  }else{ w_form.c_animal_name.focus();}
  
  if(c==null || c==""){alert("반려동물의 이름을 입력해주세요");
  w_form.c_animal_name.focus();
  return false;
  }
  
  if(d==null || d==""){alert("사진을 넣어주세요");
  w_form.file2.focus();
  return false;
  }
  
  Gflag=true;
  document.w_form.submit();
  
}

</script>


</head>
<body>

<%
String path = application.getRealPath("download");

 int data=Integer.parseInt(request.getParameter("idx"));
 msg="select * from c_animal where c_code="+ data ;
 ST=CN.createStatement( );
 RS=ST.executeQuery(msg);
 if(RS.next()==true){
	code=RS.getInt("c_code"); 
	id=RS.getString("c_id");
	title=RS.getString("c_title");
	content=RS.getString("c_content");
	animal_name=RS.getString("c_animal_name");
	gender=RS.getString("c_gender");
	file=RS.getString("c_file_name");
 }
%>

<br>
<form name="w_form" method="post" enctype="multipart/form-data" action="animalEditSave_cat.jsp" >
 <div class="container">
     <table width=860px>
		   
		   <tr>
       <td><b><%=id%></b>님의 글 입니다<p><input type="hidden" name="c_code" value="<%=code %>"></td>
       </tr>
       
       <tr align="right">
       <td colspan="4">
        <a href="animalList_cat.jsp"><input type="button" value="목록" style="background-color:white ; color : #fdd017; width:100px; height:38px;"></a>
        <a href="animalHome.jsp"><input type="button" value="홈" style="background-color:white ; color : #fdd017; width:100px; height:38px; "></a>
       </td>
       </tr>
        
    </table>
  
     <h4>게시판 글 수정하기</h4><p>
       <div>
        <input type="text" placeholder="제목을 입력해주세요." name="c_title" value="<%=title%>" >
       </div><br>
         
	     <div>
	       <textarea style="resize: none; " name="c_content" cols="95" rows="10" class="textarea"  placeholder="내용을 입력해주세요." ><%=content%></textarea>
	     </div>
       

         <br><hr width="860px" align="left"><p>   
  
    
     <h4>반려동물 정보</h4>
        <div>   
          <table width="860px">
                      
            <tr>
            <td>
             <label>이름&nbsp;</label>
                <input type="text" placeholder="반려동물 이름" name="c_animal_name" value="<%=animal_name%>"> 
            </td>
              
            <td style="text-align:left;">
              <label>성별&nbsp;&nbsp;</label>
               <input type="radio" id="gender_m" name="c_gender" value="male" style="padding-right:20px;" <%if(gender.equals("male")){%>checked<%}%>>
               <label for="gender_m">수컷</label>&nbsp;
               <input type="radio" id="gender_w" name="c_gender" value="female" <%if(gender.equals("female")){%>checked<%}%>>
               <label for="gender_w">암컷</label>&nbsp;&nbsp;
            </td>
             
            <td>
               <input type="file" name="c_file_name" id="file1" style="display: none;" > 
            </td>
             
            <td style="text-align:right;">
               <input type="text" name="file2" id="file2" placeholder="파일을 선택하세요" >
            </td>
             
            <td>
             <img src="./images/cat2.png" name="find" id="find" border="0" onclick="document.all.file1.click(); document.all.file2.value=document.all.file1.value" style="cursor:hand;">
            </td>
             
            </tr>
          </table>     
        </div>
         
          <br>
          <div>
            <button type="button" style="height:35px; width:430px; background-color: white; color : #fdd017;" onclick="history.back()">취소하기</button>
            <button type="button" onclick="checkNull()" style="height:35px; width:430px; background-color:  #fdd017; color: white;">수정하기</button>
          </div>        
          
 </div>                
</form>
</body>
</html>       













