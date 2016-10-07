
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!doctype html>

<html  lang="kr">
<head>
 
   


<title>write</title>

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

</style>


</head>
<body>
	<c:import url="/WEB-INF/views/include/header.jsp" />

	<div class="container">
		<div class="row">
			<div class="box">
				<div class="col-lg-12">
				
					<div class="page-header">
						<hr><h3 class="text-center"><strong>글쓰기</strong></h3><hr>
					</div>
				
				<div class="form-horizontal" id="write-form" >
					
					<!-- 제목 -->
					<div class="form-group" id="divTitle">
						<div class="col-lg-10 col-lg-offset-1">
							<label class="col-sm-1 control-label" id= "title_title" for="inputName">제목</label>
							<!-- select  [공지 or 이벤트] -->
							<div class="col-lg-2">
								<select class="form-control" name="category_select"
									id="category_select">
									<option value="" selected>선택하세요</option>
									<option value="공지">공지</option>
									<option value="이벤트">이벤트</option>
								</select>
							</div>
							<div class="col-lg-3">
								<input class="form-control" id="inputTitle" name="title" type="text" placeholder="제목" value="${notiBdVo.title }">
							</div>
						 </div>
					</div>
					
				 <!-- 첨부파일  -->	
				<div class="form-group" >
				  <div class="col-lg-10 col-lg-offset-1">
					<label class="col-sm-1 control-label" id= "file_title" for="file">첨부파일</label>
					<div class="col-lg-2">
						<input class="btn btn-default" name="file" id="file" type="file">		
					</div>						
				 </div>
				</div>
					  
				 <div class="form-group" >
				  <div class="col-lg-10 col-lg-offset-1">
					  <textarea id="summernote" name="contents">${notiBdVo.content }</textarea>
 				  </div>
 				</div>
 					
				<div class="col-lg-11 text-right">
					<button  id="insert" class="btn btn-danger">등록 <span class="glyphicon glyphicon-ok"></span></button>
					<button  id="modify" class="btn btn-danger">수정 <span class="glyphicon glyphicon-ok"></span></button>
					<a href="board" class="btn btn-danger">취소 <span class="glyphicon glyphicon-repeat"></span></a>
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
    $('#summernote').summernote({
    	
    	height : 300,
    	minHeight : null,
    	maxHeight : null,
    	focus : true,
    	lang : 'ko-KR',
    	 onImageUpload : function(files, editor, welEditable) {
             sendFile(files[0], editor, welEditable);
         }
  	
    });
   
});
$(function(){
	$("#insert").on("click", function() {
		var category = $("#category_select").val();
		var title = $("#inputTitle").val();
	var content = 	$('#summernote').summernote('code');
		var NoticeBoardVo ={
				"category": category,
				"title" : title,
				"content": content
			};
		
		
		console.log(NoticeBoardVo);
	
		$.ajax({// 비동기식 
			url : "write",
			type : "POST",
			data : JSON.stringify(NoticeBoardVo),
			contentType:"application/json",
			success : function() {
				location.href = "board";
				
			},
			error : function(jqXHR, status, error) {
				console.error(status + ":" + error);
			}
		});

	});
	function sendFile(file, editor, welEditable) {
			data = new FormData();
			data.append("file", file);
			$.ajax({
				url : "imaUpload",
				type : "POST",
				data : data,
				cache : false,
				contentType : false,
				processData : false,
				success : function(url) {
					editor.insertImage(welEditable, url);
				},
				error : function(jqXHR, status, error) {
					console.error(status + ":" + error);
				}
			});
		}

		$("#inputTitle").keyup(function() {
			var markup = $('#summernote').summernote('code');
			//console.log("출력"+markup);
		});
	});
<<<<<<< HEAD
=======
	
$(function(){
	$("#modify").on("click", function() {
		var category = $("#category_select").val();
		var title = $("#inputTitle").val();
	var content = 	$('#summernote').summernote('code');
		var NoticeBoardVo ={
				"category": category,
				"title" : title,
				"content": content
			};
		
		
		console.log(NoticeBoardVo);
	
		$.ajax({// 비동기식 
			url : "modify",
			type : "POST",
			data : JSON.stringify(NoticeBoardVo),
			contentType:"application/json",
			success : function() {
				location.href = "board";
				
			},
			error : function(jqXHR, status, error) {
				console.error(status + ":" + error);
			}
		});

	});
	function sendFile(file, editor, welEditable) {
			data = new FormData();
			data.append("file", file);
			$.ajax({
				url : "imaUpload",
				type : "POST",
				data : data,
				cache : false,
				contentType : false,
				processData : false,
				success : function(url) {
					editor.insertImage(welEditable, url);
				},
				error : function(jqXHR, status, error) {
					console.error(status + ":" + error);
				}
			});
		}

		$("#inputTitle").keyup(function() {
			var markup = $('#summernote').summernote('code');
			//console.log("출력"+markup);
		});
	});	
>>>>>>> 9736b05cc1fed2de8363c2e5ff8d8e59da73a5d9
</script>
</html>