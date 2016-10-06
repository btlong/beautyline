<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
    <meta charset="utf-8">
    <title>Simple AngularJS Bulletin Board</title>
    <link rel="stylesheet" href="stylesheets/style.css">

    <link rel="stylesheet" href="bootstrap/dist/css/bootstrap.css">
    <script src="angular/angular.js"></script>
    <script src="angular-route/angular-route.js"></script>

    <!-- simple_angularjs_bulletin_board -->

    <script src="routings/routings.js"></script>
    <script src="pagingDirective/pagingDirective.js"></script>
    <script src="globalService/globalService.js"></script>
    <script src="main.js"></script>
    <script src="msgList/list.js"></script>
    <script src="msgView/view.js"></script>
    <script src="msgEdit/edit.js"></script>
    <script src="msgWrite/write.js"></script>


<style type="text/css">
a {
  color: #00B7FF;
}

input[type="text"] {
    height: 30px;
    font-size: 14px;
    line-height: 30px;
}</style>
</head>
<body>



<div class="container">
    <h2><span class="label label-primary">Simple AngularJS Bulletin Board</span></h2>

    <div ng-view></div>
</div>




















</body>
</html>