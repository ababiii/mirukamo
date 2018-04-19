<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>     
<!DOCTYPE html> 
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale="1">
<link href="<c:url value="/css/bootstrap.min.css" />" rel="stylesheet">
<title>아이디 중복검사</title>
<script type="text/javascript">
function formCheck() {
	var searchId = document.getElementById("searchId");
	if(searchId.value.length<3){
		alert("검색할 ID를 3자이상 입력하세요.")
		searchId.focus();
		return false;
	}
	return true;
}

function idSelect(id) {
	opener.document.getElementById("userId").value = id;/* 그냥 찾으면 같은 창 안에서 찾기 때문에 원래 불러준 창에서 찾아줘야 하기 때문에 opener을 사용해 준다 */
	this.close();//회원가입창에 전달이 되면선 중복창이 닫혀야 한다.
}
</script>
</head>
<body>
<!-- 검색폼 -->
<form action="idCheck" method="post" onsubmit="return formCheck()">
	<input type="text" name="searchId" placeholder="검색할 ID입력"><!-- 지금 검색할 id -->
	<input type="submit" value="검색">
</form>
<br>
		<c:if test="${searchId ne null }">
			<c:if test="${Customer ne null }">
		${searchId }: 이미 사용중인 ID입니다.<br>
		
		</c:if>
		<c:if test="${Customer eq null }">
		${searchId }: 사용 가능한 ID입니다.<br>
		<input type="button" value="ID 사용하기" onclick="idSelect('${searchId }')"> 
		</c:if>
		</c:if>
</body>
</html>