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
<c:if test="${copy != null}">
<form action="replyadvice" method="post">
<table>
<tr>
<td>번호</td>
<td>${copy.num}
<input type="hidden" name="q_num" value="${copy.num}">
</td>
</tr>
<tr>
<td>제목</td>
<td>${copy.title}</td>
</tr>
<tr>
<td>작성자</td>
<td>${copy.member_id}</td>
</tr>
<tr>

<td>날짜</td>
<td>${copy.question_date}</td>
</tr>
<tr>
<td colspan="2" rowspan="2">
<textarea rows="10" cols="10" name="content ">


========================================
${copy.content}
</textarea>

</td>
</tr>

</table>
</form>
</c:if>
</body>
</html>