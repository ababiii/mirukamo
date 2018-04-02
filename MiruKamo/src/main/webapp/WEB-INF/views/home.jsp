<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<html>
<head>
<style type="text/css">
body {
    background-color: coral;
}
/* The side navigation menu */
.sidenav {
    height: 100%; /* 100% Full-height */
    width: 0; /* 0 width - change this with JavaScript */
    position: fixed; /* Stay in place */
    z-index: 1; /* Stay on top */
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
	<title>Home</title>
</head>
<body>


<div id="mySidenav" class="sidenav">
  <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
  <a href="join/join">회원가입</a>
  <a href="login/login">로그인</a>
<<<<<<< HEAD
  <a href="login/logout">로그아웃11</a>
  <a href="myPage/myPage">마이페이지11112</a>
=======
  <a href="login/logout">로그아웃2222</a>
  <a href="myPage/myPage">마이페이지</a>
   <a href="myPage/myPage">수정</a>
>>>>>>> branch 'master' of https://github.com/ababiii/mirukamo.git
</div>

<!-- Use any element to open the sidenav -->
<span onclick="openNav()">open</span>

<!-- Add all page content inside this div if you want the side nav to push page content to the right (not used if you only want the sidenav to sit on top of the page -->
<div id="main">
 <div>

${sessionScope.userId}
${sessionScope.userName}

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
c.parentNode.insertBefore(cp, c); })(); </script><noscript><span>New Gallery 2018/4/2</span><span>bitrate</span><span> 637 kb/s</span><span>height</span><span> 720</span><span>duration</span><span> 00:16:10.27</span><span>fps</span><span> 29.97</span><span>width</span><span> 1280</span><span>originaldate</span><span> 2017-07-01T17:08:19.000000Z</span><span>bitrate</span><span> 400 kb/s</span><span>height</span><span> 360</span><span>duration</span><span> 00:39:59.04</span><span>fps</span><span> 30</span><span>width</span><span> 640</span><span>originaldate</span><span> 2014-11-21T19:13:23.000000Z</span></noscript>
</body>
</html>
