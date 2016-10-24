<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>mypage</title>

<!-- Custom CSS -->
<link href="/beautyline/bootstrap/css/business-casual.css"
   rel="stylesheet">
<link
   href="https://maxcdn.bootstrapcdn.com/bootswatch/3.3.7/flatly/bootstrap.min.css"
   rel="stylesheet"
   integrity="sha384-+ENW/yibaokMnme+vBLnHMphUYxHs34h9lpdbSLuAwGkOKFRl4C34WkjazBtb7eT"
   crossorigin="anonymous">
<link href="/beautyline/beautyline/css/include.css" rel="stylesheet">

<!-- Custom style -->
<link rel="stylesheet"
   href="http://code.jquery.com/ui/1.10.2/themes/smoothness/jquery-ui.css" />

<!-- Fonts -->
<link
   href="https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800"
   rel="stylesheet" type="text/css">
<link
   href="https://fonts.googleapis.com/css?family=Josefin+Slab:100,300,400,600,700,100italic,300italic,400italic,600italic,700italic"
   rel="stylesheet" type="text/css">

<!-- jQuery -->
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<!-- Bootstrap Core JavaScript -->
<script
   src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/beautyline/bootstrap/js/jquery.js"></script>


<style type="text/css">
.btn btn-warning btn-lg {
   margin: 0px 5px;
}

</style>
</head>

<body>
   <c:import url="/WEB-INF/views/include/header.jsp" />
   <div class="container">
      <div class="row">
         <div class="box">
            <div class="col-lg-12">
               <hr>
               <h2 class="intro-text text-center">
                  <strong>My Page</strong><br> <br>${userVo.name }님의 마이페이지
               </h2>
               <hr>
            </div>

            <div class="col-lg-12">
               <!-- 세션검사 -->
               <c:choose>
                  <c:when test="${authUser.isAdmin eq 'a'}">
							
                     <div class="row">
                        <div class="col-lg-8 col-lg-offset-2">
                           <table class="table table-responsive text-center">
                              <tr>
                                 <td>
                              <a href="/beautyline/reserve/reservelist"
                                    class="btn btn-warning btn-lg">예약내역</a>
                              </td>
                                 <td>
                                 <a href="/beautyline/visit/details"
                                    class="btn btn-warning btn-lg">방문내역</a>
                                 </td>
                                 <td><a href="adminmodifyform"
                                    class="btn btn-warning btn-lg">관리자정보 수정</a></td>
                              <tr>
                           </table>
                        </div>
                     </div>
                  </c:when>
                  <c:otherwise>
                     <c:import url="/WEB-INF/views/include/login.jsp" />
                  </c:otherwise>
               </c:choose>
            </div>

         </div>
      </div>
   </div>
   <c:import url="/WEB-INF/views/include/footer.jsp" />

</body>
</html>