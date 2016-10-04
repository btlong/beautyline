<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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

<title>회원관리</title>

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
#insert-user {
	margin: 0px 0px 20px 0px;
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
						<strong>회원정보</strong>
					</h1>
					<hr>
				</div>

				<div class="col-lg-12 text-center">
					<!-- 관리자권한 설정 -->
					<c:choose>
						<c:when
							test="${not empty sessionScope.authUser && authUser.isAdmin eq 'a'}">
							<div class="col-lg-12 text-right">
								<a class="btn btn-info" href="/beautyline/userinfo/joinform" id="insert-user" type="button" role="button">등록</a>
							</div>

							<div class="col-lg-12 text-center">
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
												<td>${userinfoVo.isAdmin}</td>

												<td>
													<!-- 조회 클릭 --> <!-- Trigger the modal with a button --> <input
													type="hidden" name="no" value="${CouponviewVo.userNo }" />
													<a class="btn btn-default btn-sm" href="" id="couponview"
													data-target="#myModal2" type="button" data-toggle="modal"
													role="button">조회</a>
												</td>

												<td><input type="hidden" name="no"
													value="${userinfoVo.no }" /> <a class="btn btn-default  btn-sm"
													href="modifyuser?no=${userinfoVo.no }" role="button">수정</a></td>
													
												<td><form method="post" action="delete">
														<input type="hidden" name="no" value="${userinfoVo.no }" />
														<input type="submit" value="삭제" class="btn btn-default  btn-sm">
														<!-- <a class="btn btn-default" href = "javascript:del()">삭제</a> -->
													</form></td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>

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
								<form id="search_form" action="/beautyline/userinfo"
									method="get">
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
						</c:when>
						<c:otherwise>
							<h4>관리자페이지 입니다.</h4>
							<c:import url="/WEB-INF/views/userinfo/loginform.jsp" />
						</c:otherwise>
					</c:choose>
				</div>
			</div>
		</div>
	</div>
	<c:import url="/WEB-INF/views/include/footer.jsp" />


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
							<input class="btn btn-default" type="button"
								id="couponCountModify" value="수정">
							<button type="button" class="btn btn-default"
								data-dismiss="modal">닫기</button>
						</div>
					</div>
				</form>
			</div>

		</div>
	</div>



	<script>
		/* $(document).ready(function() {
			$("#insertUser").click(function() {
				$("#myModal").modal();
			});
			$("#couponview").click(function() {
				$("#myModal").modal();
			});
		});
		
		$('#myDropdown').on('shown.bs.dropdown', function () {
			  // do something…
			});
			 */
			
	
		$(document).ready(function() {
			
		});
	</script>

</body>

</html>