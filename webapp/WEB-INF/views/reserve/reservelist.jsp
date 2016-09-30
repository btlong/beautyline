<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<title>예약 관리</title>

<jsp:useBean id="now" class="java.util.Date" />



<!-- Custom CSS -->
<link href="/beautyline/bootstrap/css/business-casual.css"
	rel="stylesheet">
<link href="https://maxcdn.bootstrapcdn.com/bootswatch/3.3.7/flatly/bootstrap.min.css" rel="stylesheet" integrity="sha384-+ENW/yibaokMnme+vBLnHMphUYxHs34h9lpdbSLuAwGkOKFRl4C34WkjazBtb7eT" crossorigin="anonymous">
<!-- Modal jquery -->
<link rel="stylesheet"href="http://code.jquery.com/ui/1.10.2/themes/smoothness/jquery-ui.css" />
<link href="/beautyline/beautyline/css/include.css" rel="stylesheet">
<link href="/beautyline/beautyline/css/reserve.css" rel="stylesheet">



<!-- Fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Josefin+Slab:100,300,400,600,700,100italic,300italic,400italic,600italic,700italic"
	rel="stylesheet" type="text/css">


</head>
<style type="text/css">
#resPast tr {
	color: #AEAEAE;
}

#resDel {
	color: #AEAEAE;
}

.modal-dialog {
	padding-top: 10%;
}

.modal-body {
	margin-left: 25%;
	margin-right: 25%;
}

.modal-footer {
	text-align: center;
}

.tb-td {
	width: 100px;
}
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<body>

<c:import url="/WEB-INF/views/include/header.jsp" />

<div class="container">
	<div class="row">
		<div class="box">
			<div class="col-lg-12">
				<hr>
				<h2 class="intro-text text-center">
				<strong>Reserve List</strong><br>예약관리
				</h2>
				<hr>
			</div>

			<div class="col-md-2"></div>
				<div class="col-md-8">
					<table class="table">
						<thead class="thead-inverse">
							<tr>
								<th>#</th>
								<th>이름</th>
								<th>예약 프로그램</th>
								<th>예약일</th>
								<th>예약 시간</th>
								<th>예약취소</th>
							</tr>
						</thead>

						<c:set var="firstIndex" value="${totalCount - (currentPage-1) * sizeList }" />

						<fmt:formatDate value="${now }" pattern="yyyy-MM-dd" var="today" />
						<c:forEach items='${resList }' var="reserveVo" varStatus='status'>
							<tbody
								<c:if test='${today > reserveVo.resDate }'> id="resPast" </c:if>>
								<tr>
									<td>${status.index }</td>
									<td>${reserveVo.userName }</td>
									<td>${reserveVo.progName }</td>
									<td>${reserveVo.resDate }</td>
									<td>${reserveVo.resTime }시- ${reserveVo.resTime + 1 }시</td>
									<td><button class="btn btn-default" id="resCancelbtn">취소</button></td>
									
								</tr>
							</tbody>
						</c:forEach>
					</table>

					<div class="col-lg-12 text-right">
						<button class="btn btn-danger" type="button" onclick="location.href='calenderform'">돌아가기</button>
					</div>
				</div>
			</div>
		</div>
	</div>

	<c:import url="/WEB-INF/views/include/footer.jsp" />

<!-- Modal -->
	<!-- cancel modal -->
	<div class="modal fade" id="myModal2" role="dialog" tabindex="-1" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
		<!-- header -->
				<div class="modal-header">
			<!-- 닫기 버튼 -->
					<button type="button" class="close" data-dismiss="modal">x</button>
			<!-- header title -->
					<h4 class="modal-title">예약 취소</h4>
				</div>
			<!-- body -->
				<div class="modal-body">
					<table class="table" id="modal-table">
						<tr>
							<td class="tb-td">회원이름</td>
							<td>${reserveVo.userName }</td>
						</tr>
						<tr>
							<td class="tb-td">프로그램 명</td>
							<td>${reserveVo.progName }</td>
						</tr>
							<tr>
							<td>예약일</td>
							<td>${reserveVo.resDate }</td>
						</tr>
						<tr>
							<td class="tb-td">예약시간</td>
							<td>${reserveVo.resTime } 시 - ${reserveVo.resTime+1 } 시</td>
						</tr>
					</table>
					<h4>이 예약을 취소하시겠습니까?</h4>
				</div>
			<!-- footer -->
				<div class="modal-footer">
					<input type="hidden" value="${reserveVo.no }" id="resNo">
					<a href="" type="button" class="btn btn-success" id="resDelbtn" >예</a> 
					<button data-dismiss="modal" class="btn btn-danger">아니오</button>
				</div>
			</div>
		</div>
</div>

	<!-- jQuery -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</body>
<script>
$(document).ready( function(){
// 취소 modal 
	$("#resCancelbtn").on("click", function(){
		$("#myModal2").modal();
	 
	    var no = $("#resNo").val();
	    console.log(no);
	      $.ajax({// 비동기식 
	        url :"reservedelete",
	        type:"POST",
	        data: {"no" : no },
	        dataType: "text",
	        success:function( delResult ){
	       	 
	       	 if( delResult == "y" ){
	       		 alert("예약이 취소되었습니다.");
	       		 return true;
	       	 }else{
	       		 alert("유효하지 않은 정보 입니다.");
	       		 return false;
	       	 }
	            /*  if( findUser == "found"){
	                alert("이메일로 아이디정보를 전송하였습니다.");
	                return true; 
	           }
	             else{
	               alert("유효하지 않은 정보 입니다.");
	               $("#idFindName").val("").focus();
	               return false;
	           }  */
	       	  /*  $("#myModal2").modal('hide'); */
	        }
	        ,	     
	        error:function(jqXHR, status, error){
	            console.error(status+":"+error);
	         }
	      }); 
	   
	   });
});
</script>



</html>