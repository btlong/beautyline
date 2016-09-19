<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Bootstrap Core CSS -->
<link href="/beautyline/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="/beautyline/bootstrap/css/business-casual.css" rel="stylesheet">
<link href="/beautyline/beautyline/css/include.css" rel="stylesheet">


<!-- Fonts -->
<link 	href="https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800" rel="stylesheet" type="text/css">
<link 	href="https://fonts.googleapis.com/css?family=Josefin+Slab:100,300,400,600,700,100italic,300italic,400italic,600italic,700italic" rel="stylesheet" type="text/css">


<style type="text/css">
body {
	font-family: "돋움", "맑은 고딕";
	font-size: 0.8em;
	color: #333;
	margin: 0;
	padding: 0;
}

#header {
	width: 1090px;
	height: 100px;
	margin-left: 100px;
	background-color: #FF80FF;
	text-align: center;
}

#header h1 {
	padding: 30px;
}

#content {
	width: 1090px;
	height: 800px;
	margin-top: 5px;
	margin-left: 100px;
	background-color: #BFBFBF;
}

#test1 {
	background-color: #d7fbd7;
	float: left;
	width: 800px;
	height: 290px;
}

#test2 {
	background-color: #fbd7f6;
	float: left;
	width: 800px;
	height: 290px;
}

#test3 {
	background-color: #d8e9fb ;
	float: left ;
	width: 800px;
	height: 290px;
}

#test4 {
	float: left ;
	width: 800px;
	height: 290px;
}

#test5 {
	float: left ;
	width: 800px;
	height: 290px;
}


.hide {
	display: none;
}

#next {
	background-color: white;
	float: right;
	width: 290px;
	height: 290px;
}

p {
	padding: 30px;
	font-size: 16px;
}

img {
	margin: 20px;
	width: 100px;
	height: 100px;
	cursor: pointer;
}
#forward {
	width: 70px;
	height: 60px;
	margin-left: 80px;
	margin-top: 100px;
	background: url(/beautyline/images/btn_forward.png) no-repeat;
}

