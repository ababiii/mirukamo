<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ID 찾기</title>
<script src="resources/jQuery/jquery-3.2.1.min.js"></script>
<script>
$(document).ready(function(){
	/* $('#findID_Bt').on('click',function(){
		$('findID_form').submit();
	}); */
	
	$('#loginPage_Bt').on('click',function(){
		location.href='./login/login';
	});
	
	$('#pwPage_Bt').on('click',function(){
		location.href='./login/find_pw';
	});
	
	
	$('#findID_Bt').on('click',function(){
		var email=$('#email').val();
		var email2=$('#email2').val();
		var name=$('#name').val();
		
		$.ajax({
			url : 'findMyID',
			type : 'post',
			data : {email : email , email2 : email2, name : name},
			dataType : 'text',
			success : function(str){
				alert(str);
				
			},
			error : function(e){
				alert('오류가 발생했습니다.');
			}
		});
	});
});

</script>
</head>
<body>
<a href="./"><img src="./resources/images/loverdug.jpg" height="100px" width="100px"></a>

<div>
<form action="findMyID" method="post" id="findID_form">
Email <input type="text" name="email" id="email">@<input type="text" name="email2" id="email2">
<br>
이름 <input type="text" name="name" id="name">
</form>
</div>

<button type="button" name="findID_Bt" id="findID_Bt">ID 조회</button>
<p>
<button type="button" name="pwPage_Bt" id="pwPage_Bt">비밀번호 찾기</button>
<button type="button" name="loginPage_Bt" id="loginPage_Bt">로그인</button>
</p>
</body>
</html>