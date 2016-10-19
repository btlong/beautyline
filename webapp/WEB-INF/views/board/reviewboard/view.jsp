<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!doctype html>
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
<link
   href="https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800" rel="stylesheet" type="text/css">
<link
   href="https://fonts.googleapis.com/css?family=Josefin+Slab:100,300,400,600,700,100italic,300italic,400italic,600italic,700italic" rel="stylesheet" type="text/css">


<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/beautyline/bootstrap/js/jquery.js"></script>
<style type="text/css">

#bdhr {
   width: 100%;
   background-color: #3E3F3A;
   height: 1px;
   margin-top: 3px;
   margin-bottom: 3px;  
}
#contents {
   padding: 20px 5px;
   
   
}
#title table{
   width: 100%;
}
#titletxt {
   font-weight: bolder;
   font-size: 15pt;
}
#titleInfo{
   text-align: right;
}
#date {
   color: #95A5A6;   

}
#bottombtns {
   padding-top: 10px;
}
#userNametxt{
   font-weight: bold;
}
#file {
   border-right:1px #3E3F3A solid;
   width: 8%;
}
#file2{
   padding-left: 7px;
   text-align: left;
}
#list-group{
	margin-bottom:0px;
}
</style>

</head>
<body>

   <c:import url="/WEB-INF/views/include/header.jsp" />

   <div class="container">
      <div class="row">
         <div class="box">
            <div class="col-lg-12">
               <div class="page-header"></div>
           
               <div class="col-lg-12" id="title">
               
                 <table>
                      <tbody>
                         <tr>                 
                         <td id="titletxt">
                              <span>[${reviewBoardVo.category }] ${reviewBoardVo.title }</span>
                          </td>
                          <td id="titleInfo">
                             <span id="userName">${reviewBoardVo.userId }</span> &nbsp;
                              <span id="date">${reviewBoardVo.regDate }</span>
                          </td>
                           </tr>
                       </tbody>
                      </table>

               
                  <div id="bdhr"></div>
                  
                  <div id="contents">
                     ${reviewBoardVo.content }
                  </div>
                  
                  <br><br>
                  <p id="replytotal" ></p>
                  <div id="bdhr"></div>
            <ul id="list-group" class="list-group">
           <!--  포문으로 돌리기 여기에 추가 prepended-->           
            </ul>
            
            <div class="text-center" id="morebt" >
            <input id="replycheck"  type="hidden" value="0">
         <a class="btn btn-warning" id="moreclick">더 보기 <span class="glyphicon glyphicon-arrow-down"></span></a>
          </div>
                 
                 
                 
                 <c:if test='${not empty sessionScope.authUser }'>  
              
              <div  class="list-group-item text-center">
            
              
              <textarea rows="3" id="replycontent" class="form-control"></textarea>
              <div class ="text-center"></div>
          <a id="reply" class="btn btn-mg btn-primary btn-primary">댓글쓰기 <span class="glyphicon glyphicon-comment"></span></a>  
          </div> 
            </c:if>
             
           
       <div id="bdhr"></div>

             
               </div>
            <div class="col-lg-12 text-right" id="bottombtns"> 
            
             <c:if test="${authUser.no eq reviewBoardVo.userNo }">
               <a href="deleteform?no=${reviewBoardVo.no }" class="btn btn-sm btn-danger">삭제 <span class="glyphicon glyphicon-trash"></span></a>
               <a href="modifyform?no=${reviewBoardVo.no }" class="btn btn-sm btn-success">글 수정 <span class="glyphicon glyphicon-pencil"></span></a>
       		 </c:if>
            <a href="board" class="btn btn-sm btn-primary">목록 <span class="glyphicon glyphicon-th-list"></span></a>
            
            </div>
            
         </div>
      </div>
               
      </div>
   </div>         

   <c:import url="/WEB-INF/views/include/footer.jsp" />

