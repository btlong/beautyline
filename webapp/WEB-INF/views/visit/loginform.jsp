<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<style type="text/css">
.block-label {
	width: 100px;
}
.btn btn-danger {
	margin: 50px;
}
#loginbt {
	margin-top: 10px;
}
</style>

<div class="col-lg-12 text-center" id="reservejoin">
	<form class="form-horizontal" name="loginform" method="post"
		action="/beautyline/visit/login">


		<div class="form-group">
			<label class="col-sm-3 control-label input-sm" for="id">ID</label>
			<div class="col-sm-6">
				<input class="form-control" id="id" name="id" type="text" value=""
					placeholder="YOUR ID">
			</div>
		</div>

		<div class="form-group">
			<label class="col-sm-3 control-label input-sm" for="password">PASSWORD</label>
			<div class="col-sm-6">
				<input class="form-control input-sm" id="password" name="password"
					type="password" value="" placeholder="PASSWORD">
			</div>
		</div>


		<%-- <c:if test='${param.r == "fail"}'>
							<p>로그인이 실패 했습니다.</p>
						</c:if> --%>


		<div id="loginbt" class="col-lg-12 text-center">
			<input class="btn btn-danger " type="submit" value="LOGIN"> <a
				href="/beautyline/main" class="btn btn-info">메인으로 돌아가기</a>
		</div>


	</form>

</div>