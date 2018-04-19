<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  
<html>
<head>
	<title>회원가입 성공 페이지</title>
</head>
<body>
<div>
<img src="images/1.jpg">
</div>
<div>
회원 가입 완료
환영합니다. ${sessionScope.userName}님
회원가입 하신 계정으로 로그인 해주세요. 
</div>

<a href="../login/login">로그인 페이지로 가기</a>
</body>
</html>
