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
		alert(currentPage);
		page.value = currentPage;
		form.submit();
	}

	function pagingFormSubmitadmin(currentPage) {
		var form = document.getElementById('adminpagingForm');
		var page = document.getElementById('pageadmin');
		page.value = currentPage;
		form.submit();
	}
	
	function pagingFormSubmitqna(currentPage) {
		var form = document.getElementById('qnapagingForm');
		var page = document.getElementById('pageqna');
		page.value = currentPage;
		form.submit();
	}
</script>
</head>
<body>
	총 게시물 : ${howboardadmin}
	<table border="1">
		<tr>
			<td colspan="3">공지 사항</td>
		</tr>
		<tr>
			<td>제목</td>
			<td>작성 날자</td>
		</tr>

		<c:forEach items="${adminboardlist}" var="q">
			<c:if test="${q.category == 0}">
				<tr>
					<!-- 공지사항 글 읽기 -->
					<td><a href="adminNotice?num=${q.num}">${q.title}</a></td>
					<td>${q.question_date}</td>
				</tr>
			</c:if>
		</c:forEach>
	</table>

	<div id="navigator1">
		<!-- 페이지 이동 부분 -->
		<a
			href="javascript:pagingFormSubmitadmin(${navi1.currentPage - navi1.pagePerGroup})">◁◁
		</a> &nbsp;&nbsp; <a
			href="javascript:pagingFormSubmitadmin(${navi1.currentPage - 1})">◀</a>
		&nbsp;&nbsp;

		<c:forEach var="counter" begin="${navi1.startPageGroup}"
			end="${navi1.endPageGroup}">
			<c:if test="${counter == navi1.currentPage}">
				<b>
			</c:if>
			<a href="javascript:pagingFormSubmitadmin(${counter})">${counter}</a>&nbsp;
		<c:if test="${counter == navi1.currentPage}">
				</b>
			</c:if>
		</c:forEach>
		&nbsp;&nbsp; <a
			href="javascript:pagingFormSubmitadmin(${navi1.currentPage + 1})">▶</a>
		&nbsp;&nbsp; <a
			href="javascript:pagingFormSubmitadmin(${navi1.currentPage + navi1.pagePerGroup})">▷▷</a>
		
		<!-- /페이지 이동 끝 -->

		<form id="adminpagingForm" method="get" action="servicecenter">
			<input type="hidden" name="adminpage" id="pageadmin" />
		</form>
	</div>

	<c:if test="${admin} != null">
		<a href="writenotice">공지 사항 글 작성</a>
	</c:if>

	<!--------------------------------------------------------------------------------------------------------------->

	<input type="button" value="1대1 문의 접수"
		onclick="location.href ='<c:url value="writeboard/advice"/>'">
	<input type="button" value="나의 문의 내역">
	<br>
	<br>
	<br>총 게시물 : ${howboardqna}
	<table border="1">
		<tr>
			<td colspan="3">자주 묻는 질문</td>
		</tr>
		<tr>
			<td>제목</td>
			<td>작성 날자</td>
		</tr>
		<c:forEach items="${qnaboardlist}" var="qna">
			<c:if test="${qna.category == 9}">
				<tr>
					<td><a href="qna?num=${qna.num}">${qna.title}</a></td>
					<td>${qna.question_date}</td>
				</tr>
			</c:if>
		</c:forEach>
	</table>

	<div id="navigator">
		<a
			href="javascript:pagingFormSubmitqna(${navi2.currentPage - navi2.pagePerGroup})">◁◁
		</a> &nbsp;&nbsp; <a
			href="javascript:pagingFormSubmitqna(${navi2.currentPage - 1})">◀</a>
		&nbsp;&nbsp;

		<c:forEach var="counter" begin="${navi2.startPageGroup}"
			end="${navi2.endPageGroup}">
			<c:if test="${counter == navi2.currentPage}">
				<b>
			</c:if>
			<a href="javascript:pagingFormSubmitqna(${counter})">${counter}</a>&nbsp;
		<c:if test="${counter == navi2.currentPage}">
				</b>
			</c:if>
		</c:forEach>
		&nbsp;&nbsp; <a
			href="javascript:pagingFormSubmitqna(${navi2.currentPage + 1})">▶</a>
		&nbsp;&nbsp; <a
			href="javascript:pagingFormSubmitqna(${navi2.currentPage + navi2.pagePerGroup})">▷▷</a>

		<!-- /페이지 이동 끝 -->
		<br><br>
		<form id="qnapagingForm" method="get" action="servicecenter">
			<input type="hidden" name="qnapage" id="pageqna" />
		</form>
	</div>

	<!--------------------------------------------------------------------------------------------------------------->

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
		<c:forEach items="${reviewpaging}" var="re">
			<tr>
				<td>${re.num}</td>
				<td><a href="reviews?num=${re.num}">${re.title}</a></td>
				<td>${re.review_date}</td>
			</tr>
		</c:forEach>
	</table>
	<div id="navigator">
	<!-- 페이지 이동 부분 -->                      
	<a href="javascript:pagingFormSubmitreview(${navi0.currentPage - navi0.pagePerGroup})">◁◁ </a> &nbsp;&nbsp;
	<a href="javascript:pagingFormSubmitreview(${navi0.currentPage - 1})">◀</a> &nbsp;&nbsp;

	<c:forEach var="counter" begin="${navi0.startPageGroup}" end="${navi0.endPageGroup}"> 
		<c:if test="${counter == navi0.currentPage}"><b></c:if>
			<a href="javascript:pagingFormSubmitreview(${counter})">${counter}</a>&nbsp;
		<c:if test="${counter == navi0.currentPage}"></b></c:if>
	</c:forEach>
	&nbsp;&nbsp;
	<a href="javascript:pagingFormSubmitreview(${navi0.currentPage + 1})">▶</a> &nbsp;&nbsp;
	<a href="javascript:pagingFormSubmitreview(${navi0.currentPage + navi.pagePerGroup})">▷▷</a>

<!-- /페이지 이동 끝 -->                      

<br><br>
		<form id="pagingForm" method="get" action="servicecenter">
			<input type="hidden" name="page" id="page" />
		</form>
	</div>

	<c:if test="${userId != null}">
		<a href="writereviews">수강후기 작성</a>
	</c:if> 
</body>
</html>