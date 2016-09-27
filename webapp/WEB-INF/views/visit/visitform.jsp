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
<jsp:useBean id="now" class="java.util.Date" />
<!-- modal script -->
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!-- Bootstrap Core CSS -->
<link href="/beautyline/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Custom CSS -->
<link href="/beautyline/bootstrap/css/business-casual.css"
	rel="stylesheet">
<!-- visit css -->
<link href="/beautyline/beautyline/css/visit.css" rel="stylesheet">

<!-- Fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Josefin+Slab:100,300,400,600,700,100italic,300italic,400italic,600italic,700italic"
	rel="stylesheet" type="text/css">
<style>
</style>
</head>
<body>
	<c:import url="/WEB-INF/views/include/header.jsp" />

	<!-- container -->
	<div class="container">
		<form id="visitform" name="visitForm" method="post"
			action="/beautyline/visited">
			<!-- Navigation -->
			<div class="box center-block">
				<div class="form-inline col-lg-10">
					<div class="form-group">

						<a href="" data-target="#myModal1" data-toggle="modal"
							class="btn btn-danger btn-primary btn-sm left-block" id="package"> 쿠폰 등록</a>
						<a class="btn btn-danger btn-primary btn-sm right-block" href="/beautyline/visit/details" role="button">내역 조회</a> 
						<a class="btn btn-danger btn-primary btn-sm right-block" href="/beautyline/visit/registration" role="button">회원 등록</a>
					</div>
				</div>
			</div>

			<div class="box">
				<div class="form-inline col-lg-11">
					<p class="bg-danger">
						<!-- userNo -->
						<label class="intro-text">회원번호</label> <input type="text"
							class="form-control" name="userNo" id="userNo"
							value="${userVo.no}">

						<!-- name -->
						<label class="intro-text">이름</label> <input type="text"
							class="form-control" name="name" id="name" placeholder="홍길동"
							value="${userVo.name}">

						<!-- phone -->
						<label class="intro-text">전화번호</label> <input type="text"
							class="form-control" name="phone" id="phone"
							placeholder="010-1234-1234" value="${userVo.phone}">

						<!-- Trigger the modal with a button -->
						<button type="button" class="btn btn-info btn-lg" id="smyModal"
							data-target="#myModal3" data-toggle="modal">검색</button>
					</p>
				</div>


				<div class="form-inline col-lg-10 ">
					<label class="intro-text">케어 프로그램</label>
					<table class="table animation" id="careProgram" name="careProgram">

						<tr class="danger">
							<th>베이직 케어</th>
							<th>미백 케어</th>
							<th>주름 케어</th>
							<th>여드름 케어</th>
						</tr>

						<tr>
							<th id="one"></th>
							<th id="two"></th>
							<th id="three"></th>
							<th id="four"></th>
						</tr>

					</table>
				</div>

				<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today" />
				<div class="form-inline col-lg-10">
					<div class="form-group">
						<label class="intro-text">날짜 : </label> <label class="intro-text"><small><strong>${today}</strong></small></label>
					</div>
				</div>

				<div class="form-group col-lg-10">
					<label class="intro-text"> 점수 </label>
					<div class="table-responsive">
						<table class="table table-hover">
							<tr class="danger">
								<th>측정 사진</th>
								<th>수분</th>
								<th>안티에이징</th>
								<th>민감도</th>
								<th>피부나이</th>
							</tr>
							<tr>
								<td>
									<div class="filebox bs3-primary preview-image">
										<input class="upload-name" value="파일선택" disabled="disabled"
											style="width: 200px;"> <label for="input_file">업로드</label>
										<input type="file" id="input_file" class="upload-hidden">
									</div>
								</td>
								<td>input 값 넣기</td>
								<td>65</td>
								<td>34</td>
								<td>88</td>
							</tr>
						</table>
					</div>
				</div>

				<div class="form-group col-lg-10">
					<div class="form-inline">
						<div class="col-md-8">
							<label class="intro-text">메모</label>
							<textarea class="form-control" rows="3"></textarea>
						</div>

						<div class="col-md-4">
							<label class="radio-inline"> <input type="radio"
								name="inlineRadioOptions" id="inlineRadio1" value="option1">쿠폰
							</label> <label class="radio-inline"> <input type="radio"
								name="inlineRadioOptions" id="inlineRadio2" value="option2">현장결제
							</label>
							<div class="form-inline">
								<label class="intro-text">금액</label> <input type="text"
									class="form-control" id="money">
								<button type="submit" class="btn btn-default" id="registor"
									data-loading-text="등록중...">등록</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</form>
	</div>

	<!-- 회원번호 : 텍스트박스  ,  이름 : 텍스트박스 		right 전화번호 : 텍스트박스  -->
	<c:import url="/WEB-INF/views/include/footer.jsp" />



	<!-- searchModal -->

	<div class="modal fade" id="myModal3" role="dialog" tabindex="-1"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">

			<!-- Modal content-->
			<form class="form-inline" id="searchform" method="post"
				action="search">
				<div class="modal-content">
					<!-- header -->
					<div class="modal-header">
						<!-- 닫기(x) 버튼 -->
						<button type="button" class="close" data-dismiss="modal">×</button>
						<!-- header title -->
						<h4 class="modal-title text-center">
							<strong>회원검색</strong>
						</h4>
					</div>

					<!-- body -->
					<div class="modal-body">
						<select size="5" class="text-center center-block " id="selected">
							<option disabled="disabled">이름
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;전화번호</option>
							<option disabled="disabled">------------------------------------------------</option>

							<!-- Ajax 들어옴 -->
						</select>

						<div class="text-center address-bar bg-danger">
							<label class="control-label col-sm-6 text-right container">
								<strong>이름 : </strong>
							</label> <label id="selectedName"
								class="control-label col-sm-6 text-left container"><strong></strong></label>
							<br> <label
								class="control-label col-sm-6 text-right container"><strong>전화번호
									:</strong></label> <label id="selectedPhone"
								class="control-label col-sm-6 text-left container"><strong></strong></label><br>
						</div>
					</div>

					<!-- Footer -->
					<div class="modal-footer">
						<button id="userSelect" class="center-block btn btn-danger"
							type="button">선택</button>
					</div>
				</div>
			</form>
		</div>
	</div>





	<!-- package Model-->
	<div id="myModal1" class="modal fade " tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
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
		<!-- 	<form class="form-inline" method="post" action="registration"> -->

		<div class="modal-body">

			<div class="bg-danger ">
				<div class="row center-blocks">
					<label class="col-md-6 text-right">이름</label> <input
						class="col-md-3" type="text" value="">
				</div>
				<div class="row center-blocks">
					<label class="col-md-6 text-right">전화번호</label> <input
						class="col-md-3" type="text" value="">
				</div>

				<div class="row center-blocks">
					<label class="col-md-6 text-right">구매프로그램</label> <select
						class="col-md-3">
						<option value="1">여드름케어</option>
						<option value="2">주름 케어</option>
						<option value="3">화이트닝 케어</option>
						<option value="4">여드름 케어</option>
					</select>
				</div>
				<div class="row center-blocks">
					<label class="col-md-6 text-right">횟수</label> <input
						class="col-md-2" type="text" value=""> <label
						class="col-md-1">회</label>
				</div>
				<div class="row center-blocks">
					<label class="col-md-6 text-right">금액</label> <input
						class="col-md-2" type="text" value="">
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
		<!-- 	</form> -->
	</div>




