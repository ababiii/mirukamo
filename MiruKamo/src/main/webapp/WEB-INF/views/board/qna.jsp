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
	<table border="3">
		<tr>
			<td colspan="2">자주 묻는 질문</td>
		</tr>
		<c:forEach items="${qna}" var="a">
			<tr>
				<td>제목</td>
				<td>${a.title}</td>
			</tr>
			<tr>
				<td>작성날짜</td>
				<td>${a.question_date}</td>
			</tr>
			<tr>
				<td colspan="2">${a.content}</td>
			</tr>
		</c:forEach>
	</table>
	<a href="servicecenter">뒤로가기</a>
	<c:if test="${admin} != null">
		<a href="writenotice">자주 묻는 글 작성</a>
	</c:if>
</body>
</html>