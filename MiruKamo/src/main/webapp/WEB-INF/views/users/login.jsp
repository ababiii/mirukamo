<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>     
<!DOCTYPE html>
<html>
<head>
<script src="../resources/jQuery/jquery-3.2.1.min.js"></script>
<script>
$(document).ready(function(){
	var check=${fromDrill};

	if(check){
		alert('로그인 후 이용해 주세요.');
	}
	
});
 	/*  function registerCheckFunction() {
		var userId = $('#userId').val();
		$.ajax({
			type:'POST',
			url:'./userRegisterCheck',
			data: {userId:userId},
			success: function(result){
				if(result==0){
					$('#checkMessage').html('사용할 수 있는 아이디입니다.');
					$('#checkType').attr('class','modal-content panel-success');
				}else{
					$('#checkMessage').html('사용할 수 없는 아이디입니다.');
					$('#checkType').attr('class','modal-content panel-warning');
				}
				$('#checkModal').modal("show");
			}
		})
	} 
 	
 	function passwordCheckFunction() {
		var userPassword1 = $('#userPassword1').val();
		var userPassword2 = $('#userPassword2').val();
		if(userPassword1!=userPassword2){
			$('#passwordCheckMessage').html('비밀번호가 서로 일치하지 않습니다.');
			
		}else{
			$('#passwordCheckMessage').html('');
		}
	}  */
 </script>

	<title>로그인</title>
</head>
<body>
<a href="../"><img src="../resources/images/loverdug.jpg" height="100px" width="100px"></a>
<div><span style="font: red;">${erorrMsg }</span></div>
<form action="login" method="post">
	<input type="text" placeholder="id" name="id" id="id" value="${setId }"><br>
	<input type="password" placeholder="password" name="password" id="password"><br>
	${errorMsg}<br>
	<input type="submit">
	<a href="../findMyID">아이디 찾기</a>
</form>
</body>
</html>
