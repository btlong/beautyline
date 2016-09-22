<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>방문 내역</title>

<!-- modal script -->
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!-- Bootstrap Core CSS -->
<link href="/beautyline/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Custom CSS -->
<link href="/beautyline/bootstrap/css/business-casual.css"
	rel="stylesheet">
<!-- visit css -->
<!-- <link href="/beautyline/beautyline/css/visit.css" rel="stylesheet">  -->

<!-- Fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Josefin+Slab:100,300,400,600,700,100italic,300italic,400italic,600italic,700italic"
	rel="stylesheet" type="text/css">
</head>
<body>

	<c:import url="/WEB-INF/views/include/header.jsp" />

	<!-- container -->
	<div class="container">
		<form id="visitform" name="visitForm" method="post"
			action="/beautyline/visited">
			<!-- Navigation -->
			<div class="box center-block">
				<div class="form-inline col-lg-10">
					<div class="form-group">

						<button type="button" class="btn btn-danger btn-primary btn-sm left-block" id="package"> 쿠폰 등록</button>
						<a class="btn btn-danger btn-primary btn-sm right-block"
							href="/beautyline/visit/details" role="button">내역 조회</a> <a
							class="btn btn-danger btn-primary btn-sm right-block"
							href="/beautyline/visit/registration" role="button">회원 등록</a>
					</div>
				</div>
			</div>

			<div class="box">
				<div class="form-inline col-lg-10">
					<p class="bg-danger">
						<!-- userNo -->
						<label class="intro-text">회원번호</label> <input type="text"
							class="form-control" name="userNo" id="userNo"
							value="${userVo.no}">

						<!-- name -->
						<label class="intro-text">이름</label> <input type="text"
							class="form-control" name="name" id="name" placeholder="홍길동"
							value="${userVo.name}">

						<!-- phone -->
						<label class="intro-text">전화번호</label> <input type="text"
							class="form-control" name="phone" id="phone"
							placeholder="010-1234-1234" value="${userVo.phone}">

						<!-- Trigger the modal with a button -->
						<button type="button" class="btn btn-info btn-lg" id="myModal">검색</button>
				</div>

				<!-- searchModal -->
				<div class="modal fade" id="searchModal" role="dialog">
					<div class="modal-dialog">

						<!-- Modal content-->
						<form class="form-inline" id="searchform" method="post"
							action="search">
							<div class="modal-content">
								<!-- header -->
								<div class="modal-header">
									<!-- 닫기(x) 버튼 -->
									<button type="button" class="close" data-dismiss="modal">×</button>
									<!-- header title -->
									<h4 class="modal-title text-center">
										<strong>회원검색</strong>
									</h4>
								</div>

								<!-- body -->
								<div class="modal-body">
									<select multiple class="text-center center-block "
										id="selected">
										<option disabled="disabled">이름
											&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;전화번호</option>
										<option disabled="disabled">------------------------------------------------</option>

										<!-- Ajax 들어옴 -->
									</select>

									<div class="text-center address-bar bg-danger">
										<label class="control-label col-sm-6 text-right container">
											<strong>이름 : </strong>
										</label> <label id="selectedName"
											class="control-label col-sm-6 text-left container"><strong></strong></label>
										<br> <label
											class="control-label col-sm-6 text-right container"><strong>전화번호
												:</strong></label> <label id="selectedPhone"
											class="control-label col-sm-6 text-left container"><strong></strong></label><br>
									</div>
								</div>

								<!-- Footer -->
								<div class="modal-footer">
									<button type="button" id="userSelect"
										class="center-block btn btn-danger">검색</button>
									<button id="userSelect" class="center-block btn btn-danger"
										type="submit">선택</button>
								</div>
							</div>
						</form>
					</div>
				</div>

				<!-- package Model-->
				<div id="packageModal" class="modal hide fade " tabindex="-1"
					role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
					<!-- header -->
					<div class="modal-header">
						<!-- 닫기(x) 버튼 -->
						<button type="button" class="close" data-dismiss="modal">×</button>
						<!-- header title -->
						<h4 class="modal-title text-center">
							<strong>패키지 충전</strong>
						</h4>
					</div>

					<!-- body -->
					<form class="form-inline" method="post" action="registration">

						<div class="modal-body">

							<div class="bg-danger ">
								<div class="row center-blocks">
									<label class="col-md-6 text-right">이름</label> <input
										class="col-md-3" type="text" value="">
								</div>
								<div class="row center-blocks">
									<label class="col-md-6 text-right">전화번호</label> <input
										class="col-md-3" type="text" value="">
								</div>
								<div class="row center-blocks">
									<label class="col-md-6 text-right">구매프로그램</label> <select
										class="col-md-3" id="careProgram">
										<option>여드름케어</option>
										<option>주름 케어</option>
										<option>화이트닝 케어</option>
										<option>여드름 케어</option>
									</select>
								</div>
								<div class="row center-blocks">
									<label class="col-md-6 text-right">횟수</label> <input
										class="col-md-2" type="text" value=""> <label
										class="col-md-1">회</label>
								</div>
								<div class="row center-blocks">
									<label class="col-md-6 text-right">금액</label> <input
										class="col-md-2" type="text" value="">
								</div>
							</div>
						</div>

						<!-- Footer -->
						<div class="modal-footer">

							<div class="col-lg-12 text-center form-group">
								<input class="btn btn-danger " type="submit" value="충전하기">
								<button type="button" class=" btn btn-danger"
									data-dismiss="modal">닫기</button>
							</div>
						</div>
					</form>
				</div>

				<div class="form-inline col-lg-10">
					<label class="intro-text">케어 프로그램</label> <select
						class="form-control">
						<option>선택</option>
						<option>베이직 케어</option>
						<option>미백 케어</option>
						<option>주름 케어</option>
						<option>여드름 케어</option>
					</select>

					<!-- 이벤트 처리 필요 (케어 프로그램 선택 완료시 횟수 보여줌) -->
					<c:choose>
						<c:when test=''>
							<label class="show" for="exampleInputPassword1">남은 횟수 </label>
						</c:when>
						<c:otherwise>
							<label class="hidden" for="exampleInputPassword1">남은 횟수 </label>

						</c:otherwise>
					</c:choose>
				</div>

				<div class="form-group col-lg-10">
					<label class="intro-text">날짜</label>
					<c:choose>
						<c:when test=''>
							<label class="show" for="exampleInputPassword1">날짜 표현 </label>
						</c:when>
						<c:otherwise>
							<label class="hidden" for="exampleInputPassword1">남은 횟수 </label>

						</c:otherwise>
					</c:choose>
				</div>

				<div class="form-group col-lg-10">
					<label class="intro-text"> 점수 </label>
					<div class="table-responsive">
						<table class="table">
							<tr class="danger">
								<th></th>
								<th>수분</th>
								<th>안티에이징</th>
								<th>민감도</th>
								<th>피부나이</th>
							</tr>
							<tr>
								<td></td>
								<td>88</td>
								<td>65</td>
								<td>34</td>
								<td>88</td>
							</tr>
						</table>
					</div>
				</div>

				<div class="form-group col-lg-10">
					<label class="intro-text" for="exampleInputFile">파일 업로드</label> <input
						type="file" id="exampleInputFile">
				</div>

				<div class="form-group col-lg-10">
					<div class="form-inline">
						<div class="col-md-8">
							<label class="intro-text">메모</label>
							<textarea class="form-control" rows="3"></textarea>
						</div>

						<div class="col-md-4">
							<label class="radio-inline"> <input type="radio"
								name="inlineRadioOptions" id="inlineRadio1" value="option1">쿠폰
							</label> <label class="radio-inline"> <input type="radio"
								name="inlineRadioOptions" id="inlineRadio2" value="option2">현장결제
							</label>
							<div class="form-inline">
								<label class="intro-text">금액</label> <input type="text"
									class="form-control" id="money">
								<button type="submit" class="btn btn-default" id="registor"
									data-loading-text="등록중...">등록</button>
							</div>
						</div>
					</div>
				</div>

			</div>
		</form>
	</div>

	<!-- 회원번호 : 텍스트박스  ,  이름 : 텍스트박스 		right 전화번호 : 텍스트박스  -->
	<c:import url="/WEB-INF/views/include/footer.jsp" />

