<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입 약관</title>
<script src="resources/jQuery/jquery-3.2.1.min.js"></script>
<script>
$(document).ready(function(){
	var error='${error}';

	if(error!=''){
	alert('필수 약관에 모두 동의하셔야 다음으로 넘어갈 수 있습니다.');
	}
}); 
</script>
<style>
.appointmentBox{
	border-style: solid;
	border-width: 1;
	width : 900px;
	height : 220px;
	margin : auto;
	padding : 10px;
}

.appointmentTable {
	height : 100px;
	border-style : solid;
	border-width : 1;
}
</style>
</head>
<body>
<a href="./"><img src="./resources/images/loverdug.jpg" height="100px" width="100px"></a>
<h1 align="center">이용약관 동의</h1>

<div class="appointmentBox">
개인정보 수집/이용 동의
<table class="appointmentTable">
	<tr>
		<th>수집 및 이용하는 개인정보 항목</th>
		<th>수집 및 이용 목적</th>
		<th>보유 및 이용기간</th>
	</tr>
	<tr>
		<th>이름,아이디,비밀번호,이메일,핸드전화 번호,생년월일</th>
		<th>가입 신청 및 수강 신청</th>
		<th>3년</th>
	</tr>
</table>
위 동의 안내에 거부할 권리가 있습니다.
그러나 동의 거부할 경우 실명 확인이 되지 않음에 따라 가입 신청 및 수강 신청을 하실 수 없습니다.
<p>
<form action="./join/joinForm" method="post" >
<input type="hidden" value="true" name="fromAppointment">
<div>개인정보 수집/이용 동의(필수)<input type="checkbox" name="ok1"></div>
</p>
</div>
<br><br><br>
<div class="appointmentBox">
개인정보 제3자 제공
<table class="appointmentTable">
	<tr>
		<th>제공받는 자</th>
		<th>제공받는 자의 이용 목적</th>
		<th>제공하는 개인정보 항목</th>
		<th>보유 및 이용기간</th>
	</tr>
	<tr>
		<th>한국무역협회 아카데미</th>
		<th>Smart Cloud IT Master 과정 교육생 교육</th>
		<th>이름,아이디,비밀번호,생년월일,이메일,휴대전화번호</th>
		<th>회원탈퇴 시까지</th>
	</tr>
</table>
위 동의 안내에 거부할 권리가 있습니다.
그러나 동의 거부할 경우 실명 확인이 되지 않음에 따라 가입 신청 및 수강 신청을 하실 수 없습니다.
<p>
<div>개인정보의 제3자 제공 동의(필수)<input type="checkbox" name="ok2"></div>
</p>
</div>
<br><br><br>

<input type="submit" value="다음">
</form>
</body>
</html>