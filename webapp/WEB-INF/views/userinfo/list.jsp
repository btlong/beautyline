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
<title>userinfo</title>

<!-- Bootstrap Core CSS -->
<link href="/beautyline/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">

<!-- font awesome -->
<link rel="stylesheet"
	href="/beautyline/bootstrap/css/font-awesome.min.css" media="screen"
	title="no title">

<!-- Custom CSS -->
<link href="/beautyline/bootstrap/css/business-casual.css"
	rel="stylesheet">
<link href="/beautyline/beautyline/css/include.css" rel="stylesheet">
<link href="/beautyline/beautyline/css/userinfo.css" rel="stylesheet"
	type="text/css">

<!-- Custom style -->
<link rel="stylesheet" href="/beautyline/bootstrap/css/style.css"
	media="screen" title="no title">

<!-- Fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Josefin+Slab:100,300,400,600,700,100italic,300italic,400italic,600italic,700italic"
	rel="stylesheet" type="text/css">

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
						<strong>회원정보</strong>
					</h1>
					<hr>
				</div>

				<div class="col-lg-12 text-right">
					<a class="btn btn-default" href="" id="new-book"
						data-target="#myModal1" type="button" data-toggle="modal"
						role="button">등록</a>
				</div>

				<table class="table table-hover">
					<thead>
						<tr class="danger">
							<th>#</th>
							<th>회원번호</th>
							<th>이름</th>
							<th>전화번호</th>
							<th>아이디</th>
							<th>이메일</th>
							<th>주소</th>
							<th>권한</th>
							<th>쿠폰</th>
							<th>수정</th>
							<th>삭제</th>
						</tr>
					</thead>

					<tbody>
						<c:set var='totalCount' value='${fn:length(listUser) }' />
						<c:forEach items="${listUser }" var="userinfoVo"
							varStatus="status">
							<tr>
								<td>${totalCount - status.index }</td>
								<td>${userinfoVo.no}</td>
								<td>${userinfoVo.name}</td>
								<td>${userinfoVo.phone}</td>
								<td>${userinfoVo.id}</td>
								<td>${userinfoVo.email}</td>
								<td>${userinfoVo.address}</td>
								<td>${userinfoVo.is_admin}</td>

								<td>
									<%-- <input type="hidden" name="no"
									value="${userinfoVo.no }" /> <a class="btn btn-default"
									href="couponview?no=${userinfoVo.no }" role="button">조회</a> --%>

									<!-- 조회 클릭 --> <!-- Trigger the modal with a button --> <input
									type="hidden" name="no" value="${CouponviewVo.userNo }" /> <a
									class="btn btn-default" href="" id="couponview"
									data-target="#myModal2" type="button" data-toggle="modal"
									role="button">조회</a>
								</td>

								<td><input type="hidden" name="no"
									value="${userinfoVo.no }" /> <a class="btn btn-default"
									href="modifyuser?no=${userinfoVo.no }" role="button">수정</a></td>
								<td><form method="post" action="delete">
										<input type="hidden" name="no" value="${userinfoVo.no }" /> <input
											type="submit" value="삭제">
										<!-- <a class="btn btn-default" href = "javascript:del()">삭제</a> -->
									</form></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>

				<div class="col-lg-12 text-center">
					<nav>
						<ul class="pagination pagination-sm">
							<li><a href="#" aria-label="Previous"> <span
									aria-hidden="true">&laquo;</span>
							</a></li>
							<li><a href="#">1</a></li>
							<li><a href="#">2</a></li>
							<li><a href="#">3</a></li>
							<li><a href="#">4</a></li>
							<li><a href="#">5</a></li>
							<li><a href="#" aria-label="Next"> <span
									aria-hidden="true">&raquo;</span>
							</a></li>
						</ul>
					</nav>
				</div>

				<div class="col-lg-12">
					<form id="search_form" action="/beautyline/userinfo" method="get">
						<div class="btn-group">
							<button type="button" class="btn btn-default dropdown-toggle"
								data-toggle="dropdown" aria-expanded="false">
								전체 <span class="caret"></span>
							</button>
							<ul class="dropdown-menu" role="menu">
								<li><a href="#">회원번호</a></li>
								<li><a href="#">이름</a></li>
								<li><a href="#">전화번호</a></li>
							</ul>
						</div>
						<input type="text" id="kwd" name="kwd" value="${keyword }">
						<input type="submit" value="찾기">
					</form>
				</div>
			</div>
		</div>
	</div>
	<c:import url="/WEB-INF/views/include/footer.jsp" />


	<!-- 등록 Modal -->
	<div class="modal fade" id="myModal1" role="dialog" tabindex="-1"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg">

			<!-- Modal content-->
			<div class="modal-content">
				<form class="form-horizontal">

					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">회원등록</h4>
					</div>
					<div class="modal-body"></div>

					<div class="modal-footer">
						<div id="fintdt" class="col-lg-12 text-center">
							<input class="btn btn-default" type="button" id="#" value="등록">
							<button type="button" class="btn btn-default"
								data-dismiss="modal">취소</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>


	<!-- 쿠폰조회 Modal -->
	<div class="modal fade" id="myModal2" role="dialog" tabindex="-1"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-sm">

			<!-- Modal content-->
			<div class="modal-content">
				<form class="form-horizontal">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">쿠폰조회</h4>
					</div>
					<div class="modal-body">
						<!-- program name,coupon count  -->
						<table class="table table-hover">
							<thead>
								<tr class="danger">
									<th>프로그램이름</th>
									<th>잔여횟수</th>
								</tr>
							</thead>
							<!-- 리스트영역 -->
							<tbody>
								<c:forEach items="${couponView }" var="couponinfoVo"
									varStatus="status">
									<tr>
										<td><input type="hidden" name="programNo"
											value="${couponinfoVo.programNo }" />
											${couponinfoVo.programName}</td>
										<td><input type="hidden" name="no"
											value="${couponinfoVo.no }" /> ${couponinfoVo.count}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>

					<div class="modal-footer">
						<div id="fintdt" class="col-lg-12 text-center">
							<input class="btn btn-default" type="button" id="couponCountModify"
								value="수정">
							<button type="button" class="btn btn-default"
								data-dismiss="modal">닫기</button>
						</div>
					</div>
				</form>
			</div>

		</div>
	</div>



	<script>
		$(document).ready(function() {
			$("#new-book").click(function() {
				$("#myModal").modal();
			});
			$("#couponview").click(function() {
				$("#myModal").modal();
			});
		});
		
		$('#myDropdown').on('shown.bs.dropdown', function () {
			  // do something…
			})
	</script>

</body>

</html>