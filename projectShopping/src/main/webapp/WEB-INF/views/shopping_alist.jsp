<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>main</title>

    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="resources/home.css/home.css">
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>


</head>
<body>
<jsp:include page="./shopping_top.jsp"></jsp:include>


    <div id="contents">
     <c:set var="i" value="0"></c:set>
      <c:set var="j" value="4"></c:set> 
       
      <table>
      
       <c:forEach var="list" items="${dto}">
      
       
       <c:if test="${i%j==0}"><tr></c:if>
       
       <td>
     
      
	      <div id="items">
		       <a href="productDetail.do?code=${list.code}">
		       <div>
		       <img src="resources/images/${list.img}" width="180px" height="180px"> 
		       </div>
		       <div>
		       ${list.brand}
		       </div>
		        <div>
		      ${list.title}
		       </div>
		      
		          <div class="price" id="price">${list.price}</div>
		      
		      </a>
	       </div>
        
       
      </td>
       <c:if test="${i%j==j-1}"></tr></c:if>
       <c:set var="i" value="${i+1}"></c:set>
        
      </c:forEach>         
     
      </table>   
              
      </div>  
         
      <jsp:include page="./shopping_footer.jsp"></jsp:include>   
     
  

</body>
</html>