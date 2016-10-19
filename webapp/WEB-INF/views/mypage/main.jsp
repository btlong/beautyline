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
.btn btn-warning btn-sm {
   margin: 0px 5px;
}

.form-group margin-top {
   margin-top: 30px
}

.box-radius {
   margin-top: 7px;
   padding: 10px;
   border: 1px solid #D8D8D8;
   border-radius: 5px;
   -moz-border-radius: 5px;
   -webkit-border-radius: 5px;
   -o-border-radius: 5px;
}

.end {
   margin-bottom: 20px;
}

.strength {
   color: red;
   font-weight: bold
}

.text {
   margin: 10px 0px
}

.table {
   margin-bottom: 0px
}

/* 방문내역 그래프 & 테이블 */
div.clumn {
   overflow: visible;
}

.gragh-index {
   margin-top: 40px;
}

div.graphBox2 ul {
   width: 340px;
   height: 250px;
   border: 1px solid #e8e8e8;
   list-style: none;
   margin-top: 10px;
   margin-bottom: 10px;
   position: relative;
}

div.graphBox2 ul li {
   width: 20px;
   height: 1px;
   position: relative;
   overflow: visible !important;
}

div.graphBox2 ul li span {
   position: absolute;
   top: -15px;
   left: -9px;
   width: 30px;
   font-size: 10px;
   overflow: visible;
   text-align: center;
   font-family: tahoma;
}

div.graphBox2 ul li.g1 {
   position: absolute;
   left: 80px;
   bottom: 5px;
   background: #ec008c;
}

div.graphBox2 ul li.g2 {
   position: absolute;
   left: 120px;
   bottom: 5px;
   background: #662d91;
}

div.graphBox2 ul li.g3 {
   position: absolute;
   left: 160px;
   bottom: 5px;
   background: #0d004c;
}

div.graphBox2 ul li.g4 {
   position: absolute;
   left: 200px;
   bottom: 5px;
   background: #f7941d;
}

div.graphBox2 ul li.g5 {
   position: absolute;
   left: 240px;
   bottom: 5px;
   background: #8dc63f;
}

div.graphBox2 input.link {
   cursor: pointer;
}

.counter {
   margin-left: 5px;
}

.bg {
   background-color: #F2F396
}

