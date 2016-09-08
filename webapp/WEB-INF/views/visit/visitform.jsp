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
		<div class="row">
			<nav class="navbar navbar-default" role="navigation">
				<div class="col-md-10">
					<a> <input type="button" align="bottom" value="쿠폰등록"> </a>
				</div>
				<div class="col-md-2">
				 	<a> <input type="button" align="bottom" value="내역조회"> 
						<input type="button" align="bottom" value="회원등록"> </a>
				</div>
			</nav> 
		</div>
		<!-- 회원번호 : 텍스트박스  ,  이름 : 텍스트박스 		right 전화번호 : 텍스트박스  -->
		
	</div>
	<%-- <c:import url='/WEB-INF/views/include/footer.jsp'></c:import> --%>

</body>
</html>