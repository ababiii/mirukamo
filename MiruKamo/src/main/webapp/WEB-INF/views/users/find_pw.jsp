<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>     
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>find_pw</title>
</head>
<body>
<form action="reset_pw_form" method="POST">
아이디: <input type = "text" name = "id"><br>
이메일 주소: <input type = "email" name = "email"><br>
이름: <input type = "text" name = "name"><br>
	<input type = "submit" value ="비밀번호 조회"><br>
	<input type = "submit" value = "아이디 찾기"><input type = "submit" value = "로그인페이지">
</form>
</body>
</html>