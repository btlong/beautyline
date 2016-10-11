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

<!-- Custom CSS -->
<link href="/beautyline/bootstrap/css/business-casual.css" rel="stylesheet">
<link href="https://maxcdn.bootstrapcdn.com/bootswatch/3.3.7/flatly/bootstrap.min.css" rel="stylesheet" integrity="sha384-+ENW/yibaokMnme+vBLnHMphUYxHs34h9lpdbSLuAwGkOKFRl4C34WkjazBtb7eT" crossorigin="anonymous">
<link href="/beautyline/beautyline/css/include.css" rel="stylesheet">

<!-- Fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Josefin+Slab:100,300,400,600,700,100italic,300italic,400italic,600italic,700italic"
	rel="stylesheet" type="text/css">
	



<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.4/jquery.min.js" charset=utf-8"></script>
<style type="text/css">

   div.clumn {width:360px; float:left;overflow:visible;}
   
   
   div.graphBox2 {margin-bottom:30px;}
   div.graphBox2 ul {width:340px; height:250px; border:1px solid #e8e8e8; list-style:none; margin-top:10px; margin-bottom:10px; position:relative;}
   div.graphBox2 ul li {width:20px; height:1px; position:relative; overflow: visible !important;}
   div.graphBox2 ul li span {position:absolute; top:-15px; left:-9px; width:30px; font-size:10px; overflow:visible; text-align:center; font-family:tahoma;}
   div.graphBox2 ul li.g1 {position:absolute; left:80px; bottom:5px; background:#ec008c;}
   div.graphBox2 ul li.g2 {position:absolute; left:120px; bottom:5px; background:#662d91;}
   div.graphBox2 ul li.g3 {position:absolute; left:160px; bottom:5px; background:#0d004c;}
   div.graphBox2 ul li.g4 {position:absolute; left:200px; bottom:5px; background:#f7941d;}
   div.graphBox2 ul li.g5 {position:absolute; left:240px; bottom:5px; background:#8dc63f;}
   div.graphBox2 input.link {cursor:pointer;}
   
   .counter {margin-left: 5px; }
      
   .movepage:hover {cursor:pointer;}
  	div.pager  ul li 			{ display:inline-block; margin:5px 0; width:20px ; font-weight:bold; }
	div.pager  ul li.selected { text-decoration: underline; color:#f40808 }

   
 
</style>
<script type="text/javascript">

	


   $(document).ready(function(){
           //$("div.graphBox ul").animate({height:"80px"}, 100);
           $(".graphBox2 li span").text('0');
           $(".graphBox2 .g1").animate({height:(max1*2)+"px"}, 250);
           $(".graphBox2 .g2").animate({height:(max2*2)+"px"}, 200);
           $(".graphBox2 .g3").animate({height:(max3*2)+"px"}, 150);
           $(".graphBox2 .g4").animate({height:(max4*2)+"px"}, 100);
           $(".graphBox2 .g5").animate({height:(max5*2)+"px"}, 50);
           $(".graphBox2 li span").fadeIn(500);
           var opacity = 1;
           $(".graphBox2 li").css("opacity", opacity);
           $(".graphBox2 li").hover(function(){
               $(this).css("opacity", 0.5);
           }, function(){
               $(this).css("opacity", opacity);
           });
           incCounter2();                
   });
       
   
   // 숫자 카운터(%값)
   var max1 = 50;
   var max2 = 50;
   var max3 = 50;
   var max4 = 50;
   var max5 = 50;
               
   function incCounter2(){
	   console.log("counter");
       var currCount1 = parseInt($('.graphBox2 .counter1').html());
       var currCount2 = parseInt($('.graphBox2 .counter2').html());
       var currCount3 = parseInt($('.graphBox2 .counter3').html());
       var currCount4 = parseInt($('.graphBox2 .counter4').html());
       var currCount5 = parseInt($('.graphBox2 .counter5').html());
       if (currCount1 != max1){
           $('.graphBox2 .counter1').text(currCount1+1+"점");
           setTimeout('incCounter2()',0);
       } else if (currCount2 != max2){
           $('.graphBox2 .counter2').text(currCount2+1+"점");
           setTimeout('incCounter2()',0);
       } else if (currCount3 != max3){
           $('.graphBox2 .counter3').text(currCount3+1+"점");
           setTimeout('incCounter2()',0);
       } else if (currCount4 != max4){
           $('.graphBox2 .counter4').text(currCount4+1+"점");
           setTimeout('incCounter2()',0);
       } else if (currCount5 != max5){
           $('.graphBox2 .counter5').text(currCount5+1+"점");
           setTimeout('incCounter2()',0);
       }
   }
   
   
   
   $(function() {
		$(".movepage").click(function() {
			console.log("click");
			var cp = $(this).data("cp");
			
			$("#currentPage").val(cp);
			$("#list_form").submit();
			
		});
	});

</script>





</head>
<body>


	<form id="list_form" action="/beautyline/mypage/history" method="POST">
		<input type="hidden" id=currentPage name="currentPage" value=${listVo.currentPage }>
		<input type="hidden" id=userNo name="userNo" value=${authUser.no }>
	</form>




	<c:import url="/WEB-INF/views/include/header.jsp" />

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
								
				<div class="col-lg-12">
					<h2 class="col-lg-12 text-center">
						<small>최근 5회 평균 점수</small>
					</h2>
					<div class="col-lg-4" style="height:290px;">
					</div>
					<div class="col-lg-12 clumn">            
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
					
				</div>
				
				<div class="col-lg-12" id="visitRecords">
					<table class="table table-bordered table-hover table-responsive" >
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
						<c:set var='countList' value='${fn:length(listVo.visitList)}'/>
						<c:forEach var='visitVo' items='${listVo.visitList }' varStatus='status'>
							<tr>
								<td>[${listVo.number - status.index }]</td>
								<td>${visitVo.regDate }</td>
								<td>${visitVo.programName }</td>
								<td>${visitVo.whiteningScore }</td>
								<td>${visitVo.whinkleScore }</td>
								<td>${visitVo.elasticScore }</td>
								<td>${visitVo.moistureScore }</td>
								<td>${visitVo.acneScore }</td>
								<td>${visitVo.averageScore }</td>
							</tr>
						</c:forEach>	
											
											
					</table>
					
					<!-- begin:paging -->
					<div class="pager">
						<ul>
							<c:if test="${listVo.beforePage > 0 }">
								<li class="movepage" data-cp=${listVo.beforePage }> ◀  </li>
							</c:if>						
							<c:forEach begin='${listVo.firstPage + 1 }' end='${listVo.lastPage }' step='1' var='i'>
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