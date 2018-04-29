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
	/*$(document).ready(function(){
	 if (${userId == null}) {
	 $('#videolistlogin').submit();
	 }
	 }); */
	function signclass(msg) {
		$.ajax({
			url : 'signclass',
			type : 'POST',
			dataType : "text",
			data : {
				msg : msg
			},
			success : function(e) {
				if (e == 0) {
					alert("수강 실패");
				}
				else if (e == 1) {
					alert("수강 성공");
					location.reload();
				}
			},
			error : function(e) {
				alert("신청 오류");
			}
		});
	}
</script>
</head>
<body>
	<!-- 비 정상적인 접속시 로그인페이지로 이동 -->
	<div>
		<form action="login/login" method="get" id="videolistlogin">
			<input type="hidden" name="fromvideolist" value="true">
		</form>
	</div>
	<c:if test="${userId == null}">
		로그인 후 수강 신청을 해주세요.
	</c:if>
	<!-- 수강 신청 버튼-->
	<c:if test="${userId != null}">
	${callmebaby.get(0).teacher} 선생님과 함께 기초 실력을 다지세요!
		<c:if test="${good != null }">
			<br> 현재 강의를 수강 중이십니다.</c:if>
		<c:if test="${good == null }">
			<input type="button" onclick="signclass('${callmebaby.get(0).num}')"
				value="수강 신청" id="signid">
			<input type="hidden" name="signid" id="signid" value="${callmebaby}">
		</c:if>
		<table border="1">
			<tr>
				<td>번호</td>
				<td>제목</td>
				<td>선생님</td>
				<td>언어</td>
				<td>파일명</td>
				<td>썸네일</td>
				<td>시청</td>
			</tr>
			<c:if test="${callmebaby != null || callmebaby != ''}">
				<form action="videolist" method="POST">
					<c:forEach items="${callmebaby}" var="a" varStatus="ppap">
						<tr>
							<td>${ppap.count}</td>
							<td>${a.title}</td>
							<td>${a.teacher}</td>
							<td>${a.languages}</td>
							<td>${a.file_name}</td>
							<td>${a.thumnail}</td>
							<td><input type="submit" value="선택"></td>
						</tr>
					</c:forEach>
				</form>
			</c:if>
		</table>
</c:if>

<%-- 
		<!-- 수강 신청 버튼-->
		<c:if test="${userId != null}">
	중급 회화는 나에게!, ${tokyocold.get(0).teacher}선생님과 현지에서 쓰이는 일본 회화를!
		<c:if test="${iamnotkimsujin != null}"> 
				<br> 현재 강의를 수강 중이십니다.</c:if>
			<c:if test="${iamnotparksujin == null}">
				<input type="button" onclick="signclass('${tokyocold.get(0).num}')"
					value="수강 신청" id="signid">
				<input type="hidden" name="signid" id="signid" value="${tokyocold}">
			</c:if>
			<table border="1">
				<tr>
					<td>번호</td>
					<td>제목</td>
					<td>선생님</td>
					<td>언어</td>
					<td>파일명</td>
					<td>썸네일</td>
					<td></td>
				</tr>
				<c:if test="${tokyocold == null || tokyocold == '' }">
					<tr>
						<td colspan="5">nothing</td>
					</tr>
				</c:if>
				<c:if test="${tokyocold != null || tokyocold != '' }">
					<form action="videolist" method="POST">
						<c:forEach items="${tokyocold}" var="b" varStatus="PPAP">
							<input type="hidden" name="name" value="${a.file_name}">
							<tr>
								<td>${PPAP.count}</td>
								<td>${b.title}</td>
								<td>${b.teacher}</td>
								<td>${b.languages}</td>
								<td>${b.file_name}</td>
								<td>${b.thumnail}</td>
								<td><input type="submit" value="선택"></td>
							</tr>
						</c:forEach>
					</form>
				</c:if>
			</table>
		</c:if> --%>
</body>

</html>