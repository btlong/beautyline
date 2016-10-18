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
width:100%;
height:100%;
float:left;
overflow:hidden;
position:relative;
text-align:center;
cursor:default;
}

.hovereffect .overlay {
width:100%;
height:100%;
position:absolute;
overflow:hidden;
top:0;
left:0;
opacity:0;
background-color:rgba(0,0,0,0.5);
-webkit-transition:all .4s ease-in-out;
transition:all .4s ease-in-out
}

.hovereffect img {
display:block;
position:relative;
-webkit-transition:all .4s linear;
transition:all .4s linear;
}

.hovereffect h2 {
text-transform:uppercase;
color:#fff;
text-align:center;
position:relative;
font-size:17px;
background:rgba(0,0,0,0.6);
-webkit-transform:translatey(-100px);
-ms-transform:translatey(-100px);
transform:translatey(-100px);
-webkit-transition:all .2s ease-in-out;
transition:all .2s ease-in-out;
padding:10px;
}

.hovereffect a.info {
text-decoration:none;
display:inline-block;
text-transform:uppercase;
color:#fff;
border:1px solid #fff;
background-color:transparent;
opacity:0;
filter:alpha(opacity=0);
-webkit-transition:all .2s ease-in-out;
transition:all .2s ease-in-out;
margin:50px 0 0;
padding:7px 14px;
}

.hovereffect a.info:hover {
box-shadow:0 0 5px #fff;
}

.hovereffect:hover img {
-ms-transform:scale(1.2);
-webkit-transform:scale(1.2);
transform:scale(1.2);
}

.hovereffect:hover .overlay {
opacity:1;
filter:alpha(opacity=100);
}

.hovereffect:hover h2,.hovereffect:hover a.info {
opacity:1;
filter:alpha(opacity=100);
-ms-transform:translatey(0);
-webkit-transform:translatey(0);
transform:translatey(0);
}

.hovereffect:hover a.info {
-webkit-transition-delay:.2s;
transition-delay:.2s;
}
</style>

</head>
<body>
<c:import url="/WEB-INF/views/include/header.jsp" />
 
 
 
 <div class="container">
      <div class="row">
         <div class="box">
            <div class="col-lg-12">
               <div class="page-header">	<hr>
						<h1 class="text-center text-center">
							<strong>프로그램</strong>
						</h1>
						<hr>   </div>

   <div class="form-horizontal">
   <div class= "row">
     <div class="form-group">
     		<div id="video">
				<iframe width="640" height="360" src="https://www.youtube.com/embed/cvHn_Sg8R1s" frameborder="0" allowfullscreen></iframe>
			</div>
           <div class="col-md-3">
           <div class="hovereffect">
            <img src="/beautyline/images/information/program/1.jpg" class="img-responsive">
            <img src="/beautyline/images/information/program/basic.png" class="img-responsive">
            <div class="overlay">
            <h2>베이직 케어</h2>
            <p> 
					<a href="#">more</a>
				</p> 
            </div>
   		 </div>
            <!-- 
            <h3 class="text-center">베이직 케어</h3>
            <p class="text-center text-muted">&nbsp;- 10회:40만원 - 기본관리 + 미니등관리 : 50만원&nbsp;</p>
          -->
          </div>
           
          <div class="col-md-3">
          <div class="hovereffect">
            <img src="/beautyline/images/information/program/2.jpg" class="img-responsive">
            <img src="/beautyline/images/information/program/white.png" class="img-responsive">
            <div class="overlay">
            <h2>화이트 케어</h2>
            <p> 
					<a href="#">more</a>
				</p> 
            </div>
   		 </div>
           <!--  <h2 class="text-center">화이트 케어</h2>
            <p class="text-center">10회:50만원 - 화이트관리 + 미니등 관리 : 50만원&nbsp;</p> -->
          </div>
         
          <div class="col-md-3">
          <div class="hovereffect">
            <img src="/beautyline/images/information/program/3.jpg" class="img-responsive">
            <img src="/beautyline/images/information/program/lifting.png" class="img-responsive">
            <div class="overlay">
            <h2>리프팅 케어</h2>
            <p> 
					<a href="#">more</a>
				</p> 
            </div>
   		 </div>
        <!--     <h2 class="text-center">주름재생</h2>
            <p class="text-center">- 10회:50만원 - 주름재생관리 + 미니등 관리 : 60만원&nbsp;</p> -->
          </div>
    
          <div class="col-md-3">
          <div class="hovereffect">
            <img src="/beautyline/images/information/program/4.jpg" class="img-responsive">
            <img src="/beautyline/images/information/program/acne.png" class="img-responsive">
             <div class="overlay">
            <h2>여드름케어</h2>
            <p> 
					<a href="#">more</a>
				</p> 
            </div>
   		 </div>
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