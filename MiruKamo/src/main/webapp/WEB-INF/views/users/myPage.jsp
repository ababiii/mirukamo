<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Mirukamo MyPage</title>
<style type="text/css">
.vGraph {
	padding: 20px 0;
}

.vGraph ul {
	margin: 0;
	padding: 0;
	height: 200px;
	border: 1px solid #ddd;
	border-top: 0;
	border-right: 0;
	font-size: 11px;
	font-family: Tahoma, Geneva, sans-serif;
	list-style: none;
}

.vGraph ul:after {
	content: "";
	display: block;
	clear: both;
}

.vGraph li {
	/* float: left; */
	display: inline;
	width: 8%;
	height: 100%;
	margin: 0 3%;
	position: relative;
	text-align: center;
	white-space: nowrap;
}

.vGraph .gTerm {
	position: relative;
	display: inline-block;
	width: 100%;
	height: 20px;
	line-height: 20px;
	margin: 0 -100% -20px 0;
	padding: 200px 0 0 0;
	vertical-align: bottom;
	color: #767676;
	font-weight: bold;
}

.vGraph .gBar {
	position: relative;
	display: inline-block;
	width: 100%;
	margin: -1px 0 0 0;
	border: 1px solid #ccc;
	border-bottom: 0;
	background: #e9e9e9;
	vertical-align: bottom;
}

 .vGraph .gBar span {
	position: absolute;
	width: 100%;
	top: -20px;
	left: 0;
	color: #767676;
} 
</style>
<script src="resources/jQuery/jquery-3.2.1.min.js"></script>
<script>
	$(document).ready(function() {
		/* $('#ing').css('background', 'yellow');
		$('#tumori').on('click', function() {
			$.ajax({
				url : 'getTumori',
				type : 'post',
				data : {id : '${userId}'},
				dataType : 'json',
				success : function(ob){
					alert('성공');
				},
				error : function(e){
					alert('오류가 발생했습니다.');
				}
				
			});
			
		});
		$('#ing').on('click', function() {

		});
		$('#end').on('click', function() {

		}); */
	});
</script>
<style>
h1 {
	text-align: center;
}

table {
	width: 500px;
	margin: auto;
}

th {
	border: 1;
	border-style: dashed;
}

td {
	text-align: center;
}
</style>
</head>
<body>
	<a href="./"><img
		src="<c:url value="resources/images/loverdug.jpg" />" height="100px"
		width="100px"></a>
	<h1>MyPage</h1>
	<!-- 	<table>
		<tr>
			<th id="tumori">수강 예정 강의</th>
			<th id="ing">수강 중 강의</th>
			<th id="end">수강 완료 강의</th>
		</tr>
	</table> -->

	<table border="3">
		<tr>
			<th>강의명</th>
			<th>선생님</th>
			<th>언어</th>
		</tr>
			<c:if test="${list == null}">
				<td colspan="3">수강 중인 강의가 없습니다.</td>
			</c:if>
			<c:if test="${list.size() !=0 }">
				<c:forEach items="${list}" var="list">
		<tr>
					<td>${list.packagename}</td>
					<td>${list.teacher}</td>
					<td>${list.languages}</td>
		</tr>
				</c:forEach>
			</c:if>
	</table>
<BR>
<BR>
	<table border="1">
		<tr>
			<td colspan="3">가장 많이 틀린 오답 문장</td>
		</tr>
		<tr>
			<td><div class="vGraph">
					<ul>
						<li><span class="gTerm"></span><span class="gBar"
							style="height: 0%"><span>${rank[0].num}</span></span></li>
					</ul>
				</div></td>

			<td><div class="vGraph">
					<ul>
						<li><span class="gTerm"></span><span class="gBar"
							style="height: 0%"><span>${rank[1].num}</span></span></li>
					</ul>
				</div></td>
			<td><div class="vGraph">
					<ul>
						<li><span class="gTerm"></span><span class="gBar"
							style="height: 0%"><span>${rank[2].num}</span></span></li>
					</ul>
				</div></td>
		</tr>
		<tr>
			<td>${rank[0].original_word}</td>

			<td>${rank[1].original_word}</td>

			<td>${rank[2].original_word}</td>
		</tr>
	</table>



</body>
</html>