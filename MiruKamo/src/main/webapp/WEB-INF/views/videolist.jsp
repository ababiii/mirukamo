
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>list</title>
</head>
<body>



		<table>
			<tr>
				<td>번호</td>
				<td>제목</td>
				<td>선생님</td>
				<td>언어</td>
				<td>파일명</td>
				<td>썸네일</td>
			</tr>
			<c:if test="${list == null || list == '' }">
				<tr>
					<td colspan="5">nothing</td>
				</tr>
			</c:if>
			<c:if test="${list != null || list != '' }">
				<c:forEach items="${list}" var="a">
	<form action="videolist" method="POST">
					<input type="hidden" name="name" value="${a.file_name}">
						<tr><td>${a.num}</td>
						<td>${a.title}</td>
						<td>${a.teacher}</td>
						<td>${a.languages}</td>
						<td>${a.file_name}</td>
						<td>${a.thumnail}</td>
					</tr>
					<tr>
					<td><input type="submit" value="선택"></td></tr>
	</form>
				</c:forEach>
			</c:if>
		</table>







</body>

</html>