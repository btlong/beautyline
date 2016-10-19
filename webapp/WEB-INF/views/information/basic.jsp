<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE>
<html>
<head>

<title>베이직 케어</title>

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
#btn-reserve {
	margin-top: 20px;
}
.explain {
	margin-top: 50px;
}
.box-radius {
   margin-top: 7px;
   padding: 10px;
   border: 1px solid #D8D8D8;
   border-radius: 5px;
   -moz-border-radius: 5px;
   -webkit-border-radius: 5px;
   -o-border-radius: 5px;
}
</style>

</head>
<body>
<c:import url="/WEB-INF/views/include/header.jsp" />
 
 
 
 <div class="container">
      <div class="row">
         <div class="box">
            <div class="col-lg-12">
              
              <form class="form-horizontal">
			<div class= "form-group">
				<div class="col-lg-7 text-center" id="video">
					<iframe width="448" height="252" src="https://www.youtube.com/embed/cvHn_Sg8R1s" frameborder="0" allowfullscreen></iframe>
				</div>
			
				<div class="col-lg-5 text-right">	
						<h3 class="text-left">
							<strong>베이직 케어</strong>
						</h3>
						<hr>  
						<p class="text-left text-muted">
						&nbsp;- 10회 : 40만원 </p> 
						<p class="text-left text-muted">&nbsp;- 기본관리 + 미니등관리 : 50만원
						</p> 
						<div class="text-left">
						<div class="box-radius">
						<small> 자주 사용하지 않아 굳어있는 근육을 부드럽게 하고 노폐물과 부기를 빠지게 하면서 피부에 탄력이 증가되어 얼굴 선을 아름답게 가꾸어 줍니다.</small>
						</div>
						</div>
						<div class="row">
						<a id="btn-reserve" class="btn btn-info btn-sm" href="/beautyline/reserve/userreserve" role="button">예약하러 가기</a>
						</div>
				</div>
			</div>
			<div class="form-group">
			<div class="explain col-lg-12">
          	  <img src="/beautyline/images/information/program/explain-basic.png" class="img-responsive">
           </div>
           </div>
			</form>         
    </div> 
    
    </div>
</div>
</div>



 <c:import url="/WEB-INF/views/include/footer.jsp" />
</body>
</html>