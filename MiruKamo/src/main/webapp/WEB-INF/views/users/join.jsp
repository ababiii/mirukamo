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

</script>



<script type="text/javascript">
function formValidation()
{
var userId = document.getElementById('userId');
var userPassword = document.getElementById('userPassword');
var userPassword2 = document.getElementById('userPassword2');
var userEmail = document.getElementById('userEmail');
var userEmail2 = document.getElementById('userEmail2');
var yyyy = document.getElementById('yyyy');
var yyyy = document.getElementById('yyyy');
var mm = document.getElementById('mm');
var dd = document.getElementById('dd');
var userBirthday = yyyy.concat(" ", mm," ", dd, " ");
document.join.userBirthday.value = userBirthday;
if(userid_validation(userId,5,12))
{
if(passid_validation(passid,7,12))
{
if(allLetter(uname))
{
if(alphanumeric(uadd))
{ 
if(countryselect(ucountry))
{
if(allnumeric(uzip))
{
if(ValidateEmail(uemail))
{
if(validsex(umsex,ufsex))
{
}
} 
}
} 
}
}
}
}
return false;

} function userid_validation(userId,mx,my)
{
var uid_len = userId.value.length;
if (uid_len == 0 || uid_len >= my || uid_len < mx)
{
alert("User Id should not be empty / length be between "+mx+" to "+my);
uid.focus();
return false;
}
return true;
}
function passid_validation(passid,mx,my)
{
var passid_len = passid.value.length;
if (passid_len == 0 ||passid_len >= my || passid_len < mx)
{
alert("Password should not be empty / length be between "+mx+" to "+my);
passid.focus();
return false;
}
return true;
}
function allLetter(uname)
{ 
var letters = /^[A-Za-z]+$/;
if(uname.value.match(letters))
{
return true;
}
else
{
alert('Username must have alphabet characters only');
uname.focus();
return false;
}
}
function alphanumeric(uadd)
{ 
var letters = /^[0-9a-zA-Z]+$/;
if(uadd.value.match(letters))
{
return true;
}
else
{
alert('User address must have alphanumeric characters only');
uadd.focus();
return false;
}
}
function countryselect(ucountry)
{
if(ucountry.value == "Default")
{
alert('Select your country from the list');
ucountry.focus();
return false;
}
else
{
return true;
}
}
function allnumeric(uzip)
{ 
var numbers = /^[0-9]+$/;
if(uzip.value.match(numbers))
{
return true;
}
else
{
alert('ZIP code must have numeric characters only');
uzip.focus();
return false;
}
}
function ValidateEmail(uemail)
{
var mailformat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
if(uemail.value.match(mailformat))
{
return true;
}
else
{
alert("You have entered an invalid email address!");
uemail.focus();
return false;
}
} function validsex(umsex,ufsex)
{
x=0;

if(umsex.checked) 
{
x++;
} if(ufsex.checked)
{
x++; 
}
if(x==0)
{
alert('Select Male/Female');
umsex.focus();
return false;
}
else
{
alert('Form Succesfully Submitted');
window.location.reload()
return true;
}
}
</script>
	<title>join</title>
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
              <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
              <input type="password" class="form-control" name="password" id="userPassword" placeholder="비밀번호를 입력하세요." value="">
           </div>   
          </div>
        </div>
        <div class="form-group">
          <label class="control-label col-sm-3">비밀번호 확인 <span class="text-danger">*</span></label>
          <div class="col-md-5 col-sm-8">
            <div class="input-group">
              <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
              <input type="password" class="form-control" name="password2" id="userPassword2" placeholder="비밀번호를 확인해 주세요." value="">
            </div>  
          </div>
        </div>
        <div class="form-group">
          <label class="control-label col-sm-3">이메일 <span class="text-danger">*</span></label>
          <div class="col-md-8 col-sm-9">
              <div class="input-group">
              <span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span>
              <input type="text" class="form-control" name="email" id="userEmail" placeholder="이메일을 입력하세요." value="">
              <input type="text" class="form-control" name="email2" id="userEmail2" placeholder="이메일을 입력하세요." value="">
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
              <span class="input-group-addon"><i class="glyphicon glyphicon-phone"></i></span>
            <input type="text" class="form-control"  name="phone" id="userPhone" placeholder="휴대폰 번호를 입력하세요." value="">
            </div>
          </div>
        </div>
        
       <!--  <div class="form-group">
          <label class="control-label col-sm-3">생년월일 <span class="text-danger">*</span></label>
          <div class="col-xs-8">
            <div class="form-inline">
	             <div class="form-group" >
                <select name="yyyy" class="form-control" id="yyyy" >
                  <option value="0">년</option>
                  <option value="1955" >1955 </option><option value="1956" >1956 </option><option value="1957" >1957 </option><option value="1958" >1958 </option><option value="1959" >1959 </option><option value="1960" >1960 </option><option value="1961" >1961 </option><option value="1962" >1962 </option><option value="1963" >1963 </option><option value="1964" >1964 </option><option value="1965" >1965 </option><option value="1966" >1966 </option><option value="1967" >1967 </option><option value="1968" >1968 </option><option value="1969" >1969 </option><option value="1970" >1970 </option><option value="1971" >1971 </option><option value="1972" >1972 </option><option value="1973" >1973 </option><option value="1974" >1974 </option><option value="1975" >1975 </option><option value="1976" >1976 </option><option value="1977" >1977 </option><option value="1978" >1978 </option><option value="1979" >1979 </option><option value="1980" >1980 </option><option value="1981" >1981 </option><option value="1982" >1982 </option><option value="1983" >1983 </option><option value="1984" >1984 </option><option value="1985" >1985 </option><option value="1986" >1986 </option><option value="1987" >1987 </option><option value="1988" >1988 </option><option value="1989" >1989 </option><option value="1990" >1990 </option><option value="1991" >1991 </option><option value="1992" >1992 </option><option value="1993" >1993 </option><option value="1994" >1994 </option><option value="1995" >1995 </option><option value="1996" >1996 </option><option value="1997" >1997 </option><option value="1998" >1998 </option><option value="1999" >1999 </option><option value="2000" >2000 </option><option value="2001" >2001 </option><option value="2002" >2002 </option><option value="2003" >2003 </option><option value="2004" >2004 </option><option value="2005" >2005 </option><option value="2006" >2006 </option>                </select>
              </div>
              <div class="form-group">
                <select name="mm" class="form-control" id="mm">
                  <option value="">월</option>
                  <option value="1">1</option><option value="2">2</option><option value="3">3</option><option value="4">4</option><option value="5">5</option><option value="6">6</option><option value="7">7
                  </option><option value="8">8</option><option value="9">9</option><option value="10">10</option><option value="11">11</option><option value="12">12</option>                </select>
              </div>
              <div class="form-group">
                <select name="dd" class="form-control" id="dd">
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
        </div> -->
       
        <div class="form-group">
          <label class="control-label col-sm-3">생년월일 <span class="text-danger">*</span></label>
          <div class="col-md-8 col-sm-9">
            <input type="text" class="form-control" name="birth" id="userBirthday" placeholder="생년월일을 입력하세요.">
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
        <!-- <input type="hidden" name="userBirthday" value=""> -->
      </form>
    </div>
</div>
</div>


</body>
</html>
