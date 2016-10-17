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
.box-radius end {
	margin-bottom: 12px;
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
					<h2 class="intro-text text-center">
						<strong>My Page</strong><br>
						<br>${userVo.name }님의 마이페이지
					</h2>
					<hr>
				</div>


				<div class="col-lg-10 col-lg-offset-1">
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
										<a href="/beautyline/reserve/userreservelist"
											class="btn btn-success btn-sm">예약내역 더 보기</a>
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
										<table class="table table-striped">
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
														<td>${totalCount - status.index }</td>
														<td>${vo.progName }</td>
														<td>${vo.resDate }</td>
														<td>${vo.resTime }시-${vo.resTime + 1 }시</td>

														<td><input type="hidden" name="no" value="${vo.no }" />
															<a class="btn btn-default btn-xs delete-reserve" href=""
															data-target="#modalDeleteReserve" type="button"
															data-toggle="modal" data-backdrop="static" role="button"
															data-no="${vo.no}">삭제</a></td>
														<%-- 													<td><a href="reservedeleteform?no=${vo.no }"
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
										<form method="post" action="history2">
											<input class="btn btn-success btn-sm" type="submit"
												value="방문내역 더 보기">
										</form>
									</div>
								</div>
								<div class="row">
									<!-- css 둥근 모서리 박스 : http://www.erzsamatory.net/4 -->
									<div class="box-radius">그래프</div>
								</div>
								<div class="row">
									<!-- css 둥근 모서리 박스 : http://www.erzsamatory.net/4 -->
									<div class="box-radius end">방문내역 5건</div>
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
			var userNo = ${userVo.no}
			; //coupon count 가져올 때 보낼 회원 번호
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
		});
	</script>

</body>
</html>