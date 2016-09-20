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
<link href="/beautyline/beautyline/css/packagecharge.css" rel="stylesheet">
<!-- Fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Josefin+Slab:100,300,400,600,700,100italic,300italic,400italic,600italic,700italic"
	rel="stylesheet" type="text/css">

</head>
<body>
	<!-- Model -->

	<!-- header -->
	<div class="modal-header">
		<!-- 닫기(x) 버튼 -->
		<button type="button" class="close" data-dismiss="modal">×</button>
		<!-- header title -->
		<h4 class="modal-title text-center">
			<strong>패키지 충전</strong>
		</h4>
	</div>

	<!-- body -->
	<form class="form-inline" method="post" action="registration">

		<div class="modal-body">

			<div class="bg-danger ">
				<div class="row center-blocks">
					<label class="col-md-6 text-right">이름</label> 
					<input class="col-md-3" type="text" value="">
				</div>
				<div class="row center-blocks">
					<label class="col-md-6 text-right">전화번호</label> 
					<input class="col-md-3" type="text" value="">
				</div>
				<div class="row center-blocks">
					<label class="col-md-6 text-right" >구매프로그램</label> 
					<select class="col-md-3">
						<option>여드름케어</option>
						<option>주름 케어</option>
						<option>화이트닝 케어</option>
						<option>여드름 케어</option>
					</select>
				</div>
				<div class="row center-blocks">
					<label class="col-md-6 text-right" >횟수</label>
					<input class="col-md-2" type="text" value=""> <label class="col-md-1">회</label>
				</div>
				<div class="row center-blocks">
					<label class="col-md-6 text-right">금액</label> 
					<input class="col-md-2" type="text" value="">
				</div>
			</div>
		</div>

		<!-- Footer -->
		<div class="modal-footer">
		
			<div class="col-lg-12 text-center form-group">
				<input class="btn btn-danger " type="submit" value="충전하기">
				<button type="button" class=" btn btn-danger" data-dismiss="modal">닫기</button>
			</div>
		</div>
	</form>

</body>
</html>