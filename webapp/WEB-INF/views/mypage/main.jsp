<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>mypage</title>

<!-- Custom CSS -->
<link href="/beautyline/bootstrap/css/business-casual.css"
	rel="stylesheet">
<link
	href="https://maxcdn.bootstrapcdn.com/bootswatch/3.3.7/flatly/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-+ENW/yibaokMnme+vBLnHMphUYxHs34h9lpdbSLuAwGkOKFRl4C34WkjazBtb7eT"
	crossorigin="anonymous">
<link href="/beautyline/beautyline/css/include.css" rel="stylesheet">

<!-- Custom style -->
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.10.2/themes/smoothness/jquery-ui.css" />

<!-- Fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Josefin+Slab:100,300,400,600,700,100italic,300italic,400italic,600italic,700italic"
	rel="stylesheet" type="text/css">

<style type="text/css">
.form-group {
	margin-top: 30px
}
</style>

<!-- jQuery -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<!-- Bootstrap Core JavaScript -->
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/beautyline/bootstrap/js/jquery.js"></script>
</head>

<body>
	<c:import url="/WEB-INF/views/include/header.jsp" />
	<div class="container">
		<div class="row">
			<div class="box">
				<div class="col-lg-12">
					<hr>
					<h1 class="text-center text-center">
						<strong>마이페이지</strong>
					</h1>
					<hr>
				</div>

				<div class="col-lg-12 text-center">

<!-- 세션검사 -->
		<c:choose>
			<c:when test='${not empty sessionScope.authUser }'>

					<form id="reserve" method="post" action="#"></form>
					<form id="visit" method="post" action="#"></form>
					<form id="modifyuser" method="post" action="#"></form>


					<form class="form-inline">
						<div class="form-group">
							<label class="sr-only" for="reservebtn">예약확인</label>
							<button id="reservebtn" class="btn btn-default btn-lg">예약확인</button>
						</div>
						<div class="form-group">
							<label class="sr-only" for="visitbtm">방문내역</label>
							<button id="visitbtn" class="btn btn-default btn-lg"
								type="submit">방문내역</button>
						</div>
						<div class="form-group">
							<label class="sr-only" for="modifyuserbtn">회원정보 수정</label>
							<button id="modifyuserbtn" class="btn btn-default btn-lg"
								type="submit">회원정보 수정</button>
						</div>
					</form>



					<!-- program name,coupon count  -->
					<div class="form-group">
						<table class="table">
							<thead>
								<tr class="danger">
									<th>프로그램이름</th>
									<th>잔여횟수</th>
									<!-- <th></th> -->
								</tr>
							</thead>
							<!-- 리스트영역 -->
							<tbody>
								<tr>
									<td>베이직 케어</td>
									<td id="one"></td>
								</tr>
								<tr>
									<td>미백 케어</td>
									<td id="two"></td>
								</tr>
								<tr>
									<td>주름 케어</td>
									<td id="three"></td>
								</tr>
								<tr>
									<td>여드름 케어</td>
									<td id="four"></td>
								</tr>
								<!-- <tr>
									<td><input type=hidden id="coupon-userno" value=""></td>
								</tr> -->
							</tbody>
							<tfoot></tfoot>
						</table>



					</div>
					
					</c:when>
			<c:otherwise>
				<h4>마이페이지 조회는 회원만 가능합니다.</h4>
				<c:import url="/WEB-INF/views/include/login.jsp" />
			</c:otherwise>
			</c:choose>
				</div>
			</div>
		</div>
	</div>
	<c:import url="/WEB-INF/views/include/footer.jsp" />

	<script>
	$(document).ready(function(){
		var userNo = '${sessionScope.authUser.no }'; //조회할때 보낼 회원 번호
		console.log('${sessionScope.authUser}');
		var userName = ""; //조회할때 보낼 회원이름
	
	
		$( "#reservebtn" ).click(function() {
			  $( "#reserve" ).submit();
		});
		$( "#visitbtn" ).click(function() {
			  $( "#visit" ).submit();
		});
		$( "#modifyuserbtn" ).click(function() {
			  $( "#modifyuser" ).submit();
		});
		
		
		
		
		/*  쿠폰count조회 모달  */
		$(".couponview").click(function() {
			//console.log(this);//.couponview 버튼
			$('#one').val("0");
			$('#two').val("0");
			$('#three').val("0");
			$('#four').val("0");
			var userNo = $(this).data("userno");//userno 소문자여야함
			console.log(userNo);//userno 받아옴
			$.ajax({
				url : "selectCoupon",
				type : "POST",
				data : {"userNo" : userNo}, 
				success : function(couponList) {
					console.log(couponList);
					$.each(couponList, function(index, couponVo) {
						if (couponVo.programNo == 1) {
							$('#one').val(couponVo.count);
							//console.log("쿠폰 Vo : " + couponVo.no);
							basic = couponVo.no;
							//console.log("확인x" + basic);
						} else if (couponVo.programNo == 2) {
							$('#two').val(couponVo.count);
							whitening = couponVo.no;
						} else if (couponVo.programNo == 3) {
							console.log("쿠폰 Vo : " + couponVo.no);
							$('#three').val(couponVo.count);
							console.log("확인x" + antiaging);
							antiaging = couponVo.no;
						} else if (couponVo.programNo == 4) {
							$('#four').val(couponVo.count);
							acne = couponVo.no;
						} else {
							// count가 0으로가 나도오록 
						}
					});
					$('#coupon-userno').val(userNo);
				}
			});
		});
	});
	</script>

</body>
</html>