<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<html>
<head>
<style type="text/css">
body {
   /*  background-color: coral; */ 
}
/* The side navigation menu */
.sidenav {
    height: 100%; /* 100% Full-height */
    width: 0; /* 0 width - change this with JavaScript */
    position: fixed; /* Stay in place */
    z-index: 100; /* Stay on top */
    top: 0; /* Stay at the top */
    left: 0;
    background-color: #111; /* Black*/
    overflow-x: hidden; /* Disable horizontal scroll */
    padding-top: 60px; /* Place content 60px from the top */
    transition: 0.5s; /* 0.5 second transition effect to slide in the sidenav */
}

/* The navigation menu links */
.sidenav a {
    padding: 8px 8px 8px 32px;
    text-decoration: none;
    font-size: 25px;
    color: #818181;
    display: block;
    transition: 0.3s;
}

/* When you mouse over the navigation links, change their color */
.sidenav a:hover {
    color: #f1f1f1;
}

/* Position and style the close button (top right corner) */
.sidenav .closebtn {
    position: absolute;
    top: 0;
    right: 25px;
    font-size: 36px;
    margin-left: 50px;
}

/* Style page content - use this if you want to push the page content to the right when you open the side navigation */
#main {
    transition: margin-left .5s;
    padding: 20px;
}

/* On smaller screens, where height is less than 450px, change the style of the sidenav (less padding and a smaller font size) */
@media screen and (max-height: 450px) {
    .sidenav {padding-top: 15px;}
    .sidenav a {font-size: 18px;}
}
</style>
	<title>홈 페이지</title>
</head>
<body>
<span onclick="openNav()"><img src="resources/images/menu.png" height="50px" width="50px"></span>
<a href="./"><img src="resources/images/loverdug.jpg" height="100px" width="100px"></a>
<!-- <link href="resources/css/bootstrap.min.css" rel="stylesheet" type="text/css"> -->
<script src="resources/jQuery/jquery-3.2.1.min.js"></script>
<script src="resources/jQuery/jquery-ui.js"></script>

<script src="resources/recognition.js"></script>

<script type="text/javascript">
recstart();
</script>
<script src="resources/audio.js"></script>

<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<style>
    label, input { display:block; }
    input.text { margin-bottom:12px; width:95%; padding: .4em; }
    fieldset { padding:0; border:0; margin-top:25px; }
    h1 { font-size: 1.2em; margin: .6em 0; }
    div#users-contain { width: 350px; margin: 20px 0; }
    div#users-contain table { margin: 1em 0; border-collapse: collapse; width: 100%; }
    div#users-contain table td, div#users-contain table th { border: 1px solid #eee; padding: .6em 10px; text-align: left; }
    .ui-dialog .ui-state-error { padding: .3em; }
    .validateTips { border: 1px solid transparent; padding: 0.3em; }
    .innerPopup {
  	 z-index: 222222;
	}
  </style>
<div id="dialog-form" title="따라해 봅시다" style="z-index: 22222">
 
  <form>
    <fieldset>
      <label for="content">내용</label>
      <input type="text" name="content" id="content" value="こんにちは" readonly="readonly" class="text ui-widget-content ui-corner-all">
      <label for="result">결과</label>
      <input type="text" name="result" id="result" value="" readonly="readonly" class="text ui-widget-content ui-corner-all">


    </fieldset>
  </form>
</div>
 
 

<button id="create-user">시작</button>
 
<script>
$( function() {
    var dialog, form,
 
      // From http://www.whatwg.org/specs/web-apps/current-work/multipage/states-of-the-type-attribute.html#e-mail-state-%28type=email%29
      content = $( "#content" ),
      result = $( "#result" ),
      allFields = $( [] ).add( content ).add( result );
 
   
 
 
 


 
    dialog = $( "#dialog-form" ).dialog({
      dialogClass: "innerPopup" , 
      autoOpen: false,
      height: 330,
      width: 350,
      modal: true,
      buttons: {
    	  "넘어가기": function() {
              $( this ).dialog( "close" );
            }
      },
      close: function() {
    	  audioend();
    	  videostart();
      }
    });
 
   
    $( "#create-user" ).button().on( "click", function() {
    audiostart();
    $( "#result" ).val("");
      dialog.dialog( "open" );
    });
    $( "#result" ).on("change", function() {
    	$( "#dialog-form" ).dialog( "close" );
      });
  } );
</script>

  <form action="http://www.example.com/search">
    <textarea id="txt" style="width: auto; height: auto;">
    </textarea>
    <input type="button" value="Click to Speak" onclick="recognition.start()">
  </form>
            



 <input type="button" value="on" onclick="audiostart()">
    <input type="button" value="off" onclick="audioend()">

