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

<link href="/beautyline/beautyline/css/reserve.css" rel="stylesheet">
<link href="/beautyline/beautyline/css/include.css" rel="stylesheet">

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
					<%-- <div id=total-record class="col-lg-12 text-left">
						▶전체 회원 수 : ${page.totalRecord }명&nbsp; &nbsp; ▶현재 페이지 ( <span
							id=page-location>${page.nowPage+1 } / ${page.totalPage}
							페이지</span>)
					</div> --%>
					
					
					<div class=form-group>
						<div class="table-responsive">
							<table class="table table-condensed">
								<tr>
									<th class="text-center">번호</th>
									<th class="text-center">방문날짜</th>
									<th class="text-center">고객</th>
									<th class="text-center">프로그램</th>
									<th class="text-center">금액</th>
									<th class="text-center">결제방법</th>
								</tr>

								<c:forEach var='visitvo' items="${visitList}" varStatus='s'>
									<tr>
										<td class="text-center">${s.index +1}</td>
										<td class="text-center">${visitvo.regDate}</td>
										<td class="text-center">${visitvo.name}</td>
										<td class="text-center">${visitvo.programName}</td>
										<td class="text-right">${visitvo.price}</td>
										<td class="text-center">${visitvo.payName}</td>
									</tr>
								</c:forEach>
							</table>
						</div>

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
</html>