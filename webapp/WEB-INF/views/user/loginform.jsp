<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!doctype html>
<html>
<head>



<title>loginform</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<!-- Bootstrap Core CSS -->

    <!-- font awesome -->
    <link rel="stylesheet" href="/beautyline/bootstrap/css/font-awesome.min.css" media="screen" title="no title" >
   
    <!-- Custom CSS -->
    <link href="/beautyline/bootstrap/css/business-casual.css" rel="stylesheet">
    <link href="https://maxcdn.bootstrapcdn.com/bootswatch/3.3.7/flatly/bootstrap.min.css" rel="stylesheet" integrity="sha384-+ENW/yibaokMnme+vBLnHMphUYxHs34h9lpdbSLuAwGkOKFRl4C34WkjazBtb7eT" crossorigin="anonymous">
    
   <link href="/beautyline/beautyline/css/include.css" rel="stylesheet">
    <!-- Custom style -->
    <link rel="stylesheet" href="/beautyline/bootstrap/css/style.css" media="screen" title="no title" >
   
  <!-- Fonts -->
<link href="https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Josefin+Slab:100,300,400,600,700,100italic,300italic,400italic,600italic,700italic" rel="stylesheet" type="text/css">


<link rel="stylesheet" href="http://www.prepbootstrap.com/Content/css/loadingbuttoneffects/local.css" />

<style type="text/css">
.block-label {
   width: 100px;
}

.btn btn-danger {
   margin: 50px;
}

#loginbt {
   margin-top: 10px;
}
</style>
<!-- modal script -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

 </head>
<body>

   <c:import url="/WEB-INF/views/include/header.jsp" />
	<div class="container">
		<div class="row">
			<div class="box">
				<div class="col-lg-12">
					<div class="page-header">
						<hr><h1 class="text-center"><strong>LOGIN</strong></h1><hr>
					</div>

					<div class="form-horizontal" id="loginform" >
						<div class="form-group">
							<label class="col-lg-3 control-label" for="id">ID</label>
							<div class="col-lg-6">
								<input class="form-control" id="id" name="id" type="text" value="" placeholder="YOUR ID" autofocus>
							</div>
						</div>

						<div class="form-group">
							<label class="col-lg-3 control-label" for="password">PASSWORD</label>
							<div class="col-lg-6">
								<input class="form-control" id="password" name="password" type="password" value="" placeholder="PASSWORD">
							</div>
						</div>

						<!-- 아이디 비밀번호 찾기 클릭 -->
						<div class="col-lg-12 text-center">
							<a href="" id="idfind" data-target="#myModal3" type="button" data-toggle="modal">아이디 찾기 &nbsp;/</a> 
							<a href="" id="pwfind" data-target="#myModal2" type="button" data-toggle="modal">&nbsp;비밀번호 찾기</a>
						</div>

						<div class="col-lg-12 text-center">
							<input class="btn btn-danger" type="button" id="loginbt" value="LOGIN">
						</div>
					</div>
				</div>
			</div>
		  <div class="clearfix"></div>
		</div>
	</div>

	<!-- footer -->
   <c:import url="/WEB-INF/views/include/footer.jsp" />

	<!-- 아이디 찾기 모달 -->
    <c:import url="/WEB-INF/views/user/findid.jsp" />
	<!-- 비밀번호 찾기 모달 -->
	<c:import url="/WEB-INF/views/user/findpw.jsp" />
















<script>
$(function(){ // 다썼는지 체크하기! 빠진 항목없는지..
	$("#loginbt").on("click",function(){
		
		if($("#id").val() == ""){
			$("#id").focus();
		}
		if($("#password").val()==""){
			$("#password").focus();
		}
		
		var id = 		$("#id").val();
		var password =	$("#password").val();
	 
		userVo = {
				"id" : id,
				"password" : password
		};
		
		$.ajax({// 비동기식 
			url :"login",
			type:"POST",
			data:JSON.stringify(userVo),
			contentType:"application/json",
			dataType:"text",
			success:function(findUser){
				  if( findUser == "found"){
					//  window.history.back();
					  location.href = "/beautyline/main";
					//javascript:location.reload(); 
					return true;
				}
				  else{
					 alert("아이디와 비밀번호가 유효하지 않습니다.");
					 $("#id").focus();
					 return false;
				} 
			},
			 error:function(jqXHR, status, error){
				 console.error(status+":"+error);
			 }
		}); 

	});
		
	/* id 찾기(이름,이메일) */
	$("#idFindClick").on("click",function(){
		
		/* 진행되고 있는 표시  */
		$("#idFindClick").removeClass("btn btn-danger");
		$("#idFindClick").addClass("btn m-progress btn-danger");
		$('#idFindClick').attr('disabled',true);
		
		var name = $("#idFindName").val();
		var email = $("#idFindEmail").val();
		var userVo ={
				"name": name,
				"email": email
			};
		
		$.ajax({// 비동기식 
			url :"idfind",
			type:"POST",
			data:JSON.stringify(userVo),
			contentType:"application/json",
			dataType:"text",
			success:function(findUser){
				
				/* 진행되고 있는 표시 지우기 */
				$("#idFindClick").removeClass("btn m-progress btn-danger");
				 $("#idFindClick").addClass("btn btn-danger");
				 $('#idFindClick').attr('disabled',false);
				  if( findUser == "found"){
					  alert("이메일로 아이디정보를 전송하였습니다.");
					  return true;
				}
				  else{
					 alert("유효하지 않은 정보 입니다.");
					 $("#idFindName").val("").focus();
					 return false;
				} 
			},
			 error:function(jqXHR, status, error){
				 console.error(status+":"+error);
			 }
		}); 
	});
	
	/* pw 찾기(이름,아이디,이메일) */
	$("#pwFindClick").on("click",function(){
		
		/* 진행되고 있는 표시  */
		$("#pwFindClick").removeClass("btn btn-danger");
		$("#pwFindClick").addClass("btn m-progress btn-danger");
		$('#pwFindClick').attr('disabled',true);
		
		var name = $("#pwFindName").val();
		var id = $("#pwFindId").val();
		var email = $("#pwFindEmail").val();
		var userVo ={
				"name": name,
				"id":id,
				"email": email
			};
		$.ajax({// 비동기식 
			url :"pwfind",
			type:"POST",
			data:JSON.stringify(userVo),
			contentType:"application/json",
			success:function(findUser){
				/* 진행되고 있는 표시 지우기  */
				 $("#pwFindClick").removeClass("btn m-progress btn-danger");
				 $("#pwFindClick").addClass("btn btn-danger");
				 $('#pwFindClick').attr('disabled',false);
				
				  if( findUser == "found"){
					  alert("이메일로 임시 비밀번호를 전송하였습니다.");
					  return true; 
				}
				  else{
					 alert("유효하지 않은 정보 입니다.");
					 $("#pwFindName").val("").focus();
					 return false;
				} 
			},
			 error:function(jqXHR, status, error){
				 console.error(status+":"+error);
			 }
		}); 
	});
});
</script>
</body>
</html>