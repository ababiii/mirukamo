<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<html>
<head>
	<title>join</title>
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

<button>로그인 페이지</button>
</body>
</html>
