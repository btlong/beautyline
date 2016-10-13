<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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

<!-- Fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Josefin+Slab:100,300,400,600,700,100italic,300italic,400italic,600italic,700italic"
	rel="stylesheet" type="text/css">


<link href="/beautyline/beautyline/css/include.css" rel="stylesheet">
<style type="text/css">
<
style>.headermessage {
	margin: 19px;
	color: black;
	font-family: 'Open Sans', sans-serif;
	font-size: 16px;
	font-weight: bold;
}

.image-block {
    border: 3px solid white;
    background-color: black;
    padding: 0px;
    margin: 0px 15px;
    height: 200px;
    text-align: center;
    vertical-align: bottom;
}

.image-block>p {
	width: 100%;
	height: 100%;
	font-weight: normal;
	font-size: 19px;
	padding-top: 150px;
	background-color: rgba(3, 3, 3, 0.0);
	color: rgba(6, 6, 6, 0.0);
}

.image-block:hover>p {
	background-color: rgba(3, 3, 3, 0.5);
	color: white;
}

</style>
</head>
<body>
	<c:import url="/WEB-INF/views/include/header.jsp" />

	<div class="container">
		<div class="row">
			<div class="box">

				<div class="container-fluid center-block">

					<div class="row">
						<h3 class="headermessage text-center">나의 측정 사진</h3>
					</div>


					<div class="row">
					
						<a href="#" data-toggle="modal" data-target=".dialog1" class="center-block text-center">
							<div 
								class="image-block col-sm-2 img-responsive img-rounded center-block"
								style="background: url(http://www.prepbootstrap.com/Content/images/template/ResponsiveImageTiles/city1.jpg) no-repeat center top; background-size: cover;">
								<p>Image Info</p>
							</div>
						</a>

						<!--  Modal content for City Image -->
						<div class="modal fade dialog1" tabindex="-1">
							<div class="modal-dialog modal-lg">
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal"
											aria-hidden="true">x</button>
										<h4 class="modal-title" id="myLargeModalLabel-1">상세정보 1
											(점수)</h4>
									</div>
									<div class="modal-body active">
										<a href="#"><img
											src="http://www.prepbootstrap.com/Content/images/template/ResponsiveImageTiles/city1.jpg"
											class="img-responsive img-rounded center-block"
											alt="Bootstrap template" /> </a>
										<h3>케어 프로그램</h3>
										<h4>시술받은 날짜</h4>
										<p>메모 내용 ~~~~</p>
										<div class="text-center">
											<a href="#"><span class="glyphicon glyphicon-thumbs-up"></span>
												Vote Up</a> <a href="#"><span
												class="glyphicon glyphicon-thumbs-down"></span> Vote Down</a>
										</div>

									</div>
								</div>
							</div>
						</div>

						<a href="#" data-toggle="modal" data-target=".dialog2">
							<div
								class="image-block col-sm-2 img-responsive img-rounded center-block"
								style="background: url(http://www.prepbootstrap.com/Content/images/template/ResponsiveImageTiles/city1.jpg) no-repeat center top; background-size: cover;">
								<p>2016.10.12</p>
							</div>
						</a>

							<!--  Modal content for City Image -->
						<div class="modal fade dialog2" tabindex="-1">
							<div class="modal-dialog modal-lg">
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal"
											aria-hidden="true">x</button>
										<h4 class="modal-title" id="myLargeModalLabel-2">상세정보 2
											(점수)</h4>
									</div>
									<div class="modal-body active">
										<a href="#"><img
											src="http://www.prepbootstrap.com/Content/images/template/ResponsiveImageTiles/city1.jpg"
											class="img-responsive img-rounded center-block"
											alt="Bootstrap template" /> </a>
										<h3>케어 프로그램</h3>
										<h4>시술받은 날짜</h4>
										<p>메모 내용 ~~~~</p>
										<div class="text-center">
											<a href="#"><span class="glyphicon glyphicon-thumbs-up"></span>
												Vote Up</a> <a href="#"><span
												class="glyphicon glyphicon-thumbs-down"></span> Vote Down</a>
										</div>

									</div>
								</div>
							</div>
						</div>
						
						
						<a href="#" data-toggle="modal" data-target=".dialog3">
							<div
								class="image-block col-sm-2 img-responsive img-rounded center-block"
								style="background: url(http://www.prepbootstrap.com/Content/images/template/ResponsiveImageTiles/city1.jpg) no-repeat center top; background-size: cover;">
								<p>Image Info</p>
							</div>
						</a>

							<!--  Modal content for City Image -->
						<div class="modal fade dialog3" tabindex="-1">
							<div class="modal-dialog modal-lg">
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal"
											aria-hidden="true">x</button>
										<h4 class="modal-title" id="myLargeModalLabel-3">상세정보 3
											(점수)</h4>
									</div>
									<div class="modal-body active">
										<a href="#"><img
											src="http://www.prepbootstrap.com/Content/images/template/ResponsiveImageTiles/city1.jpg"
											class="img-responsive img-rounded center-block"
											alt="Bootstrap template" /> </a>
										<h3>케어 프로그램</h3>
										<h4>시술받은 날짜</h4>
										<p>메모 내용 ~~~~</p>
										<div class="text-center">
											<a href="#"><span class="glyphicon glyphicon-thumbs-up"></span>
												Vote Up</a> <a href="#"><span
												class="glyphicon glyphicon-thumbs-down"></span> Vote Down</a>
										</div>

									</div>
								</div>
							</div>
						</div>
						
						
						
						<a href="#" data-toggle="modal" data-target=".dialog4">
							<div
								class="image-block col-sm-2 img-responsive img-rounded center-block"
								style="background: url(http://www.prepbootstrap.com/Content/images/template/ResponsiveImageTiles/city1.jpg) no-repeat center top; background-size: cover;">
								<p>Image Info</p>
							</div>
						</a>

						<!--  Modal content for City Image -->
						<div class="modal fade dialog4" tabindex="-1">
							<div class="modal-dialog modal-lg">
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal"
											aria-hidden="true">x</button>
										<h4 class="modal-title" id="myLargeModalLabel-4">상세정보 4
											(점수)</h4>
									</div>
									<div class="modal-body active">
										<a href="#"><img
											src="http://www.prepbootstrap.com/Content/images/template/ResponsiveImageTiles/city1.jpg"
											class="img-responsive img-rounded center-block"
											alt="Bootstrap template" /> </a>
										<h3>케어 프로그램</h3>
										<h4>시술받은 날짜</h4>
										<p>메모 내용 ~~~~</p>
										<div class="text-center">
											<a href="#"><span class="glyphicon glyphicon-thumbs-up"></span>
												Vote Up</a> <a href="#"><span
												class="glyphicon glyphicon-thumbs-down"></span> Vote Down</a>
										</div>

									</div>
								</div>
							</div>
						</div>

						<a href="#" data-toggle="modal" data-target=".dialog5">
							<div
								class="image-block col-sm-2 img-responsive img-rounded center-block"
								style="background: url(http://www.prepbootstrap.com/Content/images/template/ResponsiveImageTiles/city1.jpg) no-repeat center top; background-size: cover;">
								<p>Image Info</p>
							</div>
						</a>

						<!--  Modal content for City Image -->
						<div class="modal fade dialog5" tabindex="-1">
							<div class="modal-dialog modal-lg">
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal"
											aria-hidden="true">x</button>
										<h4 class="modal-title" id="myLargeModalLabel-5">상세정보 5
											(점수)</h4>
									</div>
									<div class="modal-body active">
										<a href="#"><img
											src="http://www.prepbootstrap.com/Content/images/template/ResponsiveImageTiles/city1.jpg"
											class="img-responsive img-rounded center-block"
											alt="Bootstrap template" /> </a>
										<h3>케어 프로그램</h3>
										<h4>시술받은 날짜</h4>
										<p>메모 내용 ~~~~</p>
										<div class="text-center">
											<a href="#"><span class="glyphicon glyphicon-thumbs-up"></span>
												Vote Up</a> <a href="#"><span
												class="glyphicon glyphicon-thumbs-down"></span> Vote Down</a>
										</div>

									</div>
								</div>
							</div>
						</div>



					</div>
				</div>
			</div>
		</div>
	</div>

	<c:import url="/WEB-INF/views/include/footer.jsp" />
</body>
<script type="text/javascript">
	
</script>
</html>
