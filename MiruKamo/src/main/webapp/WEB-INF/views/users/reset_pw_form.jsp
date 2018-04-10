<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>     
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Change password</title>
<script type="text/javascript">
function formCheck(){
	var pw = document.getElementById('password');
	var pw2 = document.getElementById('pasword2');
	
	if(pw.value.length < 3 || pw.value.length > 10){
		alert('비밀번호는 3자 이상 입력하세요');
		pw.focus();
		pw.select();
		return false;
	}
	if(pw.value != pw2.value){
		alert('비밀번호가 일치하지 않습니다.');
		pw.focus();
		pw.select();
		return false;
	}
</script>
</head>
<body>
<form method="post" action="reset_pw" onsubmit="return formCheck()">
<table>
<tr>
<th>password</th>
<td><input type="password" id="password1" name="password"></td>
</tr>
<tr>
<th>password check</th>
<td><input type="password" id="password2"></td>
</tr>
<input type="submit" value="reset">
<input type="reset" value="rewrite">
</table>
</form>
</body>
</html>