.color-item {
   display: inline-block;
   width: 20px;
   height: 20px;
   margin-left: 5px;
   margin-top: 5px;
}
/* ------- */
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
                  <c:when test='${not empty sessionScope.authUser }'>
                     <div class="row">
                        <div class="col-lg-6 col-lg-offset-3">
                           <table class="table table-responsive text-center">
                              <tr>
                                 <td><a href="/beautyline/reserve/userreservelist"
                                    class="btn btn-warning btn-sm">예약확인</a></td>
                                 <td>
                                    <form method="post" action="history">
                                       <input class="btn btn-warning btn-sm" type="submit"
                                          value="방문내역">
                                    </form>
                                 </td>
                                 <td><a href="/beautyline/user/modifyform"
                                    class="btn btn-warning btn-sm">회원정보 수정</a></td>
                              <tr>
                           </table>
                        </div>
                     </div>

                     <!-- 결제한 케어프로그램 남은 횟수  -->
                     <div class="form-group">
                        <div class="row">
                           <div class="col-lg-12 text-left">
                              <img src="/beautyline/images/mypage/coupon.png"
                                 class="img-responsive">
                           </div>
                        </div>
                        <div class="row">
                           <div class="box-radius end">
                              <table class="table table-bordered table-responsive">
                                 <thead>
                                    <tr class="danger">
                                       <th>베이직 케어</th>
                                       <th>화이트 케어</th>
                                       <th>리프팅 케어</th>
                                       <th>여드름 케어</th>
                                       <!-- <th></th> -->
                                    </tr>
                                 </thead>
                                 <!-- 리스트영역 -->
                                 <tbody>
                                    <tr>
                                       <td id="one"></td>
                                       <td id="two"></td>
                                       <td id="three"></td>
                                       <td id="four"></td>
                                    </tr>
                                 </tbody>
                                 <tfoot></tfoot>
                              </table>
                           </div>
                        </div>

                     </div>

                     <!----------------------->



                     <!-- 예약확인 -->
                     <div class="form-group margin-top">
                        <div class="row">
                           <div class="col-lg-4 text-left">
                              <!-- <label>예약확인</label> -->
                              <img src="/beautyline/images/mypage/reserve.png"
                                 class="img-responsive">
                           </div>
                           <div class="col-lg-8 text-right">
                               <form id="adminReserve" action="/beautyline/reserve/userreservelist" method="post">
                                 <input type="submit" class="btn btn-primary" id="userreserveList" value="예약더보기">
                              </form>
                             
                           </div>
                        </div>
                        <div class="row">
                           <div class="box-radius end">
                              <c:set var='totalCount' value='${fn:length(myResList) }' />
                              <div class="text">
                                 <span>최근 <span class="strength">${totalCount }건</span>의
                                    예약 내역 입니다.
                                 </span>
                              </div>
                              <table class="table table-bordered table-responsive">
                                 <thead>
                                    <tr class="info">
                                       <th>#</th>
                                       <th>예약 프로그램</th>
                                       <th>예약일</th>
                                       <th>예약 시간</th>
                                       <th>예약취소</th>
                                    </tr>
                                 </thead>
                                 <tbody>
                                    <c:forEach var='vo' items='${myResList }' varStatus='status'>
                                       <tr>
                                          <td>[${totalCount - status.index }]</td>
                                          <td>${vo.progName }</td>
                                          <td>${vo.resDate }</td>
                                          <td>${vo.resTime }시-${vo.resTime + 1 }시</td>

                                          <td><input type="hidden" name="no" value="${vo.no }" />
                                             <a class="btn btn-default btn-xs delete-reserve" href=""
                                             data-target="#modalDeleteReserve" type="button"
                                             data-toggle="modal" data-backdrop="static" role="button"
                                             data-no="${vo.no}">삭제</a></td>
                                          <%--                                        <td><a href="reservedeleteform?no=${vo.no }"
                                          type="button" class="btn btn-default btn-xs"> <c:choose>
                                                <c:when test='${vo.resDate }'>삭제</c:when>
                                                <c:otherwise>취소</c:otherwise>
                                             </c:choose>
                                       </a></td> --%>
                                       </tr>
                                    </c:forEach>
                                 </tbody>
                              </table>


                           </div>
                        </div>
                     </div>
                     <!----------->



                     <!-- 방문내역확인 -->
                     <div class="form-group margin-top">
                        <div class="row">
                           <div class="col-lg-4 text-left">
                              <!-- <label>방문내역</label> -->
                              <img src="/beautyline/images/mypage/visit.png"
                                 class="img-responsive">
                           </div>
                           <div class="col-lg-8 text-right">
                              <form method="post" action="history">
                                 <input class="btn btn-success btn-sm" type="submit"
                                    value="방문내역 더 보기">
                              </form>
                           </div>
                        </div>
                        <div class="row">
                           <div class="box-radius">
                                 <div class="row text-center">
                                    <div class="col-lg-6 col-lg-offset-2">
                                       <div class="graphBox2">
                                          <ul>
                                             <li class="g1"><span class="counter1 counter">0</span></li>
                                             <li class="g2"><span class="counter2 counter">0</span></li>
                                             <li class="g3"><span class="counter3 counter">0</span></li>
                                             <li class="g4"><span class="counter4 counter">0</span></li>
                                             <li class="g5"><span class="counter5 counter">0</span></li>
                                          </ul>
                                       </div>
                                    </div>
                                    <div class="col-lg-4 text-left gragh-index">
                                       <div>
                                          <div class="color-item" style="background-color: #EC008C"></div>
                                          <label>미백점수</label>
                                       </div>
                                       <div>
                                          <div class="color-item" style="background-color: #662D91"></div>
                                          <label>주름점수</label>
                                       </div>
                                       <div>
                                          <div class="color-item" style="background-color: #0D004C"></div>
                                          <label>피부탄력점수</label>
                                       </div>
                                       <div>
                                          <div class="color-item" style="background-color: #F7941D"></div>
                                          <label>수분점수</label>
                                       </div>
                                       <div>
                                          <div class="color-item" style="background-color: #8DC63F"></div>
                                          <label>여드름점수</label>
                                       </div>
                                    </div>
                                 </div>
                              
                           </div>
                        </div>
                        <div class="row">
                           <div class="box-radius end">
                              <c:set var='countList' value='${fn:length(listVo.visitList)}' />
                              <div class="text">
                                 <span>최근 <span class="strength">${countList }건</span>의
                                    방문 내역 입니다.
                                 </span>
                              </div>
                              <table
                                 class="table table-bordered table-hover table-responsive"
                                 id="graphTable">
                                 <thead>
                                    <tr class="info">
                                       <th>#</th>
                                       <th>날짜</th>
                                       <th>프로그램</th>
                                       <th>미백점수</th>
                                       <th>주름점수</th>
                                       <th>피부탄력점수</th>
                                       <th>수분점수</th>
                                       <th>여드름점수</th>
                                       <th>평균점수</th>
                                    </tr>
                                 </thead>
                                 <tbody>
                                    <c:forEach var='visitVo' items='${listVo.visitList }'
                                       varStatus='status'>
                                       <tr class="tr-visitlist">
                                          <td>[${countList - status.index }]</td>
                                          <td id="regDate">${visitVo.regDate }</td>
                                          <td>${visitVo.programName }</td>
                                          <td id="whiteningScore">${visitVo.whiteningScore }</td>
                                          <td id="whinkleScore">${visitVo.whinkleScore }</td>
                                          <td id="elasticScore">${visitVo.elasticScore }</td>
                                          <td id="moistureScore">${visitVo.moistureScore }</td>
                                          <td id="acneScore">${visitVo.acneScore }</td>
                                          <td>${visitVo.averageScore }</td>
                                       </tr>
                                    </c:forEach>
                                 </tbody>
                              </table>
                           </div>
                        </div>
                     </div>

                     <!----------->



                     <!-- 회원정보수정 -->
                     <div class="form-group margin-top">
                        <div class="row">
                           <div class="col-lg-4 text-left">
                              <!-- <label>회원정보</label> -->
                              <img src="/beautyline/images/mypage/userinfo.png"
                                 class="img-responsive">
                           </div>
                           <div class="col-lg-8 text-right">
                              <a href="/beautyline/user/modifyform"
                                 class="btn btn-success btn-sm">회원정보 수정</a>
                           </div>
                        </div>
                        <div class="row">
                           <div class="box-radius">
                              <table class="table table-bordered table-responsive">
                                 <thead>
                                    <tr class="danger">
                                       <th colspan=2>고객님의 연락처를 확인 해 주세요</th>
                                    </tr>
                                 </thead>
                                 <tbody>
                                    <tr>
                                       <td><span class="glyphicon glyphicon-envelope"></span>&nbsp;
                                          이메일 :&nbsp; ${userVo.email1 }@${userVo.email2 }</td>
                                       <td><span class="glyphicon glyphicon-phone"></span>&nbsp;
                                          휴대폰 :&nbsp; ${userVo.phone }</td>
                                    </tr>
                                    <tr>
                                       <td>수신동의 :&nbsp; ${userVo.agrEmail }</td>
                                       <td>수신동의 :&nbsp; ${userVo.agrMessage }</td>
                                    </tr>
                                 </tbody>
                                 <tfoot></tfoot>
                              </table>
                           </div>
                        </div>
                     </div>
                     <!----------->


                  </c:when>
                  <c:otherwise>
                     <h4>마이페이지 조회는 회원만 가능합니다.</h4>
                     <c:import url="/WEB-INF/views/include/login.jsp" />
                  </c:otherwise>
               </c:choose>
            </div>

         </div>
      </div>
   </div>
   <c:import url="/WEB-INF/views/include/footer.jsp" />

   <!-- 예약삭제 Modal -->
   <div class="modal fade" id="modalDeleteReserve" role="dialog"
      tabindex="-1" aria-labelledby="myModalLabel" aria-hidden="true">
      <div class="modal-dialog">
         <!-- modal content -->
         <div class="modal-content">
            <!-- header -->
            <div class="modal-header">
               <!-- 닫기(x) 버튼 -->
               <button type="button" class="close" data-dismiss="modal">×</button>
               <!-- header title -->
               <h4 class="modal-title text-center">
                  <strong>예약취소</strong>
               </h4>
            </div>

            <!-- body -->
            <div class="modal-body text-center">
               <h4>예약을 취소 하시겠습니까?</h4>
            </div>

            <!-- Footer -->
            <div class="modal-footer">
               <button class="btn btn-primary" id="resDelOk">예</button>
               <button class="btn btn-default" type="button" data-dismiss="modal">아니요</button>
            </div>
         </div>
      </div>
   </div>
   <!-- Modal-->


   <script>
      $(document).ready(function() {

         /* 쿠폰남은 횟수  */
         $('#one').text("0");
         $('#two').text("0");
         $('#three').text("0");
         $('#four').text("0");
         var userNo = ${userVo.no}; //coupon count 가져올 때 보낼 회원 번호
         console.log(userNo);
         $.ajax({
            url : "selectCoupon",
            type : "POST",
            data : {
               "userNo" : userNo
            },
            success : function(couponList) {
               console.log(couponList);
               $.each(couponList, function(index, couponVo) {
                  if (couponVo.programNo == 1) {
                     $('#one').text(couponVo.count);
                  } else if (couponVo.programNo == 2) {
                     $('#two').text(couponVo.count);
                  } else if (couponVo.programNo == 3) {
                     $('#three').text(couponVo.count);
                  } else if (couponVo.programNo == 4) {
                     $('#four').text(couponVo.count);
                  } else {
                     // count가 0으로가 나도오록 
                  }
               });
            }
         });
         /* ------- */

         $(".delete-reserve").on("click", function() {
            var no = $(this).data("no");
            console.log(no);
            $("#resDelOk").on("click", function() {
               $.ajax({
                  url : "reservedelete",
                  type : "POST",
                  data : {
                     "no" : no
                  },
                  success : function(result) {
                     if (result > 0) {
                        location.href = "main";
                     } else {
                        alert("유효하지 않은 정보입니다.");
                     }
                  }
               });
            });

         });

         /* 방문내역 그래프& 테이블 */
         $(".tr-visitlist").click(function() {

            $("tr.bg").removeClass("bg");
            $(this).addClass("bg");
            max1 = $(this).find("#whiteningScore").text();
            max2 = $(this).find("#whinkleScore").text();
            max3 = $(this).find("#elasticScore").text();
            max4 = $(this).find("#moistureScore").text();
            max5 = $(this).find("#acneScore").text();

            drawGraph();

         });

      });
      //숫자 카운터(%값)
      var max1 = 0;
      var max2 = 0;
      var max3 = 0;
      var max4 = 0;
      var max5 = 0;

      function drawGraph() {
         $(".graphBox2 li span").text('0');
         $(".graphBox2 .g1").animate({
            height : (max1 * 2) + "px"
         }, 250);
         $(".graphBox2 .g2").animate({
            height : (max2 * 2) + "px"
         }, 200);
         $(".graphBox2 .g3").animate({
            height : (max3 * 2) + "px"
         }, 150);
         $(".graphBox2 .g4").animate({
            height : (max4 * 2) + "px"
         }, 100);
         $(".graphBox2 .g5").animate({
            height : (max5 * 2) + "px"
         }, 50);
         $(".graphBox2 li span").fadeIn(500);

         var opacity = 1;
         $(".graphBox2 li").css("opacity", opacity);
         $(".graphBox2 li").hover(function() {
            $(this).css("opacity", 0.5);
         }, function() {
            $(this).css("opacity", opacity);
         });
         incCounter2();
      };

      function incCounter2() {
         var currCount1 = parseInt($('.graphBox2 .counter1').html());
         var currCount2 = parseInt($('.graphBox2 .counter2').html());
         var currCount3 = parseInt($('.graphBox2 .counter3').html());
         var currCount4 = parseInt($('.graphBox2 .counter4').html());
         var currCount5 = parseInt($('.graphBox2 .counter5').html());

         if (currCount1 != max1) {
            $('.graphBox2 .counter1').text(currCount1 + 1 + "점");
            setTimeout('incCounter2()', 0);
         } else if (currCount2 != max2) {
            $('.graphBox2 .counter2').text(currCount2 + 1 + "점");
            setTimeout('incCounter2()', 0);
         } else if (currCount3 != max3) {
            $('.graphBox2 .counter3').text(currCount3 + 1 + "점");
            setTimeout('incCounter2()', 0);
         } else if (currCount4 != max4) {
            $('.graphBox2 .counter4').text(currCount4 + 1 + "점");
            setTimeout('incCounter2()', 0);
         } else if (currCount5 != max5) {
            $('.graphBox2 .counter5').text(currCount5 + 1 + "점");
            setTimeout('incCounter2()', 0);
         }

      };
      /* --------- */
   </script>

</body>
</html>