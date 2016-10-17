
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!doctype html>

<html  lang="kr">
<head>
 
   


<title>modify</title>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

 <!--  <link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet"> -->
  <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.4/jquery.js"></script> 
  <script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
  <link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.2/summernote.css" rel="stylesheet">
  <script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.2/summernote.js"></script>
<script src="/beautyline/beautyline/lang/summernote-ko-KR.js"></script>

<!-- Bootstrap Core CSS -->


<!-- Custom CSS -->
<link href="/beautyline/bootstrap/css/business-casual.css" rel="stylesheet">
	
	
<link href="https://maxcdn.bootstrapcdn.com/bootswatch/3.3.7/flatly/bootstrap.min.css" rel="stylesheet" integrity="sha384-+ENW/yibaokMnme+vBLnHMphUYxHs34h9lpdbSLuAwGkOKFRl4C34WkjazBtb7eT" crossorigin="anonymous">
	
<link rel="stylesheet"href="http://code.jquery.com/ui/1.10.2/themes/smoothness/jquery-ui.css" />


<!-- font awesome -->
<link rel="stylesheet" 	href="/beautyline/bootstrap/css/font-awesome.min.css" media="screen" title="no title">
<!-- Custom style -->
<link rel="stylesheet" href="/beautyline/bootstrap/css/style.css" media="screen" title="no title">
<link href="/beautyline/beautyline/css/include.css" rel="stylesheet">
	
	
<!-- Fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Josefin+Slab:100,300,400,600,700,100italic,300italic,400italic,600italic,700italic"
	rel="stylesheet" type="text/css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript" src="/beautyline/bootstrap/js/jquery.js"></script>

<!-- include libraries(jQuery, bootstrap) -->
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.4/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 

<!-- include summernote css/js-->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.2/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.2/summernote.js"></script>
<link rel="stylesheet" href="http://www.prepbootstrap.com/Content/css/loadingbuttoneffects/local.css" /> <!-- 버튼효과 -->
<style type="text/css">
.col-lg-2, .col-lg-3 {
	padding-left: 0px;
}

#title_title {
width :45px;
padding-left: 0px;
}
#file_title{

width :70px;
padding-left: 0px;

}
#delmodalbody{
	text-align: center;
}
.modal-footer{
	text-align: center;
}
#fName {
	display: inline;
}
<
</style>



</head>
<body>
	<c:import url="/WEB-INF/views/include/header.jsp" />

	<div class="container">
		<div class="row">
			<div class="box">
				<div class="col-lg-12">
				
					<div class="page-header">
						<hr><h3 class="text-center"><strong>수정하기</strong></h3><hr>
					</div>
				
				<div class="form-horizontal" id="write-form" >
					
					<!-- 제목 -->
					<div class="form-group" id="divTitle" >
						<div class="col-lg-10 col-lg-offset-1">
							<label class="col-lg-2 control-label" id= "title_title" for="inputName">제목</label>
							<!-- select  [공지 or 이벤트] -->
							<div class="col-lg-3">
								<select class="form-control" name="category_select" id="category_select">
									<option value="" selected>선택하세요</option>
									<option value="베이직 케어">베이직 케어</option>
									<option value="미백 케어">미백 케어</option>
									<option value="리프팅 케어">리프팅 케어</option>
									<option value="여드름 케어">여드름 케어</option>
								</select>
							</div>
							<div class="col-lg-5">
								<input class="form-control" id="inputTitle" name="title" type="text" placeholder="제목" value="${reviewBoardVo.title }">
							</div>
						 </div>
					</div>
				 <div class="form-group" >
				  <div class="col-lg-10 col-lg-offset-1">
					  <textarea id="summernote" name="contents">${reviewBoardVo.content }</textarea>
 				  </div>
 				</div>
 					
				<div class="col-lg-11 text-right">
					<button id="modify" class="btn btn-danger">수정 <span class="glyphicon glyphicon-ok"></span></button>
					<a href="board" class="btn btn-primary">취소 <span class="glyphicon glyphicon-repeat"></span></a>
				</div>
			</div>	
		</div>
			</div>
			</div>
			</div>
	<c:import url="/WEB-INF/views/include/footer.jsp" />


































</body>

<script >
$(document).ready(function() {
	
	//카테고리 받아오기
	var categoryseled = "${reviewBoardVo.category }";
	$("#category_select").val(categoryseled);
	
    $('#summernote').summernote({
    	
    	height : 300,
    	minHeight : null,
    	maxHeight : null,
    	focus : true,
    	lang : 'ko-KR',

  	
    });


$("#modify").on("click", function() {
	/* 진행되고 있는 표시  */
	$("#modify").removeClass("btn btn-danger");
	$("#modify").addClass("btn m-progress btn-danger");
	$('#modify').attr('disabled',true);
	var no = "${reviewBoardVo.no}";
	var category = $("#category_select").val();
	var title = $("#inputTitle").val();
	var content = 	$('#summernote').summernote('code');

	reviewBoardVo = {
    		"category" : category,
    		"title" : title,
    		"content": content,
    		"no":no
    };
		
	
		$.ajax({// 비동기식 
			url : "modify",
			type : "POST",
			type : "POST",
			data:JSON.stringify(reviewBoardVo),
			contentType:"application/json",
			success : function(response) {
				if(response != null){
					/* 진행되고 있는 표시 지우기  */
					 $("#modify").removeClass("btn m-progress btn-danger");
					 $("#modify").addClass("btn btn-danger");
					 $('#modify').attr('disabled',false);
					console.log('success');
			 		location.href = "board";
			 		return true;
				}
				else{
				 alert("수정을 할수없습니다...");
				 return false;
				}
					},
			error : function(jqXHR, status, error) {
						console.error(status + ":" + error);
					}
		});
		});
	
	
			 	
});


</script>
</html>