<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<html>

<head>
<script src="../resources/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
 	 function registerCheckFunction() {
		var userId = $('#userId').val();
		alert('아이디 중복확인');
		$.ajax({
			type:'POST',
			url:'./userRegisterCheck',
			data: {userId:userId},
			success: function(result){
				if(result==1){
					$('#checkMessage').html('사용할 수 있는 아이디입니다.');
				}else{
					$('#checkMessage').html('사용할 수 없는 아이디입니다.');
				}
			}
		})
	}
 	 function registerEmailCheckFunction() {
 		var userEmail = $('#userEmail').val();
 		var userEmail2 = $('#userEmail2').val();
 		alert('이메일 중복확인');
 		$.ajax({
 			type:'POST',
 			url:'./userRegisterEmailCheck',
 			data: {userEmail:userEmail,userEmail2:userEmail2},
 			success: function(result){
 				if(result==1){
 					$('#checkEmailMessage').html('사용할 수 있는 이메일입니다.');
 				}else{
 					$('#checkEmailMessage').html('사용할 수 없는 이메일입니다.');
 				}
 			}
 		})
 	} 
 	
 	function passwordCheckFunction() {
		var userPassword = $('#userPassword').val();
		var userPassword2 = $('#userPassword2').val();
		var end = userPassword2.length;
		if(userPassword2!=0){
		if(userPassword!=userPassword2){
			$('#passwordCheckMessage').html('비밀번호가 서로 일치하지 않습니다.');
			
		}else{
			$('#passwordCheckMessage').html('');
		}
		}
	}
 	
 
 </script>

<style type="text/css">

body {
    background: #fff;
	font-family: 'Roboto', sans-serif;
	color:#333;
	line-height: 22px;	
}
h1, h2, h3, h4, h5, h6 {
	font-family: 'Roboto Condensed', sans-serif;
	font-weight: 400;
	color:#111;
	margin-top:5px;
	margin-bottom:5px;
}
h1, h2, h3 {
	text-transform:uppercase;
}

.form-inline .form-group{
    margin-left: 0;
    margin-right: 0;
}
.control-label {
    color:#333333;
}
</style>
<meta name="viewport" content="width=device-width, initial-scale="1">
<link rel="stylesheet" href="../resources/css/bootstrap.css" >
<link rel="stylesheet" href="../resources/css/bootstrap-theme.css" >
<script src="../resources/js/bootstrap.min.js"></script>
<script type="text/javascript">
</script>

	<title>회원가입</title>
</head>
<body id="joinBody">
<div class="container">
	<div class="row">
    <div class="col-md-8">
    	<a href="../">홈으로</a>
        <h1 class="entry-title"><span>회원가입</span> </h1>
        <hr>
            <form action="join" class="form-horizontal" method="post" onSubmit="return formValidation();" data-ajax="false" name="join" id="signup" enctype="multipart/form-data" >        
         <div class="form-group">
          <label class="control-label col-sm-3">아이디<span class="text-danger">*</span></label>
          <div class="col-md-8 col-sm-9">
            <input type="text" class="form-control" name="id" id="userId" placeholder="아이디를 입력하세요">
            <div id="checkMessage"></div>
            <button class="btn btn-primary" onclick="registerCheckFunction();" type="button">중복체크</button>
          </div>
        </div>
        
        
        <div class="form-group">
          <label class="control-label col-sm-3">비밀번호 <span class="text-danger">*</span></label>
          <div class="col-md-5 col-sm-8">
            <div class="input-group">
              <input type="password" class="form-control" name="password" id="userPassword" onkeyup="passwordCheckFunction();" placeholder="비밀번호를 입력하세요." value="">
           	  <h5 style="color: red; " id="passwordCheckMessage"></h5>
           </div>   
          </div>
        </div>
        <div class="form-group">
          <label class="control-label col-sm-3">비밀번호 확인 <span class="text-danger">*</span></label>
          <div class="col-md-5 col-sm-8">
            <div class="input-group">
              <input type="password" class="form-control" name="password2" id="userPassword2" onkeyup="passwordCheckFunction();" placeholder="비밀번호를 확인해 주세요." value="">
              <h5 style="color: red; " id="passwordCheckMessage"></h5>
            </div>  
          </div>
        </div>
        <div class="form-group">
          <label class="control-label col-sm-3">이메일 <span class="text-danger">*</span></label>
          <div class="col-md-5 col-sm-8">
              <div class="input-group">
              <input type="text" class="form-control" name="email" id="userEmail">@<input type="text" class="form-control" name="email2" id="userEmail2"  value="" >
             <div id="checkEmailMessage"></div>
             <button class="btn btn-primary" onclick="registerEmailCheckFunction();" type="button">중복체크</button>
            </div>
            <small> 귀하의 이메일은 계정 승인 및 복구 보안을 위해 사용됩니다. </small> </div>
        </div>
        
        
        <div class="form-group">
          <label class="control-label col-sm-3">이름 <span class="text-danger">*</span></label>
          <div class="col-md-8 col-sm-9">
            <input type="text" class="form-control" name="name" id="userName" placeholder="이름을 입력하세요.">
          </div>
        </div>
        
     
        <div class="form-group">
          <label class="control-label col-sm-3">휴대폰 번호 <span class="text-danger">*</span></label>
          <div class="col-md-5 col-sm-8">
          	<div class="input-group">
            <input type="text" class="form-control"  name="phone" id="userPhone" placeholder="휴대폰 번호를 입력하세요." value="">
            </div>
          </div>
        </div>
       
        <div class="form-group">
          <label class="control-label col-sm-3">생년월일 <span class="text-danger">*</span></label>
          <div class="col-md-8 col-sm-9">
            <input type="text" class="form-control" name="birth" id="userBirthday" placeholder="생년월일을 입력하세요.">
          </div>
        </div>
        <div class="form-group">
          <div class="col-xs-offset-3 col-xs-10">
          <button name="Submit" type="submit" value="회원가입" class="btn btn-primary" onclick="formCheck()"></button>
          </div>
        </div>
      </form>
    </div>
</div>
</div>
</body>
</html>