</body>
</html>

<script>
	$(document).ready(function() {
		/* search Modal Click */
		$("#myModal").on("click", function() {
			var trString = "";
			var name = $('#name').val();
			var phone = $('#phone').val();

			var userVo = {
				"name" : name,
				"phone" : phone
			};
			$.ajax({
				url : "visitorsearchform",
				type : "POST",
				data : JSON.stringify(userVo),
				contentType : "application/json",
				success : function(visitorList) {
					$.each(visitorList, function(index, userVo) {
						trString += "<option>";
						trString += userVo.name;
						trString += "&nbsp;|&nbsp;&nbsp;";
						trString += userVo.phone;
						trString += "</option>";
					});
					$("#selected").append(trString);
					$("#searchModal").modal();
				}
			});
		});

		/* 해당 고객 선택시 */
		$("#selected").change(function() {

			var str = "";
			// 선택된 값 불러오기
			$("#selected option:selected").each(function(idx, item) {
				str += $(this).text() + " ";
			});

			// 이름과 전화번호 분류
			var split = str.split('|');

			// 이름과 전화번호 해당 Id에 적용
			var selectedName = $("#selectedName").text(split[0]);
			var selectedPhone = $("#selectedPhone").text(split[1]);
			
			/* 해당 고객 선택 완료시 */
			$("#userSelect").on("click", function() {
				var trString = "";
				/* var name = $('#selectedName').val(); 
				var phone = $('#selectedPhone').val(); */

				var userVo = {
					"name" : selectedName,
					"phone" : selectedPhone
				};
				console.log(userVo);
				$("#searchModal").modal('hide');
				/* $.ajax({
					url : "visitorsearchform",
					type : "POST",
					data : JSON.stringify(userVo),
					contentType : "application/json",
					success : function(visitorList) {
						$.each(visitorList, function(index, userVo) {
							trString += "<option>";
							trString += userVo.name;
							trString += "&nbsp;|&nbsp;&nbsp;";
							trString += userVo.phone;
							trString += "</option>";
						});
						$("#selected").append(trString);
						$("#searchModal").modal('hide');
					}
				}); */ 
			});
			
		});

		/* 해당 고객 선택 완료시 */
	/* 	$("#userSelect").on("click", function() {
			var trString = "";
			var name = $('#selectedName').val(); 
			var phone = $('#selectedPhone').val();

			var userVo = {
				"name" : selectedName,
				"phone" : selectedPhone
			};
			console.log(userVo);
			$("#searchModal").modal('hide'); */
			/* $.ajax({
				url : "visitorsearchform",
				type : "POST",
				data : JSON.stringify(userVo),
				contentType : "application/json",
				success : function(visitorList) {
					$.each(visitorList, function(index, userVo) {
						trString += "<option>";
						trString += userVo.name;
						trString += "&nbsp;|&nbsp;&nbsp;";
						trString += userVo.phone;
						trString += "</option>";
					});
					$("#selected").append(trString);
					$("#searchModal").modal('hide');
				}
			});
		});*/

		/* package Modal */
		$("#package").on("click", function() {
			$("#packageModal").modal();
		});

	});
</script>
