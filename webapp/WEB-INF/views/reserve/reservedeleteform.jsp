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
<title>예약 관리</title>

<!-- Bootstrap Core CSS -->
<link href="/beautyline/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Custom CSS -->
<link href="/beautyline/bootstrap/css/business-casual.css"
	rel="stylesheet">
<link href="/beautyline/beautyline/css/include.css" rel="stylesheet">
<link href="/beautyline/beautyline/css/reserve.css" rel="stylesheet">


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
				<div class="col-lg-12">
					<hr>
					<h2 class="intro-text text-center">
						<strong>Reserve Delete</strong><br>예약취소
					</h2>
					<hr>
				</div>

				<div class="col-md-3"></div>
				<div class="col-md-6">
				<table class="table">
				<tr>
						<th>회원이름</th>
						<th>예약 프로그램</th>
						<th>예약일</th>
						<th>예약 시간</th>
						
					</tr>
				<tr>
					<td>${reserveVo.userName }</td>
					<td>${reserveVo.progName }</td>
					<td>${reserveVo.resDate }</td>
					<td>${reserveVo.resTime }시 - ${reserveVo.resTime + 1 }시</td>
				</tr>
				</table>
				
				<div class="col-lg-12 text-center">
				<h3>예약을 취소하시겠습니까?</h3>
				<a href="reservedelete?no=${reserveVo.no }" class="btn btn-default btn-lg">예</a>
					<a href="main" class="btn btn-default btn-lg">아니오</a>
				</div>
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