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
<!-- <link href="/beautyline/bootstrap/css/bootstrap.min.css"
	rel="stylesheet"> -->
<link href="/beautyline/bootstrap/css/business-casual.css"
	rel="stylesheet">

<!-- Custom CSS -->
<link href="/beautyline/beautyline/css/include.css" rel="stylesheet">
<link href="https://maxcdn.bootstrapcdn.com/bootswatch/3.3.7/flatly/bootstrap.min.css" rel="stylesheet" integrity="sha384-+ENW/yibaokMnme+vBLnHMphUYxHs34h9lpdbSLuAwGkOKFRl4C34WkjazBtb7eT" crossorigin="anonymous">

<!-- Fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Josefin+Slab:100,300,400,600,700,100italic,300italic,400italic,600italic,700italic"
	rel="stylesheet" type="text/css">
	
<!-- <style type="text/css">
.input[type="text"]	{
	width: 20px;

}
 
</style>	 -->
</head>
<body>
	<c:import url="/WEB-INF/views/include/header.jsp" />

	<div class="container">
		<div class="row">
			<div class="box">
				<div class="col-lg-12">
				<div class="page-header">
					<hr>
					<h3 class="intro-text text-center">
						<strong>회원관리</strong>
					</h3>
					<hr>
				</div>

				
				<form class="form-horizontal" method="post" action="update">
				<div class="col-lg-12">
			<div class="form-group">
			
					<table class="table table-hover">
					
						<thead>
							<tr class="danger">
								<th>회원번호</th>
								<th>이름</th>
								<th>전화번호</th>
								<th>아이디</th>
								<th>이메일1</th>
								<th>이메일2</th>
								<th>우편번호</th>
								<th>주소</th>
								<th>상세주소</th>
								<th>권한</th>
								<th>저장</th>
								<th>취소</th>
							</tr>
						</thead>


						<tbody>
							
							<tr>
								<td>${UserinfoVo.no}</td>
								<td><input type="hidden" name="no"
									value="${UserinfoVo.no }" /> <input type="text" class="form-control input-sm" name="name"
									value="${UserinfoVo.name}"></td>
								<td><input type="hidden" name="no"
									value="${UserinfoVo.no }" /> <input type="text" class="form-control input-sm" name="phone"
									value="${UserinfoVo.phone}"></td>
								<td><input type="hidden" name="no"
									value="${UserinfoVo.no }" /> <input type="text" class="form-control input-sm" name="id"
									value="${UserinfoVo.id}"></td>
								<td><input type="hidden" name="no"
									value="${UserinfoVo.no }" /> <input type="text" class="form-control input-sm" name="email1"
									value="${UserinfoVo.email1}"></td>
								<td><input type="hidden" name="no"
									value="${UserinfoVo.no }" /> <input type="text" class="form-control input-sm" name="email2"
									value="${UserinfoVo.email2}"></td>
								<td><input type="hidden" name="no"
									value="${UserinfoVo.no }" /> <input type="text" class="form-control input-sm" name="zipCode"
									value="${UserinfoVo.zipCode}"></td>
								<td><input type="hidden" name="no"
									value="${UserinfoVo.no }" /> <input type="text" class="form-control input-sm" name="address1"
									value="${UserinfoVo.address1}"></td>
								<td><input type="hidden" name="no"
									value="${UserinfoVo.no }" /> <input type="text" class="form-control input-sm" name="address2"
									value="${UserinfoVo.address2}"></td>
								<td>${UserinfoVo.isAdmin}</td>
								<td><input type="hidden" name="no"
									value="${UserinfoVo.no }" /> <input type="submit" class="btn btn-primary btn-sm" value="저장">
								</td>
								<td><a class="btn btn-default btn-sm"
									href="javascript:history.go(-1);" role="button">취소</a></td>
							</tr>
								
						</tbody>
				
					</table>
						</div>
						</div>
				
				
				</form>
				</div>
					</div>
					
			</div>
		</div>
	


	<c:import url="/WEB-INF/views/include/footer.jsp" />

	<!-- jQuery -->
	<script src="js/jquery.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="js/bootstrap.min.js"></script>

	<!-- 링크 비활성화 -->
	<!-- <script>
			$('.link').unbind('click', false);
		</script> -->
</body>
</html>