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

input.upload {
    position: absolute;
    top: 0;
    right: 0;
    margin: 0;
    padding: 0;
    font-size: 12px;
    cursor: pointer;
    opacity: 1;
    filter: alpha(opacity=1);    
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
    function tocheckpw() {
        var pw = document.getElementById("userPassword").value;
        var pwck = document.getElementById("userPassword2").value;
 
        if (pw != pwck) {
            alert('비밀번호가 틀렸습니다. 다시 입력해 주세요');
            return false;
        }
    }
</script>
<script type="text/javascript">

var msg = '${errorMsg}';//가입실패라는 문자가 들어가 있음//서버에서 내용을 안보낸다면 null
if(msg.length>0){
alert(msg);//가입 서버에 갔다 왔는지 아닌지를 구분해 줄 수 있다. 
}

//가입폼 환인
function formCheck() {
	
	//전화번호와 주소는 입력을 안할 수 도 있기 때문에 체크 해 줄 필요가 없다 
	var custid = document.getElementById('userId');
	var password = document.getElementById('userPassword');
	var password2 = document.getElementById('userPassword2');
	var name = document.getElementById('userName');
	var phone = document.getElementById('userPhone');
	var email = document.getElementById('userEmail');
	
	
	if(custid.value ==''){
		alert("아이디를 입력하세요.");
		id.focus();
		return false;
	}
	if(custid.value.length<3||custid.value.length>10){
		alert("아이디 3~10글자 사이로 입력해 주세요.");
		custid.value='';
		custid.focuse();
		return false;
	}
	if(password.value ==''){
		alert("비밀번호를 입력해 주세요");
		password.focus();
		return;
	}
	if(password.value.length<3||password.value.length>10){
		alert("비밀번호는 3~10글자 사이로 입력해 주세요..");
		password.value='';
		pw.focus();
		return false;
	}
	if(password2.value !=password.value){
		alert("동일한 비밀번호를 입력해 주세요");
		password2.value='';
		password2.focus();
		return false;
	}
	if(name.value ==''){
		alert("이름을 입력해 주세요");
		name.focus();
		return false;
	}
	
	return true;
	}
	
function idCheckOpen() {
	window.open("idCheck","idCheckWin","top=200, left=400, width=400, height=250"); 
}

</script>

<script>
$(function(){
 
    $("#userPhone").on('keydown', function(e){
       // 숫자만 입력받기
        var trans_num = $(this).val().replace(/-/gi,'');
	var k = e.keyCode;
				
	if(trans_num.length >= 11 && ((k >= 48 && k <=126) || (k >= 12592 && k <= 12687 || k==32 || k==229 || (k>=45032 && k<=55203)) ))
	{
  	    e.preventDefault();
	}
    }).on('blur', function(){ // 포커스를 잃었을때 실행합니다.
        if($(this).val() == '') return;
 
        // 기존 번호에서 - 를 삭제합니다.
        var trans_num = $(this).val().replace(/-/gi,'');
      
        // 입력값이 있을때만 실행합니다.
        if(trans_num != null && trans_num != '')
        {
            // 총 핸드폰 자리수는 11글자이거나, 10자여야 합니다.
            if(trans_num.length==11 || trans_num.length==10) 
            {   
                // 유효성 체크
                var regExp_ctn = /^(01[016789]{1}|02|0[3-9]{1}[0-9]{1})([0-9]{3,4})([0-9]{4})$/;
                if(regExp_ctn.test(trans_num))
                {
                    // 유효성 체크에 성공하면 하이픈을 넣고 값을 바꿔줍니다.
                    trans_num = trans_num.replace(/^(01[016789]{1}|02|0[3-9]{1}[0-9]{1})-?([0-9]{3,4})-?([0-9]{4})$/, "$1-$2-$3");                  
                    $(this).val(trans_num);
                }
                else
                {
                    alert("유효하지 않은 전화번호 입니다.");
                    $(this).val("");
                    $(this).focus();
                }
            }
            else 
            {
                alert("유효하지 않은 전화번호 입니다.");
                $(this).val("");
                $(this).focus();
            }
      }
  });  
});
</script>
	<title>join</title>
</head>
<body>
<div class="container">
	<div class="row">
    <div class="col-md-8">
        <h1 class="entry-title"><span>회원가입</span> </h1>
        <hr>
            <form action="join" class="form-horizontal" method="post" onsubmit="return tocheckpw()" data-ajax="false" name="join" id="signup" enctype="multipart/form-data" >        
         <div class="form-group">
          <label class="control-label col-sm-3">아이디<span class="text-danger">*</span></label>
          <div class="col-md-8 col-sm-9">
            <input type="text" class="form-control" name="userId" id="userId" placeholder="아이디를 입력하세요" onclick="idCheckOpen()">
          </div>
        </div>
        
        
        <div class="form-group">
          <label class="control-label col-sm-3">비밀번호 <span class="text-danger">*</span></label>
          <div class="col-md-5 col-sm-8">
            <div class="input-group">
              <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
              <input type="password" class="form-control" name="userPassword" id="userPassword" placeholder="비밀번호를 입력하세요." value="">
           </div>   
          </div>
        </div>
        <div class="form-group">
          <label class="control-label col-sm-3">비밀번호 확인 <span class="text-danger">*</span></label>
          <div class="col-md-5 col-sm-8">
            <div class="input-group">
              <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
              <input type="password" class="form-control" name="userPassword2" id="userPassword2" placeholder="비밀번호를 확인해 주세요." value="">
            </div>  
          </div>
        </div>
        <div class="form-group">
          <label class="control-label col-sm-3">이메일 <span class="text-danger">*</span></label>
          <div class="col-md-8 col-sm-9">
              <div class="input-group">
              <span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span>
              <input type="email" class="form-control" name="userEmail" id="userEmail" placeholder="이메일을 입력하세요." value="">
            </div>
            <small> 귀하의 이메일은 계정 승인 및 복구 보안을 위해 사용됩니다. </small> </div>
        </div>
        
        
        <div class="form-group">
          <label class="control-label col-sm-3">이름 <span class="text-danger">*</span></label>
          <div class="col-md-8 col-sm-9">
            <input type="text" class="form-control" name="userName" id="userName" placeholder="이름을 입력하세요.">
          </div>
        </div>
        
     
        <div class="form-group">
          <label class="control-label col-sm-3">휴대폰 번호 <span class="text-danger">*</span></label>
          <div class="col-md-5 col-sm-8">
          	<div class="input-group">
              <span class="input-group-addon"><i class="glyphicon glyphicon-phone"></i></span>
            <input type="text" class="form-control"  name="userPhone" id="userPhone" placeholder="휴대폰 번호를 입력하세요." value="">
            </div>
          </div>
        </div>
        
        <div class="form-group">
          <label class="control-label col-sm-3">생년월일 <span class="text-danger">*</span></label>
          <div class="col-xs-8">
            <div class="form-inline">
	             <div class="form-group" >
                <select name="yyyy" class="form-control">
                  <option value="0">년</option>
                  <option value="1955" >1955 </option><option value="1956" >1956 </option><option value="1957" >1957 </option><option value="1958" >1958 </option><option value="1959" >1959 </option><option value="1960" >1960 </option><option value="1961" >1961 </option><option value="1962" >1962 </option><option value="1963" >1963 </option><option value="1964" >1964 </option><option value="1965" >1965 </option><option value="1966" >1966 </option><option value="1967" >1967 </option><option value="1968" >1968 </option><option value="1969" >1969 </option><option value="1970" >1970 </option><option value="1971" >1971 </option><option value="1972" >1972 </option><option value="1973" >1973 </option><option value="1974" >1974 </option><option value="1975" >1975 </option><option value="1976" >1976 </option><option value="1977" >1977 </option><option value="1978" >1978 </option><option value="1979" >1979 </option><option value="1980" >1980 </option><option value="1981" >1981 </option><option value="1982" >1982 </option><option value="1983" >1983 </option><option value="1984" >1984 </option><option value="1985" >1985 </option><option value="1986" >1986 </option><option value="1987" >1987 </option><option value="1988" >1988 </option><option value="1989" >1989 </option><option value="1990" >1990 </option><option value="1991" >1991 </option><option value="1992" >1992 </option><option value="1993" >1993 </option><option value="1994" >1994 </option><option value="1995" >1995 </option><option value="1996" >1996 </option><option value="1997" >1997 </option><option value="1998" >1998 </option><option value="1999" >1999 </option><option value="2000" >2000 </option><option value="2001" >2001 </option><option value="2002" >2002 </option><option value="2003" >2003 </option><option value="2004" >2004 </option><option value="2005" >2005 </option><option value="2006" >2006 </option>                </select>
              </div>
              <div class="form-group">
                <select name="mm" class="form-control">
                  <option value="">월</option>
                  <option value="1">1</option><option value="2">2</option><option value="3">3</option><option value="4">4</option><option value="5">5</option><option value="6">6</option><option value="7">7
                  </option><option value="8">8</option><option value="9">9</option><option value="10">10</option><option value="11">11</option><option value="12">12</option>                </select>
              </div>
              <div class="form-group">
                <select name="dd" class="form-control">
                  <option value="">일</option>
                  <option value="1" >1 </option><option value="2" >2 </option><option value="3" >3 </option>
                  <option value="4" >4 </option><option value="5" >5 </option><option value="6" >6 </option>
                  <option value="7" >7 </option><option value="8" >8 </option><option value="9" >9 </option>
                  <option value="10" >10 </option><option value="11" >11 </option>
                  <option value="12" >12 </option><option value="13" >13 </option>
                  <option value="14" >14 </option><option value="15" >15 </option>
                  <option value="16" >16 </option><option value="17" >17 </option>
                  <option value="18" >18 </option><option value="19" >19 </option>
                  <option value="20" >20 </option><option value="21" >21 </option>
                  <option value="22" >22 </option><option value="23" >23 </option>
                  <option value="24" >24 </option><option value="25" >25 </option>
                  <option value="26" >26 </option><option value="27" >27 </option>
                  <option value="28" >28 </option><option value="29" >29 </option>
                  <option value="30" >30 </option><option value="31" >31 </option>                
                  </select>
              </div>
            </div>
          </div>
        </div>
      
        
        <div class="form-group">
          <div class="col-xs-offset-3 col-md-8 col-sm-9"><span class="text-muted"><span class="label label-danger">Note:-</span> By clicking Sign Up, you agree to our <a href="#">Terms</a> and that you have read our <a href="#">Policy</a>, including our <a href="#">Cookie Use</a>.</span> </div>
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