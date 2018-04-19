<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
 
<html>
<head>
	<title>회원가입 성공 페이지</title>
	<style>
	div{
	text-align : center;
	margin-top : 10%;
	margin-bottom : 20%
	}
	</style>
</head>
<body>
<a href="../"><img src="../resources/images/loverdug.jpg" height="100px" width="100px"></a>
<div>
<h1>회원 가입 완료</h1>
환영합니다 ${id}님.<br>
회원가입 하신 계정으로 로그인 해주세요. 
</div>

<a href="../login/login">로그인 페이지로 가기</a>
</body>
</html>
