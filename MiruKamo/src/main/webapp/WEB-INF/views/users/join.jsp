<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<html>

<head>
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

var msg = '${errorMsg}';//가입실패라는 문자가 들어가 있음//서버에서 내용을 안보낸다면 null
if(msg.length>0){
alert(msg);//가입 서버에 갔다 왔는지 아닌지를 구분해 줄 수 있다. 
}

function idCheckOpen() {
	window.open("idCheck","idCheckWin","top=200, left=400, width=400, height=250"); 
}

function emailCheckOpen() {
	window.open("emailCheck","emailCheckWin","top=200, left=400, width=400, height=250"); 
}
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
            <input type="text" class="form-control" name="id" id="userId" placeholder="아이디를 입력하세요" onclick="idCheckOpen()">
          </div>
        </div>
        
        
        <div class="form-group">
          <label class="control-label col-sm-3">비밀번호 <span class="text-danger">*</span></label>
          <div class="col-md-5 col-sm-8">
            <div class="input-group">
              <input type="password" class="form-control" name="password" id="userPassword" placeholder="비밀번호를 입력하세요." value="">
           </div>   
          </div>
        </div>
        <div class="form-group">
          <label class="control-label col-sm-3">비밀번호 확인 <span class="text-danger">*</span></label>
          <div class="col-md-5 col-sm-8">
            <div class="input-group">
              <input type="password" class="form-control" name="password2" id="userPassword2" placeholder="비밀번호를 확인해 주세요." value="">
            </div>  
          </div>
        </div>
        <div class="form-group">
          <label class="control-label col-sm-3">이메일 <span class="text-danger">*</span></label>
          <div class="col-md-5 col-sm-8">
              <div class="input-group">
              <input type="text" class="form-control" name="email" id="userEmail"  value="" onclick="emailCheckOpen()" >@<input type="text" class="form-control" name="email2" id="userEmail2"  value="" >
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
            <input name="Submit" type="submit" value="회원가입" class="btn btn-primary" onclick="formCheck()">
          </div>
        </div>
      </form>
    </div>
</div>
</div>


</body>
</html>
