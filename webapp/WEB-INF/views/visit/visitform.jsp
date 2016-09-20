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


<script>
	$(document).ready(function() {
		$("#search").click(function() {
			$('#myModal').modal({
				remote : 'visitorsearchform?name=${userVo.name}&${userVo.phone}'
			}, name,phone);
		})
	})

	$(document).ready(function() {
		$("#package").click(function() {
			$('#myModal').modal({
				remote : 'packagecharge'
			});
		})
	})

	$('#registor').on('click', function() {
		var $btn = $(this).button('loading')
		// business logic...
		$btn.button('reset')
	})
</script>
</head>
<body>
	<c:import url="/WEB-INF/views/include/header.jsp" />

	<!-- container -->
	<div class="container">
		<!-- Navigation -->
		<div class="box center-block">
			<div class="form-inline col-lg-10">
				<div class="form-group">

					<a href="" class="btn btn-danger btn-primary btn-sm left-block"
						id="package" data-target="#myModal3" data-toggle="modal"
						role="button">쿠폰 등록</a> <a
						class="btn btn-danger btn-primary btn-sm right-block"
						href="/beautyline/visit/details" role="button">내역 조회</a> <a
						class="btn btn-danger btn-primary btn-sm right-block"
						href="/beautyline/visit/registration" role="button">회원 등록</a>
				</div>
			</div>
			<form id="visitform" name="visitForm" method="post"
				action="/beautyline/visited">
				<div class="form-inline col-lg-10">
					<p class="bg-danger">

						<!-- userNo -->
						<label class="intro-text">회원번호</label> <input type="text"
							class="form-control" name="userNo" id="userNo">

						<!-- name -->
						<label class="intro-text">이름</label> <input type="text"
							class="form-control" name="name" id="name" placeholder="홍길동" value="${userVo.name}">

						<!-- phone -->
						<label class="intro-text">전화번호</label> <input type="text"
							class="form-control" name="phone" id="phone"
							placeholder="010-1234-1234" value="${userVo.phone}">

						<a href="" type="button" id="search" data-target="#myModal3"
							data-toggle="modal", method="get">검색</a>
						<!-- <a class="btn btn-danger btn-primary btn-sm"
							href="/beautyline/visit/visitorsearchform" role="button">검색</a> -->
					</p>
				</div>


				<!-- Model 호출 -->
				<div class="modal fade" id="myModal" role="dialog">
					<div class="modal-dialog">
						<div class="modal-content">
							<!-- remote ajax call이 되는영역 -->
						</div>
					</div>
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
								name="inlineRadioOptions" id="inlineRadio1" value="option1">
								쿠폰
							</label> <label class="radio-inline"> <input type="radio"
								name="inlineRadioOptions" id="inlineRadio2" value="option2">
								현장결제
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
			</form>
		</div>

	</div>



	<!-- 회원번호 : 텍스트박스  ,  이름 : 텍스트박스 		right 전화번호 : 텍스트박스  -->

	<c:import url="/WEB-INF/views/include/footer.jsp" />


</body>

</html>