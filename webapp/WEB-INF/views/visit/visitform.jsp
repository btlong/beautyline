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

<!-- Bootstrap Core CSS -->
<link href="/beautyline/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Custom CSS -->
<link href="/beautyline/bootstrap/css/business-casual.css"
	rel="stylesheet">

<!-- Fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Josefin+Slab:100,300,400,600,700,100italic,300italic,400italic,600italic,700italic"
	rel="stylesheet" type="text/css">


<!-- visit css -->
<link href="/beautyline/assets/css/visit.css" rel="stylesheet">

</head>
<body>
	<%-- <c:import url='/WEB-INF/views/include/header.jsp'></c:import> --%>

	<!-- container -->
	<div class="container">
		<!-- Navigation -->
		<div class="box">
			<div class="form-inline">
				<div class="col-md-10">
					<a> <input type="button" value="쿠폰등록"></a>
				</div>
				<div class="col-md-1">
					<a> <input type="button" value="내역조회"></a>
				</div>
				<div class="col-md-1">
					<a><input type="button" value="회원등록"> </a>
				</div>
			</div>
			<form id="visitform" name="visitForm" method="post"
				action="/mysite4/user/visited">
				<div class="form-inline">
					<p class="bg-danger">

						<!-- userNo -->
						<label for="userno">회원번호</label> <input type="text"
							class="form-control" id="userNo">

						<!-- name -->
						<label for="name">이름</label> <input type="text"
							class="form-control" id="name" placeholder="홍길동">

						<!-- phone -->
						<label for="name">전화번호</label> <input type="text"
							class="form-control" id="phone" placeholder="010">
						<button type="button" class="btn btn-default">검색</button>
					</p>
				</div>

				<div class="form-inline">

					<label>케어 프로그램</label> <select class="form-control">
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

				<div class="form-group">
					<label for="regdate">날짜</label>
					<c:choose>
						<c:when test=''>
							<label class="show" for="exampleInputPassword1">날짜 표현 </label>
						</c:when>
						<c:otherwise>
							<label class="hidden" for="exampleInputPassword1">남은 횟수 </label>

						</c:otherwise>
					</c:choose>
				</div>

				<div class="form-group">
					<label> 점수 </label>
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
				<div class="form-group">
					<label for="exampleInputFile">파일 업로드</label> <input type="file"
						id="exampleInputFile">
				</div>

				<div class="form-group">
					<div class="form-inline">
						<div class="col-md-8">
							<label>메모</label>
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
							<div>
								<label>금액</label> <input type="text" class="form-control"
									id="money">
								<button type="submit" class="btn btn-default">등록</button>
							</div>

						</div>
					</div>
				</div>
			</form>
		</div>

	</div>
	<!-- 회원번호 : 텍스트박스  ,  이름 : 텍스트박스 		right 전화번호 : 텍스트박스  -->

	<%-- <c:import url='/WEB-INF/views/include/footer.jsp'></c:import> --%>
</body>
</html>