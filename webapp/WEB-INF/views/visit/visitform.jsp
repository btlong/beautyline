<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>방문 내역</title>
<jsp:useBean id="now" class="java.util.Date" />

<!-- 부트스트랩 -->
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="http://code.jquery.com/ui/1.10.2/jquery-ui.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!-- Custom CSS -->
<link href="/beautyline/bootstrap/css/business-casual.css"
	rel="stylesheet">

<!-- 테마 -->
<link
	href="https://maxcdn.bootstrapcdn.com/bootswatch/3.3.7/flatly/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-+ENW/yibaokMnme+vBLnHMphUYxHs34h9lpdbSLuAwGkOKFRl4C34WkjazBtb7eT"
	crossorigin="anonymous">

<link href="/beautyline/beautyline/css/include.css" rel="stylesheet">

<!-- 원호 CSS -->
<link href="/beautyline/beautyline/css/visit.css" rel="stylesheet">

<!-- Fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Josefin+Slab:100,300,400,600,700,100italic,300italic,400italic,600italic,700italic"
	rel="stylesheet" type="text/css">
<link rel="stylesheet"
	href="http://www.prepbootstrap.com/Content/css/loadingbuttoneffects/local.css" />

</head>
<body>
	<c:import url="/WEB-INF/views/include/header.jsp" />

	<!-- container -->
	<div class="container">
		<div class="row">
			<div class="box">

				<c:choose>
					<c:when
						test="${not empty sessionScope.authUser && authUser.isAdmin eq 'a'}">

						<div class="col-lg-12">
							<div class="page-header">
								<hr>
								<h1 class="text-center text-center">
									<strong>방문내역관리</strong>
								</h1>
								<hr>
							</div>
							<div class="form-horizontal">
								<div class="form-group">
									<div class="col-sm-5 col-sm-offset-7">
										<a href="" data-target="#myModal3" data-toggle="modal"
											class="btn btn-danger btn-primary btn-default" id="package">
											쿠폰 등록</a> <a class="btn btn-danger btn-primary btn-default"
											href="/beautyline/visit/details" role="button">내역 조회</a> <a
											class="btn btn-danger btn-primary btn-default"
											id="insertUser" role="button">회원 등록</a>
									</div>
								</div>
								<form id="visit-form" name="visit-form" method="post"
									enctype="multipart/form-data"
									action="/beautyline/visit/visited">
									<!-- 회원 정보-->
									<div class="form-group">
										<!-- 이름 -->
										<label class="col-sm-2 control-label">회원 정보</label>
										<div class="col-sm-2 col-sm-offset-2" id="divName">
											<input type="text" class="form-control onlyHangul"
												name="searchName" id="searchName" placeholder="이름" value="">
										</div>
										<!-- 핸드폰 -->
										<div class="col-sm-2" id="divPhone">
											<input type="text" class="form-control onlyNumberPhone"
												name="searchPhone" id="searchPhone" placeholder="-없이 입력하세요."
												value="${userVo.phone}">
										</div>
										<!-- Trigger the modal with a button -->

										<button type="button"
											class="btn btn-theme btn-default col-sm-1" id="smyModal"
											data-target="#myModal2" data-toggle="modal">검색</button>
									</div>
									<div class="form-group">
										<div class="well">
											<div>
												<label class="control-label">이름:</label> <label
													id="wellName" name="name" class="control-label"></label> <label
													class="col-sm-offset-4 control-label">ID:</label> <label
													id="wellId" name="id" class="control-label"></label>
											</div>
											<div>
												<label class="control-label">핸드폰:</label> <label
													class="control-label" id="wellPhone" name="phone"></label>
											</div>
											<div>
												<label class="control-label">이메일:</label> <label
													class="control-label" id="wellEmail" name="email"></label>
											</div>
											<div>
												<label class="control-label">주소:</label> <label
													class="control-label" id="wellAddress" name="address"></label>
											</div>
										</div>
									</div>

									<!-- 쿠폰 정보 -->
									<div class="form-group">
										<label class="col-sm-2 activestep control-label">쿠폰 정보</label>
										<br>

										<table class="table table-bordered text-center row step"
											id="rowstep">
											<thead>
												<tr>
													<th class="danger" value="1" for="one">베이직 케어</th>
													<th class=" danger" value="2" for="two">미백 케어</th>
													<th class=" danger" value="3" for="three">주름 케어</th>
													<th class="danger" value="4" for="four">여드름 케어</th>
												</tr>
											</thead>
											<tr>
												<td class="col-md-2"
													onclick="javascript: resetActive(event, 1);"><label
													id="one" name="count" value="1">0</label></td>
												<td class="col-md-2"
													onclick="javascript: resetActive(event, 2);"><label
													id="two" name="count" value="2">0</label></td>
												<td class="col-md-2"
													onclick="javascript: resetActive(event, 3);"><label
													id="three" name="count" value="3">0</label></td>
												<td class="col-md-2"
													onclick="javascript: resetActive(event, 4);"><label
													id="four" name="count" value="4">0</label></td>
											</tr>
										</table>
									</div>

									<!-- <div class="row step" id="rowstep">
									<div id="div1" class="col-md-2 thumbnail"
										onclick="javascript: resetActive(event, 1);" value="1">
										<p>베이직 케어</p>
										<p id="one" name="count" value="1"></p>
									</div>
									<div class="col-md-2 thumbnail"
										onclick="javascript: resetActive(event, 2);" value="2">
										<p>미백 케어</p>
										<p id="two" name="count" value="2"></p>
									</div>
									<div class="col-md-2 thumbnail"
										onclick="javascript: resetActive(event, 3);">
										<span class="fa fa-refresh"></span>
										<p>주름 케어</p>
										<p id="three" name="count" value="3"></p>
									</div>
									<div id="last" class="col-md-2 thumbnail"
										onclick="javascript: resetActive(event, 4);">
										<p>여드름 케어</p>
										<p id="four" name="count" value="4"></p>
									</div>
								</div>
							</div> -->
									<fmt:formatDate value="${now}" pattern="yyyy-MM-dd H:m"
										var="today" />


									<!-- 결제 정보 -->
									<div class="form-group">
										<label class="col-sm-2 control-label">결제 정보</label> <label
											class="col-sm-3 control-label" id="regDate" name="regDate"
											value="${today}">${today}</label>
										<!-- test -->
										<div class="col-sm-3 col-sm-offset-2">
											<div class="radio-group">
												<input id="opt_1" class="radio-group__option" type="radio"
													name="payNo" value="1"> <label
													class="radio-group__label control-label" for="opt_1">
													현장 결제 </label> <input id="opt_2" class="radio-group__option"
													type="radio" name="payNo" value="2" checked="checked">
												<label class="radio-group__label control-label" for="opt_2">
													쿠폰</label>
											</div>
											<div id="log"></div>
										</div>
									</div>
									<br />
									<!-- 측정 정보 -->
									<div class="form-group">
										<label class="col-sm-2 control-label">측정 정보</label>
										<table class="table table-bordered text-center">
											<tr class="danger">
												<th>사진</th>
												<th>미백</th>
												<th>주름</th>
												<th>피부탄력</th>
												<th>수분</th>
												<th>여드름</th>
											</tr>
											<tr class="center-blcok">
												<td>
													<div class="filebox bs3-primary preview-image">
														<div class="mag1">
															<input id="imageName" data-toggle="magnify"
																class="upload-name img-responsive img-rounded center-block"
																value="" disabled="disabled" style="width: 200px;"
																value=""> <label for="file">업로드</label> <input
																type="file" id="file" name="file" class="upload-hidden"
																onchange="reviewUploadImg(this);">
														</div>
													</div>

												</td>
												<td><input class="onlyNumberScore" type="text"
													id="whiteningScore" name="whiteningScore" value="" size="8"></td>

												<td><input class="onlyNumberScore" type="text"
													id="whinkleScore" name="whinkleScore" value="" size="8"
													maxlength="3" min="0" max="100"></td>
												<td><input class="onlyNumberScore" type="text"
													id="elasticScore" name="elasticScore" value="" size="8"
													maxlength="3"></td>
												<td><input class="onlyNumberScore" type="text"
													id="moistureScore" name="moistureScore" value="" size="8"
													maxlength="3"></td>
												<td><input class="onlyNumberScore" type="text"
													id="acneScore" name="acneScore" value="" size="8"
													maxlength="3"></td>
											</tr>
										</table>
										<input type="hidden" id="userNo" name="userNo">
										<!-- <input type="hidden" id="averageScore" name="averageScore" value=''> -->
										<input type="hidden" id="programNo" name="programNo" value='0'>
										<!-- 메모  -->
										<div class="row">
											<label class="col-sm-2 control-label">메모</label>
											<textarea class="col-sm-3" id="memo" rows="2" cols="35"
												name="memo"></textarea>

											<div class="col-sm-2 col-sm-offset-3" id="average">
												<label class="control-label"></label>
											</div>
										</div>
									</div>

									<!-- 시술 등록 -->
									<div class="form-group">
										<div class="text-center">
											<button type="submit" class="btn btn-theme" id="registor"
												data-loading-text="등록중...">등록</button>
										</div>
									</div>
								</form>
							</div>
						</div>
					</c:when>


					<c:otherwise>
						<!-- authUser.isAdmin 값이 'a'가 아닐 때 -->
						<div class="col-lg-12 text-center">
							<hr>
							<h1>
								<strong>회원관리</strong>
							</h1>
							<hr>
							<h4>관리자만 가능합니다.</h4>
							<c:import url="/WEB-INF/views/include/login.jsp" />
						</div>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</div>
	<!-- 푸터 -->
	<c:import url="/WEB-INF/views/include/footer.jsp" />

	<!--  userSearch Modal -->
	<c:import url="/WEB-INF/views/visit/usersearch.jsp" />


	<!--  couponCharge Modal -->
	<c:import url="/WEB-INF/views/visit/couponcharge.jsp" />

	<!-- insertUser Modal  -->
	<c:import url="/WEB-INF/views/visit/insertuser.jsp" />
