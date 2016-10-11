<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script type="text/javascript" src="/beautyline/bootstrap/js/jquery.js"></script>

<div class="col-lg-12 text-center">
	<nav>
		<ul class="pagination pagination-sm">
			<c:if test="${page.totalRecord !=0}">
				<!-- 이전 -->
				<c:if test="${page.nowBlock >0 }">
					<li id="previous"><span aria-hidden="true">&laquo;</span></li>
				</c:if>

				<!-- 페이지블럭 -->
				<c:set var="doneLoop2" value="false" />
				<c:forEach begin="0" end="${page.pagePerBlock-1 }" var="i">
					<c:if test="${not doneLoop2 }">
						<li id="page-block"><a href="javascript:pagemove(${i })">
								${(page.nowBlock*page.pagePerBlock)+i+1}</a></li>
						<c:if
							test="${(page.pagePerBlock*page.nowBlock+i+1) == page.totalPage }">
							<c:set var="doneLoop2" value="true" />
						</c:if>
					</c:if>
				</c:forEach>

				<!-- 다음 -->
				<c:if test="${page.totalBlock > page.nowBlock+1 }">
					<li id="following"><span aria-hidden="true">&raquo;</span></li>
				</c:if>
			</c:if>
		</ul>
	</nav>
</div>


<script>
	/*  paging*/
	function pagemove(i) {
		var nowPage = document.pagemove.nowPage.value;
		document.pagemove.nowPage.value = Number(nowPage) + Number(i);
		document.pagemove.submit();
	}

	$(document).ready(function() {
		/*  paging*/
		$('#previous').click(function() {
			$('#blockmoveb').submit();
		});

		$('#following').click(function() {
			$('#blockmovef').submit();
		});

	});
</script>