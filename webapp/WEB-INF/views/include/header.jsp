<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<div><a href="" data-target="#downloadModal" type="button" data-toggle="modal" data-backdrop="static" role="button"><img id="btn-appdownload" src="/beautyline/images/appdownload/btn_appdownload.png" class="img-responsive"></a></div>
<div class="text-center" id="brand-header">
	<a href ="/beautyline/main">
	<img id="brandImg" src="/beautyline/images/beautylinelogo.png" />
	</a>
</div>
<div id="includeheader">
	<ul id="userheader">
		<c:choose>
			<c:when test='${not empty sessionScope.authUser }'>
				<li><a href="/beautyline/user/logout">Log out</a></li>
				<li><a href="/beautyline/mypage/main">마이페이지</a></li>
				<li id="userli">${authUser.name }님안녕하세요^^</li>
				
			</c:when>

			<c:otherwise>
				<li><a href="/beautyline/user/joinform">Join</a></li>
				<li><a href="/beautyline/user/loginform">Login</a></li>
			</c:otherwise>

		</c:choose>
	</ul>
</div>

<!-- Navigation -->
<nav class="navbar navbar-default" role="navigation">
	<div class="container">
		
		<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav"  role="menu">
			
				<li class="dropdown">
					<a class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="true">소개</a>
					<ul class="dropdown-menu" id="navdropdown" role="menu">
						<li><a href="/beautyline/information/brand">뷰티라인</a></li>
						<li><a href="/beautyline/information/program">프로그램</a></li>
					</ul>
				</li>
				
				<c:choose>
 					<c:when test="${not empty sessionScope.authUser && authUser.isAdmin eq 'a'}">
						<li class="dropdown">
							<a href="/beautyline/reserve/reserve" >예약</a>
							<ul class="dropdown-menu" id="navdropdown" role="menu">
								<li><a href="/beautyline/reserve/reservelist">예약관리</a></li>
								<li>&nbsp</li>
								<li>&nbsp</li>
							</ul> 
						</li>					
 					</c:when>
 					<c:otherwise>
 						<li><a href="/beautyline/reserve/userreserve">예약</a></li>
 					</c:otherwise>
 				</c:choose>
 				

 				<!--
 				
 				<li style="width:160px;" class=" "><a href="../contents/program_basic_moist.php">프로그램</a>
			<ul style="overflow: hidden; display: block; height: 0px; z-index: 1035; opacity: 0;">
				<li style="width:160px;"><a href="../contents/program_basic_moist.php">피부/기본 관리</a></li>
				<li style="width:160px;"><a href="../contents/program_special_lifting.php">피부/스페셜 관리</a></li>
				<li style="width:160px;"><a href="../contents/program_part_lowbody.php">바디 관리</a></li>
				<li style="width:160px;"><a href="../contents/program_point_goose.php">집중 관리</a></li>
			</ul>
		</li> 
 				 -->
 				
				<li class="dropdown">
					<a class="dropdown-toggle"  data-toggle="dropdown" role="button" aria-expanded="true">게시판 </a>
						<ul class="dropdown-menu" id="navdropdown" role="menu">
							<li><a href="/beautyline/noticeboard/board">공지사항</a></li>
						   	<li><a href="/beautyline/qnaboard/board">문의게시판</a></li>
					       	<li><a href="/beautyline/reviewboard/board">후기게시판</a></li>
						</ul>
				</li>
				
				<li><a href="/beautyline/coun/test" >나의피부타입</a></li>

				<c:choose>
 					<c:when test="${not empty sessionScope.authUser && authUser.isAdmin eq 'a'}">
						<li><a href="/beautyline/userinfo/list">회원관리</a></li>
						<li><a href="/beautyline/visit/visitform" >방문내역</a></li>
					</c:when>
				</c:choose>
				 

			</ul>
		</div>
		<!-- /.navbar-collapse -->
	</div>
	<!-- /.container -->
</nav>

<!-- 앱다운로드 Modal -->
	<div class="modal fade" id="downloadModal" role="dialog" tabindex="-1"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-sm">

			<!-- Modal content-->
			<div class="modal-content">
				<form class="form-horizontal">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">앱다운로드</h4>
					</div>
					<div class="modal-body">
						<img src="/beautyline/images/appdownload/modal_appdownload.png" class="img-responsive">

					</div>

					<div class="modal-footer">
						<div id="fintdt" class="col-lg-12 text-center">
							<button type="button" class="btn btn-default"
								data-dismiss="modal">닫기</button>
						</div>
					</div>
				</form>
			</div>

		</div>
	</div>
	<!-- Modal-->