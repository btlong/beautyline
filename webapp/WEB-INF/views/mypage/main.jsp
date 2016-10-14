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

#user-name {
	font-weight: bold
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
							<div class="row">
								<div class="col-lg-4 col-lg-offset-3">
									<table class="table table-responsive text-center">
										<tr>
											<td>
												<a href="/beautyline/reserve/userreservelist" class="btn btn-warning btn-sm" >예약확인</a>
											</td>
											<td>
												<form method="post" action="history">
													<input class="btn btn-warning btn-sm" type="submit"
														value="방문내역">
												</form>
											</td>
											<td>
												<a href="/beautyline/user/modifyform" class="btn btn-warning btn-sm">회원정보 수정</a>
											</td>
										<tr>
									</table>
								</div>
							</div>

							<!-- 결제한 케어프로그램 남은 횟수  -->
							<div class="row">
								<span id="user-name">${userVo.name }&nbsp;</span><span>회원님</span>
							</div>

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
							<!----------------------->


							<!-- 예약확인 -->
							<div class="form-group">
								<div class="row">
									<div class="col-lg-2 text-left">
										<label>예약확인</label>
									</div>
									<div class="col-lg-10 text-right">
										<a href="/beautyline/reserve/userreservelist" class="btn btn-success btn-sm" >예약내역 더 보기</a>
									</div>
								</div>
								<div class="row">
									<!-- css 둥근 모서리 박스 : http://www.erzsamatory.net/4 -->
								</div>
							</div>
							<!----------->



							<!-- 방문내역확인 -->
							<div class="form-group">
								<div class="row">
									<div class="col-lg-2 text-left">
										<label>방문내역</label>
									</div>
									<div class="col-lg-10 text-right">
										<form method="post" action="history2">
											<input class="btn btn-success btn-sm" type="submit"
												value="방문내역 더 보기">
										</form>
									</div>
								</div>
							</div>
							<!----------->



							<!-- 회원정보수정 -->
							<div class="form-group">
								<div class="row">
									<div class="col-lg-2 text-left">
										<label>회원정보</label>
									</div>
									<div class="col-lg-10 text-right">
										<a href="/beautyline/user/modifyform" class="btn btn-success btn-sm" >회원정보 수정</a>
									</div>
								</div>
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

	<script>
		$(document).ready(function() {
			
			/* 쿠폰남은 횟수  */
			$('#one').text("0");
			$('#two').text("0");
			$('#three').text("0");
			$('#four').text("0");
			var userNo = ${userVo.no }; //coupon count 가져올 때 보낼 회원 번호
			//console.log(userNo);
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
			
			
			
		});
	</script>

</body>
</html>