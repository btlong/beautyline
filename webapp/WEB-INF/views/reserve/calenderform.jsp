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
<link href="/beautyline/bootstrap/css/bootstrap.css" rel="stylesheet">
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
<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.2/themes/smoothness/jquery-ui.css" />
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="http://code.jquery.com/ui/1.10.2/jquery-ui.js"></script>
<script type="text/javascript">
$(function(){
	$("#datepicker").datepicker({
		showOtherMonths: true,
		monthNames: ['01월', '02월', '03월', '04월', '05월', '06월', '07월', '08월', '09월', '10월', '11월', '12월' ],
		dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
		onSelect: function(dateText){
			//console.log(dateText);
			$("#dateName").val(dateText);
			//var selectDate = $(this).data("selectDate");
			
		}
		});
	
	
});
</script>

<style>
.ui-datepicker .ui-datepicker-prev{
	
}
.ui-datepicker{
	margin: 50px auto 0;
	width: 500px;
	height: auto;
	font: 10pt;
}
.ui-state-default{
	background: none;
	border: 0;
}
</style>
</head>
<body>

	<c:import url="/WEB-INF/views/include/header.jsp" />
	<div class="container">
		<div class="box">
		<div class="row">
		
				<div class="col-lg-12">
					<hr>
					<h2 class="intro-text text-center">
						<strong>Reserve</strong><br> 예약
					</h2>
					<hr>
				</div>
				<div class="col-lg-12 text-center">
					<div>
						<!-- 세션검사후 관리자이면 예약관리가 나와야한다. -->
						<c:choose>
							<c:when test='${not empty sessionScope.authUser }'>
								
									
							<div id="datepicker"> </div>
							<div id="col-sm-4 text-center">
								
								<div id="reservebtn">
									<form id="" name="" method="GET" action="/beautyline/reserve/reserveform">
										<label>예약일</label>
										<input  id="dateName" name="day" type="text" value=""><br>
										<input  id="btnreserve" class="btn btn-default btn-lg" type="submit" value="예약하기">
									
									</form>
								
									<a id="adminreserve" href="/beautyline/reserve/reservelist" class="btn btn-default btn-lg">예약관리</a>
								</div>
							</div>
							</c:when>

							<c:otherwise>
								<div class="col-lg-12 text-center" id="reservejoin">
									<p>예약은 회원만 가능합니다.</p>
									<a href="/beautyline/user/loginform" class="btn btn-default btn-lg">로그인하러가기</a>
									<a href="#" class="btn btn-default btn-lg">회원가입하러가기</a>
								</div>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
			</div>
		</div>
	</div>


	<c:import url="/WEB-INF/views/include/footer.jsp" />


</body>
</html>