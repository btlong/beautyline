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
#total-record {
	margin-bottom: 5px;
}

#page-location {
	color: red;
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
						<strong>회원관리</strong>
					</h1>
					<hr>
				</div>


				<div class="col-lg-12 text-center">
					<!-- 관리자권한 설정 -->
					<c:choose>
						<c:when
							test="${not empty sessionScope.authUser && authUser.isAdmin eq 'a'}">


							<!-- 회원등록버튼 -->
							<div class="col-lg-12 text-right">
								<a class="btn btn-info" href="/beautyline/userinfo/joinform"
									id="insert-user" type="button" role="button">등록</a>
							</div>

	
							<!-- 페이지 정보 -->
							<div id=total-record class="col-lg-12 text-left">
								▶전체 회원 수 : ${page.totalRecord }명&nbsp; &nbsp; ▶현재 페이지 ( <span
									id=page-location>${page.nowPage+1 } / ${page.totalPage}
									페이지</span>)
							</div>


							<!-- 회원리스트 -->
							<div class="col-lg-12 text-center">
								<table class="table table-hover" id="test">
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
										<c:set var="doneLoop" value="false" />
										<!-- for(i=보고있는 페이지의 시작번호; i<(시작번호+한페이지의 게시물수); i++ ){ -->
										<c:forEach begin="${page.beginPerPage }"
											end="${page.beginPerPage + page.numPerPage -1}" var="i"
											varStatus="status">

											<!-- doneLoop가 false이면 루프 계속 돎-->
											<c:if test="${not doneLoop }">
												<tr>

													<!-- (전체 게시물 갯수-(전체회원수-1))>=1이면 -->
													<c:if test="${(page.totalRecord -status.index)>=1}">
														<td>${page.totalRecord -status.index}</td>
														<td>${listUser[i].no}</td>
														<td>${listUser[i].name}</td>
														<td>${listUser[i].phone}</td>
														<td>${listUser[i].id}</td>
														<td>${listUser[i].email}</td>
														<td>${listUser[i].address}</td>
														<td>${listUser[i].isAdmin}</td>

														<td>
															<!-- 쿠폰 조회  --> <!-- Trigger the modal with a button -->
															<input type="hidden" name="no" value="${listUser[i].no }" />
															<a class="btn btn-default btn-sm" href="" id="couponview"
															data-target="#modalCoupon" type="button"
															data-toggle="modal" role="button">조회</a>
														</td>

														<td>
															<!-- 회원 수정 --> <input type="hidden" name="no"
															value="${listUser[i].no }" /> <a
															class="btn btn-default  btn-sm"
															href="modifyuser?no=${listUser[i].no }" role="button">수정</a>
														</td>

														<td>
															<!-- 회원 삭제 -->
															<form method="post" action="delete">
																<input type="hidden" name="no"
																	value="${listUser[i].no }" /> <input type="submit"
																	value="삭제" class="btn btn-default  btn-sm">
																<!-- <a class="btn btn-default" href = "javascript:del()">삭제</a> -->
															</form>
														</td>
													</c:if>

												</tr>
												<!-- 회원수가 토탈 게시물보다 많아지면 루프가 True가 되어 빠져나옴 -->
												<c:if test="${i+1 == page.totalRecord} }">
													<c:set var="doneLoop" value="true" />
												</c:if>
											</c:if>
										</c:forEach>
									</tbody>
									<tfoot></tfoot>
								</table>
							</div>



							<!-------------Paging--------------->
							<c:import url="/WEB-INF/views/include/paging.jsp" />



							<!-- 검색 -->
							<%-- <div class="col-lg-12">
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
							</div> --%>
							<form class="form-inline" action="list" name="search"
								method="post">
								<div class="form-group">

									<select class="form-control input-sm" name="keyField" size="1">
										<option value="name"
											<c:if test="${'name'==keyField }"> selected</c:if>>이름
										</option>
										<option value="phone"
											<c:if test="${'phone'==keyField }"> selected</c:if>>
											전화번호</option>
										<option value="id"
											<c:if test="${'id'==keyField }"> selected</c:if>>
											아이디</option>
										<option value="email"
											<c:if test="${'email'==keyField }"> selected</c:if>>
											이메일</option>
										<option value="address"
											<c:if test="${'address'==keyField }"> selected</c:if>>
											주소</option>
										<option value="is_admin"
											<c:if test="${'isAdmin'==keyField }"> selected</c:if>>
											권한</option>
									</select> <label> <input type="text"
										class="form-control input-sm" name="keyWord"
										value="${keyWord }">
									</label> <label> <input class="btn btn-warning btn-sm"
										type="button" value="검색" onClick="check()"></label> <input
										type="hidden" name="page" value="0">
								</div>
							</form>


							<!-------------Paging n Search form--------------->
							<!-- 히든 정의 -->

							<!-- 이전 페이지 -->
							<form id="blockmoveb" name="blockmoveb" method="POST"
								action="list">
								<input type="hidden" name="nowBlock" value="${page.nowBlock-1 }" />
								<input type="hidden" name="nowPage"
									value="${(page.nowBlock-1)*page.pagePerBlock}" /> <input
									type="hidden" name="keyField" value="${keyField }" /> <input
									type="hidden" name="keyWord" value="${keyWord }" />
							</form>

							<!-- 페이지블록 -->
							<form id="pagemove" name="pagemove" method="POST" action="list">
								<input type="hidden" name="nowBlock" value="${page.nowBlock}" />
								<input id="now-page" type="hidden" name="nowPage"
									value="${page.nowBlock*page.pagePerBlock}" /> <input
									type="hidden" name="keyField" value="${keyField }" /> <input
									type="hidden" name="keyWord" value="${keyWord }" />
							</form>

							<!-- 다음 페이지 -->
							<form id="blockmovef" name="blockmovef" method="POST"
								action="list">
								<input type="hidden" name="nowBlock" value="${page.nowBlock+1 }" />
								<input type="hidden" name="nowPage"
									value="${(page.nowBlock+1)*page.pagePerBlock}" /> <input
									type="hidden" name="keyField" value="${keyField }" /> <input
									type="hidden" name="keyWord" value="${keyWord }" />
							</form>



						</c:when>


						<c:otherwise>
							<!-- authUser.isAdmin 값이 'a'가 아닐 때 -->
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
	<div class="modal fade" id="modalCoupon" role="dialog" tabindex="-1"
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
								<%-- <c:forEach items="${couponView }" var="couponinfoVo"
									varStatus="status">
									<tr>
										<td><input type="hidden" name="programNo"
											value="${couponinfoVo.programNo }" />
											${couponinfoVo.programName}</td>
										<td><input type="hidden" name="no"
											value="${couponinfoVo.no }" /> ${couponinfoVo.count}</td>
									</tr>
								</c:forEach> --%>
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
	<!-- Modal-->


	<script>
		/* 검색 */
		function check() {
			if (document.search.keyWord.value == "") {
				alert("검색어를 입력하세요.");
				document.search.keyWord.focus();
				return;
			}
			document.search.submit();
		}

		
		$(document).ready(function() {
			
			/* $('#page-block').click(function(i) {
				 var nowPage=$('#now-page').val;
				$('#now-page').val= $('#now-page')+i; 
				  $('#pagemove').submit();
				}); */

			

			/*  쿠폰조회 모달 userNo 값 초기화 */
			$("#couponview").click(function() {
				var tess = $("#list").val();

				console.log(tess);
				/* $("#modalCoupon").modal(); */

				/* 	$.ajax({
						url : "selectCoupon",
						type : "POST",
						data : {"userNo" : userNo},
						
					}); */
			});

			/* $('#myDropdown').on('shown.bs.dropdown', function() {
				// do something…
			}); */
		});
	</script>

</body>
</html>