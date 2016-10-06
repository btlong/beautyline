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

<title>예 약</title>

<!-- Custom CSS -->
<link href="/beautyline/bootstrap/css/business-casual.css"rel="stylesheet">
<link href="https://maxcdn.bootstrapcdn.com/bootswatch/3.3.7/flatly/bootstrap.min.css" rel="stylesheet" integrity="sha384-+ENW/yibaokMnme+vBLnHMphUYxHs34h9lpdbSLuAwGkOKFRl4C34WkjazBtb7eT" crossorigin="anonymous">
<!-- Modal jquery -->
<link rel="stylesheet"href="http://code.jquery.com/ui/1.10.2/themes/smoothness/jquery-ui.css" />
<link href="/beautyline/beautyline/css/reserve.css" rel="stylesheet">
<link href="/beautyline/beautyline/css/include.css" rel="stylesheet">

<!-- Fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Josefin+Slab:100,300,400,600,700,100italic,300italic,400italic,600italic,700italic"
	rel="stylesheet" type="text/css">



<!-- Datepicker -->
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="http://code.jquery.com/ui/1.10.2/jquery-ui.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
 

</head>
<body>

<c:import url="/WEB-INF/views/include/header.jsp" />
<div class="container">
	<div class="row">
	<div class="box">
<!-- 헤더 -->
		<div class="col-lg-12">
			<hr>
			<h2 class="intro-text text-center">
			<strong>Reserve</strong><br> 예약
			</h2>
			<hr>
		</div>
<!-- 내용 -->
		<div class="col-lg-12 text-center">

	<!-- 세션검사 -->
		<c:choose>
			<c:when test='${not empty sessionScope.authUser }'>
				
				
<!-- 달력 -->
				<div class="col-lg-12 text-center">
					<div id="datepicker"></div>
					</div>
				<div class="col-md-4"></div>
				<div class="col-md-4">	
					<h4 id="txt1">예약하고자 하는 날짜를 선택하세요</h4> 
				</div>
				
<!-- 예약세부 내용 -->
	<!-- 선택된 날짜 보여짐 -->
				<div class="hide" id="resInfoDiv">
					<div class="col-lg-12 text-center">
						<h2 class="selDateView"></h2>
					</div>
	
					<div class="col-md-2"></div>
	<!-- 프로그램 선택 -->
					<div class="form-group" id="selBoxgroup">
						<div class="col-md-3">
							<select class="form-control" name="progName" size="3" id="progName">
								<option>베이직 케어</option>
								<option>미백 케어</option>
								<option>주름 케어</option>
								<option>여드름 케어</option>
							</select>
						</div> 
	<!-- 시간 선택 -->			
						<div class="col-md-3">
							<select class="form-control" name="resTime" size="3" id="resTime" >							
								
							</select>
							
						</div>
	<!-- 예약 정보 -->
						<div class="col-md-3" id="resInfoBox">
							<div id="resInfo">
								<h3>예약 정보</h3>
								<hr>
								
								<p class="resDateText"></p>
								<hr>
								<div id="resInfo1"><p>[회원]&nbsp</p> <p class="userSelectCk"></p><p>님</p></div>
								<div id="resInfo2"><p>[프로그램 명]&nbsp</p><p class="progNameCk"></p></div>
								<div id="resInfo3"><p>[시간]&nbsp</p> <p class="resTimeCk"></p></div>
							</div>
						
	<!-- 예약버튼, 취소버튼 -->	
							<button class="btn btn-primary" id="reservebtn" type="submit" >예약하기</button>
							<button class="btn btn-danger" type="button" onclick="location.href='/beautyline/main'">취소</button>						
					</div>
				</div>
				</div>
				
			</c:when>
			<c:otherwise>
				<h4>온라인 예약은 회원만 가능합니다.</h4>
				<c:import url="/WEB-INF/views/include/login.jsp" />
			</c:otherwise>
			</c:choose>
		</div>
	</div>
	</div>
</div>

