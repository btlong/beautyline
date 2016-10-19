<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- 회원 추가 -->
	<div class="modal fade" id="myModal4">
		<div class="modal-dialog">

			<!-- modal content -->
			<form class="form-horizontal" id="userInsertForm" method="post"
				action="insertUser">
				<div class="modal-content">

					<!-- header -->
					<div class="modal-header">
						<!-- 닫기(x) 버튼 -->
						<button type="button" class="close" data-dismiss="modal">×</button>
						<!-- header title -->
						<h4 class="modal-title text-center">
							<!-- Ajax처리 -->
							<strong>회원 추가</strong>
						</h4>
					</div>

					<!-- body -->
					<div class="modal-body" id="modal4body">

						<!-- 이름 -->
						<div class="form-group" id="divName">
							<label class="col-lg-4 control-label">이름*</label>
							<div class="col-lg-5">
								<input class="form-control onlyHangul" id="inputName" name="name" type="text" placeholder="이름">
							</div>
						</div>
						<!-- 휴대폰 번호 -->
						<div class="form-group" id="divNumber">
							<label class="col-lg-4 control-label">휴대폰번호*</label>
							<div class="col-lg-5">
								<input type="text" class="form-control onlyNumberPhone"
									name="phone" id="inputNumber" placeholder="- 없이 입력해 주세요" />
							</div>
						</div>
					</div>

					<!-- Footer -->
					<div class="modal-footer">
					<div class="col-lg-12 text-center form-group">
						<button id="insertUserInfo" class="btn btn-info" type="button">추가</button>
						<button data-dismiss="modal" class="btn btn-danger">취소</button>
					</div>
					</div>
				</div>
			</form>
		</div>
	</div>