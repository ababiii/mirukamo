<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="../resources/jQuery/jquery-3.2.1.min.js"></script>
<script src="../resources/jQuery/jquery-ui.js"></script>
<script type="text/javascript">
	/* 수강신청 펑션 */
	/* $(document).ready(function(){
	 if (${userId == null}) {
	 $('#videolistlogin').submit();
	 }
	 }); */


	function signclass() {
		var sign = '${list.get(0).teacher}';
		alert(sign);
		/* alert(signid); */
		$.ajax({
			url : 'signclass',
			type : 'POST',
			data : {sign : sign},
			dataType : 'text',
			success : function() {
				alert("수강신청 성공 :");
			},
			error : function(e) {
				alert("신청 실패");
			}
		});
	}
</script>
</head>
<body>
	<!-- 비 정상적인 접속시 로그인페이지로 이동 -->
	<form action="login/login" method="get" id="videolistlogin">
		<input type="hidden" name="fromvideolist" value="true">
	</form>

	<!-- 수강 신청 버튼-->
	<c:if test="${userId != null}">
		<input type="button" onclick="signclass()" value="수강 신청">
		<input type="hidden" name="signid" id="signid" value="${list}">
	</c:if>
	<c:if test="${userId == null}">
		로그인 후 수강 신청을 해주세요.
	</c:if>
	<table border="1">
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
					<tr>
						<td>${a.num}</td>
						<td>${a.title}</td>
						<td>${a.teacher}</td>
						<td>${a.languages}</td>
						<td>${a.file_name}</td>
						<td>${a.thumnail}</td>
					</tr>
					<tr>
						<td><input type="submit" value="선택"></td>
					</tr>
				</form>
			</c:forEach>
		</c:if>
	</table>






</body>

</html>