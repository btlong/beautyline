<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<<<<<<< HEAD


<div class="brand">BeautyLine</div>

<div id="includeheader">
=======
<div class="brand">BeautyLine</div>

<div id="includeheader" >

>>>>>>> d2c674fb03ba69e250822fcf97c884b14393518e
	<ul>
		<c:choose>
			<c:when test='${not empty sessionScope.authUser }'>
			<li id="userli">${authUser.name }님안녕하세요^^</li>
			<li><a href="/beautyline/user/modifyform">회원정보수정</a></li>
			<li><a href="/beautyline/user/logout">Log out</a></li>
				
			</c:when>

			<c:otherwise>
				<li><a href="/beautyline/user/loginform">Login</a></li>
				<li><a href="/beautyline/user/joinform">Join</a></li>
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
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li><a href="index.html">소개</a></li>
				<li><a href="/beautyline/reserve/calenderform">예약</a></li>
				<li><a href="blog.html">게시판</a></li>
				<li><a href="/beautyline/coun/test" >나의피부타입</a></li>
				<!-- 관리자일때
				<c:choose>
					<c:when test='${empty authUser }'>
						<li><a href="contact.html">회원관리</a></li>
						<li><a href="contact.html">방문내역관리</a></li>
					</c:when>
				</c:choose>
				 -->

			</ul>
		</div>
		<!-- /.navbar-collapse -->
	</div>
	<!-- /.container -->
</nav>