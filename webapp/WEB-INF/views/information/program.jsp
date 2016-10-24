<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<title>view</title>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">


<!-- Custom CSS -->
<link href="/beautyline/bootstrap/css/business-casual.css" rel="stylesheet">
<link href="https://maxcdn.bootstrapcdn.com/bootswatch/3.3.7/flatly/bootstrap.min.css" rel="stylesheet" integrity="sha384-+ENW/yibaokMnme+vBLnHMphUYxHs34h9lpdbSLuAwGkOKFRl4C34WkjazBtb7eT" crossorigin="anonymous">
   
<link href="/beautyline/beautyline/css/include.css" rel="stylesheet">
<!-- font awesome -->
<link rel="stylesheet" href="/beautyline/bootstrap/css/font-awesome.min.css" media="screen" title="no title">
<!-- Custom style -->
<link rel="stylesheet" href="/beautyline/bootstrap/css/style.css" media="screen" title="no title">

<!-- Fonts -->
<link href="https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Josefin+Slab:100,300,400,600,700,100italic,300italic,400italic,600italic,700italic" rel="stylesheet" type="text/css">


<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/beautyline/bootstrap/js/jquery.js"></script>


<style type="text/css">
.hovereffect {
  width: 100%;
  height: 100%;
  float: left;
  overflow: hidden;
  position: relative;
  text-align: center;
  cursor: default;
}

.hovereffect .overlay {
  position: absolute;
  overflow: hidden;
  width: 80%;
  height: 80%;
  left: 10%;
  top: 10%;
  border-bottom: 1px solid #FFF;
  border-top: 1px solid #FFF;
  -webkit-transition: opacity 0.35s, -webkit-transform 0.35s;
  transition: opacity 0.35s, transform 0.35s;
  -webkit-transform: scale(0,1);
  -ms-transform: scale(0,1);
  transform: scale(0,1);
}

.hovereffect:hover .overlay {
  opacity: 1;
  filter: alpha(opacity=100);
  -webkit-transform: scale(1);
  -ms-transform: scale(1);
  transform: scale(1);
}

.hovereffect img {
  display: block;
  position: relative;
  -webkit-transition: all 0.35s;
  transition: all 0.35s;
}

.hovereffect:hover img {
  filter: url('data:image/svg+xml;charset=utf-8,<svg xmlns="http://www.w3.org/2000/svg"><filter id="filter"><feComponentTransfer color-interpolation-filters="sRGB"><feFuncR type="linear" slope="0.6" /><feFuncG type="linear" slope="0.6" /><feFuncB type="linear" slope="0.6" /></feComponentTransfer></filter></svg>#filter');
  filter: brightness(0.6);
  -webkit-filter: brightness(0.6);
}

.hovereffect h2 {
  text-transform: uppercase;
  text-align: center;
  position: relative;
  font-size: 17px;
  background-color: transparent;
  color: #FFF;
  padding: 1em 0;
  opacity: 0;
  filter: alpha(opacity=0);
  -webkit-transition: opacity 0.35s, -webkit-transform 0.35s;
  transition: opacity 0.35s, transform 0.35s;
  -webkit-transform: translate3d(0,-100%,0);
  transform: translate3d(0,-100%,0);
}

.hovereffect a, hovereffect p {
  color: #FFF;
  padding: 1em 0;
  opacity: 0;
  filter: alpha(opacity=0);
  -webkit-transition: opacity 0.35s, -webkit-transform 0.35s;
  transition: opacity 0.35s, transform 0.35s;
  -webkit-transform: translate3d(0,100%,0);
  transform: translate3d(0,100%,0);
}

.hovereffect:hover a, .hovereffect:hover p, .hovereffect:hover h2 {
  opacity: 1;
  filter: alpha(opacity=100);
  -webkit-transform: translate3d(0,0,0);
  transform: translate3d(0,0,0);
}

</style>

</head>
<body>
<c:import url="/WEB-INF/views/include/header.jsp" />
 
 
 
 <div class="container">
      <div class="row">
         <div class="box">
            <div class="col-lg-12">
         		<hr>
				<h1 class="text-center">
				<strong>프로그램</strong>
				</h1>
				<hr>   

   <div class="form-horizontal col-lg-12 ">
   <div class= "row">
     <div class="form-group">
           <div class="col-md-3">
           <div class="hovereffect">
            <img src="/beautyline/images/information/program/1.jpg" class="img-responsive">
            <div class="overlay">
            <h2>베이직 케어</h2>
            <p> 
					<a href="/beautyline/information/basic">more</a>
				</p> 
            </div>
   		 </div>
   		 	<form action="/beautyline/information/basic" method="post">
   		 	<input class="img-responsive" type="image" src="/beautyline/images/information/program/basic.png">
   		 	</form>
            <!-- <img src="/beautyline/images/information/program/basic.png" class="img-responsive"> -->
            <!-- 
            <h3 class="text-center">베이직 케어</h3>
            <p class="text-center text-muted">&nbsp;- 10회:40만원 - 기본관리 + 미니등관리 : 50만원&nbsp;</p>
          -->
          </div>
           
          <div class="col-md-3">
          <div class="hovereffect">
            <img src="/beautyline/images/information/program/2.jpg" class="img-responsive">
            <div class="overlay">
            <h2>화이트 케어</h2>
            <p> 
					<a href="/beautyline/information/white">more</a>
				</p> 
            </div>
   		 </div>
	   		 <form action="/beautyline/information/white" method="post">
   		 	<input class="img-responsive" type="image" src="/beautyline/images/information/program/white.png">
   		 	</form>
            <!-- <img src="/beautyline/images/information/program/white.png" class="img-responsive"> -->
           <!--  <h2 class="text-center">화이트 케어</h2>
            <p class="text-center">10회:50만원 - 화이트관리 + 미니등 관리 : 50만원&nbsp;</p> -->
          </div>
         
          <div class="col-md-3">
          <div class="hovereffect">
            <img src="/beautyline/images/information/program/3.jpg" class="img-responsive">
            <div class="overlay">
            <h2>리프팅 케어</h2>
            <p> 
					<a href="/beautyline/information/lifting">more</a>
				</p> 
            </div>
   		 </div>
	   		 <form action="/beautyline/information/lifting" method="post">
   		 		<input class="img-responsive" type="image" src="/beautyline/images/information/program/lifting.png">
   		 	</form>
            <!-- <img src="/beautyline/images/information/program/lifting.png" class="img-responsive"> -->
        <!--     <h2 class="text-center">주름재생</h2>
            <p class="text-center">- 10회:50만원 - 주름재생관리 + 미니등 관리 : 60만원&nbsp;</p> -->
          </div>
    
          <div class="col-md-3">
          <div class="hovereffect">
            <img src="/beautyline/images/information/program/4.jpg" class="img-responsive">
             <div class="overlay">
            <h2>여드름케어</h2>
            <p> 
					<a href="/beautyline/information/acne">more</a>
				</p> 
            </div>
   		 </div>
	   		 <form action="/beautyline/information/acne" method="post">
   			 	<input class="img-responsive" type="image" src="/beautyline/images/information/program/acne.png">
   		 	</form>
           <!--  <img src="/beautyline/images/information/program/acne.png" class="img-responsive"> -->
            <!-- 
            <h2 class="text-center">여드름 케어</h2>
            <p class="text-center">&nbsp;- 10회:50만원 - 여드름관리 + 미니등 관리 : 60만원&nbsp;</p> -->
          </div>
          </div>
          </div>
      </div>
    </div> 
    
    </div>
</div>
</div>



 <c:import url="/WEB-INF/views/include/footer.jsp" />
</body>
</html>