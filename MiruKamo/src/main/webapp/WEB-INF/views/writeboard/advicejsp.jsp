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
/* 	function writeadvice() {
	}
 */
	function checktext() {
		var title = document.getElementById('title');
		var content = document.getElementById('content');
		if (title.value == "" || title.value == null) {
			alert("제목을 입력해주세요.");
			title.focus();
			return false;
		}
		if (content.value == "" || content.value == null) {
			alert("내용을 입력해주세요.");
			return false;
		}
	}
</script>
</head>
<body>
	<form action="./writeadvice" method="POST" onsubmit="return checktext()">
		<table border="3">
			<tr>
				<td colspan="2">1대1 문의 글 작성</td>
			</tr>
			<tr>
				<th>아이디</th>
				<th><input type="text" name="member_id" id="member_id"
					readonly="readonly" value="${userId}" ></th>
			</tr>
			<tr>
				<th>제목</th>
				<th><input type="text" name="title" id="title"></th>
			</tr>
			<tr>
				<th>문의 사항 분류</th>

				<th>
				<!--  <input type="text" id="category" value="동영상 재생" readonly="readonly"> -->
				</th>
			</tr>
			<tr>
				<th colspan="2"><input type="text" name="content" id="content">
				</th>
			</tr>
		</table>
		<a href="servicecenter">뒤로가기</a> 
		<input type="submit" value="작성">
		<input type="reset" value="다시쓰기">
	</form>
</body>
</html>