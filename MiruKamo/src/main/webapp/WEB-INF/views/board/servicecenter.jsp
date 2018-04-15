<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<head>
<style type="text/css">
body {
	background-color: coral;
}

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
	transition: 0.5s;
	/* 0.5 second transition effect to slide in the sidenav */
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
	.sidenav {
		padding-top: 15px;
	}
	.sidenav a {
		font-size: 18px;
	}
}
</style>
<title>Home</title>
</head>
</head>
<body>
	<script src="resources/recognition.js"></script>

	<script type="text/javascript">
		recstart();
	</script>
	<script src="resources/audio.js"></script>


	<form action="http://www.example.com/search">
		<textarea id="txt" style="width: auto; height: auto;">
    </textarea>
		<input type="button" value="Click to Speak"
			onclick="recognition.start()">
	</form>

	<input type="button" value="on" onclick="audiostart()">
	<input type="button" value="off" onclick="audioend()">

	<div id="mySidenav" class="sidenav">
		<a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
		<a href="join/join">회원가입</a> <a href="login/login">로그인</a> <a
			href="login/logout">로그아웃11</a> <a href="myPage/myPage">마이페이지11112</a>

		<a href="login/logout">로그아웃2222</a> <a href="myPage/myPage">마이페이지</a>
		<a href="myPage/myPage">수정</a> <a href="servicecenter">고객 센터</a>
	</div>

	<!-- Use any element to open the sidenav -->
	<span onclick="openNav()">open</span>

	<!-- Add all page content inside this div if you want the side nav to push page content to the right (not used if you only want the sidenav to sit on top of the page -->
	<div id="main">
		<div>${sessionScope.userId} ${sessionScope.userName}</div>
	</div>
	<script>
		function openNav() {
			document.getElementById("mySidenav").style.width = "250px";
		}

		function closeNav() {
			document.getElementById("mySidenav").style.width = "0";
		}
	</script>

	고객센터
	<table border="1">
		<tr>
			<td colspan="3">공지 사항</td>
		</tr>
		<tr>
			<td>제목</td>
			<td>작성 날자</td>
		</tr>

		<c:forEach items="${question}" var="q">
			<c:if test="${q.category == 0}">
				<tr>
					<!-- 공지사항 글 읽기 -->
					<td><a href="adminNotice?num=${q.num}">${q.title}</a></td>
					<td>${q.question_date}</td>
				</tr>
			</c:if>
		</c:forEach>
	</table>
	<c:if test="${admin} != null">
		<a href="writenotice">공지 사항 글 작성</a>
	</c:if>
	<input type="button" value="1대1 문의 접수" onclick="location.href ='<c:url value="writeboard/advice"/>'">
	<input type="button" value="나의 문의 내역">
	<br>
	<br>
	<br>
	<table border="1">
		<tr>
			<td colspan="3">자주 묻는 질문</td>
		</tr>
		<tr>
			<td>제목</td>
			<td>작성 날자</td>
		</tr>
		<c:forEach items="${question}" var="q">
			<c:if test="${q.category == 9}">
				<tr>
					<td><a href="qna?num=${q.num}">${q.title}</a></td>
					<td>${q.question_date}</td>
				</tr>
			</c:if>
		</c:forEach>
	</table>

	<br>

	<table border="1">
		<tr>
			<td colspan="3">수강 후기</td>
		</tr>
			<tr>
				<td>번호</td>
				<td>제목</td>
				<td>작성 날자</td>
			</tr>
			<c:forEach items="${reviews}" var="re">
			<tr>
				<td>${re.num}</td>
				<td><a href="reviews?num=${re.num}">${re.title}</a></td>
				<td>${re.review_date}</td>
			</tr>
		</c:forEach>
			<c:if test="${userId != null}">
				<a href="writereviews">수강후기 작성</a>
			</c:if>

	</table>


</body>
</html>