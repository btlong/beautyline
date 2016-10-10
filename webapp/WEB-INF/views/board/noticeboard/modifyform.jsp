
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
					<div class="form-group" id="divTitle" enctype="multipart/form-data">
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
					
					
				 <!-- 첨부파일 삭제  -->	
				<div class="form-group" >
				  <div class="col-lg-10 col-lg-offset-1">
					<label class="col-sm-1 control-label" id= "file_title" for="file">첨부파일</label>
					<div class="col-lg-2" >
						<span id="org_fileName">${file.orgName }</span>
					</div>	
					<div class="col-lg-2" >
						<button class="btn btn-danger" id="file_delck">삭제</button>
						<button class="btn btn-danger" id="file_modick">수정</button>
					</div>				
				 </div>
				</div>
				
				 <!-- 첨부파일  -->	
				<div class="form-group" id= "uploadForm">
				  <div class="col-lg-10 col-lg-offset-1">
					<label class="col-sm-1 control-label" id= "file_title" for="file">첨부파일</label>
					<div class="col-lg-2" >
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
					<button id="modify" class="btn btn-danger">수정 <span class="glyphicon glyphicon-ok"></span></button>
					<a href="board" class="btn btn-primary">취소 <span class="glyphicon glyphicon-repeat"></span></a>
				</div>
			</div>	
		</div>
			</div>
			</div>
			</div>
	<c:import url="/WEB-INF/views/include/footer.jsp" />


<!-- 모달 -->
<!-- 파일 삭제 -->
	<div class="modal fade" id="myModal">
		<div class="modal-dialog">
		
		<!-- modal content -->
		<form class="form-horizontal" id="userInsertForm" method="post">
			<div class="modal-content">
				
			<!-- header -->
				<div class="modal-header">
					<!-- 닫기(x) 버튼 -->
					<button type="button" class="close" data-dismiss="modal">×</button>
					<!-- header title -->
					<h4 class="modal-title text-center">
						<!-- Ajax처리 -->
						<strong>파일 삭제</strong>
					</h4>
				</div>
				
			<!-- body -->
				<div class="modal-body" id="delmodalbody">
					<h2>정말 삭제 하시겠습니까?</h2> 	
				</div>
				
			<!-- Footer -->
				<div class="modal-footer">
				<div class="form-group">
					<button class="btn btn-danger" type="button" id="delfile">삭제</button>
					<button data-dismiss="modal" class="btn btn-primary">취소</button>
				</div>
				</div>				
			</div>
		</form>
		</div>
	</div>	


</body>

<script >
$(document).ready(function() {
	$("#uploadForm").hide();
	//카테고리 받아오기
	var categoryseled = "${notiBdVo.category }";
	$("#category_select").val(categoryseled);
	
    $('#summernote').summernote({
    	
    	height : 300,
    	minHeight : null,
    	maxHeight : null,
    	focus : true,
    	lang : 'ko-KR',
/*     	 onImageUpload : function(files, editor, welEditable) {
             sendFile(files[0], editor, welEditable);
         } */
  	
    });
   
    
    
/* 파일 삭제 모달 열기 */
 	$("#file_delck").on("click", function(){
		$("#myModal").modal();

 	});

 var fileCheck = 0; // 파일이 수정되거나 삭제되었는지 체크하기위함
/* 파일 삭제 체크 */
$("#delfile").on("click",function(){
	fileCheck = 1;
	
	$("#org_fileName").css("text-decoration","line-through");
	$("#myModal").modal('hide');
	
});

/* 파일 수정 체크 */
$("#file_modick").on("click",function(){
	fileCheck = 2;
	
	$("#org_fileName").css("text-decoration","line-through");
	$("#uploadForm").show();
});


/* 파일 삭제 
	$("#delfile").on("click",function(){
		var fileNo = "${file.no }";
		var boardNo = "${notiBdVo.no}";
		$.ajax({
			url:"delFile",
			type:"POST",
			data: {"fileNo":fileNo,
					"boardNo": boardNo},
			success: function(ck){
				if(ck > 0){
					
					$("#org_fileName").css("text-decoration","line-through");
					$("#myModal").modal('hide');

					console.log("갔다옴"+"${file.no}");
				}else{
					console.log("유효하지 않은 정보 입니다.");
				}
			}
			
		});
	});
 	*/
 	
	$("#modify").on("click", function() {
		var urlModi = "";
		var fileNo = "${file.no }";
		var boardNo = "${notiBdVo.no}";

		if ( fileCheck = 1 ){ //첨부파일 삭제인 경우
			urlModi = "modify";
			
			//첨부파일 삭제
		
			$.ajax({
				url:"delFile",
				type:"POST",
				data: {"fileNo":fileNo,
						"boardNo": boardNo }
			});
		
		} else if ( fileCheck = 2 ){ //수정
			urlModi = "modifyModiFile";
		} else { //파일 변경된것 없음--글만 수정
			urlModi = "modify";
		}
		var data = new FormData();
		var category = $("#category_select").val();
		var title = $("#inputTitle").val();
		var content = 	$('#summernote').summernote('code');
		var file = $("#file")[0].files[0];
	 	
		data.append("no",boardNo);
 	    data.append("category",category);
		data.append("title",title);
		data.append("content",content); 
	 	data.append("file", file); 
	
		 	$.ajax({// 비동기식 
				url : urlModi,
				type : "POST",
				data : data,
				dataType:"text",
		 	 	enctype: "multipart/form-data", 
				processData: false,
			    contentType: false,
			    success : function() {
					console.log("success");
					location.href = "board";
					
				},
				error : function(jqXHR, status, error) {
					console.error(status + ":" + error);
				}
		});
	});
	
	
	
/*  	function sendFile(file, editor, welEditable) {
			data = new FormData();
			data.append("file", file);
			console.log(file);
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
		}  */

});
</script>
</html>