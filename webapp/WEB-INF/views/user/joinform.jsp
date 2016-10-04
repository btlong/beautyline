
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

	<!-- Custom CSS -->
	<link href="/beautyline/bootstrap/css/business-casual.css" rel="stylesheet">
	<link href="https://maxcdn.bootstrapcdn.com/bootswatch/3.3.7/flatly/bootstrap.min.css" rel="stylesheet" integrity="sha384-+ENW/yibaokMnme+vBLnHMphUYxHs34h9lpdbSLuAwGkOKFRl4C34WkjazBtb7eT" crossorigin="anonymous">  
    <!-- font awesome -->
    <link rel="stylesheet" href="/beautyline/bootstrap/css/font-awesome.min.css" media="screen" title="no title" >
    <!-- Custom style -->
    <link rel="stylesheet" href="/beautyline/bootstrap/css/style.css" media="screen" title="no title" >
	
  <!-- Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Josefin+Slab:100,300,400,600,700,100italic,300italic,400italic,600italic,700italic" rel="stylesheet" type="text/css">
	

  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
  <script type="text/javascript" src="/beautyline/bootstrap/js/jquery.js"></script>
 <style type="text/css">
.col-sm-3,
.col-sm-2
 {

	padding-right: 0px;
	
}
#btn {
	padding-left: 0px;
}
</style> 
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullAddr = ''; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수

                // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    fullAddr = data.roadAddress;

                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    fullAddr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
                if(data.userSelectedType === 'R'){
                    //법정동명이 있을 경우 추가한다.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가한다.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('sample6_address').value = fullAddr;

                // 커서를 상세주소 필드로 이동한다.
                document.getElementById('sample6_address2').focus();
            }
        }).open();
    }
    
     
  /*   function chkPwd(str){

		 var reg_pwd = /^.*(?=.{6,20})(?=.*[0-9])(?=.*[a-zA-Z]).*$/;

		 if(!reg_pwd.test(str)){

		  return false;

		 }

		 return true;

		}

	 	if(!chkPwd( $.trim($('#inputPassword').val()))){ 

		 alert('비밀번호를 확인하세요.₩n(영문,숫자를 혼합하여 6~20자 이내)');    

		 $('#inputPassword').val('');

		 $('#inputPassword').focus(); return false;

		 }  */ 


    
</script>




