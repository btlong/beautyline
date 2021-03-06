
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!doctype html>

<html >
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
<link rel="stylesheet" href="http://www.prepbootstrap.com/Content/css/loadingbuttoneffects/local.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
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
					<div class="form-group" id="divTitle" >
						<div class="col-lg-10 col-lg-offset-1">
							<!-- select  [공지 or 이벤트] -->
							<div class="col-lg-3">
								<select class="form-control" name="category_select" id="category_select">
									<option value="1" selected>카테고리</option>
									<option value="공지">공지</option>
									<option value="이벤트">이벤트</option>
								</select>
							</div>
							<div>
								<input class="form-control" id="inputTitle" name="title" type="text" placeholder="제목">
							</div>
						 </div>
					</div>
					
				 <!-- 첨부파일  -->	
				<div class="form-group"  id= "uploadForm">
		 			<div class="col-lg-10 col-lg-offset-1">
						<div class="input-group">
                		 <label class="input-group-btn">
                    		<span class="btn btn-success">파일 첨부 <span class="glyphicon glyphicon-folder-open"></span>
                         	<input id="file" type="file" style="display: none;" multiple>
                    		</span>
                		 </label>
                		<input type="text" class="form-control" readonly>
            			</div>
					</div>
				 </div>
				
				
					  
				 <div class="form-group" >
				  <div class="col-lg-10 col-lg-offset-1">
					  <textarea id="summernote" name="contents"></textarea>
 				  </div>
 				</div>
 					
				<div class="col-lg-11 text-right">
					<button  id="insert" class="btn btn-info">등록 <span class="glyphicon glyphicon-ok"></span></button>
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
    });
   
});
$(function(){
	$("#insert").on("click", function() {
		
		if ($("#inputTitle").val() == "") {
			alert("제목을 입력해 주세요.");
			$("#inputTitle").focus();
			return false;
		}
		if ($("#category_select").val() == '1') {//
			alert("카테고리를 선택해 주세요.");
			return false;
		}	
		
		$("#insert").removeClass("btn btn-info");
		$("#insert").addClass("btn m-progress btn btn-info");
		$('#insert').attr('disabled',true);

		var url ="";
	 	var data = new FormData();
	 	var userNo = "${sessionScope.authUser.no }";
		var category = $("#category_select").val();
		var title = $("#inputTitle").val();
		var content = 	$('#summernote').summernote('code');
		var file;
		if($("#file")[0].files[0] != undefined){
			  file=$("#file")[0].files[0];
	          data.append("file", file);
	          url="writefile";
		}else{
			url="write"
		}
		
		var file = $("#file")[0].files[0];
		console.log(file);	 
 	    data.append("category",category);
		data.append("title",title);
		data.append("content",content); 
	 	data.append("file", file); 
		data.append("userNo", userNo);
		 	  $.ajax({// 비동기식 
				url : url,
				type : "POST",
				data : data,
				dataType:"text",
		 	 	enctype: "multipart/form-data", 
				processData: false,
			    contentType: false,
			    success : function(response) {
			    	$("#insert").removeClass("btn m-progress btn btn-info");
					$("#insert").addClass("btn btn-info");
					$('#insert').attr('disabled',false);
			    	console.log('success')
					location.href = "board";
			    	return true;
					
				},
				error : function(jqXHR, status, error) {
					console.error(status + ":" + error);
				}
		}); 
	});
	
	});
</script>
</html>