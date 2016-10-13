
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!doctype html>
<html>
<head>


<title>QnABoard</title>


<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">


<!-- Bootstrap Core CSS -->

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


<!-- 
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript" src="/beautyline/bootstrap/js/jquery.js"></script>
						
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="http://getbootstrap.com/dist/js/bootstrap.min.js"></script>
	<!-- 
<style type="text/css">
.col-sm-3, .col-sm-2 {
	padding-right: 0px;
}

#btn {
	padding-left: 0px;
} 
</style>-->


<style >
#listTitle{
width:50%;

}


</style>
<script>



</script>




</head>
<body>
	<c:import url="/WEB-INF/views/include/header.jsp" />
				

<div class="container">
    <div class="row">
			<div class="box">
        
       <div class="col-lg-12 ">
					<div class="page-header">
						<hr>
						<h1 class="text-center text-center">
							<strong>문의사항</strong>

						</h1>
						<hr>
					</div>
					<div class="col-lg-10 col-lg-offset-1">
	         <table class="table table-bordered table-hover table-responsive">
             
                   
              <tbody>      
              	<c:set var="doneLoop" value="false" />
				<!-- for(i=보고있는 페이지의 시작번호; i<(시작번호+한페이지의 게시물수); i++ ){ -->
				<c:forEach begin="${page.beginPerPage }" end="${page.beginPerPage + page.numPerPage -1}" var="i" varStatus="status">

				<!-- doneLoop가 false이면 루프 계속 돎-->
				<c:if test="${not doneLoop }">
   				  <tr>
					<!-- (전체 게시물 갯수-(전체회원수-1))>=1이면 -->
					<c:if test="${(page.totalRecord -status.index)>=1}">
					<td>${page.totalRecord -status.index}</td>
					<td style="padding-left:${boardList[i].depth * 15}px">
						<c:if test='${boardList[i].depth >= 1 }'>
							<img src = "/beautyline/images/arrow2.png" width="10px">
						</c:if>
					<a href="view?no=${boardList[i].no }">[${boardList[i].category }] ${boardList[i].title}</a></td>
					<td> ${boardList[i].userId}</td>
					<td>${boardList[i].viewCount}</td>
					<td>${boardList[i].regDate}</td>
					</c:if>
				  </tr>
					
					<!-- 회원수가 토탈 게시물보다 많아지면 루프가 True가 되어 빠져나옴 -->
					<c:if test="${i+1 == page.totalRecord} }">
					<c:set var="doneLoop" value="true" />
					</c:if>
				</c:if>
				
				</c:forEach>  
             </tbody>
             
           
              <thead>
                <tr>
                  <th id="listNo" class="danger text-center">no</th>
                  <th id="listTitle" class="danger">제목</th>
                  <th id="listName" class="danger">작성자</th>
                  <th id="listCount" class="danger">조회수</th>
                  <th id="listDate" class="danger">등록일</th>
                </tr>
              </thead>
            </table>
            </div>
            <div class="col-lg-11 text-right">
            <c:if test="${not empty sessionScope.authUser}">

      			<a href="writeform" class="btn btn-sm btn-danger">글쓰기 <span class="glyphicon glyphicon-pencil"></span></a>
       		</c:if>
      </div>
      
      
      
      
      
      
      
      
      
      
      <!-------------Paging--------------->
	 <c:import url="/WEB-INF/views/include/paging.jsp" />
      <!-- 이전 페이지 -->
							<form id="blockmoveb" name="blockmoveb" method="POST" action="board">
								<input type="hidden" name="nowBlock" value="${page.nowBlock-1 }" />
								<input type="hidden" name="nowPage" value="${(page.nowBlock-1)*page.pagePerBlock}" />
								<%-- <input type="hidden" name="keyField" value="${keyField }" />	
								<input type="hidden" name="keyWord" value="${keyWord }" /> --%>
							</form>

							<!-- 페이지블록 -->
							<form id="pagemove" name="pagemove" method="POST" action="board">
								<input type="hidden" name="nowBlock" value="${page.nowBlock}" />
								<input id="now-page" type="hidden" name="nowPage" value="${page.nowBlock*page.pagePerBlock}" />
							<%-- 	<input type="hidden"name="keyField" value="${keyField }" />
								<input type="hidden"name="keyWord" value="${keyWord }" /> --%>
							</form>

							<!-- 다음 페이지 -->
							<form id="blockmovef" name="blockmovef" method="POST" action="board">
								<input type="hidden" name="nowBlock" value="${page.nowBlock+1 }" />
								<input type="hidden" name="nowPage" value="${(page.nowBlock+1)*page.pagePerBlock}" />
								<%-- <input type="hidden" name="keyField" value="${keyField }" />
								<input type="hidden" name="keyWord" value="${keyWord }" /> --%>
							</form>
  </div>
  </div>
  </div>
  </div>
	<c:import url="/WEB-INF/views/include/footer.jsp" />
</body>
</html>