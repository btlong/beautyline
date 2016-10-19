<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page contentType="text/html;charset=UTF-8"%>

<!DOCTYPE html>
<html>

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-"webapp/WEB-INF"width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>Beauty-Line</title>

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
 
</head>

<body>
	<c:import url="/WEB-INF/views/include/header.jsp" />

	
	<div class="container">
		<div class="row">
		
			<div class="box">
				<div class="col-lg-12 text-center">
					<div id="carousel-example-generic" class="carousel slide">
						<!-- Indicators -->
						<ol class="carousel-indicators hidden-xs">
							<li data-target="#carousel-example-generic" data-slide-to="0"
								class="active"></li>
							<li data-target="#carousel-example-generic" data-slide-to="1"></li>
							<li data-target="#carousel-example-generic" data-slide-to="2"></li>
						</ol>

						<!-- Wrapper for slides -->
						<div class="carousel-inner">
							<div class="item active">
								<img class="img-responsive img-full"
									src="images/main/main1.jpg" alt="">
							</div>
							<div class="item">
								<img class="img-responsive img-full"
									src="images/main/main2.jpg" alt="">
							</div>
							<div class="item">
								<img class="img-responsive img-full"
									src="images/main/main3.jpg" alt="">
							</div>
							<div class="item">
								<img class="img-responsive img-full"
									src="images/main/main4.jpg" alt="">
							</div>
						</div>

						<!-- Controls -->
						<a class="left carousel-control" href="#carousel-example-generic"
							data-slide="prev"> <span class="icon-prev"></span>
						</a> <a class="right carousel-control"
							href="#carousel-example-generic" data-slide="next"> <span
							class="icon-next"></span>
						</a>
					</div>
					<h2 class="brand-before">
						<small>Welcome to</small>
					</h2>
					<h1 class="brand-name">Beauty Line</h1>
					<hr class="tagline-divider">
					<h2>
						<small>By <strong>Long</strong>
						</small>
					</h2>
				</div>
			</div>
		</div>

		<!-- <div class="row">
			<div class="box">
				<div class="col-lg-12">
					<hr>
					<h2 class="intro-text text-center">
					당신의 <strong>아름다움</strong>을 위한 뷰티라인
					</h2>
					<hr>
					<img class="img-responsive img-border img-left"
						src="bootstrap/img/intro-pic.jpg" alt="">
					<hr class="visible-xs">
					<p> Basic Care - <small>기본적인 피부관리</small> </p>
					<p> Whitening -  <small>피부 톤 화이트닝</small></p>
					<p> Lifting -  <small>주름 개선, 주름 예방</small></p>
					<p> Acne Management -  <small>여드름 피부 완화</small> </p>
					<p> 당신의 피부 타입을 검사해드립니다! 맞춤 화장품 추천 서비스 <a href="/beautyline/coun/test"
							target="_blank"> 나의 <strong>피부타입</strong>은?</a>
					</p>
					<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.
						Nunc placerat diam quis nisl vestibulum dignissim. In hac
						habitasse platea dictumst. Interdum et malesuada fames ac ante
						ipsum primis in faucibus. Pellentesque habitant morbi tristique
						senectus et netus et malesuada fames ac turpis egestas.</p>
				</div>
			</div>
		</div> 

		<div class="row">
			<div class="box">
				<div class="col-lg-12">
					<hr>
					<h2 class="intro-text text-center">
						Beautiful boxes <strong>to showcase your content</strong>
					</h2>
					<hr>
					<p>Use as many boxes as you like, and put anything you want in
						them! They are great for just about anything, the sky's the limit!</p>
					<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.
						Nunc placerat diam quis nisl vestibulum dignissim. In hac
						habitasse platea dictumst. Interdum et malesuada fames ac ante
						ipsum primis in faucibus. Pellentesque habitant morbi tristique
						senectus et netus et malesuada fames ac turpis egestas.</p>
				</div>
			</div>
		</div> -->

	</div>
	<!-- /.container -->
	<c:import url="/WEB-INF/views/include/footer.jsp" />

	

	

	<!-- Script to Activate the Carousel -->
	<script>
		$('.carousel').carousel({
			interval : 5000
		//changes the speed
		})
	</script>

</body>

</html>