</body>
<script>
	/* search Modal Click */
	$("#smyModal").on("click", function() {
		var trString = "";
		var name = $('#name').val();
		var phone = $('#phone').val();

		var userVo = {
			"name" : name,
			"phone" : phone
		};
		$.ajax({
			url : "visitorsearchform",
			type : "POST",
			data : JSON.stringify(userVo),
			contentType : "application/json",

			success : function(visitorList) {

				$.each(visitorList, function(index, userVo) {
					trString += "<option>";
					trString += userVo.name;
					trString += "&nbsp;|&nbsp;&nbsp;";
					trString += userVo.phone;
					trString += "</option>";
				});
				$("#selected").append(trString);
				//
			}
		});

	});

	/* searched visitor select */
	$("#selected").change(function() {
		var str = "";
		// 선택된 값 불러오기
		$("#selected option:selected").each(function(idx, item) {
			str += $(this).text() + " ";
		});

		// 이름과 전화번호 분류
		var split = str.split('|');

		// 이름과 전화번호 해당 Id에 적용
		var selectedName = $("#selectedName").text(split[0]);
		var selectedPhone = $("#selectedPhone").text(split[1]);

	});

	/* selcted complit  회원정보 + 쿠폰 횟수 */
	$("#userSelect").on("click", function() {
		var tdString = "";
		var name = $("#selectedName").html().replace(/&nbsp;/gi, '');
		var phone = $("#selectedPhone").html().replace(/&nbsp;/gi, '').trim();
		var userVo = {
			"name" : name,
			"phone" : phone
		};
		$.ajax({
			url : "searchSucess",
			type : "POST",
			data : JSON.stringify(userVo),
			contentType : "application/json",
			success : function(retVal) {
				var user = retVal.authUser;
				var selectId = [ "one", "two", "three", "four" ];
				/* 말줄임말 필요 */
				document.getElementById('userNo').value = user.no;
				document.getElementById('name').value = user.name;
				document.getElementById('phone').value = user.phone;

				/* 아이디 비교하여 남은 횟수 td에 append */
				/* for문에  if문을 섞어서  */
				var coupon = retVal.couponList;
				$.each(coupon, function(index, couponVo) {
					console.log(couponVo.program_no);
					if (couponVo.program_no == 1) {
						$('#one').html(couponVo.count);
						return;
					} else if (couponVo.program_no == 2) {
						$('#two').html(couponVo.count);
						return;
					} else if (couponVo.program_no == 3) {
						$('#three').html(couponVo.count);
						return;
					} else if (couponVo.program_no == 4) {
						$('#four').html(couponVo.count);
						return;
					} else {
						// count가 0으로가 나도오록 
					}
				});
				/* $("#careProgram").append(tdString); */
			}
		});
		$("#myModal3").modal('hide'); // 숨키기.
	});

	/* package Modal */
	$("#package").on("click", function() {
		$("#myModal").modal();
	});

	//preview image 
	var imgTarget = $('.preview-image .upload-hidden');

	imgTarget
			.on(
					'change',
					function() {
						var parent = $(this).parent();
						parent.children('.upload-display').remove();

						if (window.FileReader) {
							//image 파일만
							if (!$(this)[0].files[0].type.match(/image\//))
								return;

							var reader = new FileReader();
							reader.onload = function(e) {
								var src = e.target.result;
								parent
										.prepend('<div class="upload-display"><div class="upload-thumb-wrap"><img src="'+src+'" class="upload-thumb"></div></div>');
							}
							reader.readAsDataURL($(this)[0].files[0]);
						}

						else {
							$(this)[0].select();
							$(this)[0].blur();
							var imgSrc = document.selection.createRange().text;
							parent
									.prepend('<div class="upload-display"><div class="upload-thumb-wrap"><img class="upload-thumb"></div></div>');

							var img = $(this).siblings('.upload-display').find(
									'img');
							img[0].style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(enable='true',sizingMethod='scale',src=\""
									+ imgSrc + "\")";
						}
					});
</script>
</html>

