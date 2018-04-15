<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>     
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>이메일 중복검사</title>
<script type="text/javascript">

function formCheck() {
	var searchEmail = document.getElementById("searchEmail");
	var searchEmail = document.getElementById("searchEmail2");
	if(searchEmail.value.length==0&&searchEmail2.value.length==0){
		alert("검색할 이메일을 입력해 주세요")
		searchId.focus();
		return false;
	}
	return true;
}

function emailSelect(Email,Email2) {
	opener.document.getElementById("userEmail").value = Email;
	opener.document.getElementById("userEmail2").value = Email2;
	this.close();
}
</script>
</head>
<body>
<!-- 검색폼 -->
<h1>검색할 이메일을 입력해 주세요.</h1>
<form action="emailCheck" method="post" onsubmit="return formCheck()">
	<input type="text" name="searchEmail" id="searchEmail">@<input type="text" name="searchEmail2" id="searchEmail2" >
	<input type="submit" value="검색">
</form>
<br>
		<c:if test="${searchEmail ne null }">
			<c:if test="${searchEmail2 ne null }">
			<c:if test="${Email ne null }">
				<c:if test="${Email2 ne null }">
		${searchEmail }: 이미 사용중인 이메일입니다.<br>
		
		</c:if>
		</c:if>
		<c:if test="${Email eq null }">
			<c:if test="${Email2 eq null }">
		${searchEmail }: 사용 가능한 이메일입니다.<br>
		<input type="button" value="이메일 사용하기" onclick="EmailSelect('${searchEmail }','${searchEmail2 }')"> 
		</c:if>
		</c:if>
		</c:if>
		</c:if>
</body>
</html>