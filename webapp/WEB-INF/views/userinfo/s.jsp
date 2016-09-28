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
<link href="/beautyline/beautyline/css/include.css" rel="stylesheet">
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
				<div class="col-lg-12">
					<hr>
					<h3 class="intro-text text-center">
						<strong>회원관리</strong>
					</h3>
					<hr>
				</div>

				<div class="col-lg-2 col-lg-offset-10">
					<a class="btn btn-default" href="write" id="new-book">등록</a>
				</div>

				<form method="post" action="delete">
					<table class="table table-hover">
						<thead>
							<tr class="danger">
								<th>회원번호</th>
								<th>이름</th>
								<th>전화번호</th>
								<th>아이디</th>
								<th>이메일</th>
								<th>주소</th>
								<th>권한</th>
								<th>수정</th>
								<th>취소</th>
							</tr>
						</thead>

						<tbody>
							<tr>
								<td>${UserinfoVo.no}</td>
								<td>${UserinfoVo.name}</td>
								<td>${UserinfoVo.phone}</td>
								<td>${UserinfoVo.id}</td>
								<td>${UserinfoVo.email}</td>
								<td>${UserinfoVo.address}</td>
								<td>${UserinfoVo.is_admin}</td>
								<td><input type="hidden" name="no"
									value="${UserinfoVo.no }" /> <a class="btn btn-default"
									href="modifyuser?no=${UserinfoVo.no }" role="button">수정</a></td>
								<td><a class="btn btn-default"
									href="javascript:history.go(-1);" role="button">취소</a></td>
							</tr>
						</tbody>
					</table>
				</form>
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