</body>
<script>
	/* search Modal Click */
	var userNo;
	var programNo;

	/* 이미지 이름 불러오기 */
	function reviewUploadImg(fileObj) {
		var filePath = fileObj.value;
		var fileName = filePath.substring(filePath.lastIndexOf("\\") + 1);
		var fileKind = fileName.split(".")[1];
		if (fileKind != "jpg" && fileKind != "gif" && fileKind != "png"
				&& fileKind != "PNG" && fileKind != "JPG" && fileKind != "GIF") {
			alert("jpg, gif, png 확장자를 가진 이미지 파일만 올려주세요.");
			document.getElementById("imageName").value = "";
			document.getElementById("file").select();
			document.selection.clear();
		}
		$("#imageName").val(fileName);
	}

	$("#smyModal").on("click", function() {

		var trString = "";

		$('#selectedName').html("");
		$('#selectedPhone').html("");
		var name = $('#searchName').val();
		var phone = $('#searchPhone').val();

		if (name == "" && phone == "") {
			alert(" 회원정보를 입력해주세요.");
			return false;
		}

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
					trString += "<option class='muk'>";
					trString += userVo.name;
					trString += "&nbsp;&nbsp;|&nbsp;&nbsp;";
					trString += userVo.phone;
					trString += "</option>";
				});
				$(".muk").remove();
				$("#selected").append(trString);
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

	/* 선택버튼 완료시 */
	$("#userSelect").on("click", function() {
		$('#one').html("0");
		$('#two').html("0");
		$('#three').html("0");
		$('#four').html("0");

		var tdString = "";
		var name = $("#selectedName").html().replace(/&nbsp;/gi, '');
		var phone = $("#selectedPhone").html().replace(/&nbsp;/gi, '').trim();

		if (name == "" || phone == "") {
			alert("선택해주세요");
			return;
		}
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
				/* 말줄임말 필요 */
				/* 	document.getElementById('searchName').value = user.name;
					document.getElementById('searchPhone').value = user.phone; */

				document.getElementById('searchName').value = "";
				document.getElementById('searchPhone').value = "";
				$('#wellName').html(user.name);
				$('#wellId').html(user.id);
				$('#wellPhone').html(user.phone);
				$('#wellEmail').html(user.email);
				$('#wellAddress').html(user.address);

				/* userNo = parseInt(user.no); */
				$("#userNo").val(parseInt(user.no));
				/* 아이디 비교하여 남은 횟수 td에 append */
				/* for문에  if문을 섞어서  */
				var coupon = retVal.couponList;

				$.each(coupon, function(index, couponVo) {
					if (couponVo.programNo == 1) {
						$('#one').html(couponVo.count);
					} else if (couponVo.programNo == 2) {
						$('#two').html(couponVo.count);
					} else if (couponVo.programNo == 3) {
						$('#three').html(couponVo.count);
					} else if (couponVo.programNo == 4) {
						$('#four').html(couponVo.count);
					} else {
						// count가 0으로가 나도오록 
					}
				});
			}
		});
		$("#myModal2").modal('hide'); // 숨키기.
	});

	/* 이미지 미리보기 */
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
						/* var fname=document.all.file.value;
						var arr=("file:///"+fname.replace(/ /gi,"%20").replace(/\/ /gi,"/")).split("/");
						alert("파일명 : " + arr[arr.length-1]);
						$("#imageName").val(arr[arr.length-2]); */
					});

	/* 한글만 적용 */
	$(".onlyHangul").keyup(function(event) {
		if (!(event.keyCode >= 37 && event.keyCode <= 40)) {
			var inputVal = $(this).val();
			$(this).val(inputVal.replace(/[a-z0-9]/gi, ''));
		}
	});

	/* 숫자만 적용 */
	$(".onlyNumber").keyup(function(event) {
		if (!(event.keyCode >= 37 && event.keyCode <= 40)) {
			var inputVal = $(this).val();
			$(this).val(inputVal.replace(/[^0-9]/gi, ''));
		}
	});

	/* 점수만 적용 Max - 3자리수 */
	$(".onlyNumberScore").keyup(function(event) {
		var average;
		if (!(event.keyCode >= 37 && event.keyCode <= 40)) {
			var inputVal = $(this).val();
			$(this).val(inputVal.replace(/[^0-9]/gi, ''));
		}
		if (parseInt($(this).val()) > 100) {
			$('#average').html('입력 값 0 ~ 100');
			$(this).val('');
		}
	});

	/* focus를 잃었을때 */
	$(".onlyNumberScore").blur(function() {

		var value = $(this).val();
		var score = score + parseInt(value);
		$(this).css("background-color", "#68dff0"); // 배경색 변경

	});
	/* 이름 - 한글만  */
	$('#searchName').keyup(function(event) {

		var divId = $('#divName');

		if ($('#searchName').val() == "") {
			divId.removeClass("has-success");
			divId.addClass("has-error");
		} else {
			divId.removeClass("has-error");
			divId.addClass("has-success");
		}

	});

	/* 전화번호 - 숫자만  */
	$('#searchPhone').keyup(function(event) {
		var divId = $('#divPhone');
		if ($('#searchPhone').val() == "") {
			divId.removeClass("has-success");
			divId.addClass("has-error");
		} else {
			divId.removeClass("has-error");
			divId.addClass("has-success");
		}
	});

	/* 점수 입력값 숫자만  */
	$('#whiteningScore').keyup(function(event) {
		var divId = $('#divWhitening');
		if ($('#whiteningScore').val() == "") {
			divId.removeClass("has-success");
			divId.addClass("has-error");
		} else {
			divId.removeClass("has-error");
			divId.addClass("has-success");
		}
	});

	function resetActive(event, y) {

		$("td").each(function() {
			if ($(this).hasClass("activestep")) {
				$(this).removeClass("activestep");
			}
		});

		if (event.target.className == "col-md-2") {
			$(event.target).addClass("activestep");

		} else {
			$(event.target.parentNode).addClass("activestep");
		}
		var por = $("#programNo").val(y);
	}

	/* 라디오버튼시 on off */
	function updateLog() {

		var tradioString = "";

		/* 해당 id에 checked 옵션. */
		var one = $("#opt_1:checked").val() ? "On" : "Off"
		var two = $("#opt_2:checked").val() ? "On" : "Off"

		tradioString = "<input id='opt_3' class='radio-group__option' type='radio' name='payNo' value='3'> <label class='radio-group__label control-label' for='opt_3'> 현금 </label>"
				+ "<input id='opt_4' class='radio-group__option' type='radio' name='payNo' value='4'>"
				+ " <label class='radio-group__label control-label' for='opt_4'> 카드</label>"
				+ "<input type='text' class='form-control onlyNumber' id='price' name='price'>원";

		$("#log").html(tradioString);
		$("#log").show();
		if (one == "On") {
			$("#log").show();
			$("#log").html(tradioString);
		} else if (two == "On") {
			$("#log").hide();
		}

	}
	/* 충전 모달 열기 */
	$("#package").on("click", function() {
		// 모달 열기

		var name = $('#wellName').text();
		var phone = $('#wellPhone').text();
		var userVo = {
			"name" : name,
			"phone" : phone
		};

		$.ajax({
			url : "packageModal",
			type : "POST",
			data : JSON.stringify(userVo),
			contentType : "application/json",

			success : function(authUser) {

				if (authUser == '') {
					$('#packageName').html("");
					$('#packagePhone').html("");

				}
				/* packageName은  id값 */
				$('#packageName').html(authUser.name);
				$('#packagePhone').html(authUser.phone);
				/* userNo = parseInt(authUser.no); */
				$("#userNo").val(parseInt(authUser.no));
				userNo = authUser.no;

			}
		});

		$("#myModal").modal();
	});

	/* 쿠폰 충전 */
	$("#packageCharge").on("click", function() {
		var name = $("#packageName").val();
		var phone = $("#packagePhone").val();
		var programNo = $("#packageSelected option:checked").val();
		var payNo = $(".radio-box:checked").val();
		var count = $("#packageCount").val();
		var price = $("#packagePrice").val();
		var couponVo = {
			"name" : name,
			"userNo" : userNo,
			"phone" : phone,
			"programNo" : programNo,
			"payNo" : payNo,
			"count" : count,
			"price" : price
		};

		$.ajax({
			url : "packageCharge",
			type : "POST",
			data : JSON.stringify(couponVo),
			contentType : "application/json",

			success : function(couponList) {
				$.each(couponList, function(index, couponVo) {
					if (couponVo.programNo == 1) {
						$('#one').html(couponVo.count);
					} else if (couponVo.programNo == 2) {
						$('#two').html(couponVo.count);
					} else if (couponVo.programNo == 3) {
						$('#three').html(couponVo.count);
					} else if (couponVo.programNo == 4) {
						$('#four').html(couponVo.count);
					} else {
						// count가 0으로가 나도오록 
					}

				});
				alert("충전되었습니다.");
				$("#myModal3").modal('hide'); // 숨키기.
			}
		});

	});

	$(".radio-group__option").change(updateLog);

	$("#registor").on("click", function() {

				/* 회원정보가 비어있을때 */
				if ($("#wellName").html() == '' || $("#wellphone").html() == '') {
					alert("회원을 검색해주세요.");
					return false;
				}

				/* 쿠폰이 없을때  */
				var payNo = $(".radio-group__option:checked").val();

				var programSample = $("#programNo").val();
				var count;
				if (programSample == 1) {
					count = $('#one').text();
				} else if (programSample == 2) {
					count = $('#two').text();
				} else if (programSample == 3) {
					count = $('#three').text();
				} else if (programSample == 4) {
					count = $('#four').text();
				}

				$("td").each(function() {
					if ($(this).hasClass("activestep") == false ) {
						alert("선택해주세요");
						return false;
					}
				});
					
				if (count <= 0 && payNo == 2) {
					alert("횟수가 부족");
					return false;
				}

				/* 점수가 비어있을때 */

				if ($("#whiteningScore").val() == ''
						|| $("#whinkleScore").val() == ''
						|| $("#elasticScore").val() == ''
						|| $("#moistureScore").val() == ''
						|| $("#acneScore").val() == '') {
					alert("점수 입력 바랍니다.");
					return false;
				}
				
				
				/* 사진이 비어있을때 */
				if($("#imageName").text() =='') {
					alert($("#imageName").html());
					return false;
				}
					
			});

	/* 회원추가 모달 */
	$("#insertUser").on("click", function() {
		$("#inputName").val('');//초기화
		$("#inputNumber").val('');//초기화
		$("#myModal4").modal();
	});

	/* 회원추가 모달에서 이름과 전화번호에 값이 잘못 들어올때 막기 */
	$('#inputName').keyup(function(event) {
		var divId = $('#divName');

		if ($('#inputName').val() == "") {
			divId.removeClass("has-success");
			divId.addClass("has-error");
		} else {
			divId.removeClass("has-error");
			divId.addClass("has-success");
		}
	});

	/* 회원 추가 */
	var inputName = "";
	var inputNumber = "";
	$("#insertUserInfo").on("click", function() {
		inputName = $("#inputName").val();
		inputNumber = $("#inputNumber").val();
		if (inputName == "") {
			alert("회원 이름을 입력하세요");
			return false;
		}
		if (inputNumber == "") {
			alert("회원 전화번호를 입력하세요");
			return false;
		}
		var isAdmin = "y";
		var uservo = {
			"name" : inputName,
			"phone" : inputNumber,
		};
		var dbCk = ""; //db에 들어갔는지 검사
		$.ajax({
			url : "insertUser",
			type : "POST",
			data : JSON.stringify(uservo),
			dataType : "JSON",
			contentType : "application/json",
			success : function(uservi) {
				console.log(uservi);
				/*예약세부내용 사용자 정보 추가'임효빈:01029392382'*/
				if (uservi = !null) {
					dbCk = 'y';
				}
				if (dbCk == 'y') {
					alert("회원이 추가 되었습니다.");
					return true;
				} else {
					alert("유효하지 않은 정보 입니다.");
					return false;
				}
			}
		});

		$("#myModal4").modal('hide');
	});

	/* 핸드폰 하이픈 자동 삽입  */
	$(".onlyNumberPhone").keyup(function(event) {

		if (!(event.keyCode >= 37 && event.keyCode <= 40)) {
			var inputVal = $(this).val();
			inputVal = inputVal.replace(/[^0-9]/g, '');
			var tmp = '';

			if (inputVal.length < 4) {
				return $(this).val(inputVal);
			} else if (inputVal.length < 7) {
				tmp += inputVal.substr(0, 3);
				tmp += '-';
				tmp += inputVal.substr(3);
				return $(this).val(tmp);
			} else if (inputVal.length < 11) {
				tmp += inputVal.substr(0, 3);
				tmp += '-';
				tmp += inputVal.substr(3, 3);
				tmp += '-';
				tmp += inputVal.substr(6);
				return $(this).val(tmp);
			} else {
				tmp += inputVal.substr(0, 3);
				tmp += '-';
				tmp += inputVal.substr(3, 4);
				tmp += '-';
				tmp += inputVal.substr(7);
				return $(this).val(tmp);
			}
		}
	});

	/* 쿠폰 차지모달 유효성 검사 */
</script>
</html>