</body>
<script>
function replyAll(reviewNo, userNo, isAdmin){
	var trString="";
	
	$.ajax({
        type : 'POST',
        url : 'replylist',
        data :{"reviewNo": reviewNo},
        /* contentType: "application/json", */
        success : function (listBoard) {
        	var length = listBoard.length;
        	$("#replytotal").text("댓글갯수 "+length+'개');
        	if( listBoard.length >5 ){
        		if( $("#replycheck").val() == '0'){//5개만그리기
        		$.each(listBoard, function(index, replyVo) {
        			if(index < 5){
        			trString += "<li class='list-group-item'>";
            		trString += "	<div><strong>" + replyVo.userId + "</strong>&nbsp;<span id='date'> "+ replyVo.regDate +"</span>" ;
    				if(userNo == replyVo.userNo || isAdmin=='a'){
            		trString += "	<a href='#' data-no='"+ replyVo.no +"' id='deletereply' class='btn btn-xs btn-default'>삭제 <span class='glyphicon glyphicon-trash'></span></a></div>";
    				}
            		trString += "	<div>" + replyVo.content + "</div>";
            		trString += "</li>";
        			}
        			
        		});$("#morebt").show();
        		
        		}
        		
        		else if( $("#replycheck").val() == '1'){//더보기 버튼을 눌렀을때 다그리기
        			$.each(listBoard, function(index, replyVo) {
                		trString += "<li class='list-group-item'>";
                		trString += "	<div><strong>" + replyVo.userId + "</strong>&nbsp;<span id='date'> "+ replyVo.regDate +"</span>" ;
        				if(userNo == replyVo.userNo ||  isAdmin=='a' ){
                		trString += "	<a href='#' data-no='"+ replyVo.no +"' id='deletereply' class='btn btn-xs btn-default'>삭제 <span class='glyphicon glyphicon-trash'></span></a></div>";
        				}
                		trString += "	<div>" + replyVo.content + "</div>";
                		trString += "</li>";
                		
            		});
        		}
        		
        	}else{
        		$.each(listBoard, function(index, replyVo) {
            		trString += "<li class='list-group-item'>";
            		trString += "	<div><strong>" + replyVo.userId + "</strong>&nbsp;<span id='date'> "+ replyVo.regDate +"</span>" ;
    				if(userNo == replyVo.userNo || isAdmin=='a'){
            		trString += "	<a href='#' data-no='"+ replyVo.no +"' id='deletereply' class='btn btn-xs btn-default'>삭제 <span class='glyphicon glyphicon-trash'></span></a></div>";
    				}
            		trString += "	<div>" + replyVo.content + "</div>";
            		trString += "</li>";
            	});
        		$("#morebt").hide();
        		
        	}
        	 
        	  
/* 		if( 더보기 버튼 활성되면 ){
			다 뿌려주기  더보기 버튼 비활성 
		} else{

			더보기 버튼 과 5개 뿌려주기	
		}         	
        	 */
	
        	/* 
        	2.5개 이하 
        	 */
        	
        	$("#list-group").html(trString);
        	/* console.log(trString) */
        }
    });
}	


$(function(){
	$("#morebt").show();
	var reviewNo =('${reviewBoardVo.no }');
 	var userNo = "${sessionScope.authUser.no }";
 	var isAdmin	= "${sessionScope.authUser.isAdmin }"; 
 	
 	
 	replyAll(reviewNo,userNo, isAdmin);
   
 	
	$("#reply").on("click", function() {
		var reviewNo =('${reviewBoardVo.no }');
		var content = $('#replycontent').val();
	    var userNo = "${sessionScope.authUser.no }";
		
	    replyVo = {
			"reviewNo": reviewNo,
			"content": content,
			"userNo": userNo
	    }
	    $.ajax({// 비동기식 
				url : "reply",
				type : "POST",
				data:JSON.stringify(replyVo),
				contentType:"application/json",
			    success : function(response) {
			 if(response != null){
			    	console.log('success');
			    	
			    	replyAll(reviewNo,userNo,isAdmin);
			    	$("#replycontent").val("");
			 		return true;
			 }
			 else{
				 alert("글쓰기에 실패했습니다...");
				 return false;
				 
			 }
			   
				},
				error : function(jqXHR, status, error) {
					console.error(status + ":" + error);
				}
		}); 
	});
	
	
	$("#moreclick").on("click", function(){
		$("#morebt").hide();
		 $("#replycheck").val('1');
		replyAll(reviewNo,userNo, isAdmin);
	});
	
	
	
	
	
	
	
	$("#list-group").on("click", "#deletereply", function() {
		var replyNo = $(this).data("no");
		console.log(this);
		console.log("reply no느"+replyNo);
		   $.ajax({// 비동기식 
				url : "deletereply",
				type : "POST",
				data:{"replyNo": replyNo},
				success : function(response) {
			 if(response != null){
			    	console.log('success');
			    	
			    	replyAll(reviewNo,userNo);
			    	$("#replycontent").val("");
			 		return true;
			 }
			 else{
				 alert("글쓰기에 실패했습니다...");
				 return false;
				 
			 }
			   
				},
				error : function(jqXHR, status, error) {
					console.error(status + ":" + error);
				}
		}); 

	});
	
});



</script>
</html>