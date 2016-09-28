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
<title>예약 하기</title>

<jsp:useBean id="now" class="java.util.Date" />

<!-- Bootstrap Core CSS -->
<link href="/beautyline/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Custom CSS -->
<link href="/beautyline/bootstrap/css/business-casual.css"
	rel="stylesheet">
<link href="/beautyline/beautyline/css/include.css" rel="stylesheet">
<link href="/beautyline/beautyline/css/reserve.css" rel="stylesheet">


<!-- Fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Josefin+Slab:100,300,400,600,700,100italic,300italic,400italic,600italic,700italic"
	rel="stylesheet" type="text/css">

<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
<style type="text/css">
.form-group div {
	margin-top: 30px;
}

.form-group div select {
	padding-top: 30px;
	height: 300px;
}

.form-control {
	text-align: center;
	border-width: 1px;
	background: transparent;
	overflow: hidden;
}

#resInfoBox {
	border: 1px solid #ccc;
	padding: 25px 30px 30px;
}

#resInfoBox hr {
	margin-top: 5px;
	margin-bottom: 5px;
}

#resInfoBox p {
	font-size: 14px;
	margin-bottom: 5px;
}

#resInfo {
	height: 146.8px;
	background: transparent;
}

#resSelOption {
	color: #CFCFCF;
}
</style>

<script type="text/javascript">
	$(document).ready(function() {
		var progNameCk = $('.progNameCk');
		$(document).on("change", "select[name=progName]", function() {
			var progName = $("select[name=progName] option:selected").text();
			progNameCk.text(progName);
		});

		var resTimeCk = $('.resTimeCk');
		$(document).on("change", "select[name=resTime]", function() {
			var resTime = $("select[name=resTime] option:selected").text();
			var resTimeVal = $("select[name=resTime] option:selected").val();
			resTimeCk.text(resTime);
		});
		
		/* $("#res-form").submit( function(){
				alert($("#progName").option.val);
			//프로그램 췌크
			if( $("#progName").val == "" ){
				alert( "프로그램을 선택해 주세요" );
				return false;
			}
			
			//시간선택 췌크
			if( $("#resTime").val == "" ){
				alert( "시간을 선택해 주세요" );
				return false;
			}
			
			return true;
		}); */
		
		$("#reservebtn").on("click", function(){
			
			alert();
		});
	});
	
</script>


</head>
<body>
	<c:import url="/WEB-INF/views/include/header.jsp" />

	<div class="container">
		<div class="row">
			<div class="box">
				<div class="col-lg-12">

					<hr>
					<h2 class="intro-text text-center">
						<strong>Reserve</strong><br>예약하기
					</h2>
					<hr>
				</div>
				<c:choose>
					<c:when test='${not empty sessionScope.authUser }'>
						<form id="res-form" class="form-horizontal" method="POST" action="/beautyline/reserve/reserve">
							<!-- 이름 -->
							<div class="form-group">
								<div class="col-lg-12 text-center">
									<h2>
										<c:forTokens items='${resDate }' delims='-' var="sel" varStatus="status">
											${sel}
											<c:choose>
												<c:when test='${status.first }'>년&nbsp;</c:when>
												<c:when test='${status.last }'>일 &nbsp;</c:when>
												<c:otherwise>월&nbsp; </c:otherwise>
											</c:choose>
										</c:forTokens>
									</h2>

								</div>
								<div class="col-md-2"></div>

								<div class="col-md-3">
									<select  class="form-control" name="progName" size="3" id="progName">
										<option>베이직 케어</option>
										<option>미백 케어</option>
										<option>주름 케어</option>
										<option>여드름 케어</option>
									</select>
								</div>

								<div class="col-md-3">
									<select class="form-control" name="resTime" size="3" id="resTime" >
										<c:set var="a" value="0"></c:set>

										<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today" />
										
										<c:choose>
											
											<%--오늘날짜와 예약하고자 하는 날짜가 같은경우 현재 시간이전은 disabled처리 --%>
											<c:when test='${today == resDate}'>
												<%-- 현재시간 --%>
												<fmt:formatDate value="${now}" pattern="HH" var="presentTime" />
												<%-- 예약되어있는 시간 disabled처리 --%>
												<c:forEach begin="10" end="21" var="time" step="1">
													<option value='${time }'
														<c:if test="${  (time == resSelList[a].resTime) || (time <= presentTime-1 )}">
													disabled disabled id="resSelOption"
													<c:set var="a" value="${a+1}"></c:set>
												</c:if>>
													${time }:00 - ${time+1 }:00
												</option>
												</c:forEach>
											</c:when>

											<c:otherwise>
												<c:forEach begin="10" end="21" var="time" step="1">
													<option value='${time }'
														<c:if test="${(time == resSelList[a].resTime) }">
												disabled disabled id="resSelOption"
												<c:set var="a" value="${a+1}"></c:set>
											</c:if>>
														${time }:00 - ${time+1 }:00
												</option>
												</c:forEach>
											</c:otherwise>
										</c:choose>
									</select>
								</div>


								<div class="col-md-3" id="resInfoBox">
									<div id="resInfo">
										<h3>예약 정보</h3>
										<hr>
										<p>
											<c:forTokens items='${resDate }' delims='-' var="sel" varStatus="status">
												${sel}
												<c:choose>
													<c:when test='${status.first }'>년&nbsp;</c:when>
													<c:when test='${status.last }'>일 &nbsp;</c:when>
													<c:otherwise>월&nbsp; </c:otherwise>
												</c:choose>
											</c:forTokens>
										</p>
										<hr>
										<p class="progNameCk"></p>
										<p class="resTimeCk"></p>
									</div>
						
									<input type="hidden" name="resDate" value="${resDate }">
									<input type="hidden" name="userNo" value="${sessionScope.authUser.no }">
									<button class="btn btn-primary" id="reservebtn" type="submit" >예약하기</button>
									<button class="btn btn-danger" type="button" onclick="location.href='calenderform'">취소</button>
								</div>
							</div>
						</form>
					</c:when>

					<c:otherwise>
					<div class="col-lg-12 text-center">
						<h4>온라인 예약은 회원만 가능합니다.</h4>
						<c:import url="/WEB-INF/views/include/login.jsp" />
					</div>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</div>

	<c:import url="/WEB-INF/views/include/footer.jsp" />
</body>
</html>