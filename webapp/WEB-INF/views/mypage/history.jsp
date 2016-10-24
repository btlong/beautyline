<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<title>default</title>
<!-- 부트스트랩 -->
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="http://code.jquery.com/ui/1.10.2/jquery-ui.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!-- Custom CSS -->
<link href="/beautyline/bootstrap/css/business-casual.css"
   rel="stylesheet">

<!-- 테마 CSS -->
<link
   href="https://maxcdn.bootstrapcdn.com/bootswatch/3.3.7/flatly/bootstrap.min.css"
   rel="stylesheet"
   integrity="sha384-+ENW/yibaokMnme+vBLnHMphUYxHs34h9lpdbSLuAwGkOKFRl4C34WkjazBtb7eT"
   crossorigin="anonymous">
<link href="/beautyline/beautyline/css/include.css" rel="stylesheet">

<!-- Fonts -->
<link
   href="https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800"
   rel="stylesheet" type="text/css">
<link
   href="https://fonts.googleapis.com/css?family=Josefin+Slab:100,300,400,600,700,100italic,300italic,400italic,600italic,700italic"
   rel="stylesheet" type="text/css">



<script type="text/javascript"
   src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.4/jquery.min.js"
   charset="utf-8"></script>
<script type="text/javascript" src="/beautyline/jquery/jquery-1.9.0.js"></script>
<script type="text/javascript"
   src="/beautyline/jquery/jquery.scrollfollow.js"></script>

<style type="text/css">
div.clumn {
   width: 360px;
   float: left;
   overflow: visible;
}

div.graphBox2 {
   margin-bottom: 30px;
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

.movepage:hover {
   cursor: pointer;
}

div.pager  ul li {
   display: inline-block;
   margin: 5px 0;
   width: 20px;
   font-weight: bold;
}

div.pager  ul li.selected {
   text-decoration: underline;
   color: #f40808
}

.bg {
   background-color: #F2F396
}

.color-item {
   display: inline-block;
   width: 20px;
   height: 20px;
   margin-left: 15px;
   margin-top: 5px;
}

#color-item {
   padding-top: 30px;
}

#ment {
   font-size: 15px;
}

#ad {
   background-color: #123456;
   position: absolute;
   border: 3px solid #f00;
   right: 20px;
   top: 30px;
   width: 175px;
   height: 315px;
}

#img_ad {
   width: 150px;
   height: 150px;
}

/* image */
style>.headermessage {
   margin: 19px;
   color: black;
   font-family: 'Open Sans', sans-serif;
   font-size: 16px;
   font-weight: bold;
}

.image-block {
   border: 3px solid white;
   background-color: black;
   padding: 0px;
   margin: 0px 15px;
   height: 200px;
   text-align: center;
   vertical-align: bottom;
}

.image-block>p {
   width: 100%;
   height: 100%;
   font-weight: normal;
   font-size: 19px;
   padding-top: 150px;
   background-color: rgba(3, 3, 3, 0.0);
   color: rgba(6, 6, 6, 0.0);
}

