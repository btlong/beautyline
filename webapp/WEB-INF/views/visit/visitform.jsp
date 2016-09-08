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
		<form>
			<!-- Navigation -->
			<div class="box">
				<div class="row">
					<div class="col-md-9">
						<a> <input type="button" value="쿠폰등록">
						</a>
					</div>
					<div class="col-md-1">
						<a> <input type="button" value="내역조회"></a>
					</div>
					<div class="col-md-1">
						<a><input type="button" value="회원등록"> </a>
					</div>
				</div>

				<div class="form-inline">
					<div class="form-group has-error">
						<label for="userno">회원번호</label> <input type="text"
							class="form-control" id="userNo"> <label for="name">이름</label>
						<input type="text" class="form-control" id="name"
							placeholder="홍길동"> <label for="name">전화번호</label> <input
							type="text" class="form-control" id="phone" placeholder="010">
					</div>
					<button type="button" class="btn btn-default">검색</button>
					<div class="form-group">
						<label >케어 프로그램</label> 
						
						<select class="form-control">
							<option>선택 </option>
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
								<label class="hidden" for="exampleInputPassword1">남은 횟수
								</label>

							</c:otherwise>
						</c:choose>
					</div>
				</div>

			</div>
		</form>
		<!-- 회원번호 : 텍스트박스  ,  이름 : 텍스트박스 		right 전화번호 : 텍스트박스  -->

	</div>
	<%-- <c:import url='/WEB-INF/views/include/footer.jsp'></c:import> --%>

</body>
</html>