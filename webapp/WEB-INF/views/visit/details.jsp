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


<!-- visit css -->
<!-- <link href="/beautyline/beautyline/css/visit.css" rel="stylesheet"> -->
</head>
<body>

	<c:import url="/WEB-INF/views/include/header.jsp" />

	<div class="box">
		<div class="form-group">
			<label>방문 내역 조회</label>
			<div class="table-responsive hidden-xs">

				<table class="table">
					<tr class="danger">
						<th>번호</th>
						<th>방문날짜</th>
						<th>고객</th>
						<th>금액</th>
						<th>결제방법</th>
					</tr>
					<c:set var='visitList' value='${fn:length(list) }' />
					<c:forEach var='vo' items='${list}' varStatus='s'>
						<tr>
							<td>[${countList - s.index }]</td>
							<td>${vo.regDate }</td>
							<td>${vo.name }</td>
							<td>${vo.money}</td>
							<td>${vo.payName}</td>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>
	</div>
	<c:import url="/WEB-INF/views/include/footer.jsp" />
</body>
</html>