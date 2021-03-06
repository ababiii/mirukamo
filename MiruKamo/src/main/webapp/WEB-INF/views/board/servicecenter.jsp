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

	$(document).ready(function() {
		if (!${empty(param.plzlogin)}) {
			location.href="./login";	
				}
	});
	
	/* 페이지 이동 스크립트  */	
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
	<!--  고객센터 게시판-->
	총 게시물 : ${attributeValues}
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

	<c:if test="${userId == 'admin'}">
		<a href="writenotice?category=0">공지 사항 글 작성</a>
	</c:if>


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


	<!--------------------------------------------------------------------------------------------------------------->
	<c:if test="${userId != 'admin'}">
		<c:if test="${userId != null}">
			<input type="button" value="1대1 문의 접수" onclick="location.href ='<c:url value="writeadvice"/>'">
			<input type="button" value="나의 문의 내역" onclick="location.href='<c:url value="myadvicelist"/>'">
		</c:if>
	</c:if>
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
	<c:if test="${userId == 'admin'}">
		<a href="writenotice?category=9">자주 묻는 글 작성</a>
	</c:if>
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
		<br> <br>
		<form id="qnapagingForm" method="get" action="servicecenter">
			<input type="hidden" name="qnapage" id="pageqna" />
		</form>
	</div>
</body>
</html>