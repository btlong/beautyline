<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.2/themes/smoothness/jquery-ui.css" />
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="http://code.jquery.com/ui/1.10.2/jquery-ui.js"></script>
<title>Insert title here</title>
  <style>      
      
      #datepicker {margin-left:230px;}      
      #schedule_wrap {margin-top: 30px; margin-left: 150px;}
      #schedule_attr {background-color: rgb(120,193,255);}
      #schedule_attr td {color:white; width:90px; font-weight:bold;}
      #schedule_table {text-align: center; height: 800px; border-collapse:collapse; }
      #schedule_table tr, #schedule_table td {border:1px solid black;}
      .schedule {cursor:pointer; }
      #currentDate {margin-left: 300px;}   
      td { border : solid 1px white;}      
   </style>   
<script type="text/javascript">
$(function() { 
	   $( "#datepicker" ).datepicker( 
	   { 
	      showMonthAfterYear: true, 
	      minDate: '-0d', 
	      yearSuffix: '년', 
	      monthNames:['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
	      dayNamesMin: ['일','월','화','수','목','금','토','일'],
	      onSelect: function(dateText, datePicker) { 
	         var sDate = new Date(dateText); 
	         var dd = sDate.getDate(); 
	         var mm = sDate.getMonth()+1; 
	         if(mm<10) mm = "0" + mm; 
	         if(dd <10) dd = "0" + dd; 
	         $("#currentDate").val(sDate.getFullYear() +"년 "+mm+"월 "+dd+"일 ");           
	         
	         location.replace('Schedule.jsp?SelectedDay=' + currentDate.value);       
	      }  
	   });
	});
</script>
</head>
<body>

<div id="datepicker"> 

</div> 

</body>
</html>