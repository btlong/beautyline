<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!doctype html>
<html>
<head>

<title>삭제 확인</title>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">



<!-- Custom CSS -->
<link href="/beautyline/bootstrap/css/business-casual.css" rel="stylesheet">
<link href="https://maxcdn.bootstrapcdn.com/bootswatch/3.3.7/flatly/bootstrap.min.css" rel="stylesheet" integrity="sha384-+ENW/yibaokMnme+vBLnHMphUYxHs34h9lpdbSLuAwGkOKFRl4C34WkjazBtb7eT" crossorigin="anonymous">
	
<link href="/beautyline/beautyline/css/include.css" rel="stylesheet">
<!-- font awesome -->
<link rel="stylesheet" href="/beautyline/bootstrap/css/font-awesome.min.css" media="screen" title="no title">
<!-- Custom style -->
<link rel="stylesheet" href="/beautyline/bootstrap/css/style.css" media="screen" title="no title">

<!-- Fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800" rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Josefin+Slab:100,300,400,600,700,100italic,300italic,400italic,600italic,700italic" rel="stylesheet" type="text/css">


<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript" src="/beautyline/bootstrap/js/jquery.js"></script>
<style type="text/css">
.col-sm-3, .col-sm-2 {
	padding-right: 0px;
}

#btn {
	padding-left: 0px;
}
</style>

</head>
<body>
	<c:import url="/WEB-INF/views/include/header.jsp" />

	<div class="container">
		<div class="row">
			<div class="box">
				<div class="col-lg-12">
					<div class="page-header">
						<hr>
						<h1 class="text-center">
							<strong>유효하지 않은 정보 입니다.</strong>
						</h1>
						<hr>
					</div>
					
				
				<div class="col-lg-11 text-center">
				<a href="/beautyline/main" class="btn btn-md btn-primary">메인으로 <span class="glyphicon glyphicon-remove"></span></a>
				
				
					<!-- <a href="/mysite/bs?a=list&no=1">글목록</a>  -->
					
				<%-- <!-- <c:if test='${not empty authUser && (boardVo.userNo == authUser.no) }'> -->	
					<a href="#" class="btn btn-sm btn-danger">수정하기 <span class="glyphicon glyphicon-edit"></span></a>
					<a href="/mysite/bs?a=modifyform&no=${boardVo.no }">글수정</a>
					<a href="#" class="btn btn-sm btn-danger">삭제 <span class="glyphicon glyphicon-remove"></span></a>
					<a href="/mysite/bs?a=replyform&no=${boardVo.no }">삭제</a> 
					</c:if> --%>
					
				</div>
			</div>
		</div>
					
		</div>
		</div>			

	<c:import url="/WEB-INF/views/include/footer.jsp" />

</body>

<script>
$(document).ready(function(){


});
</script>



</html>