</head>
<body>
<c:import url="/WEB-INF/views/include/header.jsp" />
 
    <div class="container">
      <div class="row">
         <div class="box">    
        	<div class="col-lg-12">
             <div class="page-header">
               <hr>
               <h1 class="text-center text-center">
                  <strong>회원가입</strong>
               </h1>
               <hr>
            </div>
        
        
        
        <!-- ////////////////////////회원가입 폼시작///////////////////////////////////// -->
					<form class="form-horizontal" id="join-form" name="joinform"
						method="post" action="/beautyline/user/join">

						<!-- 이름 -->
						<div class="form-group" id="divName">
							<label class="col-sm-3 control-label" for="inputName">이름*</label>
							<div class="col-sm-3">
								<input class="form-control onlyHangul" id="inputName"
									name="name" type="text" placeholder="이름">
							</div>
						</div>
						<br>

						<!-- 아이디 -->
						<div class="form-group" id="divId">
							<label class="col-sm-3 control-label" for="inputId">아이디*</label>
							<div class="col-sm-3">
								<input class="form-control onlyAlphabetAndNumber" id="inputId"
									name="id" type="text" placeholder="아이디">
							</div>
							<span class="input-group-btn">
							<input type="hidden" name="conCheckId" value="0">
								<button class="btn btn-success" id="checkId" type="button">
									중복 확인<i class="fa fa-edit spaceLeft"></i>
								</button>
							</span>
						</div>
						<br>

						<!-- 비밀번호 -->
						<div class="form-group" id="divPassword">
							<label class="col-sm-3 control-label" for="inputPassword">비밀번호*</label>
							<div class="col-sm-3">
								<input class="form-control" id="inputPassword" name="password"
									type="password" placeholder="비밀번호">
							</div>
							<div class="col-sm-3">
								<h11 class="help-block" id="checkPw">특수문자,영문,숫자를 혼합하여
								6~20자 이내</h11>
							</div>
						</div>

						<!-- 비밀번호확인 -->
						<div class="form-group" id="divPasswordCheck">
							<label class="col-sm-3 control-label" for="inputPasswordCheck">비밀번호
								확인*</label>
							<div class="col-sm-3">
								<input class="form-control" id="inputPasswordCheck"
									type="password" placeholder="비밀번호 확인">
							</div>
							<div class="col-sm-3">
								<h11 class="help-block" id="oneMore">비밀번호를 한번 더 입력해주세요.</h11>
							</div>
						</div>
						<br>


						<!-- 이메일 -->
						<div class="form-group" id="divEmail">
							<label class="col-sm-3 control-label" for="inputEmail">이메일*</label>
							<div class="col-sm-2">
								<input class="form-control" name="email1" id="inputEmail1"
									type="text">
							</div>
							<div class="col-sm-2">
								<input class="form-control" name="email2" id="inputEmail2"
									type="text">
							</div>
							<div class="col-sm-2">
								<select class="form-control" name="email_select"
									id="email_select">
									<option value="" selected>선택하세요</option>
									<option value="naver.com">naver.com</option>
									<option value="hotmail.com">hotmail.com</option>
									<option value="hanmail.com">hanmail.com</option>
									<option value="yahoo.co.kr">yahoo.co.kr</option>
									<option value="1">직접입력</option>
								</select>
							</div>
						</div>
						<br>



						<!-- 주소 -->
						<div class="form-group" id="divAddress">
							<label class="col-sm-3 control-label">주소*</label>
							<div class="col-sm-2">
								<input class="form-control" type="text" name="zipCode"
									id="sample6_postcode" placeholder="우편번호">
							</div>
							<span class="input-group-btn"> <input
								class="btn btn-success" type="button"
								onclick="sample6_execDaumPostcode()" value="우편번호 찾기">
							</span>
							<div class="col-sm-12 col-sm-offset-3">
								<div class="row">
									<div class="col-sm-4">
										<input class="form-control" name="address1" type="text"
											id="sample6_address" placeholder="주소">
									</div>
									<div class="col-sm-2">
										<input class="form-control" name="address2" type="text"
											id="sample6_address2" placeholder="상세주소">
									</div>
								</div>
							</div>
						</div>
						<br>

						<!-- 휴대폰 번호 -->
						<div class="form-group" id="divNumber">
							<label class="col-sm-3 control-label" for="inputNumber">휴대폰번호*</label>
							<div class="col-sm-3">
								<input type="tel" class="form-control onlyNumber" name="phone"
									id="inputNumber" placeholder="- 없이 입력해 주세요" />
							</div>
							<span class="input-group-btn">
								<button class="btn btn-success">
									인증번호 전송<i class="fa fa-mail-forward spaceLeft"></i>
								</button>
							</span>
						</div>
						<br>

						<!-- 인증번호 확인 -->
						<div class="form-group" id="divNumberCheck">
							<label class="col-sm-3 control-label" for="inputNumberCheck">인증번호
								확인</label>
							<div class="col-sm-2">
								<input class="form-control" id="inputNumberCheck" type="text" placeholder="인증번호">
							</div>
							<!--     <span class="input-group-btn"> -->
							<div class="col-sm-2" id="btn">
								<button class="btn btn-success" type="button">
									인증번호 확인<i class="fa fa-edit spaceLeft"></i>
								</button>
							</div>
							<div class="col-sm-3">
								<h11 class="help-block">전송된 인증번호를 입력해주세요.</h11>
							</div>

						</div>
						<br><br>

						<div class="form-group">
							<label class="col-sm-3 control-label" for="inputEmailReceiveYn" >이메일 수신여부</label>
							<div class="col-sm-4">
								<label class="radio-inline">
								<input type="radio" id="emailReceiveYn" name="emailReceiveYn" value="Y" checked> 동의합니다.
								</label>
								<label class="radio-inline">
								<input type="radio" id="emailReceiveYn" name="emailReceiveYn" value="N">동의하지 않습니다.
								</label>
							</div>
						</div><br>
						
						<div class="form-group">
							<label class="col-sm-3 control-label" for="inputPhoneNumber" >SMS 수신여부</label>
							<div class="col-sm-4">
								<label class="radio-inline">
								<input type="radio" id="smsReceiveYn" name="smsReceiveYn" value="Y" checked>동의합니다.
								</label>
								<label class="radio-inline"> <input type="radio" id="smsReceiveYn" name="smsReceiveYn" value="N"> 동의하지 않습니다.
								</label>
							</div>
						</div><br>


						<div class="form-group">
							<label class="col-sm-3 control-label" for="inputAgree">약관 동의</label>
							<div class="col-sm-6" data-toggle="buttons">
								<label class="btn btn-warning active">
								<input id="agree" type="checkbox" autocomplete="off">
								<span class="fa fa-check"></span>
								</label> <a href="#">이용약관</a> 에 동의 합니다.
							</div>
						</div><br><br>
						
						
						<div class="form-group">
							<div class="col-sm-12 text-center">
								<button class="btn btn-primary" type="submit">
									회원가입<i class="fa fa-check spaceLeft"></i>
								</button>
								<button class="btn btn-danger" type="submit">
									가입취소<i class="fa fa-times spaceLeft"></i>
								</button>
							</div>
						</div>
					</form>
					<hr>
				</div>
			</div>
		</div>
	</div>

	<c:import url="/WEB-INF/views/include/footer.jsp" />








	<!-- <div class="col-md-4 hidden-lg hidden-md text-center"> 
            <div class="alert alert-danger alert-dismissable">
              <button contenteditable="false" type="button" class="close" data-dismiss="alert"
              aria-hidden="true">×</button>이미 등록된 아이디 입니다.</div>-->

	<button id="qmyBtn">Click Here</button>
