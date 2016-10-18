<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<!-- searchModal -->
	<div class="modal fade " id="myModal2" role="dialog" tabindex="-1" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">

			<!-- Modal content-->
			<!-- 모달 회원 검색 -->
			<div id="searchform" >
				<div class="modal-content modal-dialog">
				<div class="form-horizontal">
					<!-- header -->
					<div class="modal-header">
						<!-- 닫기(x) 버튼 -->
						<button type="button" class="close" data-dismiss="modal">×</button>
						<!-- header title -->
						<h3 class="modal-title text-center"><strong>회원 검색</strong></h3>
					</div>

					<!-- body -->
					<div class="modal-body">
					<div class="form-group">
					<div class="col-lg-8 col-lg-offset-2">
						<select size="5" class="form-control text-center" id="selected">
							<option disabled="disabled">이름 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;전화번호</option>
							<option disabled="disabled">-----------------------------------------</option>
						<!-- 	Ajax 들어와서 회원 그려주는 것 -->
						</select>
						</div>
						
					</div>
					
					<!-- 	<div class="address-bar bg-danger row"> -->
						
							<div class="form-group">
								<label class="col-lg-4 control-label text-right">이름</label>
								<div class="col-lg-5">
								<label id="selectedName" class="form-control"></label>
								</div>
							</div>
							<div class="form-group">	
								<label class="col-lg-4 control-label text-right">전화번호</label>
								<div class="col-lg-5"> 
								<label id="selectedPhone" class="form-control"></label>
							</div>
							</div>
					</div>

					<!-- Footer -->
					<div class="modal-footer">
						<button id="userSelect" class="center-block btn btn-info" type="button">선택</button>
					</div>
				</div>
				</div>
			</div>
		</div>
	</div>