<c:import url="/WEB-INF/views/include/footer.jsp" />

		
</body>
<script type="text/javascript"> 
$(document).ready(function(){
	var userNo = '${sessionScope.authUser.no }'; //예약할때 보낼 회원 번호
	console.log('${sessionScope.authUser}');
	var userName = ""; //예약할때 보낼 회원이름
	
/* 예약 세부 내용 */

	//프로그램 선택체크
	var progNameCk = $('.progNameCk');
	$(document).on("change", "select[name=progName]", function() {
		var progName = $("select[name=progName] option:selected").text();
		progNameCk.text(progName);
	});
	
	//시간 선택체크
	var resTimeCk = $('.resTimeCk');
	$(document).on("change", "select[name=resTime]", function() {
		var resTime = $("select[name=resTime] option:selected").text();
		var resTimeVal = $("select[name=resTime] option:selected").val();
		resTimeCk.text(resTime);
	});


	
/* 달력 및 예약 세부내용 출력 */
	var resDateText =""; //선택한 날짜 (전역변수)
	var resDateList="";
	$("#datepicker").datepicker({
		showOtherMonths: true,
		monthNames: ['01월', '02월', '03월', '04월', '05월', '06월', '07월', '08월', '09월', '10월', '11월', '12월' ],
		dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
		minDate: '-0d',
		dateFormat: 'yy-mm-dd',
		onSelect: function(dateText){ //날짜선택 시
			
		//요일
			var d = new Date(dateText);
			var week = new Array('일','월','화','수','목','금','토');
			var day = week[d.getDay()];
			
			var dateArr = dateText.split("-");
			rsDateText = "";
			resDateText= "";
			
			resDateText += dateArr[0] + "년 ";
			resDateText += dateArr[1] + "월 ";
			resDateText += dateArr[2] + "일 ";
			
			resDateText += day + "요일";
			
			$(".resDateText").text(resDateText);
			$('.selDateView').text(resDateText); 
		
			//선택한 날짜 설정
			resDate = dateText;
			
			// 예약세부내용 화면 보이게
			$("#resInfoDiv").removeClass("hide");
			
			//선택한 날짜를 이용해 db에서 list를 받아온다. 
			$.ajax({
				url : "reserveDay",
				type : "POST",
				data : {"resDateText": resDateText },
				dataType: "JSON",
				success : function(resSelList){
					//선택된 회원 정보 회원이름
					var userSelectCk = $('.userSelectCk');
					userSelectCk.text('${sessionScope.authUser.name}');
					
					//select option 초기화
					$("#resTime option").remove();
					
					var trString = "";
					var now = new Date();
					var nowHour = now.getHours();
					nowHour *= 1;
					//오늘날짜 비교를 위한 값 구하기
					var nowDate = $.datepicker.formatDate('yy년 mm월 dd일 ', new Date());
					var d2 = new Date(new Date());
					var week2 = new Array('일','월','화','수','목','금','토');
					var day2 = week[d2.getDay()];
					
					nowDate += day2 + "요일";

					for( var i = 10; i <= 21 ; i++ ){
						trString += "<option value='" + i + "' id='resTime"+ i + "'" ;
						
						//예약된 시간 검사
						  $.each(resSelList, function(index, reserveVo){
							if( i == reserveVo.resTime ){
								 trString += "disabled"; 
							}
						  }); 
						//오늘일때  지금 시간 이전은 예약 못함 처리
						if( resDateText == nowDate ){
							if( i <= nowHour ){
								trString += " disabled";
							}	 
						}
						 
						trString += ">" + i + ":00 - " + (i+1) + ":00 " + "</option>" ;
					}
					
					$("#resTime").append(trString);
				}
			});
		}
	});

	
/* 예약내용 보내기 */
$("#reservebtn").on("click",function(){
	var progName2 = $("select[name=progName] option:selected").text();
	var resTime2 = $("select[name=resTime] option:selected").text();
	var resTime3 = $("select[name=resTime] option:selected").val(); 
	//선택안했을 때 
	if( progName2 == "" ){
		alert("프로그램을 선택하세요");
		return false;
	};
	if( resTime2 == "" ){
		alert("시간 선택하세요");
		return false;
	};
	
	var reserveVo = {
		"resDate" : resDateText,
		"progName" : progName2,
		"resTime" : resTime3,
		"userNo" : userNo
	};
	//값 넘기기 ( F선택한 날짜: resDateText, 프로그램 명:progName2, 시간:resTime3, 회원번호:userNo )
	$.ajax({
		url: "reserveData",
		type: "POST",
		data: JSON.stringify(reserveVo),
		contentType : "application/json",
		success : function(count){
			if( count >= 0 ){
				location.href = "reserveok";
			}
		}
	});
});
	
});
</script>

</html>