<!-- 비 로그인 사용자에게 보이는 메뉴 -->


<c:if test="${sessionScope.adminCheck==null }">
<div id="mySidenav" class="sidenav">
  <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
  <a><h1>Mirukamo</h1></a>
  <a href="appointment">회원가입</a>
  <c:if test="${userId==null }">
  <a href="login/login">로그인</a>
	</c:if>
	<c:if test="${userId!=null }">
  <a href="login/logout">로그아웃</a>
  
  <a href="myPage">마이페이지11112</a>

  
  <a href="myPage/myPage">마이페이지</a>
   <a href="myPage/myPage">수정</a>
   <a href="login/find_pw">비밀번호 찾기</a>
   
   </c:if>
</div>
</c:if>
<!-- admin이 0인 이용자 아이디로 로그인 하면 보이는 메뉴 -->
<c:if test="${sessionScope.adminCheck==0 }">
<div id="mySidenav" class="sidenav">

  <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
  <a><h1>${sessionScope.userId } </h1></a>
  
  <a href="login/logout">로그아웃</a>
  <a href="myPage">마이페이지</a>
   <a href="myPage/mypage">수정</a>
   <a href="login/find_pw">비밀번호 찾기</a>
  <a href="myPage/myPage">마이페이지</a>
   <a href="myPage/myPage">수정</a>
      <a href="servicecenter"> 고객 센터 </a>
      <a href="drill"> 형태소 변환 </a>
   		
</div>
</c:if>

<!-- admin이 1인 운영자 계정으로 로그인 하면 보이는 메뉴 -->
<c:if test="${sessionScope.adminCheck==1 }">
			운영자 계정으로 로그인
	<div id="mySidenav" class="sidenav">
	
			<a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
			<a><h1>운영자</h1></a>
			<a href="login/logout">로그아웃</a> 
			<a href="#">수강영상 업로드</a> 
			<a href="#">1:1 문의 리스트</a> 
			<a href="servicecenter">고객 센터</a>
		</div>

	</c:if>

<!-- Use any element to open the sidenav -->

	
<a href="course/face">얼굴</a>
<a href="course/face2">얼굴2</a>
<a href="course/face3">얼굴3</a>
<a href="course/face4">얼굴4</a>
<a href="course/face5">얼굴5</a>
<a href="course/face6">얼굴6</a>
<a href="course/video">비디오</a>
<a href="course/eye_blink_detect">눈</a>
<input class="btn" type="button" value="wait, loading video" disabled="disabled" onclick="startVideo()" id="startbutton"></input>
<input class="btn" type="button" value="Stop" onclick="stopVideo()" id="startbutton"></input>



<!-- Add all page content inside this div if you want the side nav to push page content to the right (not used if you only want the sidenav to sit on top of the page -->
<div id="main">
 <div>

${sessionScope.userId}
${sessionScope.userName}
${sessionScope.adminCheck}
</div>
</div>
<script>
function openNav() {
    document.getElementById("mySidenav").style.width = "250px";
}

function closeNav() {
    document.getElementById("mySidenav").style.width = "0";
}
</script>



<div id="cp_widget_29a33252-b29d-45e1-87a8-dbe932ba97d8">...</div><script type="text/javascript">
var cpo = []; cpo["_object"] ="cp_widget_29a33252-b29d-45e1-87a8-dbe932ba97d8"; cpo["_fid"] = "AsDAtN-uutay";
var _cpmp = _cpmp || []; _cpmp.push(cpo);
(function() { var cp = document.createElement("script"); cp.type = "text/javascript";
cp.async = true; cp.src = "//www.cincopa.com/media-platform/runtime/libasync.js";
var c = document.getElementsByTagName("script")[0];
c.parentNode.insertBefore(cp, c); })();
console.log(cpo);
</script><noscript><span>New Gallery 2018/4/2</span><span>bitrate</span><span> 637 kb/s</span><span>height</span><span> 720</span><span>duration</span><span> 00:16:10.27</span><span>fps</span><span> 29.97</span><span>width</span><span> 1280</span><span>originaldate</span><span> 2017-07-01T17:08:19.000000Z</span><span>bitrate</span><span> 400 kb/s</span><span>height</span><span> 360</span><span>duration</span><span> 00:39:59.04</span><span>fps</span><span> 30</span><span>width</span><span> 640</span><span>originaldate</span><span> 2014-11-21T19:13:23.000000Z</span></noscript>

</body>
</html>