</body>








<script>
	$(function() {
		//모달을 전역변수로 선언
		var modalContents = $(".modal-contents");
		var modal = $("#defaultModal");

		$('.onlyAlphabetAndNumber').keyup(function(event) {
			if (!(event.keyCode >= 37 && event.keyCode <= 40)) {
				var inputVal = $(this).val();
				$(this).val($(this).val().replace(/[^_a-z0-9]/gi, '')); //_(underscore), 영어, 숫자만 가능
			}
		});

		$(".onlyHangul").keyup(function(event) {
			if (!(event.keyCode >= 37 && event.keyCode <= 40)) {
				var inputVal = $(this).val();
				$(this).val(inputVal.replace(/[a-z0-9]/gi, ''));
			}
		});

		$(".onlyNumber").keyup(function(event) {
			if (!(event.keyCode >= 37 && event.keyCode <= 40)) {
				var inputVal = $(this).val();
				$(this).val(inputVal.replace(/[^0-9]/gi, ''));
			}
		});

		//------- 검사하여 상태를 class에 적용
		$('#inputName').keyup(function(event) {

			var divId = $('#divName');

			if ($('#inputName').val() == "") {
				divId.removeClass("has-success");
				divId.addClass("has-error");
			} else {
				divId.removeClass("has-error");
				divId.addClass("has-success");
			}
		});
		$('#inputId').keyup(function(event) {
			var divId = $('#divId');
			if ($('#inputId').val() == "") {
				divId.removeClass("has-success");
				divId.addClass("has-error");
			} else {
				divId.removeClass("has-error");
				divId.addClass("has-success");
			}
		});


		$('#inputPassword').keyup(function(event) {
			var password = $('#inputPassword').val();
			var passwordCheck = $('#inputPasswordCheck').val();
			var divPasswordCheck = $('#divPasswordCheck');
			var divPassword = $('#divPassword');
			
			
			
			if (password == "" || (CehckPassWord(password) == false)) {
				divPassword.removeClass("has-success");
				divPassword.addClass("has-error");
				$("#checkPw").html("비밀번호는 특수문자, 영문,숫자를 혼합하여 6~20자리로 입력해주세요.");
			} else {
				divPassword.removeClass("has-error");
				divPassword.addClass("has-success");
				$("#checkPw").html("사용 가능합니다.");
			}
			
			
			
			if (password != passwordCheck) {
				divPasswordCheck.removeClass("has-success");
				divPasswordCheck.addClass("has-error");
				$("#oneMore").html("일치 하지 않습니다.")
			} else {
				divPasswordCheck.removeClass("has-error");
				divPasswordCheck.addClass("has-success");
				$("#oneMore").html("일치 합니다.")
			}
		});

		$('#inputPasswordCheck').keyup(function(event) {

			var passwordCheck = $('#inputPasswordCheck').val();
			var password = $('#inputPassword').val();
			var divPasswordCheck = $('#divPasswordCheck');

			if ((passwordCheck == "") || (password != passwordCheck)) {
				divPasswordCheck.removeClass("has-success");
				divPasswordCheck.addClass("has-error");
				$("#oneMore").html("일치 하지 않습니다.")
			} else {
				divPasswordCheck.removeClass("has-error");
				divPasswordCheck.addClass("has-success");
				$("#oneMore").html("일치 합니다.")
			}
		});
		
		$('#inputEmail1').keyup(function(event) {
			var divEmail = $('#divEmail');
			if ($.trim($('#inputEmail1').val()) == "" || $.trim($('#inputEmail2').val()) == "") {
				divEmail.removeClass("has-success");
				divEmail.addClass("has-error");
			} else {
				divEmail.removeClass("has-error");
				divEmail.addClass("has-success");
			}
		});
		$("#email_select").change(function() {
			/* @뒤 이메일 자동으로 만들어주는것  */
			if ($("#email_select").val() == '1') {//
				$("#inputEmail2").readonly = false;
				$("#inputEmail2").value = '';
				$("#inputEmail2").focus();
			} else {
				$("#inputEmail2").readonly = true;
				$("#inputEmail2").val($("#email_select").val());
			}
			var divEmail = $('#divEmail');
			if ($.trim($('#inputEmail1').val()) == "" || $.trim($('#inputEmail2').val()) == "") {
				divEmail.removeClass("has-success");
				divEmail.addClass("has-error");
			} else {
				divEmail.removeClass("has-error");
				divEmail.addClass("has-success");
			}
		});

		$('#inputNumber').keyup(function(event) {
			var divPhoneNumber = $('#divNumber');
			//숫자 검사해야함!
			if ($.trim($('#inputNumber').val()) == "") {
				divPhoneNumber.removeClass("has-success");
				divPhoneNumber.addClass("has-error");
			} else {
				divPhoneNumber.removeClass("has-error");
				divPhoneNumber.addClass("has-success");
			}
		});
	
		
		/* validation 검사   */
		$("#join-form").submit(function() {
			
		/* 	var name = $("#inputName").val();
				var id = $("#inputId").val();
			var 	$("#inputPassword").val()
				$("#inputPasswordCheck").val()
				$("#email1").val()
				$("#email2").val()
				$("#sample6_postcode").val()
				$("#address1").val()
				$("#address2").val()
				$("#inputNumber").val() */
				
				
				console.log(id);
				$.ajax({// 비동기식 
					url : "checkId",
					type : "POST",
					data : {
						"id" : id
					},
					dataType : "text",
					success : function(check) {
						console.log(check);
						if (check == "exists") {
							alert("이미 존재하는 아이디 입니다.");
							$("#inputId").val("").focus();
							$("#conCheckId").val('0');
						}

						/*  if($("#inputId").val()==null){
						  $("#inputId").val("").focus();
						 } */
						else {
							alert("사용 가능한 아이디입니다..");
							$("#conCheckId").val('1');
						}
					},
					error : function(jqXHR, status, error) {
						console.error(status + ":" + error);
					}
				});
			
			if ($("#inputName").val() == "") {
				alert("이름은 필수 입력 항목입니다.");
				$("#inputName").focus()
				return false;
			}
			if ($("#inputId").val() == "") {
				alert("아이디는 필수 입력 항목입니다.");
				$("#inputId").focus()
				return false;
			}
			if ($("#inputPassword").val() == "") {
				alert("비밀번호는 필수 입력 항목입니다.");
				$("#inputPassword").focus()
				return false;
			}
			if ($("#inputPasswordCheck").val() == "") {
				alert("이메일은 필수 입력 항목입니다.");
				$("#inputPasswordCheck").focus()
				return false;
			}
			if ($("#email1").val() == "") {
				alert("이메일은 필수 입력 항목입니다.");
				$("#email1").focus()
				return false;
			}
			if ($("#email2").val() == "") {
				alert("이메일은 필수 입력 항목입니다.");
				$("#email2").focus()
				return false;
			}
			if ($("#sample6_postcode").val() == "") {
				alert("우편번호를 입력하세요.");
				$("#sample6_postcode").focus()
				return false;
			}
			if ($("#address1").val() == "") {
				alert("주소를 입력하세요.");
				$("#address1").focus()
				return false;
			}
			if ($("#address2").val() == "") {
				alert("상세주소를 입력하세요.");
				$("#address2").focus()
				return false;
			}
			if ($("#inputNumber").val() == "") {
				alert("전화번호를 입력하세요.");
				$("#inputNumber").focus()
				return false;
			}
			if($("#conCheckId").val()=='0' ){
				alert ("아이디 중복확인이 필요합니다.");
				
				return false;
				}
			
			
			/* if($("#agree-prov").is(":checked")==false ){
			alert ("약관동의가 필요합니다.");
			
			return false;
			} */
			alert("회원가입에 성공하였습니다.");
			return true;

		});

		

		/* id중복체크  */
		$("#inputId").change(function() {
			$("#conCheckId").val('0');
			$("#checkId").on("click", function() {
				var id = $("#inputId").val();
				console.log(id);
				$.ajax({// 비동기식 
					url : "checkId",
					type : "POST",
					data : {
						"id" : id
					},
					dataType : "text",
					success : function(check) {
						console.log(check);
						if (check == "exists") {
							alert("이미 존재하는 아이디 입니다.");
							$("#inputId").val("").focus();
							$("#conCheckId").val('0');
						}

						/*  if($("#inputId").val()==null){
						  $("#inputId").val("").focus();
						 } */
						else {
							alert("사용 가능한 아이디입니다..");
							$("#conCheckId").val('1');
						}
					},
					error : function(jqXHR, status, error) {
						console.error(status + ":" + error);
					}
				});

			});
		});
		
		
	/* 	$("#email_select").change(function() { 
			console.log($("#email_select").val());
		
		});
		 */
		

		
		

	});

	function CehckPassWord(str) { //비밀번호 유효성 검사 
		if (str.length < 6) {
			return false;
		}
		if (!str
				.match(/([a-zA-Z0-9].*[!,@,#,$,%,^,&,*,?,_,~])|([!,@,#,$,%,^,&,*,?,_,~].*[a-zA-Z0-9])/)) {
			return false;
		}

		return true;
	}

	$(function() { // 다썼는지 체크하기! 빠진 항목없는지..
		

	});
</script>



</html>