.selected {
	width: 120px;
	height: 120px;
}
</style>
<script type="text/javascript" src="/beautyline/jquery/jquery-1.9.0.js"></script>
<script type="text/javascript">
	$(function() {

		$(function() {
			$("img").click(function() {
				$("img.selected").removeClass("selected");
				$(this).addClass("selected");
			});
		});

		$(function() {
			$("#forward").click(function() {
				if ($("#stage").val() == 1) {
					$("#stage").val("2");
					$("#test1").remove();
					$("#test2").removeClass("hide");
                } else if ($("#stage").val() == 2) {
					$("#stage").val("3");
					$("#test2").remove();
					$("#test3").removeClass("hide");
                } else if ($("#stage").val() == 3) {
					$("#stage").val("4");
					$("#test3").remove();
					$("#test4").removeClass("hide");
                } else if ($("#stage").val() == 4) {
                	$("#stage").val("5");
					$("#test4").remove();
					$("#test5").removeClass("hide");
                } else if ($("#stage").val() == 5) {
					$("#scores").submit();
					console.log("섭밋"); 
                }
				
				
				
			});
		});

		$("#blue").click(function() {
			$("#score1").val("20");

		});

		$("#green").click(function() {
			$("#score1").val("40");
		});

		$("#red").click(function() {
			$("#score1").val("60");
		});

		$("#yellow").click(function() {
			$("#score1").val("80");
		});
		
		$("#bmw").click(function() {
			$("#score1").val("100");
		});

		$("#bird").click(function() {
			$("#score2").val("20");
		});
		
		$("#bug").click(function() {
			$("#score2").val("40");
		});
		
		$("#nemo").click(function() {
			$("#score2").val("60");
		});
		
		$("#shark").click(function() {
			$("#score2").val("80");
		});
		
		$("#twitter").click(function() {
			$("#score2").val("100");
		});
		
		$("#4hours").click(function() {
			$("#score3").val("20");
		});
		
		$("#5hours").click(function() {
			$("#score3").val("40");
		});
		
		$("#6hours").click(function() {
			$("#score3").val("60");
		});
		
		$("#7hours").click(function() {
			$("#score3").val("80");
		});
		
		$("#8hours").click(function() {
			$("#score3").val("100");
		});
		
		$("#tone1").click(function() {
			$("#score4").val("100");
		});
		
		$("#tone2").click(function() {
			$("#score4").val("80");
		});
		
		$("#tone3").click(function() {
			$("#score4").val("60");
		});
		
		$("#tone4").click(function() {
			$("#score4").val("40");
		});
		
		$("#tone5").click(function() {
			$("#score4").val("20");
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
	
	<div id="content">
		<form id="scores" name="score" action="result" method="post">
			<input type="hidden" id ="stage" name="stage" value="1" />
			<input type="hidden" id ="score1" name="score1" value="" />
			<input type="hidden" id ="score2" name="score2" value="" />
			<input type="hidden" id ="score3" name="score3" value="" />
			<input type="hidden" id ="score4" name="score4" value="" />
			<input type="hidden" id ="score5" name="score5" value="" />
		</form>



		<div id="test1" class="">
			<p>당신이 좋아하는 색깔은?</p>

			<img id="blue" src="/beautyline/images/btn_color_blue.png" /> 
			<img id="green" src="/beautyline/images/btn_color_green.png" /> 
			<img id="red" src="/beautyline/images/btn_color_red.png" /> 
			<img id="yellow" src="/beautyline/images/btn_color_yellow.png" /> 
			<img id="bmw" src="/beautyline/images/btn_color_bmw.png" />


		</div>

		<div id="test2" class="hide">
			<p>당신이 좋아하는 동물은?</p>

			<img id="bird" src="/beautyline/images/btn_animal_bird.png" /> 
			<img id="bug" src="/beautyline/images/btn_animal_bug.png" /> 
			<img id="nemo" src="/beautyline/images/btn_animal_nemo.png" /> 
			<img id="shark" src="/beautyline/images/btn_animal_shark.png" /> 
			<img id="twitter" src="/beautyline/images/btn_animal_twitter.png" />

		</div>
		
		<div id="test3" class="hide">
			<p>당신의 평소 수면시간은?</p>

			<img id="4hours" src="/beautyline/images/btn_sleep_4.PNG" /> 
			<img id="5hours" src="/beautyline/images/btn_sleep_5.PNG" /> 
			<img id="6hours" src="/beautyline/images/btn_sleep_6.PNG" /> 
			<img id="7hours" src="/beautyline/images/btn_sleep_7.PNG" /> 
			<img id="8hours" src="/beautyline/images/btn_sleep_8.PNG" />

		</div>
		
		<div id="test4" class="hide">
			<p>당신의 피부 톤은?</p>

			<img id="tone1" src="/beautyline/images/btn_color_1.PNG" /> 
			<img id="tone2" src="/beautyline/images/btn_color_2.PNG" /> 
			<img id="tone3" src="/beautyline/images/btn_color_3.PNG" /> 
			<img id="tone4" src="/beautyline/images/btn_color_4.PNG" /> 
			<img id="tone5" src="/beautyline/images/btn_color_5.PNG" />

		</div>
		
		<div id="test5" class="hide">
			<p>얼마나 자주 피부 트러블이 나시나요?</p>

			<img id="acne1" src="/beautyline/images/btn_acne_always.PNG" /> 
			<img id="acne2" src="/beautyline/images/btn_acne_usually.PNG" /> 
			<img id="acne3" src="/beautyline/images/btn_acne_often.PNG" /> 
			<img id="acne4" src="/beautyline/images/btn_acne_sometimes.PNG" /> 
			<img id="acne5" src="/beautyline/images/btn_acne_never.PNG" />

		</div>


		<div id="next">
			<button id="forward">다음</button>
		</div>

	</div>
</body>
</html>