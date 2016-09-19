<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>  
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
body {
	font-family: "돋움", "맑은 고딕";
	font-size: 0.8em;
	color: #333;
	margin: 0;
	padding: 0;
}

#header {
	width: 1090px;
	height: 100px;
	margin-left: 100px;
	background-color: #FF80FF;
	text-align: center;
}

#header h1 {
	padding: 30px;
}

#content {
	width: 1090px;
	height: 800px;
	margin-left: 100px;
	background-color: #BFBFBF;
}

#result {
	width: 1090px;
	height: 500px;
}

p {
	border 1;	
	color: #5B95D7;
	padding: 30px;
	font-size: 32px;
}

img {
	margin: 20px;
	width: 200px;
	height: 400px;
	cursor: pointer;
}

</style>

<script type="text/javascript" src="./jquery/jquery-1.9.0.js"></script>
<script type="text/javascript">
	


</script>

<title>Insert title here</title>
</head>
<body>
	<div id="header">
		<h1>헤더 입니다.</h1>
	</div>
	
	<div id="content">
		<div id="result">
			<p>고객님만을 위한 추천제품 (product regimen)</p>
			
			<a href='${url }' target="_blank"> <img src='${src }' title="구매하러 가기" /> </a>
		</div>
	</div>

</body>
</html>