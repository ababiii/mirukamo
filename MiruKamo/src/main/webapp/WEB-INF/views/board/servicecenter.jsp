<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	고객센터
	<table border="1">
		<tr>
			<td colspan="3">공지 사항</td>
		</tr>
		<tr>
			<td>제목</td>
			<td>작성 날자</td>
		</tr>

		<c:forEach items="${question}" var="q">
			<c:if test="${q.category == 0}">
				<tr>
					<!-- 공지사항 글 읽기 -->
					<td><a href="adminNotice?num=${q.num}">${q.title}</a></td>
					<td>${q.question_date}</td>
				</tr>
			</c:if>
		</c:forEach>
	</table>
	<c:if test="${admin} != null">
		<a href="writenotice">공지 사항 글 작성</a>
	</c:if>
	<input type="button" value="1대1 문의 접수">
	<input type="button" value="나의 문의 내역">
	<br>
	<br>
	<br>
	<table border="1">
		<tr>
			<td colspan="3">자주 묻는 질문</td>
		</tr>
		<tr>
			<td>제목</td>
			<td>작성 날자</td>
		</tr>
		<c:forEach items="${question}" var="q">
			<c:if test="${q.category == 9}">
				<tr>
					<td><a href="qna?num=${q.num}">${q.title}</a></td>
					<td>${q.question_date}</td>
				</tr>
			</c:if>
		</c:forEach>
	</table>

	<br>

	<table border="1">
		<tr>
			<td colspan="3">수강 후기</td>
		</tr>
		<tr>
			<td>번호</td>
			<td>제목</td>
			<td>작성 날자</td>
	</table>
</body>
</html>