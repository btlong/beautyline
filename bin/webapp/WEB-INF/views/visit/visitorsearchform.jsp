<<<<<<< HEAD
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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<!-- Bootstrap Core CSS -->
<link href="/beautyline/bootstrap/css/bootstrap.min.css" rel="stylesheet">
 
<!-- Custom CSS -->
<link href="/beautyline/bootstrap/css/business-casual.css" rel="stylesheet">
<link href="/beautyline/beautyline/css/visit.css" rel="stylesheet">

<!-- Fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Josefin+Slab:100,300,400,600,700,100italic,300italic,400italic,600italic,700italic"
	rel="stylesheet" type="text/css">
</head>
<body> 

	<!-- Modal-->
	<div id="searchModalView" class="modal hide fade " tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<!-- header -->
		<div class="modal-header">
			<!-- 닫기(x) 버튼 -->
			<button type="button" class="close" data-dismiss="modal" >×</button>
			<!-- header title -->
			<h4 class="modal-title text-center">
				<strong>회원검색</strong>
			</h4>
		</div>
		<!-- body -->
		<form class="form-inline" method="post" action="search">
	
			<div class="modal-body">
				<select multiple class="text-center center-block " id ="">
					<option disabled="disabled">이름
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;전화번호</option>
					<option disabled="disabled">------------------------------------------------</option>
					<!-- 조건 재설정 필요 -->
					<c:set var='visitList' value='${fn:length(visitList) }'/>
					<%-- <c:forEach var='vo' items='${visitList}' varStatus='s'> --%>
						<option>${vo.name}&nbsp;|&nbsp;&nbsp;${vo.phone}</option>
					<%-- </c:forEach> --%>
					<option>오징어
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;010-123-1234</option>
				</select>
				
				<div class="text-center address-bar bg-danger">
					<label class="control-label col-sm-6 text-right"><strong>이름 : </strong></label> 
					<label class="control-label col-sm-6 text-left"><strong>이원호</strong></label> <br>
					<label class="control-label col-sm-6 text-right"><strong>전화번호 : </strong></label> 
					<label class="control-label col-sm-6 text-left"><strong>010-5236-8377</strong></label><br>
				</div>
			</div>
	
			<!-- Footer -->
			<div class="modal-footer">
				<input class="center-block btn btn-danger " type="submit" value="선택">
			</div>
		</form>
	</div>
<!-- </body>
</html> -->



=======
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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<!-- Bootstrap Core CSS -->
<link href="/beautyline/bootstrap/css/bootstrap.min.css" rel="stylesheet">
 
<!-- Custom CSS -->
<link href="/beautyline/bootstrap/css/business-casual.css" rel="stylesheet">
<link href="/beautyline/beautyline/css/visit.css" rel="stylesheet">

<!-- Fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Josefin+Slab:100,300,400,600,700,100italic,300italic,400italic,600italic,700italic"
	rel="stylesheet" type="text/css">
</head>
<body> 

	<!-- Modal-->
	<div id="searchModalView" class="modal hide fade " tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<!-- header -->
		<div class="modal-header">
			<!-- 닫기(x) 버튼 -->
			<button type="button" class="close" data-dismiss="modal" >×</button>
			<!-- header title -->
			<h4 class="modal-title text-center">
				<strong>회원검색</strong>
			</h4>
		</div>
		<!-- body -->
		<form class="form-inline" method="post" action="search">
	
			<div class="modal-body">
				<select multiple class="text-center center-block " id ="">
					<option disabled="disabled">이름
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;전화번호</option>
					<option disabled="disabled">------------------------------------------------</option>
					<!-- 조건 재설정 필요 -->
					<c:set var='visitList' value='${fn:length(visitList) }'/>
					<%-- <c:forEach var='vo' items='${visitList}' varStatus='s'> --%>
						<option>${vo.name}&nbsp;|&nbsp;&nbsp;${vo.phone}</option>
					<%-- </c:forEach> --%>
					<option>오징어
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;010-123-1234</option>
				</select>
				
				<div class="text-center address-bar bg-danger">
					<label class="control-label col-sm-6 text-right"><strong>이름 : </strong></label> 
					<label class="control-label col-sm-6 text-left"><strong>이원호</strong></label> <br>
					<label class="control-label col-sm-6 text-right"><strong>전화번호 : </strong></label> 
					<label class="control-label col-sm-6 text-left"><strong>010-5236-8377</strong></label><br>
				</div>
			</div>
	
			<!-- Footer -->
			<div class="modal-footer">
				<input class="center-block btn btn-danger " type="submit" value="선택">
			</div>
		</form>
	</div>
<!-- </body>
</html> -->



>>>>>>> 261558846f254aab5ad68bd186c448f89ddb7c99
