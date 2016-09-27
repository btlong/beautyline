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
<title>default</title>

<!-- Bootstrap Core CSS -->
<link href="/beautyline/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="/beautyline/bootstrap/css/business-casual.css" rel="stylesheet">
<link href="/beautyline/beautyline/css/include.css" rel="stylesheet">


<!-- Fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Josefin+Slab:100,300,400,600,700,100italic,300italic,400italic,600italic,700italic"
	rel="stylesheet" type="text/css">
	
<link href="/beautyline/beautyline/css/counsel.css" rel="stylesheet" type="text/css">
</head>
<body>
	<c:import url="/WEB-INF/views/include/header.jsp" />

	<div class="container">
		<div class="row">
			<div class="box">
				<div class="col-lg-12">
					<hr>
					<h2 class="intro-text text-center">
						<strong>나의 피부타입</strong><br>추천 제품
					</h2>
					<hr>
				</div>
				
				

				<h2 class="col-lg-12 text-center">
					<small>고객님만을 위한 추천제품 (product regimen)</small>
				</h2>
				
				

				<div class="col-lg-12 text-center " id="cosmetic"> <!-- text-center, right -->
						<a href='${resultVo.url }' target="_blank"> <img src='${resultVo.src }' title="구매하러 가기" /> </a>
						<h6>※이미지를 클릭하면 제품 구매 페이지로 이동합니다.</h6>
				</div>
				
				
				
				
				<div class="col-lg-12" id="result_score">
					<table class="table-bordered text-center" id="print_score">
						<tr>
							<td>종합점수</td>
							<td>피부점수1</td>
							<td>피부점수2</td>
							<td>피부점수3</td>
							<td>피부점수4</td>
							<td>피부점수5</td>							
						</tr>
						<tr>
							<td>
								${resultVo.average }
							</td>
							<c:forEach var="score" items="${resultVo.scores }">
								<td> ${score } </td>
							</c:forEach>
							
						</tr>					
					</table>
				</div>

				<div class="vGraph" id="graph">
					<ul>
						<c:forEach var="score" items="${resultVo.scores }" varStatus="count">
						
							<li><span class="gTerm">피부점수${count.index + 1 }</span><span class="gBar" style="height:${score }%"><span>${score }점</span></span></li>
						
						</c:forEach>
					</ul>
				</div>
			</div>
		</div>
	</div>
	


	<c:import url="/WEB-INF/views/include/footer.jsp" />
	
</body>
</html>