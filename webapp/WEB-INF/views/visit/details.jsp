<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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

<!-- 테마 -->
<link
	href="https://maxcdn.bootstrapcdn.com/bootswatch/3.3.7/flatly/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-+ENW/yibaokMnme+vBLnHMphUYxHs34h9lpdbSLuAwGkOKFRl4C34WkjazBtb7eT"
	crossorigin="anonymous">

<link href="/beautyline/beautyline/css/include.css" rel="stylesheet">
<!-- Custom style -->
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.10.2/themes/smoothness/jquery-ui.css" />
<style type="text/css">
#page-location {
	color: red;
}

.form-group div select {
	padding-top: 0px;
	height: auto;
}
</style>

</head>

<body>

	<c:import url="/WEB-INF/views/include/header.jsp" />

	<!-- container -->
	<div class="container">
		<div class="row">
			<div class="box">
				<div class="col-lg-12">
					<div class="page-header">
						<hr>
						<h1 class="text-center text-center">
							<strong>방문내역조회</strong>
						</h1>
						<hr>
					</div>

					<!-- 페이지 정보 -->
					<div id="total-record" class="col-lg-12 text-left">
						▶전체 회원 수 : ${page.totalRecord }명&nbsp; &nbsp; ▶현재 페이지 ( <span
							id=page-location>${page.nowPage+1 } / ${page.totalPage}
							페이지</span>)
					</div>


					<div class="form-group">
						<div class="col-lg-12 text-center center-block">
							<table class="table table-bordered table-hover table-responsive">
								<thead>
									<tr>
										<th class="text-center">번호</th>
										<th class="text-center">방문날짜</th>
										<th class="text-center">고객</th>
										<th class="text-center">프로그램</th>
										<th class="text-center">금액</th>
										<th class="text-center">결제방법</th>
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
													<td class="text-center">${page.totalRecord-status.index}</td>
													<td class="text-center">${visitList[i].regDate}</td>
													<td class="text-center">${visitList[i].name}</td>
													<td class="text-center">${visitList[i].programName}</td>
													<td class="text-right">${visitList[i].price}</td>
													<td class="text-center">${visitList[i].payName}</td>
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



						<form class="form-inline" action="details" name="search"
							method="post">
							<div class="col-lg-12 text-center">

								<select class="form-control input-sm" name="keyField" size="1">
									<option value="name"
										<c:if test="${'name'==keyField }"> selected</c:if>>이름
									</option>
									<option value="phone"
										<c:if test="${'phone'==keyField }"> selected</c:if>>
										방문날짜</option>
									<option value="id"
										<c:if test="${'id'==keyField }"> selected</c:if>>프로그램</option>
									<option value="email"
										<c:if test="${'email'==keyField }"> selected</c:if>>
										결제방법</option>
								</select> <label> <input type="text"
									class="form-control input-sm" name="keyWord"
									value="${keyWord }">
								</label> <label> <input class="btn btn-warning btn-sm"
									type="button" value="검색" onClick="check()">
								</label> <input type="hidden" name="page" value="0">
							</div>
						</form>


						<!-------------Paging n Search form--------------->
						<!-- 히든 정의 -->

						<!-- 이전 페이지 -->
						<form id="blockmoveb" name="blockmoveb" method="POST"
							action="details">
							<input type="hidden" name="nowBlock" value="${page.nowBlock-1 }" />
							<input type="hidden" name="nowPage"
								value="${(page.nowBlock-1)*page.pagePerBlock}" /> <input
								type="hidden" name="keyField" value="${keyField }" /> <input
								type="hidden" name="keyWord" value="${keyWord }" />
						</form>

						<!-- 페이지블록 -->
						<form id="pagemove" name="pagemove" method="POST" action="details">
							<input type="hidden" name="nowBlock" value="${page.nowBlock}" />
							<input id="now-page" type="hidden" name="nowPage"
								value="${page.nowBlock*page.pagePerBlock}" /> <input
								type="hidden" name="keyField" value="${keyField }" /> <input
								type="hidden" name="keyWord" value="${keyWord }" />
						</form>

						<!-- 다음 페이지 -->
						<form id="blockmovef" name="blockmovef" method="POST"
							action="details">
							<input type="hidden" name="nowBlock" value="${page.nowBlock+1 }" />
							<input type="hidden" name="nowPage"
								value="${(page.nowBlock+1)*page.pagePerBlock}" /> <input
								type="hidden" name="keyField" value="${keyField }" /> <input
								type="hidden" name="keyWord" value="${keyWord }" />
						</form>
					</div>
				</div>
			</div>

			<div class="group-form">
				<div class="col-sm-1 col-sm-offset-11">
					<a class="btn-danger btn-primary btn-default"
						href="/beautyline/visit/visitform" role="button">내역 관리</a> <br />
				</div>
			</div>

		</div>
	</div>

	<c:import url="/WEB-INF/views/include/footer.jsp" />

</body>
<script type="text/javascript">
	$(document).ready(function() {

		/* 검색 */
		function check() {
			if (document.search.keyWord.value == "") {
				alert("검색어를 입력하세요.");
				document.search.keyWord.focus();
				return;
			}
			$('#blockmoveb').trigger('focus');
			$('#pagemove').trigger('focus');
			$('#blockmovef').trigger('focus');
		}
	});
</script>
</html>