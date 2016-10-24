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
<title>나의 피부점수</title>


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

<style type="text/css">
.test img {
	margin: 20px 10px;
	width: 145px;
	height: 145px;
	cursor: pointer;
}

.selected {
	filter: url('data:image/svg+xml;charset=utf-8,<svg xmlns="http://www.w3.org/2000/svg"><filter id="filter"><feComponentTransfer color-interpolation-filters="sRGB"><feFuncR type="linear" slope="0.6" /><feFuncG type="linear" slope="0.6" /><feFuncB type="linear" slope="0.6" /></feComponentTransfer></filter></svg>#filter');
	filter: brightness(0.6);
	-webkit-filter: brightness(0.6);
}

.hovereffect:hover img {
	-webkit-transition: all 0.35s;
	transition: all 0.35s;
	filter: url('data:image/svg+xml;charset=utf-8,<svg xmlns="http://www.w3.org/2000/svg"><filter id="filter"><feComponentTransfer color-interpolation-filters="sRGB"><feFuncR type="linear" slope="0.6" /><feFuncG type="linear" slope="0.6" /><feFuncB type="linear" slope="0.6" /></feComponentTransfer></filter></svg>#filter');
	filter: brightness(0.6);
	-webkit-filter: brightness(0.6);
}

#next {
	margin-top: 50px;	
}

#forward {
	width: 150px;
}
</style>
	

<script type="text/javascript" src="/beautyline/bootstrap/js/jquery.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="http://getbootstrap.com/dist/js/bootstrap.min.js"></script>


<script type="text/javascript">
	$(document).ready(function() {
		
		$(function() {
			$("#btn_temp").click(function() {
				var url = "/beautyline/mypage/history?userNo=8";
				$(location).attr('href',url);
			});
		});

		$(function() {
			$(".test img").click(function() {
				$("img.selected").removeClass("selected");
				$(this).addClass("selected");
			});
		});


		$(function() {
			$("#forward").click(function() {
				if ($("#stage").val() == 1) {
					if($("#score1").val() == '') {
						alert("버튼을 누르세요");
						return;
					}
					$("#stage").val("2");
					$("#white").remove();
					$("#lifting").removeClass("hide");
                } else if ($("#stage").val() == 2) {
                	if($("#score2").val() == '') {
						alert("버튼을 누르세요");
						return;
					}
					$("#stage").val("3");
					$("#lifting").remove();
					$("#elastic").removeClass("hide");
                } else if ($("#stage").val() == 3) {
                	if($("#score3").val() == '') {
						alert("버튼을 누르세요");
						return;
					}
					$("#stage").val("4");
					$("#elastic").remove();
					$("#moisture").removeClass("hide");
                } else if ($("#stage").val() == 4) {
                	if($("#score4").val() == '') {
						alert("버튼을 누르세요");
						return;
					}
                	$("#stage").val("5");
					$("#moisture").remove();
					$("#acne").removeClass("hide");
                } else if ($("#stage").val() == 5) {
                	if($("#score5").val() == '') {
						alert("버튼을 누르세요");
						return;
					}
					$("#scores").submit();
					console.log("섭밋"); 
                }
			});
		});

		$("#white1").click(function() {
			$("#score1").val("20");

		});

		$("#white2").click(function() {
			$("#score1").val("40");
		});

		$("#white3").click(function() {
			$("#score1").val("60");
		});

		$("#white4").click(function() {
			$("#score1").val("80");
		});
		
		$("#white5").click(function() {
			$("#score1").val("100");
		});

		$("#lifting1").click(function() {
			$("#score2").val("20");
		});
		
		$("#lifting2").click(function() {
			$("#score2").val("40");
		});
		
		$("#lifting3").click(function() {
			$("#score2").val("60");
		});
		
		$("#lifting4").click(function() {
			$("#score2").val("80");
		});
		
		$("#lifting5").click(function() {
			$("#score2").val("100");
		});
		
		$("#elastic1").click(function() {
			$("#score3").val("20");
		});
		
		$("#elastic2").click(function() {
			$("#score3").val("40");
		});
		
		$("#elastic3").click(function() {
			$("#score3").val("60");
		});
		
		$("#elastic4").click(function() {
			$("#score3").val("80");
		});
		
		$("#elastic5").click(function() {
			$("#score3").val("100");
		});
		
		$("#moisture1").click(function() {
			$("#score4").val("20");
		});
		
		$("#moisture2").click(function() {
			$("#score4").val("40");
		});
		
		$("#moisture3").click(function() {
			$("#score4").val("60");
		});
		
		$("#moisture4").click(function() {
			$("#score4").val("80");
		});
		
		$("#moisture5").click(function() {
			$("#score4").val("100");
		});

		$("#acne1").click(function() {
			$("#score5").val("20");
		});

		$("#acne2").click(function() {
			$("#score5").val("40");
		});

		$("#acne3").click(function() {
			$("#score5").val("60");
		});

		$("#acne4").click(function() {
			$("#score5").val("80");
		});

		$("#acne5").click(function() {
			$("#score5").val("100");
		});
		
		
	});
