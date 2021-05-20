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
<jsp:include page="./shopping_top.jsp">
   <jsp:param value="userid" name="userid"/>
</jsp:include>


 <div id="myCarousel" class="carousel slide" data-ride="carousel">
        <!-- Indicators -->
        <ol class="carousel-indicators">
          <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
          <li data-target="#myCarousel" data-slide-to="1"></li>
          <li data-target="#myCarousel" data-slide-to="2"></li>
        </ol>
      
        <!-- Wrapper for slides -->
        <div class="carousel-inner">
          <div class="item active">
            <a href="#"><img src="resources/images/c1.jpg"></a>
          </div>
      
          <div class="item">
            <a href="#"><img src="resources/images/c2.jpg"></a>
          </div>
      
          <div class="item">
             <a href="#"><img src="resources/images/c3.jpg"></a>
          </div>
        </div>
      
        <!-- Left and right controls -->
        <a class="left carousel-control" href="#myCarousel" data-slide="prev">
          <span class="glyphicon glyphicon-chevron-left"></span>
          <span class="sr-only">Previous</span>
        </a>
        <a class="right carousel-control" href="#myCarousel" data-slide="next">
          <span class="glyphicon glyphicon-chevron-right"></span>
          <span class="sr-only">Next</span>
        </a>
      </div>
      
       <div id="contents">
       
       <h2>봄에 입기 좋은</h2><br>
       <h5><a href="slist.do"> 더보기 > </a></h5>
       

       <c:set var="i" value="0"></c:set>
       <c:set var="j" value="5"></c:set>
     
      <table>

       <c:forEach var="list" items="${pdto}" end="24">
       <c:if test="${i%j==0}">
       <tr>
       </c:if>
               
        <td>
          <div  id="items">
           <a href="productDetail.do?code=${list.code}"> 
                  
	        <div><img src="resources/images/${list.img}" width="180px" height="180px"></div>
	        <div>${list.brand}</div>
	        <div>${list.title}</div>
	        <div class="price" id="price">${list.price}</div>
              
           </a>
          </div>
        </td>
       
        <c:if test="${i%j ==j-1}"></tr></c:if>
        <c:set var="i" value="${i+1}"></c:set>
       
        </c:forEach>
       </table>
    
   <jsp:include page="./shopping_footer.jsp"></jsp:include>   
     
 </body>
</html>