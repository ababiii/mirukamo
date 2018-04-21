<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>MyUpdate</title>
<script src="resources/jQuery/jquery-3.2.1.min.js"></script>
<script>
$(document).ready(function(){
	var updateResult=${result};
	if(updateResult==true){
		alert('업데이트가 완료되었습니다.');
	}
	
});

function formCheck(){
	
	var password=$('#password').val();
	var password2=$('#password2').val();
	if(password!=password2){
		alert('비밀번호를 확인해주세요.');
		$('#password2').focus();
		return false;
	}
	
	return true;
	
}
</script>
</head>
<body>

<a href="./"><img src="./resources/images/loverdug.jpg" height="100px" width="100px"></a>

<h1>My Page</h1>

<form method="post" onsubmit="return formCheck()" action="myUpdate">
<table>
<tr>
	<th>
		이름
	</th>
	<td><input type="text" id="name" name="name" value="${info.name}" readonly="readonly"></td>
</tr>
<tr>
	<th>아이디
	</th>
	<td><input type="text" id="id" name="id" value="${info.id }" readonly="readonly">
	</td>
</tr>
<tr>
	<th>비밀번호
	</th>
	<td><input type="password" id="password" name="password" value="${info.password}">
	</td>
</tr>
<tr>
	<th>비밀번호 확인
	</th>
	<td><input type="password" id="password2" name="password2" value="${info.password}">
	</td>
</tr>
<tr>
	<th>email
	</th>
	<td><input type="text" id="email" name="email" value="${info.email}@${info.email2}" readonly="readonly">
	</td>
</tr>
<tr>
	<th>전화번호
	</th>
	<td><input type="text" id="phone" name="phone" value="${info.phone}">
	</td>
</tr>
<tr>
	<th>생일
	</th>
	<td><input type="date" id="birth" name="birth" value="${info.birth }">
	</td>
</tr>


</table>

<input type="submit" value="update">
</form>

</body>
</html>