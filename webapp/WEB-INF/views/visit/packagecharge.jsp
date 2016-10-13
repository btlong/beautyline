	<!-- 쿠폰 충전 모달 -->
	<div id="myModal1" class="modal fade " tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-content modal-dialog">
			<!-- header -->
			<div class="modal-header">
				<!-- 닫기(x) 버튼 -->
				<button type="button" class="close" data-dismiss="modal">×</button>
				<!-- header title -->
				<h4 class="modal-title text-center">
					<strong>패키지 충전</strong>
				</h4>
			</div>

			<!-- body -->
			<!-- 	<form class="form-inline" method="post" action="registration"> -->

			<div class="modal-body">

				<div class="row center-blocks">
					<label class="col-sm-6 text-right">이름</label> <label
						id="packageName" class="col-sm-3 com-sm-offset-1" type="text"
						value="" size="8"></label>
				</div>
				<div class="row center-blocks">
					<label class="col-md-6 text-right">전화번호</label> <label
						id="packagePhone" class="col-md-4" type="text"
						value="${userVo.phone}"></label>
				</div>

				<div class="row center-blocks">
					<label class="col-md-6 text-right">구매프로그램</label> <select
						id="packageSelected" class="col-md-3">
						<option value="1">베이직 케어</option>
						<option value="2">미백 케어</option>
						<option value="3">주름 케어</option>
						<option value="4">여드름 케어</option>
					</select>
				</div>
				<div class="row center-blocks">
					<label class="col-md-6 text-right">횟수</label> <input
						id="packageCount" class="col-md-2" type="text"> <label
						class="col-md-1">회</label>
				</div>
				<div class="row center-blocks">
					<label class="col-md-6 text-right">금액</label> <input
						id="packagePrice" class="col-md-2" type="text"> <label
						class="col-md-1">원</label>
				</div>
				<div class="radio-group text-center">
					<input id="pack_opt_1" class="radio-box" type="radio"
						name="packagePay" value="4"> <label
						class="radio-group__label control-label " for="pack_opt_1">
						카드</label> <input id="pack_opt_2" class="radio-box" type="radio"
						name="packagePay" value="3"> <label
						class="radio-group__label control-label" for="pack_opt_2">
						현금</label>
				</div>
			</div>

			<!-- Footer -->
			<div class="modal-footer">
				<div class="col-lg-12 text-center form-group">
					<input id="packageCharge" class="btn btn-danger " type="button"
						value="충전하기">
					<button type="button" class=" btn btn-danger" data-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>