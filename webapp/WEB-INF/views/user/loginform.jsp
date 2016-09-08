<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!doctype html>
<html>
<head>



<title>loginform</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
   <!-- Bootstrap Core CSS -->
    <link href="/beautyline/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="/beautyline/bootstrap/css/business-casual.css" rel="stylesheet">
	<link href="/beautyline/beautyline/css/include.css" rel="stylesheet">
	<!-- Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Josefin+Slab:100,300,400,600,700,100italic,300italic,400italic,600italic,700italic" rel="stylesheet" type="text/css">
	
	
</head>
<body>
    <div class="brand">BeautyLine</div>
    <div class="address-bar">3481 Melrose Place | Beverly Hills, CA 90210 | 123.456.7890</div>


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
			 <div class="col-lg-12">
                    <hr>
                    <h2 class="intro-text text-center">
                        <strong>LOGIN</strong>
                    </h2>
                    <hr>
                </div>
                <form id="login-form" name="loginform" method="post" action="/beautyline/user/login">
                 <div class="col-lg-12">
                   <label class="block-label" for="id">ID</label>
			   	<input id="id" name="id" type="text" value="">
                    </div>
				    <div class="col-lg-12">
            	     <label class="block-label">password</label>
					<input name="password" type="password" value="">
                    </div>
					<c:if test='${param.r == "fail"}'>
						<p>로그인이 실패 했습니다.</p>
					</c:if>
					<input type="submit" value="LOGIN">
				</form>
				<div class="clearfix"></div>
			</div>
		</div>

	</div>
</body>
</html>