
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!doctype html>
<html>
<head>

    <title>joinform</title>

 <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">


    <!-- Bootstrap Core CSS -->
    <link href="/beautyline/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="/beautyline/bootstrap/css/business-casual.css" rel="stylesheet">

    <!-- Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Josefin+Slab:100,300,400,600,700,100italic,300italic,400italic,600italic,700italic" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->




<title>mysite</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link href="/mysite4/assets/css/user.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="/mysite4/assets/js/jquery/jquery-1.9.0.js"></script>
<!-- <script >
$(function(){ // 다썼는지 체크하기! 빠진 항목없는지..
	$("#join-form").submit(function(){
		if($("#name").val()=="" ){
			alert ("이름은 필수 입력 항목입니다.");
			$("#name").focus()
			return false;
		}
		
		 if($("#email").val()=="" ){
			alert ("이메일은 필수 입력 항목입니다.");
			$("#email").focus()
			return false;
		}
	 	if($("#image-checked").is(":visible")==false ){
			alert ("이메일 중복 체크를 해주세요.");
			return false;
		}
		if($("input[type='password']").val()=="" ){
			alert ("비밀번호는 필수 입력 항목입니다.");
			$("input[type='password']").focus()
			return false;
		}
	 	if($("#agree-prov").is(":checked")==false ){
			alert ("약관동의가 필요합니다.");
			
			return false;
		}  
		
		 return true;
		
	})
	$("#email").change(function(){
		$("#image-checked").hide();
		$("#btn-checkemail").show();
	})
	$("#btn-checkemail").click(function(){
		var email = $("#email").val(); //이메일 값 빼오기
		if(email ==""){
			return;
		}
		$.ajax({
			"url":"/mysite/user?a=checkemail&email=" + email,
			"type":"get",
			"dataType":"json",
			"data":"", // get방식이라서 data는 그냥..아무것도 쓰지않기
			
			"success":function(response){
				if(	response.result=="fail"){
					console.error("error:"+response.message);
					return;
				}
				if(response.data == true){
					alert("이미 존재하는 이메일입니다. 다른이메일을 사용해 주세요");
					$("#email").val("").focus();
					return;
				}
				$("#image-checked").show();
				$("#btn-checkemail").hide();
			},
			"error":function(jsXHR, status, e ){
				console.error("error:"+status+":"+e);
			}
		});
	});
	
});
</script> -->
</head>
<body>
 <!-- Navigation 상단바 -->
    <nav class="navbar navbar-default" role="navigation">
        <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <!-- navbar-brand is hidden on larger screens, but visible when the menu is collapsed -->
                <a class="navbar-brand" href="index.html">Business Casual</a>
            </div>
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">
                    <li>
                        <a href="index.html">Home</a>
                    </li>
                    <li>
                        <a href="about.html">About</a>
                    </li>
                    <li>
                        <a href="blog.html">Blog</a>
                    </li>
                    <li>
                        <a href="contact.html">Contact</a>
                    </li>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container -->
    </nav>


	<div class="container">
		<div class="row">
			<div class="box">
		
			<div id="user">

				<form id="join-form" name="joinForm" method="post" action="/mysite4/user/join">
					<input type="hidden" name="a" value="join"> 
					<label class="block-label" for="name">이름</label> 
					<input id="name" name="name" type="text" value="">
					<label class="block-label" for="email">이메일</label>
					<input id="email" name="email" type="text" value="">
					<img id="image-checked" style="width:13px; display:none" src="/mysite4/assets/images/check.png">
					<input type="button" id="btn-checkemail" value="id 중복체크">
					<label class="block-label">패스워드</label>
					<input name="password" type="password" value="">

					<fieldset>
						<legend>성별</legend>
						<label>여</label>
						<input type="radio" name="gender" value="female" checked="checked">
						<label>남</label>
						<input type="radio" name="gender" value="male">
					</fieldset>

					<fieldset>
						<legend>약관동의</legend>
						<input id="agree-prov" type="checkbox" name="agreeProv" value="y">
						<label>서비스 약관에 동의합니다.</label>
					</fieldset>

					<input type="submit" value="가입하기">

				</form>
			</div>
		</div>
		</div>


	</div>
</body>
</html>