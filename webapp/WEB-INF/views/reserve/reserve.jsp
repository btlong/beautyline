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

<!-- Bootstrap Core CSS -->
<link href="/beautyline/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Custom CSS -->
<link href="/beautyline/bootstrap/css/business-casual.css"
	rel="stylesheet">
<link href="/beautyline/beautyline/css/include.css" rel="stylesheet">
<link href="/beautyline/beautyline/css/reserve.css" rel="stylesheet">


<!-- Fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Josefin+Slab:100,300,400,600,700,100italic,300italic,400italic,600italic,700italic"
	rel="stylesheet" type="text/css">

<!-- Datepicker -->
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.10.2/themes/smoothness/jquery-ui.css" />
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="http://code.jquery.com/ui/1.10.2/jquery-ui.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<style>
.form-group div {
	margin-top: 30px;
}

.form-group div select {
	padding-top: 30px;
	height: 300px;
}

.form-control {
	text-align: center;
	border-width: 1px;
	background: transparent;
	overflow: hidden;
	color: black;
}

#selDate {
	text-align: center;
}
#datepicker {
	padding-bottom : 50px;
}
#resInfoBox {
	border: 1px solid red;
	padding: 25px;
	margin-left: 15px;
	margin-right: 15px;
	border-radius: 4px;
	height: 300px;
	
}

#resInfoBox hr {
	margin-top: 5px;
	margin-bottom: 5px;
}

#resInfoBox p {
	font-size: 14px;
	margin-bottom: 5px;
}

#resInfo {
	background: transparent;
	padding-bottom: 10px;
}
#resInfo p{
	display: inline;
}
#resInfo div{
	text-align:left;
	margin: 5px;
}

#resSelOption {
	color: #CFCFCF;
}

.ui-datepicker .ui-datepicker-prev {
	
}

.ui-datepicker {
	margin: 50px auto 0;
	width: 500px;
	height: auto;
	font: 10pt;
}

.ui-state-default {
	background: none;
	border: 0;
}
#name {
	width: 100px;
	text-align: left;
}
#lbtxt {
	margin: 0;
}
#UserSelected {
	text-align: left;
	border-width: 1px;
	background: transparent;
	color: black;
	width: 40%;
}
#myModal3 {
	padding-top: 10%;
}

#modalbtn{
	display: inline
	text-align: center;
}
</style>
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

	<!-- 세션검사후 관리자이면 예약관리가 나와야한다. -->
		<c:choose>
			<c:when test='${not empty sessionScope.authUser }'>
				<div class="col-lg-12 text-right">
					<%-- c:if test="${sessionScope.authUser.isAdmin == 'a' }">
					</c:if>  관리자 세션 검사--%>
					<a id="adminreserve" href="/beautyline/reserve/reservelist" class="btn btn-default btn-lg">예약관리</a>
				</div>
				
<!-- 관리자 일 경우 회원 이름으로 검색 -->
				<div class="form-inline col-lg-12">
					<!-- name -->
					<label id="lbtxt" >회원 이름 : &nbsp</label> 
					<input type="text" class="form-control" name="name" id="name" value="${userVo.name}">
					<button class="btn btn-info" id="searchUser">검색</button>
				</div>
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
					<div class="form-group">
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
								<div id="resInfo1"><p>[회원]&nbsp</p> <p class="userSelectCk"></p></div>
								<div id="resInfo2">[프로그램 명]&nbsp <p class="progNameCk"></p></div>
								<div id="resInfo3">[시간]&nbsp <p class="resTimeCk"></p></div>
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





<!-- Modal -->
<!-- 회원검색 모달 -->
	<div class="modal fade" id="myModal3">
		<div class="modal-dialog">
		
		<!-- modal content -->
		<form class="form-inline" id="searchform" method="post"action="search">
			<div class="modal-content">
				
			<!-- header -->
				<div class="modal-header">
					<!-- 닫기(x) 버튼 -->
					<button type="button" class="close" data-dismiss="modal">×</button>
					<!-- header title -->
					<h4 class="modal-title text-center">
						<!-- Ajax처리 -->
						<strong>회원검색</strong>
					</h4>
				</div>
				
			<!-- body -->
				<div class="modal-body">
					<select size="5" class="text-center center-block " id="UserSelected" name="UserSelected">
					</select>
				</div>
				
			<!-- Footer -->
				<div class="modal-footer">
				<div class="form-group" id="modalbtn">
					<button id="userSelect" class="center-block btn btn-danger" type="button">선택</button>
					<button data-dismiss="modal" class="center-block btn btn-danger">취소</button>
				</div>
				</div>				
			</div>
		</form>
		</div>
	</div>		


</body>
<script type="text/javascript"> 
$(document).ready(function(){

	/* 관리자의 회원검색  */	
	var nameSearch = ""; //회원검색시 입력된 값
	
		$("#searchUser").on("click",function(){
			nameSearch = $("#name").val();
			if( nameSearch == ""){
				alert("검색할 회원 이름을 입력해 주세요.");
				return false;
			}
			$("#myModal3").modal();
			$("#UserSelected option").remove();
			
			var trString2 = "";

			$.ajax({
				url : "reserveusersearch",
				type: "POST",
				data: {"name": nameSearch },
				dataType: "JSON",
				success: function(userList){
					$.each(userList, function(index, userVo){
						trString2 += "<option value='" + userVo.no + "'>";
						trString2 += userVo.name;
						trString2 += "&nbsp:&nbsp";
						trString2 += userVo.phone;
						trString2 += "</option>";
						
					});
					$("#UserSelected").append(trString2)
				}
				
			});
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


/* 예약 세부 내용 */

	//선택된 회원 정보 
	var userSelectCk = $('.userSelectCk');
	$(document).on("change", "select[name=UserSelected]", function() {
		var UserSelected = $("select[name=UserSelected] option:selected").text();
		userSelectCk.text(UserSelected);
	});
	
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
	
	
	
/* 모달에서 화면으로 값 가져오기 */
var userNo = "";
var userName = "";
$("#userSelect").on("click", function(){
	userNo = $("select[name=UserSelected] option:selected").val();
	userName = $("select[name=UserSelected] option:selected").text();
	$("#myModal3").modal('hide'); // 숨키기.
});
	
/* 예약내용 보내기 */
$("#reservebtn").on("click",function(){
	var progName2 = $("select[name=progName] option:selected").text();
	var resTime2 = $("select[name=resTime] option:selected").text();
	var resTime3 = $("select[name=resTime] option:selected").val(); 
	//선택안했을 때 
	if( nameSearch == ""){
		alert("회원 이름을 입력해 주세요.");
		return false;
	}
	
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
	//값 넘기기 ( 선택한 날짜: resDateText, 프로그램 명:progName2, 시간:resTime3, 회원번호:userNo )
	$.ajax({
		url: "reserveData",
		type: "POST",
		data: JSON.stringify(reserveVo),
		success : function(count){
			var insReturn = count;
		}
	});
});
	
});
</script>

</html>
