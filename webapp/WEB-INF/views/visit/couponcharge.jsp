
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- 쿠폰 충전 모달 -->
<div id="myModal3" class="modal fade " tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-content modal-dialog">
		<div class="form-horizontal">
			<!-- header -->
			<div class="modal-header">
				<!-- 닫기(x) 버튼 -->
				<button type="button" class="close" data-dismiss="modal">×</button>
				<h3 class="modal-title text-center"><strong>패키지 충전</strong></h3>
			</div>

			<!-- body -->
			<div class="modal-body">
				<div class="form-group">
					<label class="col-lg-4 control-label text-right">이름</label>
					<div class="col-lg-4">
					<label id="packageName" class="form-control" ></label>
					</div>
				</div>
				<div class="form-group">
					<label class="col-lg-4 control-label text-right">전화번호</label>
					<div class="col-lg-4">
					<label id="packagePhone" class="form-control" >${userVo.phone}</label>
					</div>
				</div>
				
				<div class="form-group">
					<label class="col-lg-4 control-label text-right">구매프로그램</label>
					<div class="col-lg-4">
					<select id="packageSelected" class="form-control" >
						<option value="1">베이직 케어</option>
						<option value="2">미백 케어</option>
						<option value="3">주름 케어</option>
						<option value="4">여드름 케어</option>
					</select>
					</div>
				</div>
				<div class="form-group">
					<label class="col-lg-4 control-label text-right">횟수</label>
					<div class="col-lg-4">
					<input id="packageCount" class="form-control onlyNumber" type="text" placeholder="횟수 입력">
			<!-- 		<label >회</label> -->
					</div>
				</div>
				
				<div class="form-group">
					<label class="col-lg-4 control-label text-right">금액</label> 
					<div class="col-lg-4">
					<input id="packagePrice" class="form-control onlyNumber" type="text" placeholder="금액 입력">
			<!-- 		<span class="col-lg-1">원</span> -->
					</div>
				</div>
				
				<div class="radio-group text-center">
					<input id="pack_opt_1" class="radio-box" type="radio" name="packagePay" value="4">
					<label class="radio-group__label control-label " for="pack_opt_1"> 카드</label>
					<input id="pack_opt_2" class="radio-box" type="radio" name="packagePay" value="3">
					<label class="radio-group__label control-label" for="pack_opt_2">현금</label>
				</div>
			</div>

			<!-- Footer -->
			<div class="modal-footer">
				<div class="col-lg-12 text-center form-group">
					<input id="packageCharge" class="btn btn-info" type="button" value="충전">
					<button type="button" class=" btn btn-danger" data-dismiss="modal">취소</button>
				</div>
			</div>
			</div>
		</div>
	</div>