</script>
	
	
	
</head>
<body>
	<c:import url="/WEB-INF/views/include/header.jsp" />

	<div class="container">
		<div class="row">
			<div class="box">
				<div id="content">
					<form id="scores" name="score" action="result" method="post">
						<input type="hidden" id ="stage" name="stage" value="1" />
						<input type="hidden" id ="score1" name="score1" value="" />
						<input type="hidden" id ="score2" name="score2" value="" />
						<input type="hidden" id ="score3" name="score3" value="" />
						<input type="hidden" id ="score4" name="score4" value="" />
						<input type="hidden" id ="score5" name="score5" value="" />
					</form>
					<div class="col-lg-12" id="temp">
						<button id="btn_temp">히스토리</button>
					</div>
				<div class="col-lg-12">
					<hr>
					<h2 class="intro-text text-center">
						<strong>나의 피부타입</strong><br>검사하기
					</h2>
					<hr>
				</div>
				
				<div class="col-lg-12" id=white>
					<h2 class="col-lg-12 text-center">
						<small>평소 메이크업 스타일을 <strong>피부색과 비교하면?</strong></small>
					</h2>
					<div class="col-lg-12 form-inline test">
						<div class="form-group hovereffect">
						<img id="white1" src="/beautyline/images/skin_test/white/white1.png" /> 
						</div>
						<div class="form-group hovereffect">
						<img id="white2" src="/beautyline/images/skin_test/white/white2.png" /> 
						</div>
						<div class="form-group hovereffect">
						<img id="white3" src="/beautyline/images/skin_test/white/white3.png" /> 
						</div>
						<div class="form-group hovereffect">
						<img id="white4" src="/beautyline/images/skin_test/white/white4.png" /> 
						</div>
						<div class="form-group hovereffect">
						<img id="white5" src="/beautyline/images/skin_test/white/white5.png" />					
						</div>
					</div>
				</div>
				
				<div class="col-lg-12 hide" id=lifting>
					<h2 class="col-lg-12 text-center">
						<small>나의 <strong>주름 상태</strong>는 어떤 편 인가요?</small>
					</h2>
					<div class="col-lg-12 form-inline test">
						<div class="form-group hovereffect">
							<img id="lifting5" src="/beautyline/images/skin_test/lifting/lifting5.png" />
						</div>
						<div class="form-group hovereffect">
							<img id="lifting4" src="/beautyline/images/skin_test/lifting/lifting4.png" /> 
						</div>
						<div class="form-group hovereffect">
							<img id="lifting3" src="/beautyline/images/skin_test/lifting/lifting3.png" /> 
						</div>
						<div class="form-group hovereffect">
							<img id="lifting2" src="/beautyline/images/skin_test/lifting/lifting2.png" /> 
						</div>
						<div class="form-group hovereffect">
							<img id="lifting1" src="/beautyline/images/skin_test/lifting/lifting1.png" />				
						</div>
					</div>
				</div>
				
				<div class="col-lg-12 hide" id=elastic>
					<h2 class="col-lg-12 text-center">
						<small>자고일어나서 베개 자국이 얼마나 빨리 없어지나요?</small>
					</h2>
					<div class="col-lg-12 form-inline test">
						<div class="form-group text-center">
						<div class="hovereffect">
							<img id="elastic5" src="/beautyline/images/skin_test/elastic/elas1.png" />				
						</div>
						<span>자국이 나지 않는다</span>
						</div>
						<div class="form-group text-center">
						<div class="hovereffect">
							<img id="elastic4" src="/beautyline/images/skin_test/elastic/elas2.png" /> 
						</div>
						<span>일어나자 마자</span>
						</div>
						<div class="form-group text-center">
						<div class="hovereffect">
							<img id="elastic3" src="/beautyline/images/skin_test/elastic/elas3.png" /> 
						</div>
						<span>양치질 할 때</span>
						</div>
						<div class="form-group text-center">
						<div class="hovereffect">
							<img id="elastic2" src="/beautyline/images/skin_test/elastic/elas4.png" /> 
						</div>
						<span>출근할 때</span>
						</div>
						<div class="form-group text-center">
						<div class="hovereffect">
							<img id="elastic1" src="/beautyline/images/skin_test/elastic/elas5.png" /> 
						</div>
						<span>점심 전 후에</span>
						</div>
					</div>
				</div>
				
				<div class="col-lg-12 hide test" id=moisture>
					<h2 class="col-lg-12 text-center">
						<small>기초단계에서 사용하는 <strong>가장 무거운 제형의 화장품은?</strong></small>
					</h2>
					<div class="col-lg-12 form-inline test">
						<div class="form-group text-center">
						<div class="hovereffect">
							<img id="moisture5" src="/beautyline/images/skin_test/moisture/non_use.png" />				
						</div>
							<span>사용하지 않는다</span>
						</div>
						<div class="form-group text-center">
						<div class="hovereffect">
							<img id="moisture4" src="/beautyline/images/skin_test/moisture/skin.png" /> 
						</div>
							<span>스킨/토너</span>
						</div>
						<div class="form-group text-center">
						<div class="hovereffect">
							<img id="moisture3" src="/beautyline/images/skin_test/moisture/moisture_cream.jpg" /> 
						</div>
							<span>수분크림</span>
						</div>
						<div class="form-group text-center">
						<div class="hovereffect">
							<img id="moisture2" src="/beautyline/images/skin_test/moisture/lotion.jpg" /> 
						</div>
							<span>로션</span>
						</div>
						<div class="form-group text-center">
						<div class="hovereffect">
							<img id="moisture1" src="/beautyline/images/skin_test/moisture/cream.jpg" /> 
						</div>
							<span>크림</span>
						</div>
					</div>
				</div>
				
				<div class="col-lg-12 hide" id=acne>
					<h2 class="col-lg-12 text-center">
						<small>나의 피부 상태와 비슷한 사진을 골라주세요!</small>
					</h2>
					<div class="col-lg-12 form-inline test">
						<div class="form-group hovereffect">
							<img id="acne5" src="/beautyline/images/skin_test/acne/acne1.png" />			
						</div>
						<div class="form-group hovereffect">
							<img id="acne4" src="/beautyline/images/skin_test/acne/acne2.png" /> 
						</div>
						<div class="form-group hovereffect">
							<img id="acne3" src="/beautyline/images/skin_test/acne/acne3.png" /> 
						</div>
						<div class="form-group hovereffect">
							<img id="acne2" src="/beautyline/images/skin_test/acne/acne4.png" /> 
						</div>
						<div class="form-group hovereffect">
							<img id="acne1" src="/beautyline/images/skin_test/acne/acne5.png" /> 
						</div>
					</div>
				</div>
			</div>
				
				
				<div class="col-lg-12 text-center" id="next">
					<button class="btn btn-info btn-lg" id="forward">다음</button>
				</div>

			</div>
		</div>
	</div>


	<c:import url="/WEB-INF/views/include/footer.jsp" />
	
	
</body>
</html>