.image-block:hover>p {
   background-color: rgba(3, 3, 3, 0.5);
   color: white;
}
</style>
<script type="text/javascript">
   $(document).ready(function() {

      /* 사진으로 보는중이면 */
      if ($("#pageType").val() == "P") {

         $("#graph").addClass('hide');
         $("#graphTable").addClass('hide');
         $("#imageTable").removeClass('hide');
         $("#imageShow").html("점수로 보기");

         /* 점수로 보는중이면 */
      } else {
         $("#graph").removeClass('hide');
         $("#graphTable").removeClass('hide');
         $("#imageTable").addClass('hide');
         $("#imageShow").html("사진으로 보기");
      }

      $("#ad").scrollFollow({
         speed : 800, // 꿈지럭 거리는 속도
         offset : 500
      // 웹페이지 상단에서 부터의 거리(바꿔보면 뭔지 안다)
      });

      $("tr").click(function() {

         $("tr.bg").removeClass("bg");
         $(this).addClass("bg");

         var selectedDay = $(this).find("#regDate").text();
         max1 = $(this).find("#whiteningScore").text();
         max2 = $(this).find("#whinkleScore").text();
         max3 = $(this).find("#elasticScore").text();
         max4 = $(this).find("#moistureScore").text();
         max5 = $(this).find("#acneScore").text();

         $("#selectedDay").text(selectedDay);
         drawGraph();

      });

      $("#imageShow").on("click", function() {

         if ($("#imageTable").hasClass('hide') == true) {

            $("#graph").addClass('hide');
            $("#graphTable").addClass('hide');
            $("#imageTable").removeClass('hide');
            $("#imageShow").html("리스트로 보기");
            $("#pageType").val("P");

         } else { /* 그래프 0 */
            $("#graph").removeClass('hide');
            $("#graphTable").removeClass('hide');
            $("#imageTable").addClass('hide');
            $("#imageShow").html("사진으로 보기");
            $("#pageType").val("L");
         }
      });

      $(".filter-tab").click(function() {
         var value = $(this).attr('data-filter');

         if (value == "전부") {
            //$('.filter').removeClass('hidden');
            $('.filter').show('1000');
         } else {
            //                  $('.filter[filter-item="'+value+'"]').removeClass('hidden');
            //                  $(".filter").not('.filter[filter-item="'+value+'"]').addClass('hidden');
            $(".filter").not('.' + value).hide('3000');
            $('.filter').filter('.' + value).show('3000');

         }
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

   $(function() {
      $(".movepage").click(function() {
         var cp = $(this).data("cp");

         $("#currentPage").val(cp);
         $("#list_form").submit();

      });
   });

   /* test */
   $(function() {
      $("#items a").fluidbox();

      var $container = $("#items");
      imagesLoaded("#items", function() {
         $container.isotope({
            itemSelector : ".item",
            layoutMode : "fitRows"
         });
      });

      $("#select-filter").selectpicker({
         size : 6
      }).change(function() {
         $container.isotope({
            filter : "." + $(this).val(),
            transitionDuration : "1s"
         });
         $("#items a").fluidbox();
      });
   });
   /* test end */
</script>
</head>
<body>


   <form id="list_form" action="/beautyline/mypage/history" method="POST">
      <input type="hidden" id=currentPage name="currentPage"
         value=${listVo.currentPage }> <input type="hidden" id=userNo
         name="userNo" value=${authUser.no }> <input type="hidden"
         id=pageType name="pageType" value="${pageType}">
   </form>

   <c:import url="/WEB-INF/views/include/header.jsp" />

   <div id="ad">
      <h2 class="text-center">
         <small id="ment">고객님만을 위한 <br> 추천제품
         </small>
      </h2>
      <div class="text-center " id="cosmetic">
         <!-- text-center -->
         <a href='${recommend.url }' target="_blank"> <img
            src='${recommend.src }' title="구매하러 가기"
            style="height: 250px; width: 170px;" />
         </a>
      </div>
   </div>

   <div class="container">
      <div class="row">
         <div class="box">
            <div class="col-lg-12">
               <hr>
               <h2 class="intro-text text-center">
                  <strong>방문내역</strong>
               </h2>
               <hr>
            </div>

            <button type="button" id="imageShow">사진으로 보기</button>

            <div class="col-lg-12" id="graph">
               <h2 class="col-lg-12 text-center">
                  <small id="selectedDay"></small>
               </h2>
               <div class="col-lg-3" style="height: 290px;"></div>
               <div class="col-lg-4 clumn">
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
               <div class="col-lg-3" id="color-item" style="height: 290px;">
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

            <div class="zoom-desc"></div>
            <div class="col-lg-12" id="visitRecords">
               <table class="table table-bordered table-hover table-responsive"
                  id="graphTable">
                  <thead>
                     <tr>
                        <th class="danger">번호</th>
                        <th class="danger">날짜</th>
                        <th class="danger">프로그램</th>
                        <th class="danger">미백점수</th>
                        <th class="danger">주름점수</th>
                        <th class="danger">피부탄력점수</th>
                        <th class="danger">수분점수</th>
                        <th class="danger">여드름점수</th>
                        <th class="danger">평균점수</th>
                     </tr>
                  </thead>
                  <c:set var='countList' value='${fn:length(listVo.visitList)}' />
                  <c:forEach var='visitVo' items='${listVo.visitList }'
                     varStatus='status'>
                     <tr>
                        <td>[${listVo.number - status.index }]</td>
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


               </table>

 	           <%--    <div class="hide" id="imageTable">
                  <div class="col-lg-12 center-block">
                 <br>
                     <c:forEach var='visitVo' items='${listVo.visitList }' varStatus='status'>

                        <a href="#" data-toggle="modal"
                           data-target=".dialog-${status.index}"
                           data-index="${status.index}"
                           class="center-block text-center content">
                           <div
                              class="image-block col-sm-2 img-responsive img-rounded center-block"
                              style="background: url(download?saveName=thumb_${visitVo.saveName}) no-repeat center top; background-size: cover;">
                              <p>${visitVo.regDate}</p>
                           </div>

                        </a>

                        <!--  Modal content for City Image -->
                        <div class="modal fade dialog-${status.index}"
                           id="dialog-${status.index}" tabindex="-1">
                           <div class="modal-dialog modal-lg">
                              <div class="modal-content">

                                 <!-- 사진 모달 헤더 -->
                                 <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal"
                                       aria-hidden="true">x</button>
                                    <h4 class="modal-title"
                                       id="myLargeModalLabel-${status.index}">상세정보</h4>
                                 </div>

                                 <!-- 사진 모달 바디 -->
                                 <div class="modal-body active">

                                    <!-- 사진 -->
                                    <a href="#"> <img
                                       src="download?saveName=${visitVo.saveName}"
                                       class="img-responsive img-rounded center-block"
                                       alt="Bootstrap template" />
                                    </a>

                                    <!-- 사진 모달 내용 -->
                                    <h3>${visitVo.programName }</h3>
                                    <h4>${visitVo.regDate }</h4>
                                    <p>${visitVo.memo }</p>
                                    <div class="text-center">
                                       <a href="#"> <span
                                          class="glyphicon glyphicon-thumbs-up"></span> Vote Up
                                       </a> <a href="#"> <span
                                          class="glyphicon glyphicon-thumbs-down"></span>Vote Down
                                       </a>
                                    </div>

                                 </div>
                              </div>
                           </div>
                        </div>
                     </c:forEach>
                  </div>
//               </div> --%>

               <!-- begin:paging -->
               <div class="pager">
                  <ul>
                     <c:if test="${listVo.beforePage > 0 }">
                        <li class="movepage" data-cp=${listVo.beforePage }>◀</li>
                     </c:if>
                     <c:forEach begin='${listVo.firstPage + 1 }'
                        end='${listVo.lastPage }' step='1' var='i'>
                        <c:choose>
                           <c:when test='${listVo.currentPage == i }'>
                              <li class="selected">${i }</li>
                           </c:when>

                           <c:otherwise>
                              <li class="movepage" data-cp=${i }>${i }</li>
                           </c:otherwise>
                        </c:choose>
                     </c:forEach>

                     <c:if test='${listVo.nextPage > 0 }'>
                        <li class="movepage" data-cp=${listVo.nextPage }>▶</li>
                     </c:if>
                  </ul>
               </div>
               <!-- end:paging -->

            </div>
         </div>
      </div>
   </div>

   <c:import url="/WEB-INF/views/include/footer.jsp" />
</body>
</html>