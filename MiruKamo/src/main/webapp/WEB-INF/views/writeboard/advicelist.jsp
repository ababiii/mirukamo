<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<script type="text/javascript">

</script>
</head>
<body>
<c:if test="${list != null}">
<table>
<tr>
<td>번호</td>
<td>제목</td>
<td>작성자</td>
<td>날짜</td>
<td>답변완료</td>
</tr>
<c:forEach items="${list}" var="a">
<tr>
<td>${a.num}</td>
<td>
<a href="replyadvice?num=${a.num}"> 
${a.title}
</a>
</td>
<td>${a.member_id}</td>
<td>${a.question_date}</td>
<td>
<c:if test="${a.answer == 0}">
X
</c:if>
<c:if test="${a.answer != 0}">
O
</c:if>
</td>
</tr>
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

</c:if>
</body>
</html>