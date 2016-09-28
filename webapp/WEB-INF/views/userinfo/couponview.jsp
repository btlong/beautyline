<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<title>userinfo</title>

<!-- Bootstrap Core CSS -->
<link href="/beautyline/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link href="/beautyline/bootstrap/css/business-casual.css"
	rel="stylesheet">

<!-- Custom CSS -->
<link href="/beautyline/beautyline/css/include.css"
	rel="stylesheet">
<link href="/beautyline/beautyline/css/userinfo.css" rel="stylesheet" type="text/css">

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

	<div class="container">
		<div class="row">
			<div class="box">

				${UserinfoVo.name }회원님 <br> <br>
				<table class="table table-hover">
							<thead>
							<tr class="danger">
								<th>프로그램이름</th>
								<th>잔여횟수</th>
							</tr>
							</thead>
							<!-- 리스트영역 -->
							<tbody>
						<c:forEach items="${listCoupon }" var="couponviewVo"
							varStatus="status">
							<tr>
								<td><input type="hidden" name="programNo"
									value="${couponinfoVo.programNo }" />
								${couponinfoVo.programName}</td>
								<td><input type="hidden" name="no"
									value="${couponinfoVo.no }" />
								${couponinfoVo.count}</td>

							</tr>
						</c:forEach>
					</tbody>
						</table>
						
				<input type="hidden" name="no" value="${CouponVo.no }" />
						<div>
							<a href="modify?no=${CouponVo.no }">수정</a> 
						</div>
				
			</div>
		</div>
	</div>


	<c:import url="/WEB-INF/views/include/footer.jsp" />
	
	<!-- jQuery -->
    <script src="js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>
	
</body>
</html>