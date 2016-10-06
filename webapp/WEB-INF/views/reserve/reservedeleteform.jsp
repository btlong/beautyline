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

<!-- Custom CSS -->
<link href="/beautyline/bootstrap/css/business-casual.css"rel="stylesheet">
<link href="https://maxcdn.bootstrapcdn.com/bootswatch/3.3.7/flatly/bootstrap.min.css" rel="stylesheet" integrity="sha384-+ENW/yibaokMnme+vBLnHMphUYxHs34h9lpdbSLuAwGkOKFRl4C34WkjazBtb7eT" crossorigin="anonymous">
<!-- Modal jquery -->
<link rel="stylesheet"href="http://code.jquery.com/ui/1.10.2/themes/smoothness/jquery-ui.css" />
<link href="/beautyline/beautyline/css/reserve.css" rel="stylesheet">
<link href="/beautyline/beautyline/css/include.css" rel="stylesheet">

<!-- Fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Josefin+Slab:100,300,400,600,700,100italic,300italic,400italic,600italic,700italic"
	rel="stylesheet" type="text/css">

<!-- jquery  -->
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="http://code.jquery.com/ui/1.10.2/jquery-ui.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	
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
				<button class="btn btn-primary" id="resDelOk">예 </button>
				<button class="btn btn-default" >아니오 </button>
				</div>
				</div>
			</div>
		</div>
	</div>


	<c:import url="/WEB-INF/views/include/footer.jsp" />
	

<!-- Modal -->
<!-- 회원검색 모달 -->
	<div class="modal fade" id="myModal3">
		<div class="modal-dialog">
		
		<!-- modal content -->
		<div class="modal-content">
				
			<!-- header -->
				<div class="modal-header">
					<!-- 닫기(x) 버튼 -->
					<button type="button" class="close" data-dismiss="modal">×</button>
					<!-- header title -->
					<h4 class="modal-title text-center">
						<strong>예약취소 완료</strong>
					</h4>
				</div>
				
			<!-- body -->
				<div class="modal-body">
					예약이 취소 되었습니다.
				</div>
				
			<!-- Footer -->
				<div class="modal-footer">
					<button class="btn btn-default" id="backList">리스트로</button>
					<button class="btn btn-default" id="backMain">메인으로</button>					
				</div>				
			</div>
		</div>
	</div>		



</body>

<script type="text/javascript">
$(document).ready(function(){
	var resNo = ${reserveVo.no };
	$("#resDelOk").on("click", function(){
		$.ajax({
			url : "reservedelete",
			type : "POST",
			data : { "no" : resNo },
			success : function(result){
				if(result > 0){
					$("#myModal3").modal();
				}else{
					alert("유효하지 않은 정보입니다.");
				}
			}
		});
	});
	
	$("#backList").on("click", function(){
		location.href = "reservelist";
	});
	
	$("#backMain").on("click", function(){
		location.href = "/beautyline/main";
	});
});
</script>

</html>