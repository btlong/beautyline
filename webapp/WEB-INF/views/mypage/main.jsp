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

<style type="text/css">
.form-group {
	margin-top: 30px
}
</style>

<!-- jQuery -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<!-- Bootstrap Core JavaScript -->
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/beautyline/bootstrap/js/jquery.js"></script>
</head>

<body>
	<c:import url="/WEB-INF/views/include/header.jsp" />
	<div class="container">
		<div class="row">
			<div class="box">
				<div class="col-lg-12">
					<hr>
					<h1 class="text-center text-center">
						<strong>마이페이지</strong>
					</h1>
					<hr>
				</div>

				
				<div class="col-lg-10 col-lg-offset-1">
<!-- 세션검사 -->
		<c:choose>
			<c:when test='${not empty sessionScope.authUser }'>

					<!-- <div class="row">
						<div class="col-lg-4  text-left">
						<form id="reserve" method="post" action="#">
							<label class="sr-only" for="reservebtn">예약확인</label>
							<button id="reservebtn" class="btn btn-default btn-lg">예약확인</button>
							</form>
						</div>
						<div class="col-lg-3 col-lg-offset-1 text-center">
						<form id="visit" method="post" action="#">
							<label class="sr-only" for="visitbtm">방문내역</label>
							<button id="visitbtn" class="btn btn-default btn-lg"
								type="submit">방문내역</button>
								</form>
						</div>
						<div class="col-lg-3 col-lg-offset-1 text-right">
						<form id="modifyuser" method="post" action="#">
							<label class="sr-only" for="modifyuserbtn">회원정보 수정</label>
							<button id="modifyuserbtn" class="btn btn-default btn-lg"
								type="submit">회원정보 수정</button>
						</form>
						</div>
					</div>	 -->
					
					<div class=".col-lg-4 .col-lg-offset-4">
					<table class="table table-responsive text-center">
					<tr>
						<td>
							<form method="post" action="#">
								<input class="btn btn-warning btn-sm" type="submit" value="예약확인">
							</form>
						</td>
						<td>
							<form method="post" action="#">
								<input class="btn btn-warning btn-sm" type="submit" value="방문내역">
							</form>
						</td>
						<td>
							<a href="/beautyline/user/modifyform"  class="btn btn-warning btn-sm" 
										>회원정보 수정</a>
						</td>
						
					<tr>
					</table>
					</div>

					<!-- program name,coupon count  -->
					<div class="form-group">
					<div class="form-group">
						<span class="userName"></span>&nbsp;회원님
					</div>
						<table class="table table-bordered table-responsive">
							<thead>
								<tr class="danger">
									<th>프로그램이름</th>
									<th>잔여횟수</th>
									<!-- <th></th> -->
								</tr>
							</thead>
							<!-- 리스트영역 -->
							<tbody>
								<tr>
									<td>베이직 케어</td>
									<td id="one"></td>
								</tr>
								<tr>
									<td>미백 케어</td>
									<td id="two"></td>
								</tr>
								<tr>
									<td>주름 케어</td>
									<td id="three"></td>
								</tr>
								<tr>
									<td>여드름 케어</td>
									<td id="four"></td>
								</tr>
								<!-- <tr>
									<td><input type=hidden id="coupon-userno" value=""></td>
								</tr> -->
							</tbody>
							<tfoot></tfoot>
						</table>
					</div>
					
					<div class="form-group">
						
								<div class="row">
									<div class="col-lg-2 text-left">
										<label>예약확인</label>
									</div>
									<div class="col-lg-10 text-right">
										<form method="post" action="#">
											<input class="btn btn-default btn-sm" type="submit"
												value="예약내역 더 보기" placeholder=".col-xs-2">
										</form>	
									</div>
								</div>
							
						
								<div class="row">
									<div class="col-lg-2 text-left">
										<label>방문내역</label>
									</div>
									<div class="col-lg-10 text-right">
										<form method="post" action="#">
											<input class="btn btn-default btn-sm" type="submit"
												value="방문내역 더 보기" placeholder=".col-xs-2">
										</form>
									</div>
								</div>
							
					</div>				
					
					
					<div class="form-group">
						<div class="row">
							<div class="col-lg-2 text-left">
								<label>회원정보</label>
							</div>
							<div class="col-lg-10 text-right">
							
									<a href="/beautyline/user/modifyform" class="btn btn-default btn-sm" 
										>회원정보 수정</a>
								
							</div>
						</div>
						<table class="table table-bordered table-responsive">
							<thead>
								<tr class="danger">
									<th colspan=2>고객님의 연락처를 확인 해 주세요</th>
								</tr>
							</thead>
							<!-- 리스트영역 -->
							<tbody>
								<tr>
								
									<td><span class="glyphicon glyphicon-phone"></span>&nbsp; 휴대폰 :&nbsp; <span class="userPhone"></span><!-- 휴대폰번호 --></td>
									<td><span class="glyphicon glyphicon-envelope"></span>&nbsp; 이메일 :&nbsp; <span class="userEmail1"></span>@<span class="userEmail2"></span><!-- 이메일 --></td>
								</tr>
								<tr>
									<td>수신동의 :&nbsp; <span class="userAgrMessage"></span><!-- 수신동의 --></td>
									<td>수신동의 :&nbsp; <span class="userAgrEmail"></span><!-- 수신동의 --></td>
								</tr>
								<!-- <tr>
									<td><input type=hidden id="coupon-userno" value=""></td>
								</tr> -->
							</tbody>
							<tfoot></tfoot>
						</table>
					</div>
					
					
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

	<script>
	$(document).ready(function(){
		var userNo = '${sessionScope.authUser.no }'; //coupon count 가져올 때 보낼 회원 번호
		console.log('${sessionScope.authUser}');
		
		var userName = $('.userName');
		var userPhone = $('.userPhone');
		var userEmail1 = $('.userEmail1');
		var userEmail2 = $('.userEmail2');
		var userAgrMessage = $('.userAgrMessage');
		var userAgrEmail = $('.userAgrEmail');
		userName.text('${sessionScope.authUser.name}');	
		userPhone.text('${sessionScope.authUser.phone}');	
		userEmail1.text('${sessionScope.authUser.email1}');	
		userEmail2.text('${sessionScope.authUser.email2}');	
		userAgrMessage.text('${sessionScope.authUser.agrMessage}');	
		userAgrEmail.text('${sessionScope.authUser.agrEmail}');	
		
		

			//console.log(this);//.couponview 버튼
			$('#one').text("0");
			$('#two').text("0");
			$('#three').text("0");
			$('#four').text("0");
			//var userNo = $(this).data("userno");//userno 소문자여야함
			//console.log(userNo);//userno 받아옴 
			$.ajax({
				url : "selectCoupon",
				type : "POST",
				data : {"userNo" : userNo}, 
				success : function(couponList) {
					console.log(couponList);
					$.each(couponList, function(index, couponVo) {
						if (couponVo.programNo == 1) {
							$('#one').val(couponVo.count);
						} else if (couponVo.programNo == 2) {
							$('#two').val(couponVo.count);
						} else if (couponVo.programNo == 3) {
							$('#three').val(couponVo.count);
						} else if (couponVo.programNo == 4) {
							$('#four').val(couponVo.count);
						} else {
							// count가 0으로가 나도오록 
						}
					});
				}
			});
		});
	</script>

</body>
</html>