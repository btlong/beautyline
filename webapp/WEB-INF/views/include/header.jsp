<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>

</style>
<div class="brand">BeautyLine</div>




<div id="includeheader">
	<ul id="userheader">
		<c:choose>
			<c:when test='${not empty sessionScope.authUser }'>
			<li><a href="/beautyline/user/logout">Log out</a></li>
			<li><a href="/beautyline/user/modifyform">마이페이지</a></li>
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
		<!-- Brand and toggle get grouped for better mobile display -->
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target="#bs-example-navbar-collapse-1">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<!-- navbar-brand is hidden on larger screens, but visible when the menu is collapsed -->
			<a class="navbar-brand" href="index.html">Beauty Line</a>
		</div>
		<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li><a href="index.html">소개</a></li>
				<c:choose>
 					<c:when test="${not empty sessionScope.authUser && authUser.isAdmin eq 'a'}">
						<li><a href="/beautyline/reserve/reserve">예약</a></li> 					
 					</c:when>
 					<c:otherwise>
 						<li><a href="/beautyline/reserve/userreserve">예약</a></li>
 					</c:otherwise>
 				</c:choose>
				<li><a class="dropdown-toggle" data-toggle="dropdown" href="">게시판 </a>
					<ul class="dropdown-menu" id="navdropdown">
						<li><a href="/beautyline/noticeboard/board">공지사항</a></li>
				      	<li><a href="#">문의게시판</a></li>
				      	<li><a href="#">후기게시판</a></li>
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