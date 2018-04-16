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
	<form action="writereviews" method="post" >
	<table border="3">
		<tr>
			<td colspan="2">수강후기 글 작성</td>
		</tr>
		<tr>
			<th>아이디</th>
			<th><input type="text" name="customer_id" id="customer_id"
				readonly="readonly" value="${userId}"></th>
		</tr>

		<tr>
			<th>제목</th>
			<th><input type="text" name="title" id="title"></th>
		</tr>
		<tr>
			<th colspan="2">
			<input type="text" name="content" id="content">
			</th>
		</tr>
	</table>
	<a href="servicecenter">뒤로가기</a>
	<input type="submit" value="작성">
	<input type="reset" value="다시쓰기">
</form>
</body>
</html>