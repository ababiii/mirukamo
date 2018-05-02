<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<head>
<title></title>
<script src="resources/jQuery/jquery-3.2.1.min.js"></script>
<script src="resources/jQuery/jquery-ui.js"></script>
<script type="text/javascript">
<!-- 페이지 이동 스크립트  -->
	function pagingFormSubmitreview(currentPage) {
		var form = document.getElementById('pagingForm');
		var page = document.getElementById('page');
		page.value = currentPage;
		form.submit();
	}
</script>
</head>
<body>
	<!--  고객센터 게시판-->
	<br> 총 게시물 : ${howboardreview}
	<table border="1">
		<tr>
			<td colspan="3">수강 후기</td>
		</tr>

		<tr>
			<td>번호</td>
			<td>제목</td>
			<td>작성 날자</td>
		</tr>
		<c:if test="${reviewpaging != null}">
			<c:forEach items="${reviewpaging}" var="re">
				<tr>
					<td>${re.num}</td>
					<td><a href="reviews?num=${re.num}">${re.title}</a></td>
					<td>${re.review_date}</td>
				</tr>
			</c:forEach>
		</c:if>
		<c:if test="${reviewpaging == null}">
			<tr>
				<td colspan="3">등록된 수강 후기가 없습니다.</td>
			</tr>	
		</c:if>
	</table>
	<div id="navigator">
		<!-- 페이지 이동 부분 -->
		<a
			href="javascript:pagingFormSubmitreview(${navi0.currentPage - navi0.pagePerGroup})">◁◁
		</a> &nbsp;&nbsp; <a
			href="javascript:pagingFormSubmitreview(${navi0.currentPage - 1})">◀</a>
		&nbsp;&nbsp;

		<c:forEach var="counter" begin="${navi0.startPageGroup}"
			end="${navi0.endPageGroup}">
			<c:if test="${counter == navi0.currentPage}">
				<b>
			</c:if>
			<a href="javascript:pagingFormSubmitreview(${counter})">${counter}</a>&nbsp;
		<c:if test="${counter == navi0.currentPage}">
				</b>
			</c:if>
		</c:forEach>
		&nbsp;&nbsp; <a
			href="javascript:pagingFormSubmitreview(${navi0.currentPage + 1})">▶</a>
		&nbsp;&nbsp; <a
			href="javascript:pagingFormSubmitreview(${navi0.currentPage + navi.pagePerGroup})">▷▷</a>

		<!-- /페이지 이동 끝 -->

		<br>
		<br>
		<form id="pagingForm" method="get" action="reviewsservicecenter">
			<input type="hidden" name="page" id="page" />
		</form>
	</div>

	<c:if test="${userId != null}">
		<a href="writereviews">수강후기 작성</a>
	</c:if>
</body>
</html>